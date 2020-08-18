include .env
export


build:
	docker build -t ${IMAGE_NAME} .


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
