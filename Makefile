init:
	make init-permissions
	docker-compose run --rm --no-deps --user=www-data php bash -c 'composer install'
	scripts/magento-install.sh

init-permissions:
	sudo chmod -R 775 Source/var
	sudo chmod -R 775 Source/app/etc
	sudo chmod -R 775 Source/pub/media
	sudo chmod -R 775 Source/pub/static
	sudo chmod -R 775 Source
	sudo chgrp -R www-data Source
	chmod +x scripts/*.sh

reinit-docker:
	docker-compose stop php
	docker-compose rm --force php
	docker-compose build php
	docker-compose start
	docker-compose up -d

refresh:
	rm -rf Source/var/generation/*
	rm -rf Source/var/di/*
	rm -rf Source/var/cache/*
	rm -rf Source/var/view_preprocessed/*
	rm -rf Source/pub/static/_requirejs
	rm -rf Source/pub/static/adminhtml
	rm -rf Source/pub/static/frontend
