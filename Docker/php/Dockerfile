FROM php:7.0.9-apache


RUN curl -O https://getcomposer.org/download/1.2.0/composer.phar
RUN mv composer.phar /usr/bin/composer
RUN chmod +x /usr/bin/composer

RUN apt-get update

RUN apt-get install -y libxslt1.1 libxslt1-dev
RUN docker-php-ext-install -j$(nproc) xsl

RUN apt-get install -y zlib1g-dev
RUN docker-php-ext-install -j$(nproc) zip

RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng12-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd

RUN apt-get install -y libicu-dev
RUN docker-php-ext-install -j$(nproc) intl

RUN docker-php-ext-install -j$(nproc) mcrypt

RUN docker-php-ext-install -j$(nproc) pdo_mysql

RUN pecl install xdebug
RUN echo 'zend_extension = /usr/local/lib/php/extensions/no-debug-non-zts-20151012/xdebug.so' >> /usr/local/etc/php/php.ini
RUN touch /usr/local/etc/php/conf.d/xdebug.ini; \
	echo xdebug.remote_enable=1 >> /usr/local/etc/php/conf.d/xdebug.ini; \
  	echo xdebug.remote_autostart=0 >> /usr/local/etc/php/conf.d/xdebug.ini; \
  	echo xdebug.remote_connect_back=1 >> /usr/local/etc/php/conf.d/xdebug.ini; \
  	echo xdebug.remote_port=9000 >> /usr/local/etc/php/conf.d/xdebug.ini; \
  	echo xdebug.remote_log=/tmp/php5-xdebug.log >> /usr/local/etc/php/conf.d/xdebug.ini;

RUN a2enmod rewrite

RUN apt-get install -y mysql-client
