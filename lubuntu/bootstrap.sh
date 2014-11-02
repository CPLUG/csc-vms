#!/bin/sh
set -e

apt-get -qq update
apt-get -qy dist-upgrade

# Install a minimal desktop environment, plus
# dependencies for the VirtualBox kernel extension
apt-get -qy install \
  lightdm lightdm-gtk-greeter build-essential dkms
apt-get -qy --no-install-recommends install \
  lubuntu-core lxterminal byobu-

# Enable auto-login
echo "[SeatDefaults]\nautologin-user=student" > /etc/lightdm/lightdm.conf
