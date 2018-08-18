# alpine-nginx-php
Dockerized Nginx with PHP-FPM on Alpine

## Docker Hub Image:
- rbekker87/alpine-nginx-php:7
- https://hub.docker.com/r/rbekker87/alpine-nginx-php/

## Environment Variables:

```
- SERVER_NAME=example.com
Defaults to: server_name _;
```

```
- CONTENT_PATH="\/var\/www\/localhost\/path"
Defaults to: root /var/www/localhost/htdocs;
```

## Usage:

Run a Container:

```
$ docker run -itd --name test \
  -p 80:80 \ 
  -e SERVER_NAME=example.com \
  -e CONTENT_PATH="\/var\/www\/localhost\/htdocs" \
  rbekker87/alpine-nginx-php:7
```

Make a GET Request:

```
$ curl -i -H "Host: example.com"  http://localhost:80/
HTTP/1.1 200 OK
Server: nginx
Date: Sat, 18 Aug 2018 21:53:49 GMT
Content-Type: text/html; charset=UTF-8
Transfer-Encoding: chunked
Connection: keep-alive
X-Powered-By: PHP/7.2.8

Hostname: 40d76983c79d
```
