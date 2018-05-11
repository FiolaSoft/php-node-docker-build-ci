# Docker image for running PHP on CI

* Based on [sunfoxcz/docker-php-build](https://github.com/sunfoxcz/docker-php-build) (but thrown away everything what is not needed for CI)
* PHP installed from [Ondrej Sury's Ubuntu PPA](https://launchpad.net/~ondrej/+archive/ubuntu/php) which contains almost any posiible package

## APT packages added

* curl
* unzip
* git
* mysql-client
* postgresql-client
* redis-tools
* nodejs
* npm

## PHP packages installed

* bcmath
* bz2
* cli
* curl
* gd
* imap
* intl
* json
* mbstring
* mcrypt (before php 7.2)
* mysql
* opcache
* pgsql
* readline
* soap
* sqlite3
* xml
* zip
* mongodb
* redis

## NPM packages globally installed

* yarn
* sass
* less
* minify
* cross-env

## Composer packages globally installed

* [composer](https://getcomposer.org/) (of course)
* [hirak/prestissimo](https://github.com/hirak/prestissimo) which speeds up composer install
* [jakub-onderka/php-parallel-lint](https://github.com/JakubOnderka/PHP-Parallel-Lint) which tests PHP syntax in parallel
* [nette/code-checker](https://github.com/nette/code-checker) which checks for coding style and template error in Nette framework
* [phpstan/phpstan](https://github.com/phpstan/phpstan)
* [fiolasoft/qa](https://github.com/fiolasoft/qa)

## Cache dirs redirected

 * NPM: `/cache/npm`
 * yarn: `/cache/yarn`
 * Composer: `/cache/composer`

You may want to set `/cache` dir as Docker image volume for faster CI build.

## ENV variables changed/added

 * `$PATH`: added `~/.composer/vendor/bin`
 * `$COMPOSER_NO_INTERACTION`: set to `1`

## Tags (and PHP version) available for Docker

* 7.1
* 7.2
