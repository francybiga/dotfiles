# pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# pyenv-virtualenv configuration
eval "$(pyenv virtualenv-init -)"

# Set default Python version
export PYENV_VERSION="3.11.5"

# pyenv aliases
alias py="python"
alias py3="python3"
alias pip="pip3"
alias venv="python -m venv"
alias activate="source .venv/bin/activate"

# Auto-activate virtualenv when entering directory
function cd() {
  builtin cd "$@"
  if [[ -d ".venv" ]]; then
    source .venv/bin/activate
  fi
} 