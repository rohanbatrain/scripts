#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Please provide a GitHub username as an argument."
  exit 1
fi

username=$1

repos=$(curl -s "https://api.github.com/users/$username/repos" | jq -r '.[].full_name')

for repo in $repos; do
  creation_date=$(curl -s "https://api.github.com/repos/$repo" | jq -r '.created_at')
  echo "Repository: $repo, Creation Date: $creation_date"
done
