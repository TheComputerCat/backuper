#!/bin/bash

backu_dir=$1

dconf_path=$backu_dir/Dotfiles/dconfs.ini

declare -A folders
declare -A files

folders[$backu_dir/Dotfiles/.obsidian/]=$HOME/Obsidian/.obsidian
folders[$backu_dir/Dotfiles/.config/VSCodium/]=$HOME/.config/VSCodium
folders[$backu_dir/Dotfiles/.ssh/]=$HOME/.config/VSCodium
# TODO: ensure folder end with /

files[$backu_dir/Dotfiles/.gitconfig]=$HOME
files[$backu_dir/Dotfiles/.profile]=$HOME
files[$backu_dir/Dotfiles/.zshrc]=$HOME
files[$backu_dir/Dotfiles/commander_back.jpg]=$HOME/.local/share/backgrounds

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
