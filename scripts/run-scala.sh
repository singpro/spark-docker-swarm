#!/bin/sh

echo "Getting container ID of the Spark master..."
eval $(docker-machine env node-1)
#NODE=$(docker service ps --format "{{.Node}}" spark_master)
NODE=$(docker service ps --format "{{.Node}}" spark_master | head -n 1)
eval $(docker-machine env $NODE)
CONTAINER_ID=$(docker ps --filter name=master --format "{{.ID}}")

echo "Copying count.py script to the Spark master..."
docker cp /home/cloud-user/spark-docker-swarm/target/scala-2.11/wordcount_2.11-1.0.jar  $CONTAINER_ID:/tmp

echo "Running Spark job..."
docker exec $CONTAINER_ID \
  bin/spark-submit \
    --master spark://master:7077 \
    --class WordCount \
    /tmp/wordcount_2.11-1.0.jar 
