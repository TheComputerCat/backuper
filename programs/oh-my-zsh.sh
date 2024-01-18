#!/usr/bin/env bash

set -e

targetUser=$1

su - $targetUser -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

apt -y install --no-install-recommends fonts-powerline >> /dev/null
cat <<END
+----------------------------------------------------------------+
  Oh my zsh successfully installed.
+----------------------------------------------------------------+
END