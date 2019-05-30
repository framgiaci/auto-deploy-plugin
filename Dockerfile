FROM php:7

RUN apt-get -y update

COPY commands.sh /scripts/commands.sh
COPY rocketeer.phar /usr/bin/rocketeer

RUN chmod +x /usr/bin/rocketeer
RUN ["chmod", "+x", "/scripts/commands.sh"]
RUN docker-php-ext-install pcntl

RUN curl -LO https://deployer.org/deployer.phar
RUN mv deployer.phar /usr/local/bin/dep
RUN chmod +x /usr/local/bin/dep

ENTRYPOINT ["/scripts/commands.sh"]
WORKDIR /workdir
