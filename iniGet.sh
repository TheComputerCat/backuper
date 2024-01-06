#!/bin/bash

iniGet() {
    if [[ $# -lt 2 || ! -f $1 ]]; then
        echo "usage: iniget <file> [<section> [key]]"
        echo ""
    fi
    local inifile=$1
    local section=$2
    local key
    [ $# -eq 3 ] && key=$3

    local lines=$(awk '/\[/{prefix=$0; next} $1{print prefix $0}' $inifile)
    for line in $lines; do
        if [[ "$line" = \[$section\]* ]]; then
            local keyval=$(echo $line | sed -e "s/^\[$section\]//")
            if [[ "$keyval" = $key=* ]]; then
                echo $(echo $keyval | sed -e "s/^$key=//")
            fi
            
        fi
    done
    echo ""
}