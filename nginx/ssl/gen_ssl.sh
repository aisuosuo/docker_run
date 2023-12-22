#!/bin/zsh

openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout lucy.wifi.com.key -out lucy.wifi.com.crt