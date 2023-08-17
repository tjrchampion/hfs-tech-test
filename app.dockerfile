#can update to latest rc version if needed.
FROM php:8.2.8-fpm 

# RUN apt-get update && apt-get install -y \
#     libmcrypt-dev && \
#     docker-php-ext-install pdo_mysql

RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Copy Composer from the official Composer image
#COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer