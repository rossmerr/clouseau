FROM openjdk:8

COPY ./clouseau-2.17.0 /app/
COPY ./config/clouseau/ /config/

VOLUME ["/data", "/config"]

CMD ["java","-server","-classpath","/app/*","-Xmx2G","-Dsun.net.inetaddr.ttl=30","-Dsun.net.inetaddr.negative.ttl=30","-Dlog4j.configuration=file:/config/log4j.properties","-XX:OnOutOfMemoryError=kill -9 %p","-XX:+UseConcMarkSweepGC","-XX:+CMSParallelRemarkEnabled","com.cloudant.clouseau.Main","/config/clouseau.ini"]