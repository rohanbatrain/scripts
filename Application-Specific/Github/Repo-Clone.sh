#!/bin/bash

read -p "Which method do you want to use to clone the GitHub repos? ssh/https: " gh_choice

if [ "$gh_choice" == "https" ]; then
  git clone https://github.com/rohanbatrain/rohanbatrain.git
  git clone https://github.com/rohanbatrain/educational-projects.git
  git clone https://github.com/rohanbatrain/kruxers-landing-page.git
  git clone https://github.com/rohanbatrain/scripts.git
  git clone https://github.com/rohanbatrain/knowledge-base.git
  git clone https://github.com/rohanbatrain/second-brain-api.git
  git clone https://github.com/rohanbatrain/dotfiles.git
  git clone https://github.com/rohanbatrain/second-brain-template.git
  git clone https://github.com/rohanbatrain/productivity-suite.git
  git clone https://github.com/rohanbatrain/landing-page.git
  git clone https://github.com/rohanbatrain/suckless-st.git
  git clone https://github.com/rohanbatrain/suckless-dwm.git
  git clone https://github.com/rohanbatrain/suckless-dmenu.git

elif [ "$gh_choice" == "ssh" ]; then
  git clone git@github.com:rohanbatrain/rohanbatrain.git
  git clone git@github.com:rohanbatrain/educational-projects.git
  git clone git@github.com:rohanbatrain/kruxers-landing-page.git
  git clone git@github.com:rohanbatrain/scripts.git
  git clone git@github.com:rohanbatrain/knowledge-base.git
  git clone git@github.com:rohanbatrain/second-brain-api.git
  git clone git@github.com:rohanbatrain/dotfiles.git
  git clone git@github.com:rohanbatrain/second-brain-template.git
  git clone git@github.com:rohanbatrain/productivity-suite.git
  git clone git@github.com:rohanbatrain/landing-page.git
  git clone git@github.com:rohanbatrain/suckless-st.git
  git clone git@github.com:rohanbatrain/suckless-dwm.git
  git clone git@github.com:rohanbatrain/suckless-dmenu.git

else
  echo "Unknown user input, ungraceful exit"
fi
