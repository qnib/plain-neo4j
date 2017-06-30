FROM qnib/alplain-jre8

ARG NEO_VER=3.2.1
ENV ENTRYPOINTS_DIR=/opt/qnib/entry/ \
    NEO_DBMS_LISTEN_ADDR=0.0.0.0 \
    NEO_BOLT_ADDRESS=0.0.0.0 \
    NEO_BOLT_PORT=7687 \
    NEO_HTTP_ADDRESS=0.0.0.0 \
    NEO_HTTP_PORT=7474 \
    NEO_HTTPS_ADDRESS=0.0.0.0 \
    NEO_HTTPS_PORT=7473 \
    NEO_AUTH_ENABLED=false \
    NEO_HEAP_INIT=512m \
    NEO_HEAP_MAX=512m
RUN wget -qO - http://neo4j.com/artifact.php?name=neo4j-community-${NEO_VER}-unix.tar.gz |tar xfz - -C /opt/ \
 && mv /opt/neo4j-community-${NEO_VER} /opt/neo4j
COPY opt/qnib/neo4j/bin/start.sh /opt/qnib/neo4j/bin/
COPY opt/qnib/neo4j/conf/neo4j.conf /opt/qnib/neo4j/conf/
COPY opt/qnib/entry/30-config-neo4j.sh /opt/qnib/entry/
CMD ["/opt/qnib/neo4j/bin/start.sh"]
