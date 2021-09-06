FROM php:8.0-apache

RUN apt-get update \
	&& apt-get install -y \
	libzip-dev \
	zip \
	&& docker-php-ext-install zip pdo pdo_mysql

COPY . /var/www/html
RUN chown -R www-data.www-data /var/www/*

