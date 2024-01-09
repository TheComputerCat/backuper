#!/usr/bin/env bash

set -e

target=$1

folders=('BackUp' 'Boring' 'Calibre\ Library' 'Code'
'Desktop' 'Documentation' 'Documents' 'Dotfiles' 'Library' 'Mobile' 'Music' 'Obsidian' 'Old'
'Pictures' 'Software' 'Term' 'Unal' 'Videos')

# TODO: ensure folder end with /

for folder in "${folders[@]}"; do
    if [[ -d $HOME/$folder ]]; then
        rsync -a --progress $HOME/$folder/ $target/backup-$(date '+%Y-%m-%d')/$folder/
    else 
        echo $key not found.
    fi
done

rsync -a --progress --exclude $HOME/Repositories/Thunderbird/ $HOME/Repositories/ $target/backup-$(date '+%Y-%m-%d')/Repositories/

cat <<END
+----------------------------------------------------------------+
  Files trasfered.
+----------------------------------------------------------------+
END
