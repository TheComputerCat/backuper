#!/bin/bash

homeFolder=$2
backu_dir=$3

folders=('Term' 'BackUp' 'Boring' 'Calibre Library' 'Code'
'Desktop' 'Documents' 'Mobile' 'Library' 'Music' 'Obsidian' 'Old'
'Documentation' 'Pictures' 'Repositories' 'Software' 'Unal' 'Videos')

# TODO: ensure folder end with /


for folder in "${folders[@]}"; do
    if [[ -d $backu_dir/$folder ]]; then
        rsync -a --progress $backu_dir/$folder $homeFolder/$folder
    else 
        echo $key not found.
    fi
done

cat <<END
+----------------------------------------------------------------+
  Files trasfered.
+----------------------------------------------------------------+
END