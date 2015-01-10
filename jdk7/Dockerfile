#===============================================================================
#
#                    ##        .
#              ## ## ##       ==
#           ## ## ## ##      ===
#       /""""""""""""""""\___/ ===
#  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
#       \______ o          __/
#         \    \        __/
#          \____\______/
#
# VERSION:        0.1
# DESCRIPTION:    Oracle Java Dockerfile
# AUTHOR:         Patrick M. Slattery <pslattery@mywebgrocer.com>
# COMMENTS:
#   This file describes how to build a very minimal Oracle Java container based on Busybox
#   Based on: https://github.com/jeanblanchard/docker-busybox-java
# USAGE:
#   # Build image:
#   docker build --force-rm --tag registry.mywebgrocer.com/mywebgrocer/busybox-java:jdk7 https://raw.githubusercontent.com/patrickmslatteryvt/busybox-java/master/jdk7/Dockerfile
#   docker push registry.mywebgrocer.com/mywebgrocer/busybox-java
#
#   # Run the container:
#   docker run --rm --interactive --tty --env TZ="America/New_York" --hostname="jdk7" --memory="1g" --name="jdk7" registry.mywebgrocer.com/mywebgrocer/busybox-java:jdk7
#
#   # Debug mode:
#   docker run --rm --interactive --tty --env TZ="America/New_York" --hostname="jdk7-dbg" --memory="1g" --name="jdk7-dbg" registry.mywebgrocer.com/mywebgrocer/busybox-java:jdk7 sh
#
#===============================================================================
FROM progrium/busybox
MAINTAINER Patrick M. Slattery <pslattery@mywebgrocer.com>

# Install cURL and shadow (for useradd in downstream images)
RUN opkg-install curl shadow

# Java Version
ENV JAVA_VERSION_MAJOR 7
ENV JAVA_VERSION_MINOR 72
ENV JAVA_VERSION_BUILD 14
ENV JAVA_PACKAGE jdk
# Set environment
ENV JAVA_HOME /opt/java
ENV PATH ${PATH}:${JAVA_HOME}/bin

# Download and unarchive Java
RUN \
  curl --fail --retry 3 --insecure --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie"\
  --location http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz -#\
  | gunzip | tar x -C /opt && \
  ln -s /opt/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} /opt/java && \
  rm -rf /opt/java/*src.zip \
    /opt/java/lib/missioncontrol \
    /opt/java/lib/visualvm \
    /opt/java/lib/*javafx* \
    /opt/java/jre/lib/plugin.jar \
    /opt/java/jre/lib/ext/jfxrt.jar \
    /opt/java/jre/bin/javaws \
    /opt/java/jre/lib/javaws.jar \
    /opt/java/jre/lib/desktop \
    /opt/java/jre/plugin \
    /opt/java/jre/lib/deploy* \
    /opt/java/jre/lib/*javafx* \
    /opt/java/jre/lib/*jfx* \
    /opt/java/jre/lib/amd64/libdecora_sse.so \
    /opt/java/jre/lib/amd64/libprism_*.so \
    /opt/java/jre/lib/amd64/libfxplugins.so \
    /opt/java/jre/lib/amd64/libglass.so \
    /opt/java/jre/lib/amd64/libgstreamer-lite.so \
    /opt/java/jre/lib/amd64/libjavafx*.so \
    /opt/java/jre/lib/amd64/libjfx*.so

# Define default command.
CMD ["/opt/java/bin/java","-version"]