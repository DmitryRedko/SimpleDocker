#!/bin/bash

spawn-fcgi -p 8080 -n my_server

while true; do
	wait
done
