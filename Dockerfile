# PHP 8.1 va Apache o'rnatilgan tayyor obrazdan foydalanamiz
FROM php:8.1-apache

# Papkalarni yaratish va huquqlarni berish (Txt fayllar ishlashi uchun)
RUN mkdir -p /var/www/html/statistika /var/www/html/foydalanuvchi /var/www/html/sozlamalar /var/www/html/buyurtma \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 777 /var/www/html

# Kodlarni konteyner ichiga nusxalash
COPY . /var/www/html/

# Apache portini sozlash
EXPOSE 80
