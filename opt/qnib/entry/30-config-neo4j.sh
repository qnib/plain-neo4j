#!/bin/bash

cat opt/qnib/neo4j/conf/neo4j.conf \
    |sed -e "s/^[[:space:]]*#*dbms.connectors.default_listen_address=.*/dbms.connectors.default_listen_address=${NEO_DBMS_LISTEN_ADDR}/" \
    |sed -e "s/^[[:space:]]*#*dbms.security.auth_enabled=.*/dbms.security.auth_enabled=${NEO_AUTH_ENABLED}/" \
    |sed -e "s/^[[:space:]]*#*dbms.security.auth_enabled=.*/dbms.security.auth_enabled=${NEO_AUTH_ENABLED}/" \
    |sed -e "s/^[[:space:]]*#*dbms.connector.bolt.address=.*/dbms.connector.bolt.address=${NEO_BOLT_ADDRESS}:${NEO_BOLT_PORT}/" \
    |sed -e "s/^[[:space:]]*#*dbms.connector.http.address=.*/dbms.connector.http.address=${NEO_HTTP_ADDRESS}:${NEO_HTTP_PORT}/" \
    |sed -e "s/^[[:space:]]*#*dbms.memory.heap.initial_size=.*/dbms.memory.heap.initial_size=${NEO_HEAP_INIT}/" \
    |sed -e "s/^[[:space:]]*#*dbms.memory.heap.max_size=.*/dbms.memory.heap.max_size=${NEO_HEAP_MAX}/" \
    |sed -e "s/dbms.connector.https.address=.*/dbms.connector.https.address=${NEO_HTTPS_ADDRESS}:${NEO_HTTPS_PORT}/" \
    > /opt/neo4j/conf/neo4j.conf
