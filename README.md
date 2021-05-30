## Project Requirement
- docker
- docker-compose

## Starting this Project
- Go to project root folder and run: `docker-compose build app`
- Start all containers with `docker-compose up -d`
- Run `docker-compose exec app bash` to access app container with bash

## System Structure
- docker
- Nginx
- Mysql
- PHP 7.3
- CakePHP 4 (Framework)

# Test
To use this application correctly you need Postman and import the collection in the `Postman` folder.
The endpoints there use the correctly api.