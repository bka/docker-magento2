init:
	make init-permissions
	docker-compose run --rm --no-deps --user=www-data php bash -c 'composer install'
  docker-compose run --rm --no-deps --user=www-data php bash -c 'bin/magento setup:install --db-host=mysql --db-name=magento2 --db-user=magento2 --db-password=magento2 --admin-user=admin --admin-password=admin123 --admin-email=admin@localhost.de --admin-firstname=admin --admin-lastname=admin'
	scripts/magento-set-base-url localhost:8123

init-permissions:
	sudo chmod -R 775 Source/var
	sudo chmod -R 775 Source/app/etc
	sudo chmod -R 775 Source/pub/media
	sudo chmod -R 775 Source/pub/static
	sudo chmod -R 775 Source
	sudo chgrp -R www-data Source
	chmod +x scripts/*.sh

reinit-docker:
	docker-compose stop php mysql
	docker-compose rm --force php mysql
	docker-compose build php mysql
	docker-compose start
	docker-compose up -d
