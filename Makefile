DOCKER_COMPOSE = docker compose -f docker-compose.yaml
DOCKER_RUN = docker compose run

all:
	@echo "Docker: "
	@echo " - make up"
	@echo " - make build"
	@echo " - male down"
	@echo " - make run"
	@echo "   Exec:"
	@echo "    - make exec/app_bash"
	@echo "Composer: "
	@echo " - make composer/install"
	@echo " - make composer/update"
	@echo " - make composer/require"
	@echo " - make composer/require-dev"
	@echo " - make composer/dump-autoload"
	@echo " - make composer/remove"

composer/install:
	${DOCKER_RUN} composer install

composer/update:
	${DOCKER_RUN} composer update

composer/require:
	${DOCKER_RUN} composer require $(REQ)

composer/require-dev:
	${DOCKER_RUN} composer require --dev $(REQ)

composer/dump-autoload:
	${DOCKER_RUN} composer dump-autoload

composer/remove:
	${DOCKER_RUN} composer remove $(FOO)

run: build up composer/install

build:
	${DOCKER_COMPOSE} build

up:
	${DOCKER_COMPOSE} up -d

down:
	${DOCKER_COMPOSE} down

restart: down up

exec/app_bash:
	docker exec -it php /bin/bash

php/clear_cache:
	${DOCKER_RUN} php bin/console cache:clear

php/clear_cache_test:
	${DOCKER_RUN} php bin/console cache:clear --env=test