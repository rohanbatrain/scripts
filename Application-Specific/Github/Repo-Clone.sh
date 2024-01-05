#!/bin/bash

read -p "Which method do you want to use to clone the GitHub repos? ssh/https: " gh_choice

declare -A repos=(
  ["https"]="rohanbatrain/rohanbatrain.git rohanbatrain/educational-projects.git rohanbatrain/kruxers-landing-page.git rohanbatrain/scripts.git rohanbatrain/knowledge-base.git rohanbatrain/second-brain-api.git rohanbatrain/dotfiles.git rohanbatrain/second-brain-template.git rohanbatrain/productivity-suite.git rohanbatrain/landing-page.git rohanbatrain/suckless-st.git rohanbatrain/suckless-dwm.git rohanbatrain/suckless-dmenu.git"
  ["ssh"]="rohanbatrain/rohanbatrain.git rohanbatrain/educational-projects.git rohanbatrain/kruxers-landing-page.git rohanbatrain/scripts.git rohanbatrain/knowledge-base.git rohanbatrain/second-brain-api.git rohanbatrain/dotfiles.git rohanbatrain/second-brain-template.git rohanbatrain/productivity-suite.git rohanbatrain/landing-page.git rohanbatrain/suckless-st.git rohanbatrain/suckless-dwm.git rohanbatrain/suckless-dmenu.git"
)

clone_repo() {
  repo_url=$1
  git clone "$repo_url" &
}

if [ -z "${repos[$gh_choice]}" ]; then
  echo "Unknown user input, ungraceful exit"
  exit 1
fi

repos_to_clone=(${repos[$gh_choice]})

# Clone repositories in parallel
for repo in "${repos_to_clone[@]}"; do
  clone_repo "https://github.com/$repo"   # Append "https://github.com/" for https URLs
done

# Wait for all background processes to finish
wait

echo "All repositories cloned successfully."
