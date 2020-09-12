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


# Operating with Docker Swarm Stack
# ---------------------------------

# Build custom image
stack-build:
	docker-compose -f ${DOCKER_COMPOSE_CONFIG} build

# Pull the latest base images and build custom images
stack-freshbuild:
	docker-compose -f ${DOCKER_COMPOSE_CONFIG} build --pull --no-cache

# Push custom images to repository
stack-push:
	docker-compose -f ${DOCKER_COMPOSE_CONFIG} push

# Deploy swarm stack
stack-deploy:
	docker stack deploy -c ${DOCKER_COMPOSE_CONFIG} --with-registry-auth ${STACK_NAME}

# Build images, redo config, deploy
stack-redeploy:
	make stack-build
	make stack-deploy
	make stack-ls

# Rescale Tor & Privoxy services
stack-scale:
	docker service scale ${STACK_NAME}_tor-privoxy=$(n)
	make stack-ls

# Print logs of tor-privoxy from Stack
stack-log:
	docker service logs ${STACK_NAME}_tor-privoxy

# Print & follow logs of tor-privoxy from Stack
stack-flog:
	docker service logs --follow ${STACK_NAME}_tor-privoxy

# List stack tasks
stack-ps:
	docker stack ps ${STACK_NAME}

# List stack services
stack-ls:
	docker stack services ${STACK_NAME}

# Remove stack
stack-rm:
	docker stack rm ${STACK_NAME}
