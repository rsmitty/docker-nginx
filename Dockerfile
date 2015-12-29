FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/* &&\
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

COPY nginx.conf /etc/nginx/sites-available/default
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80 443

CMD /usr/sbin/nginx -g 'daemon off;'
