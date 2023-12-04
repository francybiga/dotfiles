# # Define a function for previewing Bazel queries with bat
# function bat_preview_for_bazel {
#     local bazel_target="$1"
#     local bazel_output
#     bazel_output=$(bazel query "$bazel_target" --noshow_progress --output=build | head -1 | sed -e "s/^#[[:space:]]//")
#     local bazel_file
#     bazel_file=$(echo "$bazel_output" | cut -d: -f1)
#     local line
#     line=$(echo "$bazel_output" | cut -d: -f2)
#     bat --style=numbers --color=always --line-range "$line:" "$bazel_file"
# }

