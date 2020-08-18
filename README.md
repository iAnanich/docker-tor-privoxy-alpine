# tor-privoxy-alpine

Fork from https://github.com/rdsubhas/docker-tor-privoxy-alpine

## Changes:

* update base image to latest Alpine 3
* update .gitignore
* update .dockerignore
* add Makefile
* docker service functionality

### Usage

Make sure to install `make` and 
copy `example.env` as `.env` (edit if there's a need for that).


#### as Docker container
```
# get your IP for later comparison
make get-ip

# start container (it will remove itself automatically after being stopped)
make run

# retrieve IP using proxy
make check-ip

# print container status
make ps

# stop container (also removes it)
make stop
```

#### as Docker service
Using Docker service requires docker swarm to be initialized or connected to, 
but gives ability to scale easily (docker acts as load balancer).

```shell script
# create service
make serv

# scale service
make serv-scale n=4

# print short service status
make serv-ls

# remove service
make serv-rm
```

See `Makefile` for full list of shortcuts (logging etc.).
