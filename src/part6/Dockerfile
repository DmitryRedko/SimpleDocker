FROM nginx:latest

USER root

WORKDIR /home/

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./main.c /home/main.c
COPY ./start_script.sh /home/start_script.sh

RUN apt-get update; \
    apt-get install -y gcc spawn-fcgi libfcgi-dev; \
    chmod 777 start_script.sh

ENTRYPOINT ["/home/start_script.sh"]
