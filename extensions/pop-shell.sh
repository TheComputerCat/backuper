#!/usr/bin/env bash

set -e

extensionsFolder=$HOME/extensions-tmp

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "<Shift><Super>Return"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "tilix"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "Tilix"

su -c "apt -y install --no-install-recommends node-typescript >> /dev/null"

mkdir -p $extensionsFolder

# master_jammy is recomended for gnome < 45
git clone -b master_jammy https://github.com/TheComputerCat/shell.git $extensionsFolder/pop-shell

pushd $extensionsFolder/pop-shell

yes | make local-install

cat <<END
+---------------------------------------------------------+
  Pop shell successfully installed.
  You have to manually enable it in the extensions window.
+---------------------------------------------------------+
END


