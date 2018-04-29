#/bin/bash

# CRT and KEY
openssl req -x509 -nodes \
            -days 365 \
            -newkey rsa:2048 \
            -keyout /certs/ca.key \
            -out    /certs/ca.crt

# P12
openssl pkcs12 -export -in /certs/ca.crt -inkey /certs/ca.key -out /certs/ca.p12

# PEM
openssl pkcs12 -in /certs/ca.p12 -nodes -out /certs/ca.pem

# DER
openssl x509 -outform der -in /certs/ca.pem -out /certs/ca.der

# BKS
keytool -noprompt -import -v -trustcacerts \
        -alias         'openssl x509 -inform PEM -subject_hash -noout -in /certs/ca.pem' \
        -file          /certs/ca.pem \
        -keystore      /certs/ca.bks \
        -storetype     BKS \
        -providerclass org.bouncycastle.jce.provider.BouncyCastleProvider \
        -providerpath  bc.jar