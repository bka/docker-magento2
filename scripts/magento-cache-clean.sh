#!/bin/bash

docker-compose run --rm --no-deps php bash -c "bin/magento cache:clean"
docker-compose run --rm --no-deps varnish bash -c "curl -X PURGE varnish"
