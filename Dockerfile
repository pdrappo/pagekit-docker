FROM ubuntu:bionic

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get -yq install \
    nginx \
    git \
    ca-certificates \
    php7.2 php7.2-fpm php7.2-cli php7.2-json php7.2-mysql php7.2-curl php7.2-sqlite

# Install Node.js and npm
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs npm

ENV PAGEKIT_VERSION 1.0.18

# RUN mkdir /pagekit
WORKDIR /pagekit
VOLUME /pagekit

ADD nginx.conf /etc/nginx/nginx.conf

RUN apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN chown -R www-data: /pagekit

RUN useradd -ms /bin/bash -d /pagekit pagekit
RUN usermod -aG www-data,sudo pagekit

CMD ["sh", "-c", "service php7.2-fpm start && nginx"]