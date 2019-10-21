# Change Password For root

https://neo4j.com/docs/operations-manual/current/tools/cypher-shell/

```
neo4j-enterprise-4.0.0-alpha09mr02> .\bin\cypher-shell.bat
```

```
neo4j@neo4j> :use system
```

```
neo4j@system> SHOW USERS;
Permission denied.
```

```
neo4j@system> ALTER CURRENT USER SET PASSWORD FROM "neo4j" TO "password";
```

```
neo4j@system> SHOW USERS
```
