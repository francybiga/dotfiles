#!/usr/bin/env python3

# flake8: noqa: E501

import os
import sys
import subprocess
from pathlib import Path


def run(cmd: str, ignore_error: bool = False) -> bool:
    """Run a shell command and return success status."""
    try:
        subprocess.run(cmd, shell=True, check=True,
                       capture_output=True, text=True)
        return True
    except subprocess.CalledProcessError:
        if not ignore_error:
            print(f"Error running: {cmd}")
        return False


def install_if_missing(prog: str, cmd: str) -> bool:
    """Install a program if it's not already installed."""
    if run(f"command -v {prog} > /dev/null 2>&1", ignore_error=True):
        print(f"{prog} already installed")
        return True
    print(f"Installing {prog}...")
    return run(cmd)


# Configuration
BREW_TOOLS = {
    "python": "brew install python",  # Use brew version of python instead of macOS one
    "zsh-syntax-highlighting": "brew install zsh-syntax-highlighting",
    "node": "brew install node",
    "pure-prompt": "npm install --global pure-prompt",
    "ffmpeg": "brew install ffmpeg",
    "youtube-dl": "brew install youtube-dl",
    "jq": "brew install jq",
    "rmtrash": "brew install rmtrash",
}

PYTHON_PACKAGES = {
    "pygit2": "pip install pygit2",
    "powerline-status": "pip3 install powerline-status",
}

DOTFILES = [
    "zshrc", "config", "vimrc", "vim", "tmux.conf", "fzf.zsh", "gitconfig"
]


def setup_tools() -> bool:
    """Install all required tools."""
    # Install Homebrew first
    install_if_missing(
        "brew",
        # The eval command "activates" brew
        '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && eval "$(/opt/homebrew/bin/brew shellenv)"'
    )

    for prog, cmd in BREW_TOOLS.items():
        if not install_if_missing(prog, cmd):
            return False

    # Install Python packages
    for prog, cmd in PYTHON_PACKAGES.items():
        if not install_if_missing(prog, cmd):
            return False

    # Install other tools
    for prog, cmd in BREW_TOOLS.items():
        if prog != "brew" and not install_if_missing(prog, cmd):
            return False

    return True


def setup_oh_my_zsh() -> bool:
    """Install Oh My Zsh and its plugins."""
    # Install Oh My Zsh
    if not run('sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended'):
        return False

    # Install zsh-autosuggestions
    zsh_custom = os.getenv(
        "ZSH_CUSTOM", os.path.expanduser("~/.oh-my-zsh/custom"))
    autosuggestions_path = os.path.join(
        zsh_custom, "plugins/zsh-autosuggestions")

    if not os.path.exists(autosuggestions_path):
        return run(f"git clone https://github.com/zsh-users/zsh-autosuggestions {autosuggestions_path}")

    return True


def setup_vim() -> bool:
    """Setup Vim and Vundle."""
    vim_bundle_path = os.path.expanduser("~/.vim/bundle/Vundle.vim")
    if not os.path.exists(vim_bundle_path):
        return run(f"git clone https://github.com/VundleVim/Vundle.vim.git {vim_bundle_path}")
    return True


def setup_dotfiles() -> bool:
    """Setup dotfiles by creating symlinks."""
    dotfiles_dir = Path(__file__).parent.absolute()
    backup_dir = dotfiles_dir / "backup"
    home_dir = Path.home()

    # Create backup directory
    backup_dir.mkdir(exist_ok=True)

    # Backup and symlink each file
    for file in DOTFILES:
        source = dotfiles_dir / file
        target = home_dir / f".{file}"
        backup = backup_dir / file

        if not source.exists():
            print(f"Warning: {source} does not exist, skipping")
            continue

        if target.exists():
            if target.is_symlink():
                target.unlink()
            else:
                target.rename(backup)

        target.symlink_to(source)

    # Special handling for VSCode settings
    vscode_user_dir = home_dir / "Library/Application Support/Code/User"
    if vscode_user_dir.exists():
        vscode_settings = dotfiles_dir / "vscode/settings.json"
        vscode_keybindings = dotfiles_dir / "vscode/keybindings.json"

        if vscode_settings.exists():
            (vscode_user_dir / "settings.json").symlink_to(vscode_settings)
        if vscode_keybindings.exists():
            (vscode_user_dir / "keybindings.json").symlink_to(vscode_keybindings)

    # Set correct permissions
    for file in [".zshrc", ".vimrc", ".tmux.conf", ".gitconfig"]:
        target = home_dir / file
        if target.exists():
            target.chmod(0o644)

    return True


def main() -> None:
    """Main setup function."""
    if sys.platform != "darwin":
        print("This script is intended for macOS only")
        sys.exit(1)

    if not all([
        setup_tools(),
        setup_oh_my_zsh(),
        setup_vim(),
        setup_dotfiles()
    ]):
        print("Setup failed")
        sys.exit(1)

    print("Setup completed successfully!")


if __name__ == "__main__":
    main()
