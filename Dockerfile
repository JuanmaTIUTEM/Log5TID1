# Usar una imagen base con PHP y Apache
FROM php:7.4-apache

# Instalar extensiones de PHP necesarias para CodeIgniter y MySQL
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copiar los archivos de la aplicación al contenedor
COPY . /var/www/html/

# Configurar permisos adecuados
RUN chown -R www-data:www-data /var/www/html

# Activar mod_rewrite de Apache para URLs amigables
RUN a2enmod rewrite

# Exponer el puerto 80
EXPOSE 80
