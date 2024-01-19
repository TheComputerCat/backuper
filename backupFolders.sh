#!/usr/bin/env bash

set -e

target=$1

folders=('BackUp' 'Boring' 'Calibre Library' 'Code'
'Desktop' 'Documentation' 'Documents' 'Dotfiles' 'Library' 'Mobile' 'Music' 'Obsidian' 'Old'
'Pictures' 'Software' 'Term' 'Unal' 'Videos')

mkdir -p $target/backup-$(date '+%Y-%m-%d')

for folder in "${folders[@]}"; do
    if [[ -d $HOME/"$folder" ]]; then
        echo Copying "$folder"
        rsync -au --info=progress2 $HOME/"$folder"/ $target/backup-$(date '+%Y-%m-%d')/"$folder"/
    else 
        echo "$folder" not found.
    fi
done

echo Copying $HOME/Repositories and excluding Thunderbird
rsync -au --info=progress2 --exclude Thunderbird/ $HOME/Repositories/ $target/backup-$(date '+%Y-%m-%d')/Repositories/

cat <<END
+----------------------------------------------------------------+
  Files trasfered.
+----------------------------------------------------------------+
END
