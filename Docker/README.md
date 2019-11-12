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

> Ubuntu                                                                          

```
apt-get update
```        
                                        
> `-qq` suppress output which you usually don't need in Dockerfile.

```                                                                                                  
apt-get -qq -y install curl
```

> Another nice trick - tell `debconf` that it is working in non interactive environment.

```
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
```

```
apt-get -qq -y install net-tools nmap neovim docker.io
```


# Configure

> Add user in docker group

```
sudo usermod -aG docker $USER
```

> then relog to the system.

# Usefull Commands

```
docker ps --format "table {{.ID}}\t{{.Names}}\t{{.RunningFor}}\t{{.Status}}\t{{.Ports}}"
```

```
docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Commands}}\t{{.Status}}\t{{.Ports}}"
```

```
docker ps --format "ID\t{{.ID}}\nNAME\t{{.Names}}\nIMAGE\t{{.Image}}\nPORTS\t{{.Ports}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.CreatedAt}}\nSTATUS\t{{.Status}}\n"
```

> Stop all containers

```
docker stop $(docker ps -q)
```

> Force stop all containers

```
docker kill $(docker ps -q)
```

> Remove all containers

```
docker rm $(docker ps -a -q)
```

> Remove all images

```
docker rmi $(docker images -q)
```

> Start neo4j server

```
docker run --name server35e -p7687:7687 -p7474:7474 -p7473:7473 --env NEO4J_AUTH=neo4j/password --env NEO4J_ACCEPT_LICENSE_AGREEMENT=yes neo4j:3.5-enterprise
```

# Network

https://docs.docker.com/engine/reference/commandline/network_connect/

> List networks

```
docker network ls
```

> Create a network

```
docker network create -d bridge teamcity
```

```
docker network create -d bridge --ipv6 --subnet=172.18.0.0/16 teamcity
```

> Inspect a network

```
docker network inspect teamcity
```

> Assign static ip address to container

**server**
```
docker run -it -d --network=teamcity --name=server --dns=8.8.8.8 --ip=172.22.0.22 ubuntu:18.04
```

**client**
```
docker run -it -d --network=teamcity --name=client --dns=8.8.8.8 --ip=172.22.0.33 drivers:python-test
```

**conductor**

```
docker run -it -d --network=teamcity --name=conductor --dns=8.8.8.8 --ip=172.22.0.44 --volume /var/run/docker.sock:/var/run/docker.sock drivers:python-test
```

> Attach to a container

```
docker attach --detach-keys 'ctrl-k' container_name
```

> Rename a container

```
docker rename random_name server
```

## Conductor Container

https://stackoverflow.com/questions/25529386/how-can-i-set-a-static-ip-address-in-a-docker-container

> A "conductor container" is able to run docker commands by itself (inside) so to start and stop containers as needed.
> Each container is configured to know where to connect to access a particular role/container in the dist-app
> (so the set of ip's for each role must be known by each partner).

**Dockerfile**

```
FROM pin3da/docker-zeromq-node
MAINTAINER Foobar

# install docker software  
RUN apt-get -yqq update && apt-get -yqq install docker.io 

# export /var/run/docker.sock  so we can connect it in the host
VOLUME /var/run/docker.sock

> Build conductor image.

```
docker build --tag=myrepos/conductor --file=Dockerfile .
```

> Run conductor container

**conductor**

```
docker run -it -d --network=teamcity --name=conductor --dns=8.8.8.8 --ip=172.22.0.44 --volume /var/run/docker.sock:/var/run/docker.sock drivers:python-test
```

> To make this work via the “wormwhole” technique, you have to use those additional docker run arguments

```
--volume /var/run/docker.sock:/var/run/docker.sock
```
