#!/bin/bash

#clone the  HFS Laravel project into laravel directory
git clone https://github.com/tjrchampion/hfs-test-test-lara.git laravel

#move directory
cd laravel

#run everything 
docker-compose build

#run composer install in container then dispose of it
docker container run --rm -v $(pwd):/app composer update && composer install

#move directory
cd ../

#copy over the env into laravel project.
# I've generated a key for you, however you may wish to run "docker-compose exec app php artisan key:generate"
cp .env.example laravel/.env

#run everything 
docker-compose up