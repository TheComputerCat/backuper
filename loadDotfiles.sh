#!/bin/bash

homeFolder=$2
backu_dir=$3

dconf_path=$backu_dir/dotfiles/dconfs.ini

declare -A folders
declare -A files

folders[$backu_dir/dotfiles/.obsidian/]=$homeFolder/Obsidian/.obsidian
folders[$backu_dir/dotfiles/.config/VSCodium/]=$homeFolder/.config/VSCodium
folders[$backu_dir/dotfiles/.ssh/]=$homeFolder/.config/VSCodium
# TODO: ensure folder end with /

files[$backu_dir/dotfiles/.gitconfig]=$homeFolder
files[$backu_dir/dotfiles/.profile]=$homeFolder
files[$backu_dir/dotfiles/.zshrc]=$homeFolder
files[$backu_dir/dotfiles/commander_back.jpg]=$homeFolder/.local/share/backgrounds

for key in "${!folders[@]}"; do
    if [[ -d $key ]]; then
        rsync -a $key ${folders[$key]}
        echo $key moved to  ${files[$key]}
    else 
        echo $key not found.
    fi
done

for key in "${!files[@]}"; do
    if [[ -f $key ]]; then
        rsync -a $key ${files[$key]}
        echo $key copied to  ${files[$key]}
    else 
        echo $key not found.
    fi
done

cat <<END
+----------------------------------------------------------------+
  Configuration folders and files transfered.
+----------------------------------------------------------------+
END

gpg --import $backu_dir/gpg/TheComputerCat.gpg

cat <<END
+----------------------------------------------------------------+
  Git GPG key imported.
+----------------------------------------------------------------+
END

cat $dconf_path | sed "s|HOMEDIR|${HOME}|g" | dconf load /

cat <<END
+----------------------------------------------------------------+
  Settings loaded with dconf
+----------------------------------------------------------------+
END
