#!/usr/bin/expect
set timeout 500
spawn prosodyctl cert generate example.com # Replace with your command.
expect "Choose key size (2048):" { send "\r" }
expect "countryName (GB):" { send "\r" }
expect "localityName (The Internet):" { send "\r" }
expect "organizationName (Your Organisation):" { send "\r" }
expect "organizationalUnitName (XMPP Department):" { send "\r" }
expect "commonName (example.com):" { send "\r" }
expect "emailAddress (xmpp@example.com):" { send "\r" }
expect eof
