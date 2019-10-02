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
or

```python
# Suggestion D
{
  "node_id_index: {"a.id: 0, b.id: 1, c.id: 2} # This mapps the first occurence of node_id in the nodes list.
  "nodes": [a.data(), b.data(), c.data()],
  "relationships": [ab.data(), bc.data()]}
}

There could be several occurencies of the same node in a path if the relationships are specific to return to a node.
Suggestion B can not handle that case.
```

### Conclusion and Recommendation

Recommendation

```python
Node.data()         - No data loss
Relationship.data() - Relationship Suggestion B
Path.data()         - Path Suggestion D
```

Then how shouls the properties be handled?
Should it recursively serialize the properties values in the data method or is that a too expensive operation by default.

.data(recursive=False)

## Date and Time

https://en.wikipedia.org/wiki/ISO_8601

https://www.iso.org/iso-8601-date-and-time-format.html

https://stackoverflow.com/questions/2150739/iso-time-iso-8601-in-python

https://www.cl.cam.ac.uk/~mgk25/iso-time.html

https://www.iana.org/time-zones

https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

https://nbsoftsolutions.com/blog/iso-8601-and-nanosecond-precision-across-languages

### ISO 8601 duration format

ISO 8601 Durations are expressed using the following format, where (n) is replaced by the value for each of the date and time elements that follow the (n):

P(n)Y(n)M(n)DT(n)H(n)M(n)S

Where:

P is the duration designator (referred to as "period"), and is always placed at the beginning of the duration.
Y is the year designator that follows the value for the number of years.
M is the month designator that follows the value for the number of months.
W is the week designator that follows the value for the number of weeks.
D is the day designator that follows the value for the number of days.
T is the time designator that precedes the time components.
H is the hour designator that follows the value for the number of hours.
M is the minute designator that follows the value for the number of minutes.
S is the second designator that follows the value for the number of seconds.
For example:

P3Y6M4DT12H30M5S

Represents a duration of three years, six months, four days, twelve hours, thirty minutes, and five seconds.

### ISO 8601 date format

Every component shown in the example below must be present when expressing a date in ISO 8601 format; this includes all punctuation characters and the "T" character. Within a string, the "T" indicates the beginning of the time element (directly following the date element). Although several date expressions exist, Remote Manager supports only the following format:

Complete date plus hours, minutes and seconds:

YYYY-MM-DDThh:mm:ss[.mmm]TZD (eg 2012-03-29T10:05:45-06:00)

millisecond resolution: YYYY-MM-DDThh:mm:ss.mmmTZD (eg 2012-03-29T10:05:45.000-06:00)

nanosecond resolution: YYYY-MM-DDThh:mm:ss.mmmmmmmmmTZD (eg 2012-03-29T10:05:45.000000000-06:00)

Where:

YYYY = four-digit year
MM = two-digit month (eg 03=March)
DD = two-digit day of the month (01 through 31)
T = a set character indicating the start of the time element
hh = two digits of an hour (00 through 23, AM/PM not included)
mm = two digits of a minute (00 through 59)
ss = two digits of a second (00 through 59)
mmm = three digits of a millisecond (000 through 999)
nnnnnnnnn = nine digits of a nanosecond (000000000 through 999999999)
TZD = time zone designator (Z or +hh:mm or -hh:mm), the + or - values indicate how far ahead or behind a time zone is from the UTC (Coordinated Universal Time) zone.


**Bolt**

Using ISO-8601

+ Date `2007-12-03`
+ Time `10:15:30+01:00`, `10:15:30-01:00`
+ LocalTime `10:15:30`
+ DateTime `2007-12-03T10:15:30+01:00 Europe/Paris`, `2007-12-03T10:15:30-05:00 America/New_York`
+ LocalDateTime `2007-12-03T10:15:30`
+ Duration `P3Y6M4DT12H30M5S`

Local


**Python**

+ neotime.Date
+ neotime.Time
+ neotime.DateTime
+ neotime.Duration

```
import numpy
numpy.datetime64('2016-06-10T21:42:24.76073899')
# numpy.datetime64('2016-06-10T21:42:24.760738990+0000')
# Created a datetime with nanosecond resolution
```

```
DateTime: Suggestion A

DateTime.data()

{
  "timestamp": "2011-12-03T10:15:30.000000000+01:00",
  "timezone": "Europe/Paris"
}

{
  "timestamp": "2011-12-03T10:15:30.000000000+00:00",
  "timezone": "UTC"
}

# Explicit show all the nanoseconds
```

```
Time: Suggestion A

Time.data()

{
  "timestamp": "10:15:30.000000000+01:00",
  "timezone": "Europe/Paris"
}

{
  "timestamp": "10:15:30.000000000+00:00",
  "timezone": "UTC"
}

# Explicit show all the nanoseconds
```

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
