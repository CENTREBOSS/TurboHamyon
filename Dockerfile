# PHP 8.1 Apache versiyasidan foydalanamiz
FROM php:8.1-apache

# Zaruriy PHP kengaytmalarini o'rnatamiz (curl va mbstring)
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    pkg-config \
    libssl-dev \
    && docker-php-ext-install curl

# Apache mod_rewrite ni yoqamiz
RUN a2enmod rewrite

# Ishchi katalogni belgilaymiz
WORKDIR /var/www/html

# Kodlarni konteynerga nusxalaymiz
COPY . /var/www/html/

# Fayl va papkalarga ruxsat beramiz (Sizning botingiz txt fayllarga yozadi)
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 775 /var/www/html

# 80-portni ochamiz
EXPOSE 80
