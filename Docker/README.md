# README

## Neo4j Server Docker Images

https://neo4j.com/developer/docker/

https://hub.docker.com/_/neo4j

```
docker pull neo4j:latest
```

```
docker pull neo4j:enterprise
```

https://docs.docker.com/docker-for-windows/

```
docker image ls -a
```

https://neo4j.com/developer/docker-run-neo4j/

```
docker run --name testlatest -p7687:7687 -p7474:7474 -p7473:7473 --env NEO4J_AUTH=neo4j/password neo4j:latest
```

```
docker run --name testenterprise -p7687:7687 -p7474:7474 -p7473:7473 --env NEO4J_AUTH=neo4j/password --env NEO4J_ACCEPT_LICENSE_AGREEMENT=yes neo4j:enterprise
```

```
docker container stop testlatest
```

```
docker ps -a
```

```
docker rm ImageID
```

## Causal Cluster

The containers in the cluster need to be set up so that they can talk to each other.

Each container must have a network route to each of the others.

Environment variables must be set for **Cores**:

```
NEO4J_causal__clustering_expected__core__cluster__size
NEO4J_causal__clustering_initial__discovery__members
```

**Read Replicas** only need to define:

```
NEO4J_causal__clustering_initial__discovery__members
```

Within a single Docker host, this can be achieved as follows.

> Note that the default ports for HTTP, HTTPS and Bolt are used. For each container, these ports are mapped to a different set of ports on the Docker host.

```
docker network create --driver=bridge cluster

docker run --name=core1 --detach --network=cluster \
    --publish=7474:7474 --publish=7473:7473 --publish=7687:7687 \
    --env=NEO4J_dbms_mode=CORE \
    --env=NEO4J_causal__clustering_expected__core__cluster__size=3 \
    --env=NEO4J_causal__clustering_initial__discovery__members=core1:5000,core2:5000,core3:5000 \
    --env=NEO4J_ACCEPT_LICENSE_AGREEMENT=yes \
    neo4j:3.5-enterprise

docker run --name=core2 --detach --network=cluster \
    --publish=8474:7474 --publish=8473:7473 --publish=8687:7687 \
    --env=NEO4J_dbms_mode=CORE \
    --env=NEO4J_causal__clustering_expected__core__cluster__size=3 \
    --env=NEO4J_causal__clustering_initial__discovery__members=core1:5000,core2:5000,core3:5000 \
    --env=NEO4J_ACCEPT_LICENSE_AGREEMENT=yes \
    neo4j:3.5-enterprise

docker run --name=core3 --detach --network=cluster \
    --publish=9474:7474 --publish=9473:7473 --publish=9687:7687 \
    --env=NEO4J_dbms_mode=CORE \
    --env=NEO4J_causal__clustering_expected__core__cluster__size=3 \
    --env=NEO4J_causal__clustering_initial__discovery__members=core1:5000,core2:5000,core3:5000 \
    --env=NEO4J_ACCEPT_LICENSE_AGREEMENT=yes \
    neo4j:3.5-enterprise
```

Additional instances can be added to the cluster in an ad-hoc fashion.

A **Read Replica** can for example be added with:

```
docker run --name=read_replica1 --detach --network=cluster \
         --publish=10474:7474 --publish=10473:7473 --publish=10687:7687 \
         --env=NEO4J_dbms_mode=READ_REPLICA \
         --env=NEO4J_causal__clustering_initial__discovery__members=core1:5000,core2:5000,core3:5000 \
         --env=NEO4J_ACCEPT_LICENSE_AGREEMENT=yes \
         neo4j:3.5-enterprise
```


# UBUNTU with Python

https://hub.docker.com/_/ubuntu

https://hub.docker.com/_/python

```
docker pull ubuntu:18.04
```





