#!/usr/bin/with-contenv bash

PUID=${PUID:-911}
PGID=${PGID:-911}

groupmod -o -g "$PGID" abc
usermod -o -u "$PUID" abc

echo '
-------------------------------------
          _         ()
         | |  ___   _    __
         | | / __| | |  /  \
         | | \__ \ | | | () |
         |_| |___/ |_|  \__/


Brought to you by linuxserver.io
-------------------------------------'
if [[ -f /donate.txt ]]; then
    echo '
To support the app dev(s) visit:'
    cat /donate.txt
fi
echo '
To support LSIO projects visit:
https://www.linuxserver.io/donate/
-------------------------------------
GID/UID
-------------------------------------'
echo "
User uid:    $(id -u abc)
User gid:    $(id -g abc)
-------------------------------------
"

time32="$(date +%Y)"

if [[ "${time32}" == "1970" || "${time32}" == "1969" ]] && [ "$(uname -m)" == "armv7l" ]; then
  echo '
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

Your DockerHost is running an outdated version of libseccomp

To fix this, please visit https://docs.linuxserver.io/faq#libseccomp

Apps will not behave correctly without this

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
'
sleep infinity
fi

chown abc:abc /app
chown abc:abc /config
chown abc:abc /defaults