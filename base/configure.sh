#!/bin/sh

cat >> $STORM_CONF_DIR/storm.yaml <<EOF
storm.local.dir: "/tmp"
EOF

if [ -n "$1" ]; then
   cat >> $STORM_CONF_DIR/storm.yaml <<EOF
storm.zookeeper.servers:
- "$1"
EOF
fi

if [ -n "$2" ]; then
   cat >> $STORM_CONF_DIR/storm.yaml <<EOF
nimbus.host: "$2"
EOF
fi   

cat conf/storm.yaml
