FROM debian:stretch

RUN apt-get update \
 && apt-get install -y letsencrypt \
 && apt-get clean

VOLUME ["/etc/letsencrypt", "/var/www/html"]
ENTRYPOINT ["letsencrypt", "certonly", "--webroot", "-w", "/var/www/html"]
