FROM qnib/alplain-jre8

ENV NEO_VER=3.1.1 \
    NEO_BOLT_ADDRESS=0.0.0.0 \
    NEO_BOLT_PORT=7687 \
    NEO_HTTP_ADDRESS=0.0.0.0 \
    NEO_HTTP_PORT=7474 \
    NEO_HTTPS_ADDRESS=0.0.0.0 \
    NEO_HTTPS_PORT=7473 \
    NEO_AUTH_ENABLED=false
RUN wget -qO - http://neo4j.com/artifact.php?name=neo4j-community-${NEO_VER}-unix.tar.gz |tar xfz - -C /opt/ \
 && mv /opt/neo4j-community-${NEO_VER} /opt/neo4j
ADD opt/qnib/neo4j/bin/start.sh /opt/qnib/neo4j/bin/
CMD ["/opt/qnib/neo4j/bin/start.sh"]
