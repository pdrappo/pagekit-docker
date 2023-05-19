[![Pagekit Banner](https://cloud.githubusercontent.com/assets/1716665/14317675/ba034b8c-fc09-11e5-81ed-f10f37d86ea5.png)](https://pagekit.com)

## Pagekit CMS

[![Build Status](https://travis-ci.org/pagekit/pagekit.svg?branch=develop)](https://travis-ci.org/pagekit/pagekit)

* [Dockerfile](https://github.com/izuolan/dockerfiles/tree/master/pagekit) `latest`
* [Pagekit.com](https://pagekit.com)
* [Github](https://github.com/pagekit/pagekit/)

Docker image for the Pagekit CMS

**Uses nginx + php7.2-fpm + SQLite**

## Usage
```
$ docker run -d \
  -p 8080:80 \
  --name pagekit-web \
  -v ./pagekit:/pagekit \
  .
```
On install, use sqlite.

## Use Docker-compose
* `mkdir ~/pagekit && cd ~/pagekit && vim docker-compose.yml`
```
version: '3'
services:
  pagekit:
    image: pdrappo/pagekit:sqlite
    ports:
        - "8080:80"
    volumes:
        - ./pagekit:/pagekit/
```
* `wget https://github.com/pagekit/pagekit/releases/download/1.0.18/pagekit-1.0.18.zip`
* `cd ~/pagekit && unzip pagekit-1.0.18.zip`
* Run `cd ~/pagekit && docker-compose up -d`
* On install, use sqlite.