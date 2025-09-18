all:
	@echo "Starting To Build Wordpress..."
	if [ ! -d ${HOME}/data/wordpress ]; then mkdir -p ${HOME}/data/wordpress; fi
	if [ ! -d ${HOME}/data/mariadb ]; then mkdir -p ${HOME}/data/mariadb; fi
	docker compose -f src/docker-compose.yaml up -d

down:
	docker compose -f src/docker-compose.yaml down

clean: down
	docker system prune -af
	docker volume prune -f

fclean: clean
	@echo "Cleaning wordpress and mariadb data..."
	@sudo rm -rf ${HOME}/data/wordpress/* || true
	@sudo rm -rf ${HOME}/data/mariadb/* || true

re: fclean all
