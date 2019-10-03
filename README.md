# README - neo4j

https://neo4j.com/

https://neo4j.com/developer/get-started/

https://neo4j.com/docs/driver-manual/1.7/

https://github.com/neo4j-drivers/boltkit

# Bolt V.3

Starting with Neo4j 3.0 a binary protocol called Bolt is supported.

It is based on the PackStream serialization.

+ Cypher Types
+ Protocol Versioning
+ Authentication
+ TLS via certificates
+ Smart client routing for clusters.
+ Load balancing and failover for clusters.

## Bolt Types

| Bolt | Python 3 | Java | JavaScript | C# |
| ---- | -------- | ---- | ---------- | -- |
| null | None | null | null | null |
| List | list | List<Object> | Array | IList<object> |
| Map  | dict | Map<String, Object> | Object | IDictionary<string, object> |
| Boolean | bool | boolean | Boolean | bool |
| Integer (64 bits) | int | [long](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html) | Integer | long |
| Float (64 bits) | float | [double](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html) | Number | double |
| String (UTF-8) | str | String | String | string |
| ByteArray | bytearray | byte[] | Int8Array | byte[] |

| Bolt | Description | Python 3 | Java | JavaScript | C# |
| ---- | ----------- | -------- | ---- | ---------- | -- |
| Date | A date without a time-zone in the ISO-8601 calendar system. Example: `2007-12-03` | neotime.Date | LocalDate | Date | LocalDate |
| Time | A time with an offset from UTC/Greenwich in the ISO-8601 calendar system, Example: `10:15:30+01:00` | neotime.Time | OffsetTime | Time | OffsetTime |
| LocalTime | A time without a explicit time-zone in the ISO-8601 calendar system. Example: `10:15:30` | neotime.Time | LocalTime | LocalTime | LocalTime |
| DateTime | A date-time with a time-zone in the ISO-8601 calendar system. Example: `2007-12-03T10:15:30+01:00 Europe/Paris` | neotime.DateTime | ZonedDateTime | DateTime | ZonedDateTime |
| LocalDateTime | A date-time without a time-zone in the ISO-8601 calendar system. Example: `2007-12-03T10:15:30` | neotime.DateTime | LocalDateTime | LocalDateTime | LocalDateTime |
| Duration | A temporal amount. | neotime.Duration | IsoDuration | Duration | Duration |
  
| Bolt | Description | Python 3 | Java | JavaScript | C# |
| ---- | ----------- | -------- | ---- | ---------- | -- |
| Node | Snapshot of a node within a graph database. | Node | Node | Node | INode |
| Relationship | Snapshot of a relationship within a graph database. | Relationship | Relationship | Relationship | IRelationship |
| Path | Alternating sequence of nodes and relationships. | Path | Path | Path | IPath |


| Bolt | Description | Python 3 | Java | JavaScript | C# |
| ---- | ----------- | -------- | ---- | ---------- | -- |
| Point | Represents a single location in 2-dimensional or 3-dimensional space. | Point | Point | Point | Point |


**Note:** Node, Relationship and Path can only be found in query results.

**JavaScript:** Has no native integer type so a custom Integer type is provided. For convenience, this can be disabled through configuration so that the native Number type is used instead. Note that this can lead to a loss of precision.

**C#:** DateTime zone names adhere to the https://www.iana.org/time-zones

**Python 3:**

int do not have a maximum. But is restricted to the Bolt Integer type range.

Floating point numbers are usually implemented using double in C; information about the precision and internal representation of floating point numbers for the machine on which your program is running is available in sys.float_info.

**Java:** The long data type is a 64-bit signed two's complement integer. It has a minimum value of -9,223,372,036,854,775,808 and a maximum value of 9,223,372,036,854,775,807 (inclusive).

# Neo4j Drivers

https://neo4j.com/developer/language-guides/

https://neo4j.com/docs/driver-manual/current/

| Language    | Git | API  | Changelog |
|-------------|---|---|---|
| Java        | https://github.com/neo4j/neo4j-java-driver | https://neo4j.com/docs/api/java-driver/current/ |   |
| JavaScript  | https://github.com/neo4j/neo4j-javascript-driver | https://neo4j.com/docs/api/javascript-driver/current/ |   |
| Python      | https://github.com/neo4j/neo4j-python-driver | https://neo4j.com/docs/api/python-driver/current/ | https://github.com/neo4j/neo4j-python-driver/wiki |
| .Net        | https://github.com/neo4j/neo4j-dotnet-driver  | https://neo4j.com/docs/api/dotnet-driver/current |   |
| Go          |  https://github.com/neo4j/neo4j-go-driver | https://godoc.org/github.com/neo4j/neo4j-go-driver/neo4j |   |

# Bolt Connectors

Python 1.7.0b1 - Broke out connector code into separate package: neobolt

https://github.com/neo4j-drivers/neobolt

https://github.com/neo4j-drivers/seabolt

