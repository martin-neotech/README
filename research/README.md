# README

```#Python3
.data() method will return
1. Data about the object to be used in data analytics.
2. Easy to manipulate and work with.
3. Redundancy is removed and thus a nice data representation is needed.
4. JSON-like data for easy of use.
```

## Graph

### Node

#### Bolt Representation
```java
Node(
    Integer(id),
    List<String>(labels),
    Map<String, Value>(properties),
);
```

#### Python .data()

```python
{
  "id": 123,
  "labels": [Label1, Label2,],
  "properties": {...},
}
```

### Relationship

#### Bolt Representation

```java
Relationship(
    Integer(id),
    Integer(startNodeId),
    Integer(endNodeId),
    String(type),
    Map<String, Value>(properties),
);
```

#### Python .data()

```python
# Suggestion A
{
  "id": 321,
  "type": "RELATIONSHIP_TYPE",
  "properties": {...},
  "start_node": node1.data(),
  "end_node": node2.data(),
}

# This will have redundancy about nodes, but are representing the object as it is.
```

or

```python
# Suggestion B
{
  "id": 321,
  "type": "RELATIONSHIP_TYPE",
  "properties": {...},
  "start_node_id": 1,
  "end_node_id": 2,
}

# This will remove redundancy about nodes, and nodes are easy to find with the node_id.
```

### Path

#### Bolt Representation

```java
UnboundRelationship(
    Integer(id),
    String(type),
    Map<String, Value>(properties),
); //A relationship without information of start and end node id.

Path(
    List<Node>(nodes),
    List<UnboundRelationship>(rels),
    List<Integer>(ids), //list of relationship id and node id to represent the path. [n1, r1, n2, r2, n3]
);
```

#### Python .data()

```python
# Suggestion A
{
  "nodes": [a.data(), b.data(), c.data()],
  "relationships": [ab.data(), bc.data()]}
}
```

or

```python
# Suggestion B
{
  "nodes": OrderedDict(a.id: a.data(), b.id: b.data(), c.id: c.data()),
  "relationships": [ab.data(), bc.data()]}
}

# The nodes data can then be fetched easily by id or by key.

https://pypi.org/project/indexed.py/ is licensed under the GPL3. Can replace OrderedDict.

If Path Relationship Suggestion B is used with this Suggestion:

nodes[ab.start_node_id] == a.data()
nodes.keys() == [a.id, b.id, c.id]
nodes.values() == [a.data(), b.data(), c.data()]
```

or

```python
# Suggestion C
{
  "node_ids": [a.id, b.id, c.id],
  "relationships": [ab.data(), bc.data()]}
}

This requires that the node data is available somewhere else.
```

### Conclusion

Recommendation

```python
Node.data()         - No data loss
Relationship.data() - Relationship Suggestion B
Path.data()         - Path Suggestion B
```

or

```python
Node.data()             - No data loss
Relationship.data()     - Relationship Suggestion B
Path.data(node_id=True) - Path Suggestion B or C depending on the keyword to data.
```

## Date and Time

https://en.wikipedia.org/wiki/ISO_8601

https://www.iso.org/iso-8601-date-and-time-format.html

https://stackoverflow.com/questions/2150739/iso-time-iso-8601-in-python

https://www.cl.cam.ac.uk/~mgk25/iso-time.html

**Bolt**

Using ISO-8601

+ Date `2007-12-03`
+ Time `10:15:30+01:00`
+ LocalTime `10:15:30`
+ DateTime `2007-12-03T10:15:30+01:00 Europe/Paris`
+ LocalDateTime `2007-12-03T10:15:30`
+ Duration `A temporal amount`


**Python**

+ neotime.Date
+ neotime.Time
+ neotime.DateTime
+ neotime.Duration

https://docs.python.org/3.7/library/datetime.html#datetime.date.isoformat

```python
# UTC to ISO 8601 with TimeZone information (Python 3)
import datetime
datetime.datetime.utcnow().replace(tzinfo=datetime.timezone.utc).isoformat()
```

```python
import os
from datetime import datetime
import pytz  # pip install pytz
ts = os.path.getctime(some_file)
dt = datetime.fromtimestamp(ts, pytz.timezone('America/New_York'))
dt.isoformat()
'2015-11-27T00:29:06.839600-05:00'
```

**Java**

**JavaScript**

https://momentjs.com/



## Points

https://docs.scipy.org/doc/scipy/reference/tutorial/spatial.html

https://docs.scipy.org/doc/scipy/reference/spatial.html#module-scipy.spatial

### 2D

```python
Point.data()
(1,2) # (x, y)
```

```python
# Suggestion return order based on keyword
Point.data("y","x")
(2,1) # (y, x)
```

### 3D

```python
Point.data()
(1,2,3)  # (x, y, z)
```

```python
# Suggestion return order based on keyword
Point.data("z", "x", "y")
(3,1,2)  # (z, x, y)
```

## GEO DATA

https://www.gistandards.eu/gis-standards/

https://en.wikipedia.org/wiki/Geospatial_metadata

https://www.iso.org/standard/67039.html


## JSON


## neo4j HTTP request
