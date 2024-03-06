# Use an official image with Apache as the base
FROM php:8.3-apache

# Set the working directory within the container /var/www/html
WORKDIR /var/www/html

# Install dependencies for Laravel
RUN apt-get update && \
    apt-get install -y \
        libzip-dev \
        unzip \
        git && \
    docker-php-ext-install pdo_mysql zip

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy the local Laravel project files to the container
COPY ./Laravel-Project/ /var/www/html/Laravel-Project

# Copy the shell script
COPY laravel-entrypoint.sh /var/www/laravel-entrypoint.sh

# Give execute permissions to the shell script
RUN chmod +x /var/www/laravel-entrypoint.sh

# Copy custom Apache configuration to Apache folder
COPY ./apache/default.conf /etc/apache2/sites-available/000-default.conf

# Expose port 80 used by Apache to the outside
EXPOSE 80

# Specify the command to run on container start
CMD ["/var/www/laravel-entrypoint.sh"]