# inspired by https://github.com/hauptmedia/docker-jmeter  and
# https://github.com/hhcordero/docker-jmeter-server/blob/master/Dockerfile
FROM mcr.microsoft.com/devcontainers/universal:linux

ARG JMETER_VERSION="5.6"
ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV JMETER_CUSTOM_PLUGINS_FOLDER /plugins
ENV	JMETER_BIN	${JMETER_HOME}/bin
ENV	JMETER_DOWNLOAD_URL  https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz

# Install extra packages
# Set TimeZone, See: https://github.com/gliderlabs/docker-alpine/issues/136#issuecomment-612751142
ARG TZ="Europe/Amsterdam"
ENV TZ ${TZ}
RUN    apt update \
	&& apt upgrade \
	&& apt install ca-certificates \
	&& update-ca-certificates \
	&& apt install --update openjdk8-jre tzdata curl unzip bash \
	&& apt install --no-cache nss \
	&& rm -rf /var/cache/apt/* \
	&& mkdir -p /tmp/dependencies  \
	&& curl -L --silent ${JMETER_DOWNLOAD_URL} >  /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz  \
	&& mkdir -p /opt  \
	&& tar -xzf /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz -C /opt  \
	&& rm -rf /tmp/dependencies \
 	&& curl -L --silent https://github.com/xmeter-net/mqtt-jmeter/raw/master/Download/v2.0.2/mqtt-xmeter-fuse-2.0.2-jar-with-dependencies.jar  >  ${JMETER_HOME}/lib/ext/mqtt-xmeter-fuse-2.0.2-jar-with-dependencies.jar

# Set global PATH such that "jmeter" command is found
ENV PATH $PATH:$JMETER_BIN