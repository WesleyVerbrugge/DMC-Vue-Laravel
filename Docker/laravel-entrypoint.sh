cd Laravel-Project

composer install --no-interaction --prefer-dist

cd ..

chown -R www-data:www-data /var/www/html

a2enmod rewrite

apache2-foreground
