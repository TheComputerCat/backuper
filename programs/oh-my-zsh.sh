#!/usr/bin/env bash

set -e

user=$1
home_folder=$2

su - $user -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

su - $user << END
git clone https://github.com/zsh-users/zsh-autosuggestions $home_folder/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $home_folder/plugins/zsh-syntax-highlighting
END

ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh

apt -y install --no-install-recommends fonts-powerline >> /dev/null
cat << END
+----------------------------------------------------------------+
  Oh my zsh successfully installed.
+----------------------------------------------------------------+
END