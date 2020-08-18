include .env
export


build:
	docker build -t ${IMAGE_NAME} .

check-ip:
	curl --proxy localhost:8118 http://httpbin.org/ip

get-ip:
	curl http://httpbin.org/ip


# Operating with simple Docker container
# --------------------------------------

run:
	docker run --rm -d -p 8118:8118 -p 9050:9050 --name ${CONTAINER_NAME} ${IMAGE_NAME}

ps:
	docker ps -a | grep "${CONTAINER_NAME}"

log:
	docker logs ${CONTAINER_NAME}

flog:
	docker logs --follow ${CONTAINER_NAME}

stop:
	docker stop ${CONTAINER_NAME}


# Operating with Docker service
# -----------------------------

serv:
	docker service create -p 8118:8118 -p 9050:9050 --name ${SERVICE_NAME} ${IMAGE_NAME}

serv-scale:
	docker service scale ${SERVICE_NAME}=$(n)

serv-ls:
	docker service ls | grep "${SERVICE_NAME}"

serv-ps:
	docker service ps ${SERVICE_NAME}

serv-log:
	docker service logs ${SERVICE_NAME}

serv-rm:
	docker service rm ${SERVICE_NAME}
