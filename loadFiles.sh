#!/bin/bash

backu_dir=$1

folders=('BackUp' 'Boring' 'Calibre Library' 'Code'
'Desktop' 'Documentation' 'Documents' 'Dotfiles' 'Library' 'Mobile' 'Music' 'Obsidian' 'Old'
'Pictures' 'Software' 'Term' 'Unal' 'Videos')

for folder in "${folders[@]}"; do
    if [[ -d $backu_dir/"$folder" ]]; then
        echo Copying "$folder"
        rsync -au --info=progress2 $backu_dir/"$folder" $HOME/"$folder"
    else 
        echo "$folder" not found.
    fi
done

echo Copying $HOME/Repositories and excluding Thunderbird
rsync -au --info=progress2 --exclude Thunderbird/ $backu_dir/Repositories/ $HOME/Repositories/


cat <<END
+----------------------------------------------------------------+
  Files trasfered.
+----------------------------------------------------------------+
END