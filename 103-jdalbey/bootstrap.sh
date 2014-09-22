#!/bin/sh
apt-get -qq update
apt-get -qq upgrade
apt-get -qq install openjdk-7-jdk
wget -q http://bluej.org/download/files/bluej-311.deb
dpkg -i bluej-311.deb
