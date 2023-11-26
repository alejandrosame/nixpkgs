- The module `services.apache-kafka` was largely rewritten and has certain breaking changes. To be precise, this means that the following things have changed:

  - Most settings have been migrated to [services.apache-kafka.settings](#opt-services.apache-kafka.settings).
    - Care must be taken when adapting an existing cluster to these changes, see [](#module-services-apache-kafka-migrating-to-settings).
  - By virtue of being less opinionated, it is now possible to use the module to run Apache Kafka in KRaft mode instead of Zookeeper mode.
    - [A few options](#module-services-apache-kafka-kraft) have been added to assist in this mode.
