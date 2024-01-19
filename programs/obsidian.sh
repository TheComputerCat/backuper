#!/usr/bin/env bash

set -e

user=$1
homeFolder=$2
installationsTmp=$homeFolder/installationsTmp
desktopEntry=$homeFolder/.local/share/applications/obsidian.desktop

mkdir -p $installationsTmp

wget --content-disposition https://github.com/obsidianmd/obsidian-releases/releases/download/v1.5.3/obsidian_1.5.3_amd64.deb \
-O $installationsTmp/obsidian.deb

dpkg -i $installationsTmp/obsidian.deb

cat > $desktopEntry << END
[Desktop Entry]
Name=Obsidian No Internet
Exec=$homeFolder/.local/bin/no-internet obsidian
Terminal=false
Type=Application
Icon=obsidian
StartupWMClass=obsidian
Comment=Obsidian
MimeType=x-scheme-handler/obsidian;
Categories=Office;
END

chown $user:$user $desktopEntry
chmod 700 $desktopEntry

cat <<END
+----------------------------------------------------------------+
  Obsidian successfully installed
+----------------------------------------------------------------+
END





