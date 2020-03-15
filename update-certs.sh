#!/bin/bash
  
# Renew the certificate
certbot renew --force-renewal --tls-sni-01-port=8888

# Concatenate new cert files, with less output (avoiding the use tee and its output to stdout)
for dir in /etc/letsencrypt/live/*; do
    namedir="$(cut -d'/' -f5 <<< $dir)"
    echo "Now fixing $namedir"
        bash -c "cat /etc/letsencrypt/live/$namedir/fullchain.pem /etc/letsencrypt/live/$namedir/privkey.pem > /etc/haproxy/ssl/$namedir.pem"
done

# Reload  HAProxy
service haproxy reload
