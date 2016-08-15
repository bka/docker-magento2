#!/bin/bash

docker-compose run --rm --no-deps --user=www-data php bash -c 'exec /bin/bash'
