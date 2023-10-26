#!/bin/bash

service nginx start
nginx -s reload
gcc main.c -lfcgi -o my_server
spawn-fcgi -p 8080 -n my_server

while true; do
	wait
done
