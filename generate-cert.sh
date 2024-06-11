#!/bin/bash

cd certs
openssl genrsa 2048 > squid-ca.key
openssl req -new -key squid-ca.key -config squid-ca.conf -out squid-ca.csr
openssl x509 -req -in squid-ca.csr -signkey squid-ca.key -days 365 -out squid-ca.crt
