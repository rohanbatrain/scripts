#!/bin/bash

read -p "Which method do you want to use to clone the GitHub repos? ssh/https: " gh_choice

clone_repo() {
  repo_url=$1
  git clone "$repo_url" &
}

if [ "$gh_choice" == "https" ]; then
  repos=("https://github.com/rohanbatrain/rohanbatrain.git"
         "https://github.com/rohanbatrain/educational-projects.git"
         "https://github.com/rohanbatrain/kruxers-landing-page.git"
         "https://github.com/rohanbatrain/scripts.git"
         "https://github.com/rohanbatrain/knowledge-base.git"
         "https://github.com/rohanbatrain/second-brain-api.git"
         "https://github.com/rohanbatrain/dotfiles.git"
         "https://github.com/rohanbatrain/second-brain-template.git"
         "https://github.com/rohanbatrain/productivity-suite.git"
         "https://github.com/rohanbatrain/landing-page.git"
         "https://github.com/rohanbatrain/suckless-st.git"
         "https://github.com/rohanbatrain/suckless-dwm.git"
         "https://github.com/rohanbatrain/suckless-dmenu.git"
        )

elif [ "$gh_choice" == "ssh" ]; then
  repos=("git@github.com:rohanbatrain/rohanbatrain.git"
         "git@github.com:rohanbatrain/educational-projects.git"
         "git@github.com:rohanbatrain/kruxers-landing-page.git"
         "git@github.com:rohanbatrain/scripts.git"
         "git@github.com:rohanbatrain/knowledge-base.git"
         "git@github.com:rohanbatrain/second-brain-api.git"
         "git@github.com:rohanbatrain/dotfiles.git"
         "git@github.com:rohanbatrain/second-brain-template.git"
         "git@github.com:rohanbatrain/productivity-suite.git"
         "git@github.com:rohanbatrain/landing-page.git"
         "git@github.com:rohanbatrain/suckless-st.git"
         "git@github.com:rohanbatrain/suckless-dwm.git"
         "git@github.com:rohanbatrain/suckless-dmenu.git"
        )
else
  echo "Unknown user input, ungraceful exit"
  exit 1
fi

for repo in "${repos[@]}"; do
  clone_repo "$repo"
done

# Wait for all background processes to finish
wait

echo "All repositories cloned successfully."
