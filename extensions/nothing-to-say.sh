#!/usr/bin/env bash

set -e

user=$1
extensionsFolder=$2/extensions-tmp

mkdir -p $extensionsFolder

wget --content-disposition https://github.com/wbolster/nothing-to-say/archive/refs/tags/v18.zip \
-O $extensionsFolder/nothing-to-say.zip

unzip $extensionsFolder/nothing-to-say.zip -d $extensionsFolder/nothing-to-say/
rm $extensionsFolder/nothing-to-say.zip
mv $extensionsFolder/nothing-to-say/nothing-to-say-18/* $extensionsFolder/nothing-to-say
rmdir $extensionsFolder/nothing-to-say/nothing-to-say-18
pushd $extensionsFolder && zip -r nothing-to-say.zip nothing-to-say && popd 
gnome-extensions install --force $extensionsFolder/nothing-to-say.zip

cat <<END
+---------------------------------------------------------+
  Nothing to say successfully installed.
  You have to manually enable it in the extensions window.
+---------------------------------------------------------+
END
### use correct version gnome 44

