read -p "Are you installing for Single-Boot or Double-Boot? [1,2]: " choice_1

if [[ $choice_1 == "1" ]]; then

  echo "Getting script for Single Boot"

elif [[ $choice_1 == "2" ]]; then

  echo "Getting script for Dual Boot"

else

  echo "Unknown input, ungraceful exit"

  exit

fi