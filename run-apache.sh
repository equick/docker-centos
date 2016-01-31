#!/bin/bash

# clean up any previous runs of httpd
rm -rf /run/httpd/* /tmp/httpd*

exec /usr/sbin/httpd -D FOREGROUND
