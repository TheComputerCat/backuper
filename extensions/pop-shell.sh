#!/usr/bin/env bash

set -e

extensionsFolder=$HOME/extensions-tmp

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


