#!/usr/bin/env bash

set -e

backuper_dir=$(pwd)/..

. $backuper_dir/iniGet.sh

confFile=$backuper_dir/conf.ini
declare -A programs

programs[signal]=signal.sh
programs[vscodium]=vscodium.sh
programs[docker]=docker.sh
programs[tor]=tor.sh
programs[mullvad]=mullvad.sh
programs[podman]=podman.sh
programs[coyim]=coyim.sh
programs[goland]=goland.sh
programs[obsidian]=obsidian.sh
programs[autofreq]=autofreq.sh
programs[autofreq]=autofreq.sh
programs[oh-my-zsh]=oh-my-zsh.sh

for key in "${!programs[@]}"; do
    value="$(iniGet $confFile intallations $key)"
    if [[ "$value" == "true" ]]; then
        if [[ -x ${programs[$key]} ]]; then
            echo "Installation for '"$key"' script called."
            ${programs[$key]}
        else 
            echo "Installation file for '"$key"' does not exist or is not an executable."
        fi
    else
        echo $key will not be installed.
    fi
done