#!/usr/bin/env bash

set -e

export DEBIAN_FRONTEND=noninteractive

targetUser=$1
homeFolder=$2
installationsTmp=$homeFolder/installationsTmp

mkdir -p $installationsTmp

apt -y install --no-install-recommends apt-transport-https gnupg >> /dev/null

echo \
"deb [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org $(lsb_release -cs) main" > /etc/apt/sources.list.d/tor.list

wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --dearmor > /usr/share/keyrings/tor-archive-keyring.gpg

apt update >> /dev/null
apt -y install --no-install-recommends tor deb.torproject.org-keyring  >> /dev/null

wget --content-disposition https://www.torproject.org/dist/torbrowser/13.0.8/tor-browser-linux-x86_64-13.0.8.tar.xz \
-O $installationsTmp/tor-browser.tar.xz

wget --content-disposition https://dist.torproject.org/torbrowser/13.0.8/tor-browser-linux-x86_64-13.0.8.tar.xz.asc \
-O $installationsTmp/tor-browser.tar.xz.asc

gpg --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org

gpg --verify $installationsTmp/tor-browser.tar.xz.asc

tar -xvf $installationsTmp/tor-browser.tar.xz -C $installationsTmp/

cp -r $installationsTmp/tor-browser /opt/tor-browser

chown -R $targetUser:$targetUser /opt/tor-browser

su - $targetUser -c "cd /opt/tor-browser/ && ./start-tor-browser.desktop --register-app"

cat <<END
+---------------------------------------------------------+
  Tor successfully installed.
+---------------------------------------------------------+
END