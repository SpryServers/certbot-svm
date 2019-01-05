#!/bin/bash
### For renewal: Copy this file to /scripts/ on slave server
### Then add the folling to root crontab
### 6 1,13 * * * certbot renew --standalone --renew-hook "bash /scripts/svm-slave-le-hook.sh"

cp -f /etc/letsencrypt/live/$HOSTNAME/privkey.pem /usr/local/solusvm/includes/nvnc/cert.pem
cat /etc/letsencrypt/live/$HOSTNAME/fullchain.pem >> /usr/local/solusvm/includes/nvnc/cert.pem
chmod 0600 /usr/local/solusvm/includes/nvnc/cert.pem
chown solusvm:solusvm /usr/local/solusvm/includes/nvnc/cert.pem
sh /scripts/websocket-stop
