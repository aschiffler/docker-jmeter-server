#!/bin/bash

export TARGET_HOST="broker.hivemq.com"
export TARGET_PORT="1883"
export TARGET_TOPIC="test_plan"
#export THREADS_SUB="2"
#export THREADS_PUB="10"
#export USER1="username1"
#export USER2="username2"
#export PASS1="pass1"
#export PASS1="pass2"
export PLAN="sub_pub.jmx"
#export PLAN="sub_pub_tls.jmx"


#----------------------------------
T_DIR=tests/mqtt

# Reporting dir: start fresh
R_DIR=${T_DIR}/report
rm -rf ${R_DIR} > /dev/null 2>&1
mkdir -p ${R_DIR}

/bin/rm -f ${T_DIR}/test-plan.jtl ${T_DIR}/jmeter.log  > /dev/null 2>&1

jmeter -Dlog_level.jmeter=DEBUG \
	-JTARGET_HOST=${TARGET_HOST} -JTARGET_PORT=${TARGET_PORT}  -JTARGET_TOPIC=${TARGET_TOPIC} \
	-JTHREADS_PUB=${THREADS_PUB} -JTHREADS_SUB=${THREADS_SUB}  \
	-JUSER1=${USER1} -JPASS1=${PASS1}  \
	-JUSER2=${USER2} -JPASS2=${PASS2}  \
	-n -t ${T_DIR}/${PLAN} -l ${T_DIR}/test-plan.jtl -j ${T_DIR}/jmeter.log \
	-e -o ${R_DIR}

echo "==== jmeter.log ===="
cat ${T_DIR}/jmeter.log

echo "==== Raw Test Report ===="
cat ${T_DIR}/test-plan.jtl

echo "==== HTML Test Report ===="
echo "See HTML test report in ${R_DIR}/index.html"
