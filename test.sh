#!/bin/bash

export TARGET_HOST="broker.hivemq.com"
export PLAN="sub_pub.jmx"


#----------------------------------
T_DIR=tests/mqtt

# Reporting dir: start fresh
R_DIR=${T_DIR}/report
rm -rf ${R_DIR} > /dev/null 2>&1
mkdir -p ${R_DIR}

/bin/rm -f ${T_DIR}/test-plan.jtl ${T_DIR}/jmeter.log  > /dev/null 2>&1

jmeter -Dlog_level.jmeter=DEBUG \
	-JBROKER=${TARGET_HOST}  \
	-n -t ${T_DIR}/${PLAN} -l ${T_DIR}/test-plan.jtl -j ${T_DIR}/jmeter.log \
	-e -o ${R_DIR}

echo "==== jmeter.log ===="
cat ${T_DIR}/jmeter.log

echo "==== Raw Test Report ===="
cat ${T_DIR}/test-plan.jtl

echo "==== HTML Test Report ===="
echo "See HTML test report in ${R_DIR}/index.html"
