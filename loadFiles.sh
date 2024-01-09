#!/bin/bash

backu_dir=$1

folders=('BackUp' 'Boring' 'Calibre\ Library' 'Code'
'Desktop' 'Documentation' 'Documents' 'Dotfiles' 'Library' 'Mobile' 'Music' 'Obsidian' 'Old'
'Pictures' 'Software' 'Term' 'Unal' 'Videos')

# TODO: ensure folder end with /


for folder in "${folders[@]}"; do
    if [[ -d $backu_dir/$folder ]]; then
        rsync -a --progress $backu_dir/$folder $HOME/$folder
    else 
        echo $key not found.
    fi
done

rsync -a --progress --exclude $backu_dir/Repositories/Thunderbird/ $backu_dir/Repositories/ $HOME/Repositories/


cat <<END
+----------------------------------------------------------------+
  Files trasfered.
+----------------------------------------------------------------+
END