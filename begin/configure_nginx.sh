#!/bin/bash

# install nginx
apt-get update
apt-get install nginx

# set configuration file for getcast
nginx/nginx_settings.sh getcast.nargothrond.me /home/getcast/public