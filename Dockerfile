# Lightbend Activator

FROM openjdk:8

MAINTAINER Manta

ENV SBT_VERSION 0.13.12

RUN apt-get update \
  && mkdir -p /opt/sbt/$SBT_VERSION && cd /opt/sbt/$SBT_VERSION \
  && curl -OSL https://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/0.13.12/sbt-launch.jar \
  && echo '#!/bin/bash' > /usr/local/bin/sbt \
  && echo 'SBT_OPTS="-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled"' >> /usr/local/bin/sbt \
  && echo "java \$SBT_OPTS -jar /opt/sbt/$SBT_VERSION/sbt-launch.jar \"\$@\"" >> /usr/local/bin/sbt \
  && chmod 755 /usr/local/bin/sbt \
  && sbt about
