#!/bin/bash

if [ -z "$1" ]
then
  echo "Usage: `basename $0` http://DOMAIN/"
  exit $E_NOARGS
fi

DOMAIN=$1
# set value
docker-compose run --rm --no-deps php bash -c "mysql --execute=\"update core_config_data set value='http://${DOMAIN}/' where path='web/unsecure/base_url' OR path='web/secure/base_url';\""
# clean cache
docker-compose run --rm --no-deps php bash -c "bin/magento cache:clean"
