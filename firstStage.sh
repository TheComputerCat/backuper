#!/usr/bin/env bash

sources_dir=/etc/apt/sources.list
user=$1
home_user=grep $user /etc/passwd|cut -d: -f 6
local_bin_dir=$home_user/.local/bin
backuper_dir=$(pwd)

cp $sources_dir $sources_dir.cp
cat $backuper_dir/config_files/source.list > $sources_dir

cat <<END
+----------------------------------------------------------------+
  Testing sources added to $sources_dir.
+----------------------------------------------------------------+
END

apt-get -y remove --purge "libreoffice*" && apt-get -y clean && apt-get -y autoremove

apt -y update 
apt -y full-upgrade
apt -y autoremove --purge
reboot