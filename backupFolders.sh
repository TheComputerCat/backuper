#!/usr/bin/env bash

set -e

homeFolder=$1
target=$2

folders=('Term' 'BackUp' 'Boring' 'Calibre Library' 'Code'
'Desktop' 'Documents' 'Mobile' 'Library' 'Music' 'Obsidian' 'Old'
'Documentation' 'Pictures' 'Repositories' 'Software' 'Unal' 'Videos')

# TODO: ensure folder end with /

for folder in "${folders[@]}"; do
    if [[ -d $homeFolder/$folder ]]; then
        rsync -a --progress $homeFolder/$folder $target/backup-$(date '+%Y-%m-%d')/$folder
    else 
        echo $key not found.
    fi
done

cat <<END
+----------------------------------------------------------------+
  Files trasfered.
+----------------------------------------------------------------+
END
