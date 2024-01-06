#!/usr/bin/env bash

set -e

export DEBIAN_FRONTEND=noninteractive

wget -O- https://updates.signal.org/desktop/apt/keys.asc  \
| gpg --dearmor > signal-desktop-keyring.gpg

cat signal-desktop-keyring.gpg \
| tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' \
| tee /etc/apt/sources.list.d/signal-xenial.list

apt update && apt -y install --no-install-recommends signal-desktop >> /dev/null

cat <<END
+----------------------------------------------------------------+
  Signal successfully installed
+----------------------------------------------------------------+
END