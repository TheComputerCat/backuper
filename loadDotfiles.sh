#!/bin/bash

set -e

backu_dir=$1

dconf_path=$backu_dir/dconfs.ini

declare -A folders
declare -A files

folders[$backu_dir/.obsidian/]=$HOME/Obsidian/.obsidian
folders[$backu_dir/.ssh/]=$HOME/.ssh
# TODO: ensure folder end with /

files[$backu_dir/.gitconfig]=$HOME
files[$backu_dir/.profile]=$HOME
files[$backu_dir/.zshrc]=$HOME
files[$backu_dir/commander_back.jpg]=$HOME/.local/share/backgrounds

mkdir -p $HOME/.local/share/backgrounds

for key in "${!folders[@]}"; do
    if [[ -d $key ]]; then
        mkdir -p ${folders[$key]}
        rsync -a $key ${folders[$key]}
        echo $key moved to  ${folders[$key]}
    else 
        echo $key not found in backup folder.
    fi
done

for key in "${!files[@]}"; do
    if [[ -f $key ]]; then
        rsync -a $key ${files[$key]}
        echo $key copied to  ${files[$key]}
    else 
        echo $key not found in backup folder.
    fi
done

cat <<END
+----------------------------------------------------------------+
  Configuration folders and files transfered.
+----------------------------------------------------------------+
END

if [[ -f $backu_dir/gpg/TheComputerCat.gpg ]]; then
  gpg --import $backu_dir/gpg/TheComputerCat.gpg

cat << END
+----------------------------------------------------------------+
  Git GPG key imported.
+----------------------------------------------------------------+
END
else
  echo gpg key not found.
fi

if [[ -f $dconf_path ]]; then
  cat $dconf_path | sed "s|HOMEDIR|${HOME}|g" | dconf load /

cat <<END
+----------------------------------------------------------------+
  Settings loaded with dconf
+----------------------------------------------------------------+
END
else
  echo dconf file not found.
fi