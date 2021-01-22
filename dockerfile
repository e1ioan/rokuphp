#FROM php:5-apache
#FROM php:7.2-apache
FROM ubuntu

ADD install.sh /
RUN bash -c "/install.sh" 


ENTRYPOINT service apache2 restart && bash

# COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
# COPY start-apache /usr/local/bin


# Copy application source

