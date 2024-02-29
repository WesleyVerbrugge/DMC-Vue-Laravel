# Use an official image with apache as base
FROM php:8.3-apache

# Set the working directory within the container /var/www/html
WORKDIR /var/www/html

# Install dependencies for Laravel
RUN apt-get update && \
    apt-get install -y \
        libzip-dev \
        unzip \
        git && \
    docker-php-ext-install pdo_mysql zip && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy Apache VirtualHost configuration which is used to indicate the root of the laravel project as /public
COPY ./apache/default.conf /etc/apache2/sites-available/000-default.conf

# Enable Apache modules
RUN a2enmod rewrite

# Copy the local Laravel project files to the container
COPY ./Laravel-Project/ /var/www/html/Laravel-Project

# Set permissions for apache to be able to access /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Expose port 80 used by apache to the outside
EXPOSE 80

# Specify the command to run on container start
CMD ["apache2-foreground"]