https://github.com/neo4j-drivers/gobolt

# Neo4j Server

https://github.com/neo4j/neo4j/wiki/Changelog

https://neo4j.com/developer/docker/


https://github.com/neo4j/neo4j-python-driver/wiki/1.6-changelog - Can now work with Bolt protocol v2, as introduced in server 3.4

https://github.com/neo4j/neo4j-java-driver/wiki/1.0-changelog - A fully new API for Neo4j, and a client implementation of the Bolt V1 protocol.

https://github.com/neo4j/neo4j-dotnet-driver/wiki/1.0-changelog - It provides all the basic features to connect to a 3.0+ Neo4j database and run Cypher statements over the BOLT protocol.

https://github.com/neo4j/neo4j-javascript-driver/wiki/1.0-changelog - A fully new API for Neo4j, and a client implementation of the Bolt V1 protocol.

| Server | Bolt Protocol | Java Driver | JavaScript Driver | Python Driver | .Net Driver | Go Driver |
|---|---|---|---|---|---|---|
| 4.0 | 4.0 | 4.0 | 4.0 | 4.0| 4.0 | |
| 3.5 | 3.0 | 1.7 | 1.7 | 1.7 | 1.7 | 1.7 |
| 3.4 | 2.0 | 1.6 | 1.6 | 1.6 | 1.6 | 1.6 |
| 3.3 | | | | | | |
| 3.2 | | | | | | |
| 3.1 | | | | | | |
| 3.0 | 1.0 | 1.0 | 1.0 | 1.0 | 1.0 | 1.0 |
| 2.3 | | | | | | |
| 2.2 | | | | | | |
| 2.1 | | | | | | |
| 2.0 | | | | | | |
| 1.9 | | | | | | |


https://github.com/neo4j/neo4j/wiki/Neo4j-3.2-changelog - Updated Bolt driver to 1.4.3




# Neo4j Ecosystem

https://neo4j.com/docs/

https://neo4j.com/docs/operations-manual/current/

https://neo4j.com/docs/cypher-refcard/current/

https://neo4j.com/docs/cypher-manual/current/



# Graph Visualization


## Java

### JUNG

https://en.wikipedia.org/wiki/JUNG

https://github.com/aamanlamba/jung-neo4j


## JavaScript

### Vis.js

https://visjs.org/

Example with neo4j database: https://github.com/aamanlamba/graphvisjs

http://ciminf.github.io/Hacking-Health-Camp-Hackathon/display-graph.html

### Neovis.js

Based on vis

https://github.com/neo4j-contrib/neovis.js

## Neo4j Bloom

https://neo4j.com/bloom/

**Requirements:** Neo4j Desktop

> Neo4j Desktop is the new mission control center for Developers.
> It’s free with registration, and it includes a free development license for Enterprise Edition allowing you to use Neo4j Enterprise on your local desktop for developing applications.

<img src="./Neo4j.Graph.Platform.Bloom.svg">


## REST API and HTTP API

**Neo4j REST API:** https://neo4j.com/docs/rest-docs/current/ (Depricated in version 4.0)

```
GET http://localhost:7474/db/data/
Accept: application/json; charset=UTF-8
```

Example response

```
200: OK
Content-Type: application/json;charset=utf-8
{
  "extensions" : { },
  "node" : "http://localhost:7474/db/data/node",
  "relationship" : "http://localhost:7474/db/data/relationship",
  "node_index" : "http://localhost:7474/db/data/index/node",
  "relationship_index" : "http://localhost:7474/db/data/index/relationship",
  "extensions_info" : "http://localhost:7474/db/data/ext",
  "relationship_types" : "http://localhost:7474/db/data/relationship/types",
  "batch" : "http://localhost:7474/db/data/batch",
  "cypher" : "http://localhost:7474/db/data/cypher",
  "indexes" : "http://localhost:7474/db/data/schema/index",
  "constraints" : "http://localhost:7474/db/data/schema/constraint",
  "transaction" : "http://localhost:7474/db/data/transaction",
  "node_labels" : "http://localhost:7474/db/data/labels",
  "neo4j_version" : "3.4.2-SNAPSHOT"
}
```


**Neo4j HTTP API:** https://neo4j.com/docs/http-api/3.5/

```
POST http://localhost:7474/db/data/transaction/commit
Accept: application/json; charset=UTF-8
```

```
curl -d "@data.json" -H "Content-Type: application/json" -X POST http://localhost:7474/db/data/transaction/commit -u neo4j:password
```

Example Query, data.json

```json
{
  "statements" : [ {
    "statement" : "CREATE (n) RETURN id(n)"
  } ]
}
```

Example Response:

Example response

```
200: OK
Content-Type: application/json
{
  "results" : [ {
    "columns" : [ "id(n)" ],
    "data" : [ {
      "row" : [ 6 ],
      "meta" : [ null ]
    } ]
  } ],
  "errors" : [ ]
}
```
