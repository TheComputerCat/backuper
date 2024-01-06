#!/usr/bin/env bash

set -e

sources_dir=/etc/apt/sources.list
user=$1
local_bin_dir=/home/$user/.local/bin
dconf_path=$2
backuper_dir=$(pwd)

apt install git firefox-esr calibre emacs keepassxc thunderbird tilix virt-manager \
ranger taskwarrior rsync cmake iptables iptables-persistent grep less nano \
vim neovim zsh mercurial podman

cat <<END
+----------------------------------------------------------------+
  Basic programs intalled.
+----------------------------------------------------------------+
END

cp $sources_dir $sources_dir.cp
cat $backuper_dir/config_files/source.list > $sources_dir

cat <<END
+----------------------------------------------------------------+
  Testing sources added to $sources_dir
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
  no-internet command ready to use
+----------------------------------------------------------------+
END

cat $backuper_dir/config_files/resolved.conf >> /etc/systemd/resolved.conf

ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
systemctl restart systemd-resolved
systemctl restart NetworkManager

cat <<END
+----------------------------------------------------------------+
  DNS over TLS with Mullvad ready
+----------------------------------------------------------------+
END

cp $backuper_dir/config_files/daemon.json /etc/docker

cat <<END
+----------------------------------------------------------------+
  DNS added to docker daemon
+----------------------------------------------------------------+
END

$backuper_dir/install_programs.sh
cat <<END
+----------------------------------------------------------------+
  Selected additional programs successfully installed.
+----------------------------------------------------------------+
END

$backuper_dir/install_extensions.sh

cat <<END
+----------------------------------------------------------------+
  Selected extensions successfully installed.
+----------------------------------------------------------------+
END