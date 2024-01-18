#!/usr/bin/env bash

set -e

user=$1
homeFolder=$2

if [[ ! -e $homeFolder/Software/coy ]]; then
    mkdir -p $homeFolder/Software
    wget --content-disposition https://github.com/coyim/coyim/releases/download/v0.4.1/coyim_linux_amd64 \
    -O $homeFolder/Software/coy
fi

echo "8c5d61c2fa8f5f88a9fa7693ae6085b445fa05a9802151a9f6478cd306beade4 $homeFolder/Software/coy" | sha256sum -c

chown -R $user:$user $homeFolder/Software

cat <<END
+------------------------------------------------+
+ CoyIm successfully installed.                 +
+------------------------------------------------+
END

