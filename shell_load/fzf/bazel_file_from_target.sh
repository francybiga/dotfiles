# # Define a function for extracting the Bazel file from a target
# function bazel_file_from_target() {
#     local bazel_target="$1"
#     local bazel_output
#     bazel_output=$(bazel query "$bazel_target" --noshow_progress --output=build | head -1 | sed -e "s/^#[[:space:]]//")
#     local bazel_file
#     bazel_file=$(echo "$bazel_output" | cut -d: -f1)
#     echo "$bazel_file"
# }

