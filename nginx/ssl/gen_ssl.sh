#!/bin/zsh

openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout harbridgecrypto.com.key -out harbridgecrypto.com.crt


openssl req -new -key bridgesecsys.key -out bridgesecsys.csr
openssl x509 -req -days 365 -in bridgesecsys.csr -signkey bridgesecsys.key -out bridgesecsys.crt

AU
NSW
NORTH RYDE
Harbridge
crypto
harbridgecrypto.com
service@rddpay.com
