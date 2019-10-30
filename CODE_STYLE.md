# CODE STYLE

## General textual guide lines

**Line Length:** 120

**Tabulation:** Spaces everywhere, no tabs

**Encoding:** UTF-8

**New Line:** \n

Enable auto optimize imports

## Java

**Tabulation:** 4 spaces

**Encoding:** UTF-8

**New Line:** \n

IntelliJ IDEA

http://neo4j.github.io/

https://github.com/neo4j/neo4j.github.com/tree/master/code-style


## Python

**Tabulation:** 4 spaces

**Encoding:** UTF-8

**New Line:** \n

**PEP8:** https://www.python.org/dev/peps/pep-0008/

**PEP20:** https://www.python.org/dev/peps/pep-0020/


## JavaScript

**Tabulation:** 4 spaces or 2 spaces.

**Encoding:** UTF-8

**New Line:** \n

**End of Statement:** Explicit use ;

**Strict Mode:** Use strict code style


# Python Style Guide

### `import`

> Dont use the star import, `import *`

**Example module - finance.py**

```python
__all__ = ['tax1', 'tax2']  #defines the names to import when '*' is used
 
tax1 = 5
tax2 = 10
def cost(): return 'cost'
```
Source: https://help.semmle.com/wiki/display/PYTHON/%27import+*%27+may+pollute+namespace


> Explicit import the root for library modules

```python
import os

os.path
os.path.join()
```

### ``raise NotImplementedError()``

```python
class Abstract(object):
 
    def wrong(self):
        # Will raise a TypeError
        raise NotImplemented()
 
    def right(self):
        raise NotImplementedError()
```        
Source: https://help.semmle.com/wiki/display/PYTHON/NotImplemented+is+not+an+Exception

