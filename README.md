Use this command to build image:

``
sudo docker run -d -p 80:80 -p 5432:5432 -v /var/www/:/srv/www --name laravelpostgis tektas/nginx-laravel-postgis
``

