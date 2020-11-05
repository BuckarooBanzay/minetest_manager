#!/bin/sh

test -f "$DEBUG_LOG" || exit

cat << EOF > /etc/logrotate.conf
${DEBUG_LOG} {
    monthly
    maxsize 1G
    rotate 120
    compress
    dateext
    copytruncate
    su root root
}
EOF

logrotate /etc/logrotate.conf
