#!/usr/bin/env bash

set -e

backuper_dir=$(pwd)
extensions_dir=$(pwd)/extensions

. $backuper_dir/iniGet.sh

confFile=conf.ini
declare -A extensions

extensions[bed-time-mode]=bed-time-mode.sh
extensions[night-theme-swither]=night-theme-swither.sh
extensions[nothing-to-say]=nothing-to-say.sh
extensions[pop-shell]=pop-shell.sh

for key in "${!extensions[@]}"; do
    value="$(iniGet $confFile intallations $key)"
    if [[ "$value" == "true" ]]; then
        if [[ -x $extensions_dir/${extensions[$key]} ]]; then
            echo "Installation for '"$key"' script called."
            $extensions_dir/${extensions[$key]}
        else 
            echo "Installation file for '"$key"' does not exist or is not an executable."
        fi
    else
        echo $key will not be installed.
    fi
done