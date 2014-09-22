#!/bin/sh
set -e

download() {
  echo Downloading $2
  wget -q -O $1 $2
}

apt-get -qq update
apt-get -qy dist-upgrade

# Java 7, RapidSVN
apt-get -qy install openjdk-7-jdk rapidsvn

# BlueJ
bluej=/usr/share/bluej

filename=`mktemp`
download $filename http://bluej.org/download/files/bluej-311.deb
dpkg -i $filename

download $bluej/extensions/GUI_Extension.jar \
  https://home.pf.jcu.cz/~gbluej/download.php?Down=GUI_Extension.jar

download $bluej/extensions/checkstyle308-extension.jar \
  https://www.csc.calpoly.edu/%7Ejdalbey/SWE/Tools/checkstyle308-extension.jar
mkdir -p $bluej/checkstyle
cp /vagrant/103style.xml $bluej/checkstyle/ # TODO
checkstyle='extensions.com.puppycrawl.tools.checkstyle.plugins.bluej.CheckstyleExtension.settings.checkstyle.configfile'
echo "$checkstyle=$bluej/checkstyle/103style.xml" >> $bluej/bluej.defs

# NetBeans
# TODO netbeans settings and plugins in userdir
filename=`mktemp`
download $filename \
  http://download.netbeans.org/netbeans/8.0.1/final/bundles/netbeans-8.0.1-javase-linux.sh
echo Running NetBeans installer
sh $filename --silent

# TimeLogger, JavaLOC, Violet
# TODO install .desktop file to launch these
jar_dir=/usr/local/bin
download $jar_dir/TimeLogger.jar \
  https://wiki.csc.calpoly.edu/TimeLogger/raw-attachment/wiki/DownloadPage/TimeLogger.jar
download $jar_dir/LOC.jar \
  https://java.net/projects/loc-counter/sources/svn/content/trunk/LOCcounter/deploy/LOC.jar?rev=42
download $jar_dir/violet-0.16a.jar \
  http://www.horstmann.com/violet/violet-0.16a.jar
