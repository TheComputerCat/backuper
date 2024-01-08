#!/usr/bin/env bash

set -e

homeFolder=$2
installationsTmp=$homeFolder/installationsTmp

mkdir -p $installationsTmp

wget --content-disposition https://github.com/obsidianmd/obsidian-releases/releases/download/v1.5.3/obsidian_1.5.3_amd64.deb \
-O $installationsTmp/obsidian.deb

dpkg -i $installationsTmp/obsidian.deb

cat > $homeFolder/.local/share/applications/obsidian.desktop << END
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

cat <<END
+----------------------------------------------------------------+
  Obsidian successfully installed
+----------------------------------------------------------------+
END





