#!/usr/bin/with-contenv bashio
# shellcheck shell=bash

if [ ! -d /share/adult ]; then
    echo "Creating /share/adult"
    mkdir -p /share/adult
    chown -R hotio:hotio /share/adult
fi

if [ ! -d /share/downloads ]; then
    echo "Creating /share/downloads"
    mkdir -p /share/downloads
    chown -R hotio:hotio /share/downloads
fi

if [ -d /config/whisparr ] && [ ! -d /config/addons_config/whisparr ]; then
    echo "Moving to new location /config/addons_config/whisparr"
    mkdir -p /config/addons_config/whisparr
    chmod 777 /config/addons_config/whisparr
    mv /config/whisparr/* /config/addons_config/whisparr/
    rm -r /config/whisparr
fi

if [ ! -d /config/addons_config/whisparr ]; then
    echo "Creating /config/addons_config/whisparr"
    mkdir -p /config/addons_config/whisparr
    chmod 777 /config/addons_config/whisparr
fi