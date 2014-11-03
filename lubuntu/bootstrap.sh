#!/bin/sh
set -e

apt-get -qq update
apt-get -qy dist-upgrade

# Install a minimal desktop environment
apt-get -qy install lightdm lightdm-gtk-greeter lxterminal byobu-
apt-get -qy --no-install-recommends install lubuntu-core

# Enable auto-login
echo "[SeatDefaults]\nautologin-user=student" > /etc/lightdm/lightdm.conf
usermod -aG nopasswdlogin student
