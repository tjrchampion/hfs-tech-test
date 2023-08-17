Docker environment for HFS tech test
==============
A quick local dev/testing Docker container with Nginx/MySQL and Laravel. This repo does not include the laravel portion of the test. Please follow `setup.sh` directions below which will pull in the repo that holds the laravel project

Git clone this repo run `sh setup.sh` from a blank project directory.
Laravel sits inside `./{project_name}/laravel`. Env will be copied into `laravel/.env` with key already generated, you may choose to run commands listed below.


The above details are dependent on the docker-compose file. You can adjust the settings under `mysqldb.evironment` per project. If you do this be sure to run `docker-compose build` to pull in your new configurations.

**Run in projects root directory:**\s\s
`docker-compose exec app php artisan key:generate`
Note: Create an alias in ~/.bash_profile  `alias phpd="docker-compose exec app php"` which will allow you to run `phpd artisan`. For those changes to take affect run `source ~/.bash_profile` or restart terminal.

When you're finished developing you can run: `docker-compose down` to remove all containers.

**Docker is Optional**
It is worth noting that running Laravel with Docker is entirely optional. I would recommend using my custom Docker environment in this instance, but you could quite easily run this using Laravel's own Docker implementation, Sail... 
You spin it up with Valet or Herd if this is your prefered way of running it. You can easily clone the project repo instead of this one, and composer install the project. The .env.example is configured with defaults for the MySQL using Docker, but that would be easily changed.

This Docker environment is tested on Mac OS only using Docker Desktop Version 3.6.0 (3.6.0.5487). I don't have Windows in order to confirm it runs smoothly.

Cheers, Tom.