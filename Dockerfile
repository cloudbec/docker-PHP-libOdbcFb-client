FROM nuagebec/ubuntu
MAINTAINER David Tremblay <david@nuagebec.ca>

#install php and apache

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -yq install \
        curl \
        apache2 \
        libapache2-mod-php5 \
        php5-mysql \
        php5-gd \
        php5-curl \
        php-pear \
        php-mail \
        mysql-client \
        php-apc \ 
	unixodbc \ 
	unixodbc-dev \ 
	php5-interbase \
	php5-odbc \ 
	libmyodbc && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ADD supervisor_apache.conf /etc/supervisor/conf.d/apache.conf 
ADD ./config/php.ini /etc/php5/apache2/conf.d/php.ini
ADD ./config/000-default.conf /etc/apache2/sites-available/000-default.conf

#Activate php5-mcrypt
RUN php5enmod mcrypt

#Activate mod_rewrite
RUN a2enmod rewrite

#Activate SSl 
RUN a2enmod ssl

#Activate phpmod odbc
RUN php5enmod pdo_odbc


#install the odbc shit

COPY bin/libOdbcFb.so /usr/lib/x86_64-linux-gnu/libOdbcFb.so 

RUN ln -s /usr/lib/x86_64-linux-gnu/libfbclient.so.2 /usr/lib/libgds.so

COPY config/odbc.ini /etc/odbc.ini

COPY config/odbcinst.ini /etc/odbcinst.ini


RUN echo "<?php phpinfo();" > /var/www/html/index.php


EXPOSE 80 443
CMD ["/data/run.sh"]

