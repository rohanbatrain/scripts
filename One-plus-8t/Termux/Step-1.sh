#!/bin/bash

apt update && apt upgrade

# saying yes to all conflicts (install the package maintainer's version)

pkg install openssh tsu git

# Obsidian Specific

sudo mkdir -p /sdcard/Obsidian/Second-Brain/

