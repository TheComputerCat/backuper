#!/usr/bin/env bash

set -e

user=$1

export DEBIAN_FRONTEND=noninteractive

apt -y install --no-install-recommends ca-certificates curl gnupg lsb-release >> /dev/null

mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
bookworm stable" | tee /etc/apt/sources.list.d/docker.list >> /dev/null

chmod a+r /etc/apt/keyrings/docker.gpg
apt update >> /dev/null

apt -y install --no-install-recommends docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin >> /dev/null

systemctl enable docker >> /dev/null

usermod -aG docker $user

cat <<END
+------------------------------------------------+
+ Docker successfully installed.                 +
+------------------------------------------------+
END