#!/bin/bash
certbot certonly --standalone -d $HOSTNAME
cp -f /etc/letsencrypt/live/$HOSTNAME/privkey.pem /usr/local/solusvm/includes/nvnc/cert.pem
cat /etc/letsencrypt/live/$HOSTNAME/fullchain.pem >> /usr/local/solusvm/includes/nvnc/cert.pem
chmod 0600 /usr/local/solusvm/includes/nvnc/cert.pem
chown solusvm:solusvm /usr/local/solusvm/includes/nvnc/cert.pem
sh /scripts/websocket-stop
