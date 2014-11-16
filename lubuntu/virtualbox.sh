#!/bin/sh
set -e

apt-get -qy install virtualbox-guest-x11

# Improve shared folder usability
rmdir /media/cdrom
mkdir -p /home/student/Desktop
ln -s /media /home/student/Desktop/shared
usermod -aG vboxsf student
