#!/bin/sh
cp -a /prosody/etc/* /etc/prosody/
cp -a /prosody/modules/ /usr/lib/prosody/modules/
chmod a+x /prosody/scripts/*.sh
if [ -e /prosody/scripts/create_cert.txt ]
then
    /prosody/scripts/create_user.sh && /usr/bin/supervisord
else
    echo "Creating certs..."
    echo "created!" > /prosody/scripts/create_cert.txt
    /prosody/scripts/create_cert.sh && /prosody/scripts/create_user.sh && /usr/bin/supervisord
fi
