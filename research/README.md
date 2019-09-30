# README

## Graph

```#Python3
.data() method will return
1. Data about the object to be used in data analytics.
2. Easy to manipulate and work with.
3. Redundancy is removed and thus a nice data representation is needed.
```

### Node

```#Python3
{
  "id": 123,
  "labels": [Label1, Label2,],
  "properties": {...},
}
```

### Relationship

```#Python3
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

```#Python3
# B
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

```#Python3
# Suggestion A
{
  "nodes": [a.data(), b.data(), c.data()],
  "relationships": [ab.data(), bc.data()]}
}
```

or

```#Python3
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

```#Python3
# Suggestion C
{
  "node_ids": [a.id, b.id, c.id],
  "relationships": [ab.data(), bc.data()]}
}

This requires that the node data is available somewhere else.
```

### Conclusion

Recommendation

```#Python3
Node.data()         - No data loss
Relationship.data() - Relationship Suggestion B
Path.data()         - Path Suggestion B
```

or

```#Python3
Node.data()             - No data loss
Relationship.data()     - Relationship Suggestion B
Path.data(node_id=True) - Path Suggestion B or C depending on the keyword to data.
```

## Dates

https://en.wikipedia.org/wiki/ISO_8601


Python

Java

JavaScript: https://momentjs.com/



## Points


## JSON


## neo4j HTTP request
