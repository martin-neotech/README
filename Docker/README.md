# README

## Neo4j Server Docker Images

https://neo4j.com/developer/docker/

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
docker run --name testlatest -p7687:7687 -p7474:7474 -p7473:7473 --env NEO4J_AUTH=neo4j/word neo4j:latest
```

```
docker run --name testenterprise -p7687:7687 -p7474:7474 -p7473:7473 --env NEO4J_AUTH=neo4j/word --env NEO4J_ACCEPT_LICENSE_AGREEMENT=yes neo4j:enterprise
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
