FROM debian:jessie

RUN apt-get update \
 && apt-get install -y git \
 && apt-get clean

RUN git clone https://github.com/letsencrypt/letsencrypt
WORKDIR letsencrypt
RUN ./bootstrap/debian.sh
RUN ./letsencrypt-auto --help

VOLUME ["/etc/letsencrypt", "/var/www/html"]
ENTRYPOINT ["./letsencrypt-auto", "certonly", "--webroot", "-w", "/var/www/html"]
