#!/usr/bin/env bash

set -e

ZSHRC_FILE=~/.zshrc
GITCONFIG_FILE=~/.gitconfig
PROFILE_FILE=~/.profile
OBSIDIAN_FOLDER=~/Obsidian/.obsidian
DEST=~/Dotfiles/$(date '+%Y-%m-%d')

rsync -au --info=progress2 $ZSHRC_FILE $GITCONFIG_FILE $PROFILE_FILE $OBSIDIAN_FOLDER $DEST

dconf dump / > $DEST/dconfs.ini