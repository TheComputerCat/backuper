#!/usr/bin/env bash

set -e

export DEBIAN_FRONTEND=noninteractive

user=$1
homeFolder=$2
installationsTmp=$homeFolder/installationsTmp
desktopEntry=$homeFolder/.local/share/applications/Goland.desktop

mkdir -p $installationsTmp

wget --content-disposition https://download.jetbrains.com/go/goland-2023.3.2.tar.gz \
-O $installationsTmp/GoLand.tar.gz

pushd $installationsTmp
echo "d11c9ff18323f121eeb643bd093cd4cc9b3ca5f64e1e1dbe4b9b8139217032d1 *GoLand.tar.gz" | sha256sum -c
popd

tar -xf $installationsTmp/GoLand.tar.gz -C $installationsTmp/

mv $installationsTmp/GoLand-* $installationsTmp/GoLand

cp -r $installationsTmp/GoLand /opt/GoLand

chown -R $user:$user /opt/GoLand

cat > $desktopEntry << END 
[Desktop Entry]
Type=Application
Name=GoLand
Exec=/opt/GoLand/bin/goland.sh
Icon=/opt/GoLand/bin/goland.png
END

chown $user:$user $desktopEntry
chmod 700 $desktopEntry

cat <<END
+----------------------------------------------------------------+
  Golang successfully installed.
+----------------------------------------------------------------+
END