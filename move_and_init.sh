#!/bin/sh
cp -a /prosody/etc/* /etc/prosody/
cp -a /prosody/modules/ /usr/lib/prosody/modules/
chmod a+x /prosody/scripts/*.sh
/prosody/scripts/create_cert.sh && /prosody/scripts/create_user.sh && /usr/bin/supervisord
