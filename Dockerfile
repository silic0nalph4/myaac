FROM php:8.0-apache
# No Nginx+PHP image for ARM64 currently :(

# Base dependencies
RUN apt-get update \
	&& apt-get install -y \
	libzip-dev \
	zip \
	libpng-dev \
	vim \
	less

# PHP config for MyAAC
RUN docker-php-ext-install zip pdo pdo_mysql gd

# Copy current version of website files into image
# It would be better to mount these from the local system for easier editing
# but we need to set the permissions so Apache can execute them.
COPY . /var/www/html
RUN chown -R www-data.www-data /var/www/*
 