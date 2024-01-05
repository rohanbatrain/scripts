read -p "Are you installing for Single-Boot or Double-Boot? [1,2]: " choice_1

if [[ $choice_1 == "1" ]]; then

  echo "Getting script for Single Boot"
  

elif [[ $choice_1 == "2" ]]; then

  echo "Getting script for Dual Boot"
  wget https://raw.githubusercontent.com/rohanbatrain/scripts/main/OS-Specific/Arch-Linux/Installation/Dual-Boot/arch-step-1.sh
  bash arch-step-1.sh

else

  echo "Unknown input, ungraceful exit"
  wget https://raw.githubusercontent.com/rohanbatrain/scripts/main/OS-Specific/Arch-Linux/Installation/Single-Boot/arch-step-1.sh
  bash arch-step-1.sh
  exit

fi
