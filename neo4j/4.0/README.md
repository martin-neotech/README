# config

```
browser.allow_outgoing_connections: Configure the policy for outgoing Neo4j Browser connections.

browser.credential_timeout: Configure the Neo4j Browser to time out logged in users after this idle period.

browser.post_connect_cmd: Commands to be run when Neo4j Browser successfully connects to this server.

browser.remote_content_hostname_whitelist: Whitelist of hosts for the Neo4j Browser to be allowed to fetch content from.

browser.retain_connection_credentials: Configure the Neo4j Browser to store or not store user credentials.

causal_clustering.catch_up_client_inactivity_timeout: The catch up protocol times out if the given duration elapses with no network activity.

causal_clustering.catchup_batch_size: The maximum batch size when catching up (in unit of entries).

causal_clustering.cluster_allow_reads_on_followers: Configure if the dbms.routing.getRoutingTable() procedure should include followers as read endpoints or return only read replicas.

causal_clustering.cluster_binding_timeout: The time allowed for a database on a Neo4j server to either join a cluster or form a new cluster with the other Neo4j Core Servers provided by causal_clustering.initial_discovery_members.

causal_clustering.cluster_topology_refresh: Time between scanning the cluster to refresh current server’s view of topology.

causal_clustering.connect-randomly-to-server-group: Comma separated list of groups to be used by the connect-randomly-to-server-group selection strategy.

causal_clustering.discovery_advertised_address: Advertised cluster member discovery management communication.

causal_clustering.discovery_listen_address: Host and port to bind the cluster member discovery management communication.

causal_clustering.discovery_type: Configure the discovery type used for cluster name resolution.

causal_clustering.enable_pre_voting: Enable pre-voting extension to the Raft protocol (this is breaking and must match between the core cluster members).

causal_clustering.global_session_tracker_state_size: The maximum file size before the global session tracker state file is rotated (in unit of entries).

causal_clustering.handshake_timeout: Time out for protocol negotiation handshake.

causal_clustering.in_flight_cache.max_bytes: The maximum number of bytes in the in-flight cache.

causal_clustering.in_flight_cache.max_entries: The maximum number of entries in the in-flight cache.

causal_clustering.in_flight_cache.type: Type of in-flight cache.

causal_clustering.initial_discovery_members: A comma-separated list of other members of the cluster to join.

causal_clustering.join_catch_up_timeout: Time out for a new member to catch up.

causal_clustering.kubernetes.address: Address for Kubernetes API.

causal_clustering.kubernetes.ca_crt: File location of CA certificate for Kubernetes API.

causal_clustering.kubernetes.label_selector: LabelSelector for Kubernetes API.

causal_clustering.kubernetes.namespace: File location of namespace for Kubernetes API.

causal_clustering.kubernetes.service_port_name: Service port name for discovery for Kubernetes API.

causal_clustering.kubernetes.token: File location of token for Kubernetes API.

causal_clustering.last_applied_state_size: The maximum file size before the storage file is rotated (in unit of entries).

causal_clustering.leader_election_timeout: The time limit within which a new leader election will occur if no messages are received.

causal_clustering.load_balancing.plugin: The load balancing plugin to use.

causal_clustering.load_balancing.shuffle: Enables shuffling of the returned load balancing result.

causal_clustering.log_shipping_max_lag: The maximum lag allowed before log shipping pauses (in unit of entries).

causal_clustering.middleware.logging.level: The level of middleware logging.

causal_clustering.minimum_core_cluster_size_at_formation: Minimum number of Core machines initially required to form a cluster.

causal_clustering.minimum_core_cluster_size_at_runtime: The minimum size of the dynamically adjusted voting set (which only core members may be a part of).

causal_clustering.multi_dc_license: Enable multi-data center features.

causal_clustering.protocol_implementations.catchup: Catchup protocol implementation versions that this instance will allow in negotiation as a comma-separated list.

causal_clustering.protocol_implementations.compression: Network compression algorithms that this instance will allow in negotiation as a comma-separated list.

causal_clustering.protocol_implementations.raft: Raft protocol implementation versions that this instance will allow in negotiation as a comma-separated list.

causal_clustering.pull_interval: Interval of pulling updates from cores.

causal_clustering.raft_advertised_address: Advertised hostname/IP address and port for the RAFT server.

causal_clustering.raft_in_queue_max_batch_bytes: Largest batch processed by RAFT in bytes.

causal_clustering.raft_in_queue_max_bytes: Maximum number of bytes in the RAFT in-queue.

causal_clustering.raft_listen_address: Network interface and port for the RAFT server to listen on.

causal_clustering.raft_log_implementation: RAFT log implementation.

causal_clustering.raft_log_prune_strategy: RAFT log pruning strategy.

causal_clustering.raft_log_pruning_frequency: RAFT log pruning frequency.

causal_clustering.raft_log_reader_pool_size: RAFT log reader pool size.

causal_clustering.raft_log_rotation_size: RAFT log rotation size.

causal_clustering.raft_membership_state_size: The maximum file size before the membership state file is rotated (in unit of entries).

causal_clustering.raft_term_state_size: The maximum file size before the term state file is rotated (in unit of entries).

causal_clustering.raft_vote_state_size: The maximum file size before the vote state file is rotated (in unit of entries).

causal_clustering.refuse_to_be_leader: Prevents the current instance from volunteering to become Raft leader.

causal_clustering.replicated_lease_state_size: The maximum file size before the replicated lease state file is rotated (in unit of entries).

causal_clustering.replication_leader_await_timeout: The duration for which the replicator will await a new leader.

causal_clustering.replication_retry_timeout_base: The initial timeout until replication is retried.

causal_clustering.replication_retry_timeout_limit: The upper limit for the exponentially incremented retry timeout.

causal_clustering.server_groups: A list of group names for the server used when configuring load balancing and replication policies.

causal_clustering.state_machine_apply_max_batch_size: The maximum number of operations to be batched during applications of operations in the state machines.

causal_clustering.state_machine_flush_window_size: The number of operations to be processed before the state machines flush to disk.

causal_clustering.status_throughput_window: Sampling window for throughput estimate reported in the status endpoint.

causal_clustering.store_copy_chunk_size: Store copy chunk size.

causal_clustering.store_copy_max_retry_time_per_request: Maximum retry time per request during store copy.

causal_clustering.transaction_advertised_address: Advertised hostname/IP address and port for the transaction shipping server.

causal_clustering.transaction_listen_address: Network interface and port for the transaction shipping server to listen on.

causal_clustering.unknown_address_logging_throttle: Throttle limit for logging unknown cluster member address.

causal_clustering.upstream_selection_strategy: An ordered list in descending preference of the strategy which read replicas use to choose the upstream server from which to pull transactional updates.

causal_clustering.user_defined_upstream_strategy: Configuration of a user-defined upstream selection strategy.

cypher.default_language_version: Set this to specify the default parser (language version).

cypher.forbid_exhaustive_shortestpath: This setting is associated with performance optimization.

cypher.forbid_shortestpath_common_nodes: This setting is associated with performance optimization.

cypher.hints_error: Set this to specify the behavior when Cypher planner or runtime hints cannot be fulfilled.

cypher.lenient_create_relationship: Set this to change the behavior for Cypher create relationship when the start or end node is missing.

cypher.min_replan_interval: The minimum time between possible cypher query replanning events.

cypher.planner: Set this to specify the default planner for the default language version.

cypher.query_max_allocations: The maximum amount of heap memory allocations to for cypher to perform on a single query, in bytes (or kilobytes with the 'k' suffix, megabytes with 'm' and gigabytes with 'g').

cypher.statistics_divergence_threshold: The threshold when a plan is considered stale.

db.temporal.timezone: Database timezone for temporal functions.

dbms.allow_upgrade: Whether to allow an upgrade in case the current version of the database starts against an older version.

dbms.backup.enabled: Enable support for running online backups.

dbms.backup.listen_address: Network interface and port for the backup server to listen on.

dbms.checkpoint: Configures the general policy for when check-points should occur.

dbms.checkpoint.interval.time: Configures the time interval between check-points.

dbms.checkpoint.interval.tx: Configures the transaction interval between check-points.

dbms.checkpoint.iops.limit: Limit the number of IOs the background checkpoint process will consume per second.

dbms.config.strict_validation: A strict configuration validation will prevent the database from starting up if unknown configuration options are specified in the neo4j settings namespace (such as dbms., cypher., etc).

dbms.connector.bolt.advertised_address: Advertised address for this connector.

dbms.connector.bolt.enabled: Enable the bolt connector.

dbms.connector.bolt.listen_address: Address the connector should bind to.

dbms.connector.bolt.thread_pool_keep_alive: The maximum time an idle thread in the thread pool bound to this connector will wait for new tasks.

dbms.connector.bolt.thread_pool_max_size: The maximum number of threads allowed in the thread pool bound to this connector.

dbms.connector.bolt.thread_pool_min_size: The number of threads to keep in the thread pool bound to this connector, even if they are idle.

dbms.connector.bolt.tls_level: Encryption level to require this connector to use.

dbms.connector.bolt.unsupported_thread_pool_shutdown_wait_time: The maximum time to wait for the thread pool to finish processing its pending jobs and shutdown.

dbms.connector.http.advertised_address: Advertised address for this connector.

dbms.connector.http.enabled: Enable the http connector.

dbms.connector.http.listen_address: Address the connector should bind to.

dbms.connector.https.advertised_address: Advertised address for this connector.

dbms.connector.https.enabled: Enable the https connector.

dbms.connector.https.listen_address: Address the connector should bind to.

dbms.db.timezone: Database timezone.

dbms.default_advertised_address: Default hostname or IP address the server uses to advertise itself.

dbms.default_database: Name of the default database.

dbms.default_listen_address: Default network interface to listen for incoming connections.

dbms.directories.data: Path of the data directory.

dbms.directories.import: Sets the root directory for file URLs used with the Cypher LOAD CSV clause.

dbms.directories.lib: Path of the lib directory.

dbms.directories.logs: Path of the logs directory.

dbms.directories.metrics: The target location of the CSV files: a path to a directory wherein a CSV file per reported field will be written.

dbms.directories.neo4j_home: Root relative to which directory settings are resolved.

dbms.directories.plugins: Location of the database plugin directory.

dbms.directories.run: Path of the run directory.

dbms.directories.transaction.logs.root: Root location where Neo4j will store transaction logs for configured databases.

dbms.dynamic.setting.whitelist: A list of setting name patterns (comma separated) that are allowed to be dynamically changed.

dbms.filewatcher.enabled: Allows the enabling or disabling of the file watcher service.

dbms.import.csv.buffer_size: The size of the internal buffer in bytes used by LOAD CSV.

dbms.import.csv.legacy_quote_escaping: Selects whether to conform to the standard https://tools.ietf.org/html/rfc4180 for interpreting escaped quotation characters in CSV files loaded using LOAD CSV.

dbms.index.default_schema_provider: Index provider to use for newly created schema indexes.

dbms.index.fulltext.default_analyzer: The name of the analyzer that the fulltext indexes should use by default.

dbms.index.fulltext.eventually_consistent: Whether or not fulltext indexes should be eventually consistent by default or not.

dbms.index.fulltext.eventually_consistent_index_update_queue_max_length: The eventually_consistent mode of the fulltext indexes works by queueing up index updates to be applied later in a background thread.

dbms.index_sampling.background_enabled: Enable or disable background index sampling.

dbms.index_sampling.sample_size_limit: Index sampling chunk size limit.

dbms.index_sampling.update_percentage: Percentage of index updates of total index size required before sampling of a given index is triggered.

dbms.index_searcher_cache_size: The maximum number of open Lucene index searchers.

dbms.jvm.additional: Additional JVM arguments.

dbms.lock.acquisition.timeout: The maximum time interval within which lock should be acquired.

dbms.logs.debug.level: Debug log level threshold.

dbms.logs.debug.path: Path to the debug log file.

dbms.logs.debug.rotation.delay: Minimum time interval after last rotation of the debug log before it may be rotated again.

dbms.logs.debug.rotation.keep_number: Maximum number of history files for the debug log.

dbms.logs.debug.rotation.size: Threshold for rotation of the debug log.

dbms.logs.gc.enabled: Enable GC Logging.

dbms.logs.gc.options: GC Logging Options.

dbms.logs.gc.rotation.keep_number: Number of GC logs to keep.

dbms.logs.gc.rotation.size: Size of each GC log that is kept.

dbms.logs.http.enabled: Enable HTTP request logging.

dbms.logs.http.path: Path to HTTP request log.

dbms.logs.http.rotation.keep_number: Number of HTTP logs to keep.

dbms.logs.http.rotation.size: Size of each HTTP log that is kept.

dbms.logs.query.allocation_logging_enabled: Log allocated bytes for the executed queries being logged.

dbms.logs.query.enabled: Log executed queries.

dbms.logs.query.page_logging_enabled: Log page hits and page faults for the executed queries being logged.

dbms.logs.query.parameter_logging_enabled: Log parameters for the executed queries being logged.

dbms.logs.query.path: Path to the query log file.

dbms.logs.query.rotation.keep_number: Maximum number of history files for the query log.

dbms.logs.query.rotation.size: The file size in bytes at which the query log will auto-rotate.

dbms.logs.query.runtime_logging_enabled: Logs which runtime that was used to run the query.

dbms.logs.query.threshold: If the execution of query takes more time than this threshold, the query is logged once completed - provided query logging is set to INFO.

dbms.logs.query.time_logging_enabled: Log detailed time information for the executed queries being logged.

dbms.logs.security.level: Security log level threshold.

dbms.logs.security.path: Path to the security log file.

dbms.logs.security.rotation.delay: Minimum time interval after last rotation of the security log before it may be rotated again.

dbms.logs.security.rotation.keep_number: Maximum number of history files for the security log.

dbms.logs.security.rotation.size: Threshold for rotation of the security log.

dbms.logs.user.path: Path to the user log file.

dbms.logs.user.rotation.delay: Minimum time interval after last rotation of the user log (neo4j.log) before it may be rotated again.

dbms.logs.user.rotation.keep_number: Maximum number of history files for the user log (neo4j.log).

dbms.logs.user.rotation.size: Threshold for rotation of the user log (neo4j.log).

dbms.logs.user.stdout_enabled: Send user logs to the process stdout.

dbms.max_databases: The maximum number of databases.

dbms.memory.heap.initial_size: Initial heap size.

dbms.memory.heap.max_size: Maximum heap size.

dbms.memory.pagecache.size: The amount of memory to use for mapping the store files, in bytes (or kilobytes with the 'k' suffix, megabytes with 'm' and gigabytes with 'g').

dbms.memory.pagecache.swapper: Specify which page swapper to use for doing paged IO.

dbms.memory.pagecache.warmup.enable: Page cache can be configured to perform usage sampling of loaded pages that can be used to construct active load profile.

dbms.memory.pagecache.warmup.preload: Page cache warmup can be configured to prefetch files, preferably when cache size is bigger than store size.

dbms.memory.pagecache.warmup.preload.whitelist: Page cache warmup prefetch file whitelist regex.

dbms.memory.pagecache.warmup.profile.interval: The profiling frequency for the page cache.

dbms.mode: Configure the operating mode of the database — 'SINGLE' for stand-alone operation, 'CORE' for operating as a core member of a Causal Cluster, or 'READ_REPLICA' for operating as a read replica member of a Causal Cluster.

dbms.netty.ssl.provider: Netty SSL provider.

dbms.query_cache_size: The number of Cypher query execution plans that are cached.

dbms.read_only: Only allow read operations from this Neo4j instance.

dbms.reconciler.max_backoff: Defines the maximum amount of time to wait before retrying after the dbms fails to reconcile a database to its desired state.

dbms.reconciler.may_retry: Defines whether the dbms may retry reconciling a database to its desired state.

dbms.reconciler.min_backoff: Defines the minimum amount of time to wait before retrying after the dbms fails to reconcile a database to its desired state.

dbms.record_format: Database record format.

dbms.recovery.fail_on_missing_files: If true, Neo4j will abort recovery if transaction log files are missing.

dbms.relationship_grouping_threshold: Relationship count threshold for considering a node to be dense.

dbms.rest.transaction.idle_timeout: Timeout for idle transactions in the REST endpoint.

dbms.routing_ttl: How long callers should cache the response of the routing procedure dbms.routing.getRoutingTable().

dbms.security.allow_csv_import_from_file_urls: Determines if Cypher will allow using file URLs when loading data using LOAD CSV.

dbms.security.auth_cache_max_capacity: The maximum capacity for authentication and authorization caches (respectively).

dbms.security.auth_cache_ttl: The time to live (TTL) for cached authentication and authorization info when using external auth providers (LDAP or plugin).

dbms.security.auth_cache_use_ttl: Enable time-based eviction of the authentication and authorization info cache for external auth providers (LDAP or plugin).

dbms.security.auth_enabled: Enable auth requirement to access Neo4j.

dbms.security.auth_lock_time: The amount of time user account should be locked after a configured number of unsuccessful authentication attempts.

dbms.security.auth_max_failed_attempts: The maximum number of unsuccessful authentication attempts before imposing a user lock for the configured amount of time, as defined by dbms.security.auth_lock_time.The locked out user will not be able to log in until the lock period expires, even if correct credentials are provided.

dbms.security.authentication_providers: A list of security authentication providers containing the users and roles.

dbms.security.authorization_providers: A list of security authorization providers containing the users and roles.

dbms.security.causal_clustering_status_auth_enabled: Require authorization for access to the Causal Clustering status endpoints.

dbms.security.http_access_control_allow_origin: Value of the Access-Control-Allow-Origin header sent over any HTTP or HTTPS connector.

dbms.security.http_auth_whitelist: Defines a whitelist of http paths where Neo4j authentication is not required.

dbms.security.http_strict_transport_security: Value of the HTTP Strict-Transport-Security (HSTS) response header.

dbms.security.ldap.authentication.cache_enabled: Determines if the result of authentication via the LDAP server should be cached or not.

dbms.security.ldap.authentication.mechanism: LDAP authentication mechanism.

dbms.security.ldap.authentication.use_samaccountname: Perform authentication with sAMAccountName instead of DN. Using this setting requires dbms.security.ldap.authorization.system_username and dbms.security.ldap.authorization.system_password to be used since there is no way to log in through ldap directly with the sAMAccountName, instead the login name will be resolved to a DN that will be used to log in with.

dbms.security.ldap.authentication.user_dn_template: LDAP user DN template.

dbms.security.ldap.authorization.group_membership_attributes: A list of attribute names on a user object that contains groups to be used for mapping to roles when LDAP authorization is enabled.

dbms.security.ldap.authorization.group_to_role_mapping: An authorization mapping from LDAP group names to Neo4j role names.

dbms.security.ldap.authorization.system_password: An LDAP system account password to use for authorization searches when dbms.security.ldap.authorization.use_system_account is true.

dbms.security.ldap.authorization.system_username: An LDAP system account username to use for authorization searches when dbms.security.ldap.authorization.use_system_account is true.

dbms.security.ldap.authorization.use_system_account: Perform LDAP search for authorization info using a system account instead of the user’s own account. If this is set to false (default), the search for group membership will be performed directly after authentication using the LDAP context bound with the user’s own account.

dbms.security.ldap.authorization.user_search_base: The name of the base object or named context to search for user objects when LDAP authorization is enabled.

dbms.security.ldap.authorization.user_search_filter: The LDAP search filter to search for a user principal when LDAP authorization is enabled.

dbms.security.ldap.connection_timeout: The timeout for establishing an LDAP connection.

dbms.security.ldap.host: URL of LDAP server to use for authentication and authorization.

dbms.security.ldap.read_timeout: The timeout for an LDAP read request (i.e.

dbms.security.ldap.referral: The LDAP referral behavior when creating a connection.

dbms.security.ldap.use_starttls: Use secure communication with the LDAP server using opportunistic TLS.

dbms.security.log_successful_authentication: Set to log successful authentication events to the security log.

dbms.security.procedures.default_allowed: The default role that can execute all procedures and user-defined functions that are not covered by the dbms.security.procedures.roles setting.

dbms.security.procedures.roles: This provides a finer level of control over which roles can execute procedures than the dbms.security.procedures.default_allowed setting.

dbms.security.procedures.unrestricted: A list of procedures and user defined functions (comma separated) that are allowed full access to the database.

dbms.security.procedures.whitelist: A list of procedures (comma separated) that are to be loaded.

dbms.security.property_level.enabled: This has been replaced by privilege management on roles.

dbms.shutdown_transaction_end_timeout: The maximum amount of time to wait for running transactions to complete before allowing initiated database shutdown to continue.

dbms.threads.worker_count: Number of Neo4j worker threads.

dbms.track_query_allocation: Enables or disables tracking of how many bytes are allocated by the execution of a query.

dbms.track_query_cpu_time: Enables or disables tracking of how much time a query spends actively executing on the CPU.

dbms.transaction.bookmark_ready_timeout: The maximum amount of time to wait for the database state represented by the bookmark.

dbms.transaction.concurrent.maximum: The maximum number of concurrently running transactions.

dbms.transaction.monitor.check.interval: Configures the time interval between transaction monitor checks.

dbms.transaction.sampling.percentage: Transaction sampling percentage.

dbms.transaction.timeout: The maximum time interval of a transaction within which it should be completed.

dbms.transaction.tracing.level: Transaction creation tracing level.

dbms.tx_log.preallocate: Specify if Neo4j should try to preallocate logical log file in advance.

dbms.tx_log.rotation.retention_policy: Make Neo4j keep the logical transaction logs for being able to backup the database.

dbms.tx_log.rotation.size: Specifies at which file size the logical log will auto-rotate.

dbms.tx_state.max_off_heap_memory: The maximum amount of off-heap memory that can be used to store transaction state data; it’s a total amount of memory shared across all active transactions.

dbms.tx_state.memory_allocation: Defines whether memory for transaction state should be allocated on- or off-heap.

dbms.tx_state.off_heap.block_cache_size: Defines the size of the off-heap memory blocks cache.

dbms.tx_state.off_heap.max_cacheable_block_size: Defines the maximum size of an off-heap memory block that can be cached to speed up allocations for transaction state data.

dbms.unmanaged_extension_classes: Comma-separated list of <classname>=<mount point> for unmanaged extensions.

dbms.windows_service_name: Name of the Windows Service.

fabric.database.name: Name of the Fabric database.

fabric.driver.api: Determines which driver API will be used.

fabric.driver.connection.connect_timeout: Socket connection timeout. A timeout of zero is treated as an infinite timeout and will be bound by the timeout configured on the operating system level.

fabric.driver.connection.max_lifetime: Pooled connections older than this threshold will be closed and removed from the pool. Setting this option to a low value will cause a high connection churn and might result in a performance hit. It is recommended to set maximum lifetime to a slightly smaller value than the one configured in network equipment (load balancer, proxy, firewall, etc.

fabric.driver.connection.pool.acquisition_timeout: Maximum amount of time spent attempting to acquire a connection from the connection pool. This timeout only kicks in when all existing connections are being used and no new connections can be created because maximum connection pool size has been reached. Error is raised when connection can’t be acquired within configured time. Negative values are allowed and result in unlimited acquisition timeout.

fabric.driver.connection.pool.idle_test: Pooled connections that have been idle in the pool for longer than this timeout will be tested before they are used again, to ensure they are still alive. If this option is set too low, an additional network call will be incurred when acquiring a connection, which causes a performance hit. If this is set high, no longer live connections might be used which might lead to errors. Hence, this parameter tunes a balance between the likelihood of experiencing connection problems and performance Normally, this parameter should not need tuning. Value 0 means connections will always be tested for validity.

fabric.driver.connection.pool.max_size: Maximum total number of connections to be managed by a connection pool. The limit is enforced for a combination of a host and user.

fabric.driver.logging.level: Sets level for driver internal logging.

fabric.routing.servers: A comma-separated list of Fabric instances that form a routing group.

fabric.routing.ttl: The time to live (TTL) of a routing table for fabric routing group.

fabric.stream.buffer.low_watermark: Number of records in prefetching buffer that will trigger prefetching again.

fabric.stream.buffer.size: Maximal size of a buffer used for pre-fetching result records of remote queries. To compensate for latency to remote databases, the Fabric execution engine pre-fetches records needed for local executions. This limit is enforced per fabric query.

fabric.stream.concurrency: Maximal concurrency within Fabric queries. Limits the number of iterations of each subquery that are executed concurrently.

metrics.bolt.messages.enabled: Enable reporting metrics about Bolt Protocol message processing.

metrics.csv.enabled: Set to true to enable exporting metrics to CSV files.

metrics.csv.interval: The reporting interval for the CSV files.

metrics.csv.rotation.keep_number: Maximum number of history files for the csv files.

metrics.csv.rotation.size: The file size in bytes at which the csv files will auto-rotate.

metrics.cypher.replanning.enabled: Enable reporting metrics about number of occurred replanning events.

metrics.enabled: Enable metrics.

metrics.graphite.enabled: Set to true to enable exporting metrics to Graphite.

metrics.graphite.interval: The reporting interval for Graphite.

metrics.graphite.server: The hostname or IP address of the Graphite server.

metrics.jmx.enabled: Set to true to enable the JMX metrics endpoint.

metrics.jvm.buffers.enabled: Enable reporting metrics about the buffer pools.

metrics.jvm.file.descriptors.enabled: Enable reporting metrics about the number of open file descriptors.

metrics.jvm.gc.enabled: Enable reporting metrics about the duration of garbage collections.

metrics.jvm.heap.enabled: Enable reporting metrics about the heap memory usage.

metrics.jvm.memory.enabled: Enable reporting metrics about the memory usage.

metrics.jvm.threads.enabled: Enable reporting metrics about the current number of threads running.

metrics.neo4j.causal_clustering.enabled: Enable reporting metrics about Causal Clustering mode.

metrics.neo4j.checkpointing.enabled: Enable reporting metrics about Neo4j check pointing.

metrics.neo4j.counts.enabled: Enable reporting metrics about approximately how many entities are in the database.

metrics.neo4j.data.counts.enabled: Enable reporting metrics about number of entities in the database.

metrics.neo4j.database_operation_count.enabled: Enable reporting metrics for Neo4j dbms operations; e.g.

metrics.neo4j.logs.enabled: Enable reporting metrics about the Neo4j transaction logs.

metrics.neo4j.pagecache.enabled: Enable reporting metrics about the Neo4j page cache.

metrics.neo4j.server.enabled: Enable reporting metrics about Server threading info.

metrics.neo4j.size.enabled: Enable reporting metrics about the store size of each database.

metrics.neo4j.tx.enabled: Enable reporting metrics about transactions.

metrics.prefix: A common prefix for the reported metrics field names.

metrics.prometheus.enabled: Set to true to enable the Prometheus endpoint.

metrics.prometheus.endpoint: The hostname and port to use as Prometheus endpoint.
```

