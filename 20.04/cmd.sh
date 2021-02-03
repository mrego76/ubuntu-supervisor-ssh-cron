#!/bin/bash
echo "root:$ROOTPWD" | chpasswd

/usr/bin/supervisord -n