#!/usr/bin/env bash

set -e


ZSHRC_FILE=~/.zshrc
GITCONFIG_FILE=~/.gitconfig
PROFILE_FILE=~/.profile
CONFIG_FOLDER=~/.config/
OBSIDIAN_FOLDER=~/Obdisian/.obsidian/
DEST=~/dotfiles

rsync -au  $ZSHRC_FILE $GITCONFIG_FILE $PROFILE_FILE $CONFIG_FOLDER $OBSIDIAN_FOLDER $DEST

dconf dump / > $DEST/dconfs.ini