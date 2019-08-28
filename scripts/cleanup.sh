#!/bin/bash

apt-get clean
rm -rf /tmp/* /var/tmp/*
rm -rf /var/lib/apt/lists/*

# clean up python bytecode
find / -mount -name *.pyc -delete
find / -mount -name *__pycache__* -delete

rm -f /etc/ssh/ssh_host_*
