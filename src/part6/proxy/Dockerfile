FROM nginx:latest

USER root

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/

CMD ["nginx", "-g", "daemon off;"]

