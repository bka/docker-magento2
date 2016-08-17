#!/bin/bash

docker-compose run --rm --no-deps php bash -c "bin/magento cache:clean"
