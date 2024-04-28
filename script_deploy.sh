#! /bin/bash

docker load -i vollmed-test-sonarcloud_api.tar

mv docker-compose-prod.yaml docker-compose.yaml

#!/bin/bash

# Listar os IDs dos containers em execução
container_ids=$(docker ps -q)

# Verificar se há containers em execução
if [ -z "$container_ids" ]; then
    echo "Não há containers em execução."
    exit 0
fi

# Parar cada container
for container_id in $container_ids; do
    echo "Parando container: $container_id"
    docker stop $container_id
done

echo "Todos os containers em execução foram parados."

docker compose up -d
