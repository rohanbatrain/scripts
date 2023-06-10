# Preparation

Downloading the iso, turns out that windows have some kind of weirdiness that I've observed recently. While I fresh downloaded manjaro iso before doing CachyOS that particular iso wasn't booting. This time I directly downloaded the iso in ventoy partition and it works perfectly. perhaps windows explorer does some weird things when it comes to file transfers.

# Installation

I attached an external SSD with USB to sata connector and installed CachyOS with ext4 partition on it.


# Post installation

## Initials

1. system update
2. home directory folders : Github/

## Pacman packages

1. firefox
2.


## Application specific

### Firefox

1. firefox login 


## Github

1. setting ssh keys

I was getting errors of 644 permission so I have made my ssh directory to be 777 and id_rsa to be 600. and now Github is authenticated (same termux steps were followed)
