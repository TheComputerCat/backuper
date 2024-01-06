#!/usr/bin/env bash

set -e

targetUser=$1

su - $targetUser -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) && chsh -s $(which zsh)"

cat <<END
+----------------------------------------------------------------+
  Oh my zsh successfully installed.
+----------------------------------------------------------------+
END