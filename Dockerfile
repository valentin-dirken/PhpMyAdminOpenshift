FROM phpmyadmin/phpmyadmin:latest

EXPOSE 8080

RUN chown -R www-data:root /etc/phpmyadmin/ && chmod -R 775 /etc/phpmyadmin/

RUN sed -i 's/:80/:8080/' /etc/apache2/sites-available/000-default.conf && \
    sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf && \
    sed -i 's/Listen 443/Listen 8443/' /etc/apache2/ports.conf

USER www-data:root
