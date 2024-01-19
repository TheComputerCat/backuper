#!/usr/bin/env bash

set -e

export DEBIAN_FRONTEND=noninteractive

user=$1
homeFolder=$2
installationsTmp=$homeFolder/installationsTmp

mkdir -p $installationsTmp

wget --content-disposition https://mullvad.net/en/download/browser/linux-x86_64/latest \
-O $installationsTmp/mullvad-browser.tar.xz

wget --content-disposition https://mullvad.net/en/download/browser/linux-x86_64/latest/signature \
-O $installationsTmp/mullvad-browser.tar.xz.asc

gpg --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org

gpg --verify $installationsTmp/mullvad-browser.tar.xz.asc

tar -xf $installationsTmp/mullvad-browser.tar.xz -C $installationsTmp/

cp -r $installationsTmp/mullvad-browser /opt/mullvad-browser

chown -R $user:$user /opt/mullvad-browser

su - $user -c "cd /opt/mullvad-browser/ && ./start-mullvad-browser.desktop --register-app"

cat <<END
+----------------------------------------------------------------+
  Mullvad Browser successfully installed.
+----------------------------------------------------------------+
END