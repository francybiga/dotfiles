# Example: vim (bzqfzf //...)

# Description: Functions for Basel fuzzy search.

function bazel_file_from_target() {
    local bazel_target="$1"
    local bazel_output
    bazel_output=$(bazel query "$bazel_target" --noshow_progress --output=build | head -1 | sed -e "s/^#[[:space:]]//")
    local bazel_file
    bazel_file=$(echo "$bazel_output" | cut -d: -f1)
    echo "$bazel_file"
}

function bat_preview_for_bazel {
    local bazel_target="$1"
    local bazel_output
    bazel_output=$(bazel query "$bazel_target" --noshow_progress --output=build | head -1 | sed -e "s/^#[[:space:]]//")
    local bazel_file
    bazel_file=$(echo "$bazel_output" | cut -d: -f1)
    local line
    line=$(echo "$bazel_output" | cut -d: -f2)
    bat --style=numbers --color=always --line-range "$line:" "$bazel_file"
}

# Define a function for fuzzy finding Bazel queries with preview
bzqfzf() {
    # Perform Bazel query and pass the results to fzf with custom preview function and key binding
    #  TODO THIS ISN'T WORKING BECAUSE of "unknown function error". Just use bazel query without preview for now and try fixing 
    # this when you have time
    # bazel query "$@" | fzf --preview='bat_preview_for_bazel {}' --bind 'enter:become(bazel_file_from_target {})'

   bazel query "$@" | fzf --height 40%
}
