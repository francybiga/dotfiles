# pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# pyenv-virtualenv configuration
eval "$(pyenv virtualenv-init -)"

# Auto-activate virtualenv when entering directory
function cd() {
  builtin cd "$@"
  if [[ -d ".venv" ]]; then
    source .venv/bin/activate
  fi
} 
