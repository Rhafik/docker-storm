#!/bin/sh


/configure.sh ${ZOOKEEPER_SERVICE_HOST:-$1} ${NIMBUS_SERVICE_HOST:-$2}	CONFIG="$STORM_CONF_DIR/storm.yaml"
echo "Zookeeper: $ZOOKEEPER_SERVICE_HOST"
echo "Nimbus: $NIMBUS_SERVICE_HOST"


exec bin/storm ui	cat << EOF > "$CONFIG"
storm.zookeeper.servers: ["$ZOOKEEPER_SERVICE_HOST"]
nimbus.seeds: ["$NIMBUS_SERVICE_HOST"]
EOF

cat $CONFIG

exec storm ui