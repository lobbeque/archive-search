#! /bin/sh

. ~/.conf_solr

MEM_KB=$(cat /proc/meminfo | head -n 1 | awk '{ print $2 }')

JAVA_HEAP=$((3000 + ${MEM_KB} / 3000))

export START_OPTIONS="-m ${JAVA_HEAP}M -Dsolr.conf=${SOLR_ROOT} \
-Dsolr.version=${SOLR_VERSION} \
-Dsolr.run=${SOLR_RUN} \
-Djetty.logs=${SOLR_LOGS} \
-Dsolr.logs=${SOLR_LOGS} \
-Dlogback.configurationFile=${SOLR_CORES}/logback.xml \
-Dcom.sun.management.jmxremote \
-Dcom.sun.management.jmxremote.port=3000 \
-Dcom.sun.management.jmxremote.ssl=false \
-Dcom.sun.management.jmxremote.authenticate=false \
-a -XX:-UseParallelOldGC \
-a -XX:MaxGCPauseMillis=800 \
-a -XX:GCTimeRatio=19 \
-a -XX:NewRatio=10 \
-a -XX:SurvivorRatio=20 \
-a -XX:+UseCompressedOops \
-a -XX:+PrintGC \
-a -XX:+PrintGCDateStamps \
-a -Xloggc:${SOLR_LOGS}/gc.log"
