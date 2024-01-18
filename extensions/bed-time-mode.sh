#!/usr/bin/env bash

set -e

user=$1
extensionsFolder=$2/extensions-tmp

su - $user << ENDOU

mkdir -p $extensionsFolder

wget --content-disposition https://github.com/ionutbortis/gnome-bedtime-mode/releases/download/v17.0/gnome-bedtime-mode_17.0.zip \
-O $extensionsFolder/gnome-bedtime-mode.zip

gnome-extensions install --force $extensionsFolder/gnome-bedtime-mode.zip

cat <<END
+---------------------------------------------------------+
  Bed time mode successfully installed.
  You have to manually enable it in the extensions window.
+---------------------------------------------------------+
END
ENDOU

