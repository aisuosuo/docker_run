#!/bin/zsh

openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout harbridgecrypto.com.key -out harbridgecrypto.com.crt



openssl genrsa -out harbridgecrypto.key 2048

openssl req -new -key harbridgecrypto.key -out harbridgecrypto.csr

AU
NSW
NORTH RYDE
Harbridge
crypto
harbridgecrypto.com
service@rddpay.com