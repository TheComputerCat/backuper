#!/usr/bin/env bash

set -e

user=$1
extensionsFolder=$2/extensions-tmp

su - $user << ENDOU

mkdir -p $extensionsFolder

wget --content-disposition https://gitlab.com/rmnvgr/nightthemeswitcher-gnome-shell-extension/-/releases/74/downloads/nightthemeswitcher.zip \
-O $extensionsFolder/nightthemeswitcher.zip

gnome-extensions install --force $extensionsFolder/nightthemeswitcher.zip

cat <<END
+---------------------------------------------------------+
  Night theme switcher successfully installed.
  You have to manually enable it in the extensions window.
+---------------------------------------------------------+
END
ENDOU
### use correct version gnome 44

