# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

# Custom fuzzy completion
# ------------

# Bazel query (bzq alias)
#   e.g. bzb **<TAB> or bzb DIRECTORY **<TAB> to show only targets of a given subdir
_fzf_complete_bzb() {
    # Split the arguments into an array and assign the second word as query_subdir to filter on that specific subdir
    local -a args
    IFS=' ' read -A args <<< "$@"
    # Note that this assumes the usage of bzb and not "bazel build", since it consider the 2nd argument to be the subdir
    query_subdir="${args[2]}"

   # Note that we do not restore the entire args but we drop the query_subdir (will be substituted by the fzf selection)
   _fzf_complete --multi --reverse -- "${args[1]} " < <(\
    bzq_cmd="bazel query ${query_subdir}/... --keep_going --noshow_progress"
    eval "$bzq_cmd"
  )
}
