#!/bin/bash
set -e
source /build/buildconfig
set -x

## PPA Ondrej
LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php

apt-get update

## Often used tools.
$minimal_apt_get_install curl unzip git mysql-client postgresql-client \
	redis-tools nodejs npm

## PHP packages
$minimal_apt_get_install \
	php$1-bcmath \
	php$1-bz2 \
	php$1-cli \
	php$1-curl \
	php$1-gd \
	php$1-imap \
	php$1-intl \
	php$1-json \
	php$1-mbstring \
	php$1-mysql \
	php$1-opcache \
	php$1-pgsql \
	php$1-readline \
	php$1-soap \
	php$1-sqlite3 \
	php$1-xml \
	php$1-zip \
	php-redis

if [ "$1" -ne "7.2" ]; then
	$minimal_apt_get_install php$1-mcrypt
fi

# NPM speed-up yarn sass less minify cross-env installation
npm install -g npm yarn sass less minify cross-env

# Composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

mkdir /cache

# NPM: cache
npm config set cache /cache/npm

# Composer speed-up
composer global require hirak/prestissimo:@stable
composer global require jakub-onderka/php-parallel-lint:@stable
composer global require nette/code-checker:~2.5.0
composer global require phpstan/phpstan:@stable
composer global require fiolasoft/qa:~0.7.2