FROM debian:bullseye-slim

RUN apt update && apt install apache2 libapache2-mod-php php-mysql php-ldap php-xml php-gd php-mbstring php-zip php-curl php-xmlrpc php-intl php-bz2 php-imagick php-apcu php-redis php-ldap php-xml php-gd php-mbstring php-zip php-curl php-xmlrpc php-intl php-bz2 php-imagick php-apcu php-redis -y

COPY grr /var/www/grr
RUN chown -R www-data:www-data /var/www/grr
RUN chmod -R +x /var/www/grr/personnalisation

COPY grr.conf /etc/apache2/sites-available/grr.conf
RUN a2ensite grr.conf
RUN a2dissite 000-default.conf
RUN a2enmod rewrite

EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]