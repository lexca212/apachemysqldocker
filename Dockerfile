FROM php:8.2-apache

# Install OS dependencies
RUN apt-get update && apt-get install -y \
    libonig-dev \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    unzip \
    git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
        mysqli \
        pdo \
        pdo_mysql \
        mbstring \
        zip \
        gd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Enable Apache rewrite
RUN a2enmod rewrite

# Permission
RUN chown -R www-data:www-data /var/www/html

# Versi salah
# FROM php:8.2-apache

# RUN docker-php-ext-install mysqli pdo pdo_mysql itu yang salah(dom mbstring zip gd curl)

# RUN a2enmod rewrite

# ENV APACHE_DOCUMENT_ROOT=/var/www/html

# RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' \
#     /etc/apache2/sites-available/*.conf \
#     /etc/apache2/apache2.conf

# RUN chown -R www-data:www-data /var/www/html