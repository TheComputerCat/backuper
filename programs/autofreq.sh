#!/usr/bin/env bash

set -e

cd /tmp

git clone https://github.com/AdnanHodzic/auto-cpufreq.git

cd auto-cpufreq && ./auto-cpufreq-installer && auto-cpufreq --install

cat <<END
+------------------------------------------------+
+ auto-cpufreq successfully installed.                 +
+------------------------------------------------+
END