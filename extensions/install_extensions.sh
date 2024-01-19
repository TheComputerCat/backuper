#!/usr/bin/env bash

set -e

backuper_dir=$(dirname -- "$0")/..
user=$1

. $backuper_dir/iniGet.sh

confFile=$backuper_dir/conf.ini
declare -A extensions

extensions[bed-time-mode]=bed-time-mode.sh
extensions[night-theme-swither]=night-theme-swither.sh
extensions[nothing-to-say]=nothing-to-say.sh

for key in "${!extensions[@]}"; do
    value="$(iniGet $confFile extensions $key)"
    if [[ "$value" == "true" ]]; then
        if [[ -x $backuper_dir/extensions/${extensions[$key]} ]]; then
            echo "Installation for '"$key"' script called."
            su - $user -c "$backuper_dir/extensions/${extensions[$key]} $user $2"
        else 
            echo "Installation file for '"$key"' does not exist or is not an executable."
        fi
    else
        echo $key will not be installed.
    fi
done

echo 'Pop-shell have to be installed with a non-root user'