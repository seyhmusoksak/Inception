build:
	@echo "Building Docker images..."
	if [ ! -d ${HOME}/data/wordpress ]; then mkdir -p ${HOME}/data/wordpress; fi
	if [ ! -d ${HOME}/data/mariadb ]; then mkdir -p ${HOME}/data/mariadb; fi
	docker-compose -f srcs/docker-compose.yml build

up:
	@echo "Starting containers..."
	docker-compose -f srcs/docker-compose.yml up -d

down:
	@echo "Stopping containers..."
	docker-compose -f srcs/docker-compose.yml down

clean: down
	@echo "Cleaning Docker system..."
	docker-system prune -af
	docker-volume prune -f

fclean: clean
	@echo "Cleaning WordPress and MariaDB data..."
	@sudo rm -rf ${HOME}/data/wordpress || true
	@sudo rm -rf ${HOME}/data/mariadb || true

re: fclean build up
