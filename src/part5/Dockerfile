FROM nginx:latest

USER root

WORKDIR /home/

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./main.c /home/main.c
COPY ./start_script.sh /home/start_script.sh

RUN apt-get update; \
    apt-get install -y gcc spawn-fcgi libfcgi-dev; \
    chmod 777 start_script.sh; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;

RUN chmod 777 /usr/bin/su; \
    chmod 777 /usr/bin/expiry; \
    chmod 777 /usr/bin/chsh; \
    chmod 777 /usr/bin/newgrp; \
    chmod 777 /usr/bin/chfn; \
    chmod 777 /usr/bin/umount; \
    chmod 777 /usr/bin/wall; \
    chmod 777 /usr/bin/mount; \
    chmod 777 /usr/bin/passwd; \
    chmod 777 /usr/bin/chage; \
    chmod 777 /usr/sbin/unix_chkpwd; \
    chmod 777 /usr/bin/gpasswd; \
    chmod 777 /etc/nginx

HEALTHCHECK CMD curl --fail http://localhost/ || exit 1

RUN service nginx start; \
    nginx -s reload; \
    gcc main.c -lfcgi -o my_server

USER mynginx

ENTRYPOINT ["/home/start_script.sh"]
