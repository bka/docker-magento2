#!/bin/bash

docker-compose run --rm --no-deps --user=www-data php bash -c 'bin/magento setup:install --db-host=mysql --db-name=magento2 --db-user=magento2 --db-password=magento2 --admin-user=admin --admin-password=admin123 --admin-email=admin@localhost.de --admin-firstname=admin --admin-lastname=admin --backend-frontname=admin --base-url=http://localhost:8123/'
