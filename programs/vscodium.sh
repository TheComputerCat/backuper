#!/usr/bin/env bash

set -e

export DEBIAN_FRONTEND=noninteractive

wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
| gpg --dearmor \
| dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
| tee /etc/apt/sources.list.d/vscodium.list

apt update && apt -y install --no-install-recommends codium >> /dev/null

cat <<END
+----------------------------------------------------------------+
  VSCodium successfully installed
+----------------------------------------------------------------+
END