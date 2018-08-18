FROM rbekker87/alpine:3.8

RUN apk --no-cache add \
    nginx \
    php7-fpm \
    php7-mbstring \
    php7-pdo \
    php7-json \
    php7-openssl \
    php7-mysqlnd \
    php7-pdo_mysql \
    php7-mcrypt \
    php7-sqlite3 \
    php7-pdo_sqlite \
    php7-ctype \
    php7-zlib \
    php7-curl \
    php7-phar \
    php7-xml \
    php7-opcache \
    php7-intl \
    php7-bcmath \
    php7-dom \
    php7-xmlreader \
    curl \
    supervisor \
    && rm -rf /var/cache/apk/*

RUN curl -sS https://getcomposer.org/installer | php7 -- --install-dir=/usr/bin --filename=composer

RUN mkdir -p /etc/nginx && mkdir /run/nginx && chown -R nginx:nginx /run/nginx && mkdir -p /var/run/php7-fpm && mkdir -p /var/log/supervisor \
    && rm /etc/nginx/nginx.conf && rm /etc/nginx/conf.d/default.conf

ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/conf.d/default.conf
ADD index.php /var/www/localhost/htdocs/index.php
ADD nginx-supervisor.ini /etc/supervisor.d/nginx-supervisor.ini

CMD ["/bin/sh", "/boot.sh"]
