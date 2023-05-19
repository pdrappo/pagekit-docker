FROM ubuntu:bionic

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get -yq install \
    nginx \
    ca-certificates \
    php7.2 php7.2-fpm php7.2-cli php7.2-json php7.2-mysql php7.2-curl php7.2-sqlite

# Install Node.js and npm
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

ENV PAGEKIT_VERSION 1.0.18
RUN mkdir /pagekit
WORKDIR /pagekit
VOLUME /pagekit

ADD nginx.conf /etc/nginx/nginx.conf

RUN apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["sh", "-c", "chown -R www-data: /pagekit && service php7.2-fpm start && nginx"]