#!/bin/bash
set -euxo pipefail

CERTDIR=/etc/letsencrypt/live/znc.asyahammond.com

certbot renew
new_cert=$(mktemp)
chmod 400 "$new_cert"
chown znc:znc $new_cert
cat "$CERTDIR/"{privkey,cert,chain}.pem "/root/dhparam.pem" >> "$new_cert"
mv "$new_cert" /home/znc/.znc/znc.pem
# should I restart znc?
