# NEW:

```
causal_clustering.command_applier_parallelism: Limits amount of global threads for applying commands.

causal_clustering.election_failure_detection_window: The rate at which leader elections happen.

causal_clustering.join_catch_up_max_lag: Maximum amount of lag accepted for a new follower to join the Raft group.

causal_clustering.leader_failure_detection_window: The time window within which the loss of the leader is detected and the first re-election attempt is held.The window should be significantly larger than typical communication delays to make conflicts unlikely.

causal_clustering.leadership_balancing: Which strategy to use when transferring database leaderships around a cluster.

causal_clustering.log_shipping_retry_timeout: Retry time for log shipping to followers after a stall.

causal_clustering.raft_handler_parallelism: Limits amount of global threads shared by raft groups for handling bathing of messages and timeout events.

dbms.allow_single_automatic_upgrade: Whether to allow a system graph upgrade to happen automatically in single instance mode (dbms.mode=SINGLE).

dbms.directories.dumps.root: Root location where Neo4j will store database dumps optionally produced when dropping said databases.

dbms.logs.query.early_raw_logging_enabled: Log query text and parameters without obfuscating passwords.

dbms.logs.query.parameter_full_entities: Log complete parameter entities including id, labels or relationship type, and properties.

dbms.memory.off_heap.block_cache_size: Defines the size of the off-heap memory blocks cache.

dbms.memory.off_heap.max_cacheable_block_size: Defines the maximum size of an off-heap memory block that can be cached to speed up allocations.

dbms.memory.off_heap.max_size: The maximum amount of off-heap memory that can be used to store transaction state data; it’s a total amount of memory shared across all active transactions.

dbms.memory.pagecache.directio: Use direct I/O for page cache.

dbms.memory.pagecache.scan.prefetchers: The maximum number of worker threads to use for pre-fetching data when doing sequential scans.

dbms.memory.tracking.enable: Enable off heap and on heap memory tracking.

dbms.memory.transaction.datababase_max_size: Limit the amount of memory that all transaction in one database can consume, in bytes (or kilobytes with the 'k' suffix, megabytes with 'm' and gigabytes with 'g').

dbms.memory.transaction.global_max_size: Limit the amount of memory that all of the running transactions can consume, in bytes (or kilobytes with the 'k' suffix, megabytes with 'm' and gigabytes with 'g').

dbms.memory.transaction.max_size: Limit the amount of memory that a single transaction can consume, in bytes (or kilobytes with the 'k' suffix, megabytes with 'm' and gigabytes with 'g').

dbms.reconciler.max_parallelism: Defines the level of parallelism employed by the reconciler.

dbms.routing.advertised_address: The advertised address for the intra-cluster routing connector.

dbms.routing.driver.api: Determines which driver API will be used.

dbms.routing.driver.connection.connect_timeout: Socket connection timeout. A timeout of zero is treated as an infinite timeout and will be bound by the timeout configured on the operating system level.

dbms.routing.driver.connection.max_lifetime: Pooled connections older than this threshold will be closed and removed from the pool. Setting this option to a low value will cause a high connection churn and might result in a performance hit. It is recommended to set maximum lifetime to a slightly smaller value than the one configured in network equipment (load balancer, proxy, firewall, etc.

dbms.routing.driver.connection.pool.acquisition_timeout: Maximum amount of time spent attempting to acquire a connection from the connection pool. This timeout only kicks in when all existing connections are being used and no new connections can be created because maximum connection pool size has been reached. Error is raised when connection can’t be acquired within configured time. Negative values are allowed and result in unlimited acquisition timeout.

dbms.routing.driver.connection.pool.idle_test: Pooled connections that have been idle in the pool for longer than this timeout will be tested before they are used again, to ensure they are still alive. If this option is set too low, an additional network call will be incurred when acquiring a connection, which causes a performance hit. If this is set high, no longer live connections might be used which might lead to errors. Hence, this parameter tunes a balance between the likelihood of experiencing connection problems and performance Normally, this parameter should not need tuning. Value 0 means connections will always be tested for validity.

dbms.routing.driver.connection.pool.max_size: Maximum total number of connections to be managed by a connection pool. The limit is enforced for a combination of a host and user.

dbms.routing.driver.logging.level: Sets level for driver internal logging.

dbms.routing.enabled: Enable intra-cluster routing using an additional bolt connector.

dbms.routing.listen_address: The address the routing connector should bind to.

dbms.upgrade_max_processors: Max number of processors used when upgrading the store.

metrics.jvm.pause_time.enabled: Enable reporting metrics about the VM pause time.

metrics.neo4j.pools.enabled: Enable reporting metrics about Neo4j memory pools.
```


# CHANGED:

```
< causal_clustering.leader_election_timeout: The time limit within which a new leader election will occur if no messages are received.
---
> causal_clustering.leader_election_timeout: This setting is moved and enhanced into causal_clustering.leader_failure_detection_window and causal_clustering.election_failure_detection_window.
```

```
< dbms.allow_upgrade: Whether to allow an upgrade in case the current version of the database starts against an older version.
---
>
> dbms.allow_upgrade: Whether to allow a store upgrade in case the current version of the database starts against an older version of the store.
```

```
< dbms.memory.pagecache.swapper: Specify which page swapper to use for doing paged IO.
---
> dbms.memory.pagecache.swapper: This setting is not used anymore.
```

# REMOVED:

```
cypher.query_max_allocations: The maximum amount of heap memory allocations to for cypher to perform on a single query, in bytes (or kilobytes with the 'k' suffix, megabytes with 'm' and gigabytes with 'g').

dbms.security.property_level.enabled: This has been replaced by privilege management on roles.

dbms.tx_state.max_off_heap_memory: The maximum amount of off-heap memory that can be used to store transaction state data; it’s a total amount of memory shared across all active transactions.

dbms.tx_state.off_heap.block_cache_size: Defines the size of the off-heap memory blocks cache.

dbms.tx_state.off_heap.max_cacheable_block_size: Defines the maximum size of an off-heap memory block that can be cached to speed up allocations for transaction state data.
```



