# tor-privoxy-alpine

Fork from https://github.com/rdsubhas/docker-tor-privoxy-alpine

## Changes:

* update base image to latest Alpine 3
* update .gitignore
* update .dockerignore
* add Makefile

### Usage

Make sure to install `make` and 
copy `example.env` as `.env` (edit if there's a need for that).

```
make run
curl --proxy localhost:8118 http://httpbin.org/ip

make stop
```

See `Makefile` for full list of shortcuts.
