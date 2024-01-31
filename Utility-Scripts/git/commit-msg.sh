#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <repository_url>"
    exit 1
fi

repo_url="$1"
output_file="commit_info_table.md"

# Clone the repository to a temporary directory
temp_dir=$(mktemp -d)
git clone "$repo_url" "$temp_dir"

# Generate Markdown table header
echo "| Commit Hash | Author | Date | Message |" > "$output_file"
echo "|-------------|--------|------|---------|" >> "$output_file"

# Fetch commit information and add to the Markdown table
git -C "$temp_dir" log --format="|%H|%an|%ad|%s|" --date=short >> "$output_file"

# Display a message indicating the completion
echo "Commit information saved to $output_file"

# Clean up - remove the temporary directory
rm -rf "$temp_dir"
