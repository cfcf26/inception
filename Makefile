# 모든 서비스 빌드
build:
	sudo docker-compose build

# 모든 서비스 시작
up:
	sudo docker-compose up -d

# 모든 서비스 중지 및 제거
down:
	sudo docker-compose down

# 모든 서비스 재시작
restart:
	sudo docker-compose down && sudo docker-compose up -d

# 로그 확인
logs:
	sudo docker-compose logs -f

ps:
	sudo docker-compose ps

wordpress_sh:
	docker exec -it inception_wordpress_1 sh

mariadb_sh:
	docker exec -it inception_mariadb_1 sh

nginx_sh:
	docker exec -it inception_nginx_1 sh

clean:
	docker-compose down
	docker-compose rm -f

fclean: clean
	docker image prune -af
	docker volume prune -af

re: fclean build up

.PHONY: build up down restart logs ps wordpress_sh mariadb_sh nginx_sh clean fclean

