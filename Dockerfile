# Render Dockerfile for FruitKart PHP Application
FROM php:8.2-apache

# Install PDO MySQL extensions
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Enable Apache rewrite and headers modules
RUN a2enmod rewrite headers

# Set Apache DocumentRoot to /var/www/html
WORKDIR /var/www/html

# Copy application files into the container
COPY . /var/www/html/

# Ensure uploads directories exist with proper write permissions
RUN mkdir -p /var/www/html/uploads/fruits /var/www/html/uploads/qr && \
    chmod -R 777 /var/www/html/uploads

# Configure Apache to listen on Render's dynamic PORT (Render provides $PORT environment variable)
ENV PORT=80
RUN sed -i 's/80/${PORT}/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

# Allow .htaccess and URL rewrites
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

EXPOSE 80

CMD ["apache2-foreground"]
