# geo server

[![aasaam](https://flat.badgen.net/badge/aasaam/software%20development%20group/0277bd?labelColor=000000&icon=https%3A%2F%2Fcdn.jsdelivr.net%2Fgh%2Faasaam%2Finformation%2Flogo%2Faasaam.svg)](https://github.com/aasaam)

[![Docker Image Size](https://flat.badgen.net/docker/size/aasaam/geo-server)](https://hub.docker.com/r/aasaam/geo-server)
[![Docker Repository on Quay](https://flat.badgen.net/badge/quay.io/repo/cyan)](https://quay.io/repository/aasaam/geo-server)

[![open-issues](https://flat.badgen.net/github/open-issues/aasaam/geo-server)](https://github.com/aasaam/geo-server/issues)
[![open-pull-requests](https://flat.badgen.net/github/open-prs/aasaam/geo-server)](https://github.com/aasaam/geo-server/pulls)
[![license](https://flat.badgen.net/github/license/aasaam/geo-server)](./LICENSE)

[geo-server](http://geoserver.org)] is offline geo map.

This container is useful for offline map services.

```bash
docker pull aasaam/geo-server
# or docker pull quay.io/aasaam/geo-server
```

```yml
version: '3'

services:
  geo-server:
    container_name: geo-server
    image: aasaam/geo-server
    ports:
      - 8080:8080
    restart: unless-stopped
```
