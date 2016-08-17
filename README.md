# Magento2 in docker

Pre-configured environment based on docker to run Magento2 for development.

Tested with:

  * Docker version 1.9.1
  * docker-compose version 1.5.2

If you don't have docker installed on your system:

    # install docker
    curl -sSL https://get.docker.com/ | sh

    # add user to docker group
    sudo gpasswd -a ${USER} docker

    # install docker-compose
    curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > docker-compose
    sudo mv docker-compose /usr/local/bin
    sudo chmod +x /usr/local/bin/docker-compose

## Install

Clone Magento 2 into Source folder and call:

    docker-compose up -d
    make init

Open your browser at `http://localhost:8123` and Magento2 should be up and running. Admin panel is at `http://localhost:8123/admin` and login credentials are `admin:admin123`.

## Change your base url

Default installation uses localhost:8123, set another domain with e.g:

    scripts/magento-set-base-url.sh mage2.dev.local

## bin/magento tasks and mysql

Installation lives inside docker containers, access them e.g. to run `bin/magento` tasks or query the database use:

    scripts/docker-ssh.sh

    scripts/docker-mysql.sh

## Install Sample Data

Just run this and you're done.

  scripts/magenti-install-sample-data.sh
