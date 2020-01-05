FROM ubuntu:latest

WORKDIR /var/www/html/sample-laravel-docker/

ADD /. .

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
        && apt-get -y install apache2 php tzdata curl git vim\
        &&  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN apt-get -y install php-mbstring php-bcmath php-xml php-zip

RUN chmod 777 -R storage/

ADD vol1/sample-apache.conf /etc/apache2/sites-available/

#disable default.conf and enable sample-apache.conf
RUN a2dissite 000-default.conf

RUN a2ensite sample-apache.conf

RUN a2enmod rewrite

# install composer dependencies
RUN composer install

ADD start.sh .

RUN chmod +x start.sh

CMD ./start.sh

EXPOSE 80
