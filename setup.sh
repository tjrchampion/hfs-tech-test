#!/bin/bash

#clone the  HFS Laravel project into laravel directory
git clone https://github.com/tjrchampion/hfs-test-test-lara.git laravel

cp .env.example laravel/.env

#move directory
cd laravel

#run everything 
docker-compose build

#run composer install in container then dispose of it
docker container run --rm -v $(pwd):/app composer update && composer install 

#move directory
cd ../

#run everything 
docker-compose up