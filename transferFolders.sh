#!/usr/bin/env bash

set -e

option=$1
backu_dir=$2

folders=('BackUp' 'Boring' 'Calibre Library' 'Code'
'Desktop' 'Documentation' 'Documents' 'Dotfiles' 'Library' 'Mobile' 'Music' 'Obsidian' 'Old'
'Pictures' 'Software' 'Term' 'Unal' 'Videos')

if [[ $option == "-u" ]]; then
    target=$backu_dir/backup-$(date '+%Y-%m-%d')
    source=$HOME
    mkdir -p $target
elif [[ $option == "-l" ]]; then
    target=$HOME
    source=$backu_dir
else
    echo Option not recognized.
    exit 1
fi

for folder in "${folders[@]}"; do
    if [[ -d $source/"$folder" ]]; then
        echo Copying "$folder"
        rsync -au --info=progress2 $source/"$folder"/ $target/"$folder"/
    else 
        echo "$folder" not found.
    fi
done

echo Copying $source/Repositories and excluding Thunderbird
rsync -au --info=progress2 --exclude Thunderbird/ $source/Repositories/ $target/Repositories/

cat <<END
+----------------------------------------------------------------+
  Files trasfered.
+----------------------------------------------------------------+
END
