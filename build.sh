#!/bin/bash

JMETER_VERSION=${JMETER_VERSION:-"5.6"}
IMAGE_TIMEZONE=${IMAGE_TIMEZONE:-"Europe/Amsterdam"}
REPO="yourrepo"

# Example build line
docker build  --build-arg JMETER_VERSION=${JMETER_VERSION} --build-arg TZ=${IMAGE_TIMEZONE} -t "${REPO}/jmeter-mqtt:${JMETER_VERSION}" .
