# I faced garuda-update pgp issue, which is fixed using the following commands.
sudo rm -rf /etc/pacman.d/gnupg
sudo pacman-key -init
sudo pacman-key-populate archlinux
sudo pacman-key-populate chaotic

## Updating the system

garuda-update
