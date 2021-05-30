## DOCKER

# Show all docker ps
> docker ps -a

# Removing dangling images
> docker image prune
> docker rmi $(docker images -a -q)

# Stop and remove all containers
> docker container stop $(docker container ls -aq)
> docker container rm $(docker container ls -aq)
> docker-compose rm

## TERMINAL

# Ports in use
> sudo lsof -i -P -n | grep LISTEN