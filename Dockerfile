FROM php:8.5-fpm

# Installation des dépendances système (git et zip sont requis pour Composer)
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    && docker-php-ext-install zip

# Installation de Composer depuis l'image officielle
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html