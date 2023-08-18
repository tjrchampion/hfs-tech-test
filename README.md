Docker environment for HFS tech test
==============
A quick local dev/testing Docker container with Nginx/MySQL and Laravel. This repo does not include the laravel portion of the test. Please follow `setup.sh` directions below which will pull in the repo that holds the laravel project

Git clone this repo then run `sh setup.sh` from a blank project directory.
Laravel sits inside `./{project_name}/laravel`. Env will be copied into `laravel/.env`.

Once you've run `sh setup.sh`, you should execute the following steps.

1. `docker-compose exec app npm install`
2. `docker-compose exec app npm run build`
3. `docker-compose exec app php artisan key:generate`
4. `docker-compose exec app php artsian config:clear`
5. `docker-compose exec app php artisan migrate`
6. `docker-compose exec app php artisan db:seed --class=UserSeeder`

If you want to run vite dev server, run the following command: `docker-compose run --rm --service-ports npm run dev	`. The `--service-ports` flag here is important. I'll make the connection between the PHP container and npm, allowing for the assets to load, and hot reloading to work.


### Run in projects root directory
`docker-compose exec app php artisan key:generate`
Note: Create an alias in ~/.bash_profile  `alias phpd="docker-compose exec app php"` which will allow you to run `phpd artisan`. For those changes to take affect run `source ~/.bash_profile` or restart terminal.

When you're finished developing you can run: `docker-compose down` to remove all containers.

### Docker is Optional
It is worth noting that running Laravel with Docker is entirely optional. I would recommend using my custom Docker environment in this instance, but you could quite easily run this using Laravel's own Docker implementation, Sail... 
You spin it up with Valet or Herd if this is your prefered way of running it. You can easily clone the project repo instead of this one, and composer install the project. The .env.example is configured with defaults for the MySQL using Docker, but that would be easily changed.

This Docker environment is tested on Mac OS only using Docker Desktop Version 3.6.0 (3.6.0.5487). I don't have Windows in order to confirm it runs smoothly.

Cheers, Tom.