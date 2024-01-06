#!/usr/bin/env bash

set -e

export DEBIAN_FRONTEND=noninteractive

targetUser=$1
homeFolder=$2

wget --content-disposition https://mullvad.net/en/download/browser/linux-x86_64/latest \
-O $homeFolder/mullvad-browser.tar.xz

wget --content-disposition https://mullvad.net/en/download/browser/linux-x86_64/latest/signature \
-O $homeFolder/mullvad-browser.tar.xz.asc

gpg --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org

gpg --verify $homeFolder/mullvad-browser.tar.xz.asc

tar -xvf $homeFolder/mullvad-browser.tar.xz -C $homeFolder/

cp -r $homeFolder/mullvad-browser /opt/mullvad-browser

chown -R $targetUser:$targetUser /opt/mullvad-browser

su - $targetUser -c "cd /opt/mullvad-browser/ && ./start-mullvad-browser.desktop --register-app"

cat <<END
+----------------------------------------------------------------+
  Mullvad Browser successfully installed.
+----------------------------------------------------------------+
END