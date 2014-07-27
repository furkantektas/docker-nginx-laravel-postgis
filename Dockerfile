FROM tektas/nginx-php-postgis
MAINTAINER Furkan Tektas <http://github.com/furkantektas>
#Reference: https://github.com/outrunthewolf/dockerfile-app-laravel/

# Creating a laravel user
RUN useradd -m laravel

# Add base nginx conf
ADD ./config/default_nginx_conf /etc/nginx/nginx.conf

# Add a default vhost, activate host file
ADD ./config/default_vhost /etc/nginx/sites-available/default.conf
RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

# Set up php fpm, restart php
ADD ./config/default_php_pool /etc/php5/fpm/pool.d/default.conf
RUN touch /var/log/php-slowlog.log

# Exposing HTTP port
EXPOSE 80

# nginx directory
VOLUME ["/srv/www"]

# Running nginx in the foreground
CMD service php5-fpm start && service postgresql start && /usr/sbin/nginx -c /etc/nginx/nginx.conf
