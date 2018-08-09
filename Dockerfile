FROM php:7

RUN apt-get -y update

COPY commands.sh /scripts/commands.sh
COPY rocketeer.phar /usr/bin/rocketeer

RUN chmod +x /usr/bin/rocketeer
RUN ["chmod", "+x", "/scripts/commands.sh"]

ENTRYPOINT ["/scripts/commands.sh"]
WORKDIR /workdir
