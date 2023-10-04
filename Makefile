# Define the path to the docker-compose.yml
COMPOSE_FILE := src/docker-compose.yml

# 모든 서비스 빌드
build:
	sudo docker-compose -f $(COMPOSE_FILE) build

# 모든 서비스 시작
up:
	sudo docker-compose -f $(COMPOSE_FILE) up -d

# 모든 서비스 중지 및 제거
down:
	sudo docker-compose -f $(COMPOSE_FILE) down

# 모든 서비스 재시작
restart:
	sudo docker-compose -f $(COMPOSE_FILE) down && sudo docker-compose -f $(COMPOSE_FILE) up -d

# 로그 확인
logs:
	sudo docker-compose -f $(COMPOSE_FILE) logs -f

ps:
	sudo docker-compose -f $(COMPOSE_FILE) ps

wordpress_sh:
	sudo docker exec -it wordpress sh

mariadb_sh:
	sudo docker exec -it mariadb sh

nginx_sh:
	sudo docker exec -it nginx sh

clean:
	sudo docker-compose -f $(COMPOSE_FILE) down
	sudo docker-compose -f $(COMPOSE_FILE) rm -f

fclean: clean
	sudo docker image prune -af
	sudo docker volume prune -af

re: fclean build up

.PHONY: build up down restart logs ps wordpress_sh mariadb_sh nginx_sh clean fclean
