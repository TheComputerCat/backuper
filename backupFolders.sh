#!/usr/bin/env bash

set -e

target=$1

folders=('Term' 'BackUp' 'Boring' 'Calibre Library' 'Code'
'Desktop' 'Documents' 'Mobile' 'Library' 'Music' 'Obsidian' 'Old'
'Documentation' 'Pictures' 'Repositories' 'Software' 'Unal' 'Videos', Dotfiles)

# TODO: ensure folder end with /

for folder in "${folders[@]}"; do
    if [[ -d $HOME/$folder ]]; then
        rsync -a --progress $HOME/$folder $target/backup-$(date '+%Y-%m-%d')/$folder
    else 
        echo $key not found.
    fi
done

cat <<END
+----------------------------------------------------------------+
  Files trasfered.
+----------------------------------------------------------------+
END
