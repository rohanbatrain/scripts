#!/bin/bash

read -p "GitHub Username: " github_username
read -p "Which method do you want to use to clone the GitHub repos? ssh/https: " gh_choice

# Function to fetch user's public repositories using GitHub API
get_repos() {
  local username=$1
  curl -s "https://api.github.com/users/$username/repos?per_page=1000" | jq -r '.[].ssh_url'
}

# Fetch user's repositories
repos_urls=($(get_repos "$github_username"))

# Clone repositories based on the user's choice
clone_repo() {
  repo_url=$1
  repo_name=$(basename "$repo_url" .git)
  # Create a unique directory for each repository
  repo_dir="${repo_name}_clone"
  if [ ! -d "$repo_dir" ]; then
    git clone "$repo_url" "$repo_dir" &
  else
    echo "Directory $repo_dir already exists. Skipping clone for $repo_url."
  fi
}

# Check if the user chose a valid option
if [ "$gh_choice" != "https" ] && [ "$gh_choice" != "ssh" ]; then
  echo "Unknown user input, ungraceful exit"
  exit 1
fi

# Clone repositories in parallel
for repo_url in "${repos_urls[@]}"; do
  if [ "$gh_choice" == "ssh" ]; then
    clone_repo "$repo_url"
  else
    clone_repo "https://github.com/$repo_url"
  fi
done

# Wait for all background processes to finish
wait

echo "All repositories cloned successfully."
