require "colored"

def install_if_needed(prog_name, install_cmd)
    puts "Checking #{prog_name} installation".yellow
    check_cmd = "command -v #{prog_name} > /dev/null 2>&1" 
    unless system(check_cmd) 
        puts "Installing #{prog_name}...".green
        system(install_cmd)
    else 
        puts "Already installed".green
    end
end

# Homebrew
install_if_needed("brew", "/usr/bin/ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\"")

#Oh my zsh 
puts "Installing oh-my-zsh".green
system("sh -c \"$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)\"")

#Zsh syntax highlighting
puts "Installing zsh-syntax-highlighting".green
system("brew install zsh-syntax-highlighting")

#zsh-autosuggestions
puts "Installing zsh-autosuggestions".green
system("git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions")

#Powerline status
puts "Installing powerline status".green

install_if_needed("pip", "sudo easy_install pip")
install_if_needed("cffi", "sudo easy_install cffi")
install_if_needed("libgit2", "brew install libgit2")
install_if_needed("pygit2", "pip install pygit2")
install_if_needed("powerline-status", "pip install powerline-status --user")
intall_if_needed("rmtrash", "brew install rmtrash")

#copying dotfiles
puts "Copying dotfiles".green
system("./setup.sh")

#install vundle (vim plugin manger)
puts "Installing Vundle".green
system("git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim")

