#!/bin/bash

echo "Spinning up three VMs..."
for i in 1 2 3; do  docker-machine create -d openstack node-$i; done;

echo "Initializing Swarm mode..."
eval $(docker-machine env node-1)
docker swarm init --advertise-addr $(docker-machine ip node-1)
#docker node update --availability drain node-1

echo "Adding the nodes to the Swarm..."
MANAGER_IP=`docker-machine ip node-1`
TOKEN=`docker swarm join-token -q worker`
for i in 2 3; do  eval $(docker-machine env node-$i); docker swarm join --token ${TOKEN} ${MANAGER_IP}:2377; done;

echo "Deploying Spark..."
eval $(docker-machine env node-1)
export EXTERNAL_IP=$(docker-machine ip node-2)
docker stack deploy --compose-file=docker-compose.yml spark
docker service scale spark_worker=2

echo "Get address..."
NODE=$(docker service ps --format "{{.Node}}" spark_master)
docker-machine ip $NODE
