FROM php:7.4-apache

COPY ./php.ini /usr/local/etc/php/

RUN apt-get update \
  && apt-get install --no-install-recommends -y git curl wget sudo libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libmcrypt-dev libxml2-dev libpq-dev libzip-dev libpq5 postgresql-client default-mysql-client libicu-dev libonig-dev libmagickwand-dev \
  && mv /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled \
  && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
  && docker-php-ext-install -j$(nproc) zip gd xml pdo pdo_mysql mysqli soap intl \
  && (printf "\n" | pecl install imagick) \
  && docker-php-ext-enable imagick \
  && docker-php-ext-install exif \
  && rm -rf /var/lib/apt/lists/*

RUN /bin/sh -c a2enmod rewrite

CMD /var/www/data/batch/clear_cache.sh; apache2-foreground
