#!/bin/bash

read -p "GitHub Username: " github_username
read -p "Do you want to clone all repositories? (yes/no): " clone_all

if [ "$clone_all" == "no" ]; then
  read -p "Enter the repository name to clone: " repo_to_clone
fi

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
  if [ ! -d "$repo_name" ]; then
    git clone "$repo_url" "$repo_name" &
  else
    echo "Directory $repo_name already exists. Skipping clone for $repo_url."
  fi
}

# Check if the user chose a valid option
if [ "$gh_choice" != "https" ] && [ "$gh_choice" != "ssh" ]; then
  echo "Unknown user input, ungraceful exit"
  exit 1
fi

# Clone repositories based on user's choice
if [ "$clone_all" == "yes" ]; then
  for repo_url in "${repos_urls[@]}"; do
    if [ "$gh_choice" == "ssh" ]; then
      clone_repo "$repo_url"
    else
      clone_repo "https://github.com/$repo_url"
    fi
  done
else
  for repo_url in "${repos_urls[@]}"; do
    repo_name=$(basename "$repo_url" .git)
    if [ "$repo_name" == "$repo_to_clone" ]; then
      if [ "$gh_choice" == "ssh" ]; then
        clone_repo "$repo_url"
      else
        clone_repo "https://github.com/$repo_url"
      fi
      break
    fi
  done
fi

# Wait for all background processes to finish
wait

echo "Cloning process completed."
