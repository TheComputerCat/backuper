#!/usr/bin/env bash

set -e

sources_dir=/etc/apt/sources.list
user=$1
home_user=$(grep "$user" /etc/passwd|cut -d: -f 6)
local_bin_dir=$home_user/.local/bin
backuper_dir=$(pwd)

apt update && apt -y install git firefox-esr calibre emacs keepassxc thunderbird tilix virt-manager \
ranger taskwarrior rsync cmake iptables iptables-persistent grep less nano \
vim neovim zsh mercurial podman systemd-resolved zip dconf-editor

cat <<END
+----------------------------------------------------------------+
  Basic programs installed.
+----------------------------------------------------------------+
END

groupadd no-internet
usermod -aG no-internet $user
mkdir -p $local_bin_dir
cp $backuper_dir/config_files/no-internet $local_bin_dir
chown $user:$user $local_bin_dir/no-internet
chmod 755 $local_bin_dir/no-internet
iptables -I OUTPUT 1 -m owner --gid-owner no-internet -j DROP
iptables-save

cat <<END
+----------------------------------------------------------------+
  no-internet command ready to use.
+----------------------------------------------------------------+
END

cat $backuper_dir/config_files/resolved.conf >> /etc/systemd/resolved.conf

systemctl enable systemd-resolved
ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
systemctl restart systemd-resolved
systemctl restart NetworkManager

cat <<END
+----------------------------------------------------------------+
  DNS over TLS with Mullvad ready.
+----------------------------------------------------------------+
END

mkdir -p /etc/docker/
cp $backuper_dir/config_files/daemon.json /etc/docker/daemon.json
chown root:root /etc/docker/daemon.json

cat <<END
+----------------------------------------------------------------+
  DNS added to docker daemon.
+----------------------------------------------------------------+
END

$backuper_dir/programs/install_programs.sh $user $home_user
cat <<END
+----------------------------------------------------------------+
  Selected additional programs successfully installed.
+----------------------------------------------------------------+
END

$backuper_dir/extensions/install_extensions.sh $user $home_user

cat <<END
+----------------------------------------------------------------+
  Selected extensions successfully installed.
+----------------------------------------------------------------+
END
