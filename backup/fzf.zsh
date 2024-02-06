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

# Custom fuzzy completion
# ------------

# Bazel query (bzq alias)
#   e.g. bzq **<TAB> or bzq DIRECTORY **<TAB> to show only targets of a given subdir
_fzf_complete_bzq() {
    # Split the arguments into an array and assign the second word as query_subdir to filter on that specific subdir
    local -a args
    IFS=' ' read -A args <<< "$@"
    # Note that this assumes the usage of bzq and not "bazel query", since it consider the 2nd argument to be the subdir
    query_subdir="${args[2]}"

   _fzf_complete --multi --reverse -- "$@" < <(\
    bzq_cmd="bazel query ${query_subdir}/... --keep_going --noshow_progress"
    eval "$bzq_cmd"
  )
}
