#!/bin/sh

CONFIG="$STORM_CONF_DIR/storm.yaml"
echo $ZOOKEEPER_SERVICE_HOST
cat << EOF > "$CONFIG"
storm.zookeeper.servers: ["$ZOOKEEPER_SERVICE_HOST"]
storm.local.hostname: $NIMBUS_SERVICE_HOST
storm.nimbus.seeds: ["$NIMBUS_SERVICE_HOST"]
storm.local.dir: "/tmp"
nimbus.thrift.max_buffer_size: 500000
EOF
cat $CONFIG
exec storm nimbus
