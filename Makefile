up:
	docker compose -f ./srcs/docker-compose.yml up --build

upd:
	docker compose -f ./srcs/docker-compose.yml up --build -d

# dir:
# 	@mkdir -p /home/otaraki/data
# 	@mkdir -p /home/otaraki/data/wordpress
# 	@mkdir -p /home/otaraki/data/mariadb


down: stop
	docker compose -f ./srcs/docker-compose.yml down --rmi all  --volumes
# sudo rm -rf /home/otaraki/data/*

stop:
	docker compose -f ./srcs/docker-compose.yml stop

prune: down
	docker system prune -af

re: prune up

network:
	docker network inspect inception

volumes:
	docker volume ls

.PHONY: up upd down stop prune re network volumes
