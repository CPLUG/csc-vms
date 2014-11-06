#!/bin/bash
set -e

packages=(
  vim-gtk emacs24-lucid         # Editors
  gdb g++ gcc binutils valgrind # C/C++ development
  openjdk-7-jdk junit4          # Java development
  python3 php5-cli              # Scripting languages
  libpcap0.8-dev wireshark      # Networking
  libncurses5-dev
)

echo wireshark-common wireshark-common/install-setuid select true \
  | debconf-set-selections

apt-get -qy install ${packages[@]}

usermod -aG wireshark student

# Greenfoot
filename=`mktemp`
wget -q -O $filename http://www.greenfoot.org/download/files/greenfoot-240.deb
dpkg -i $filename

