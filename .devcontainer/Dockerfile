# inspired by https://github.com/hauptmedia/docker-jmeter  and
# https://github.com/hhcordero/docker-jmeter-server/blob/master/Dockerfile
FROM mcr.microsoft.com/devcontainers/java:0-17

# Install extra packages
# Set TimeZone, See: https://github.com/gliderlabs/docker-alpine/issues/136#issuecomment-612751142
RUN mkdir -p /tmp/dependencies
RUN curl -L --silent https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-5.6.tgz >  /tmp/dependencies/apache-jmeter-5.6.tgz
RUN mkdir -p /opt && tar -xzf /tmp/dependencies/apache-jmeter-5.6.tgz -C /opt
RUN rm -rf /tmp/dependencies
RUN curl -L --silent https://github.com/xmeter-net/mqtt-jmeter/raw/master/Download/v2.0.2/mqtt-xmeter-fuse-2.0.2-jar-with-dependencies.jar  >  /opt/apache-jmeter-5.6/lib/ext/mqtt-xmeter-fuse-2.0.2-jar-with-dependencies.jar

ENV PATH $PATH:/opt/apache-jmeter-5.6/bin
