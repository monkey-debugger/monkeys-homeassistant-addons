#!/bin/bash

if [ -d /config/whisparr ] && [ ! -d /config/addons_config/whisparr ]; then
    echo "Moving to new location /config/addons_config/whisparr"
    mkdir -p /config/addons_config/whisparr
    chown -R abc:abc /config/addons_config/whisparr
    mv /config/whisparr/* /config/addons_config/whisparr/
    rm -r /config/whisparr
fi

if [ ! -d /config/addons_config/whisparr ]; then
    echo "Creating /config/addons_config/whisparr"
    mkdir -p /config/addons_config/whisparr
    chown -R abc:abc /config/addons_config/whisparr
fi