#!/bin/bash
#
# Test the JMeter Docker image using a trivial test plan.

# Example for using User Defined Variables with JMeter
# These will be substituted in JMX test script
# See also: http://stackoverflow.com/questions/14317715/jmeter-changing-user-defined-variables-from-command-line
export TARGET_HOST="www.map5.nl"
export TARGET_PORT="80"
export TARGET_PATH="/kaarten.html"
export TARGET_KEYWORD="Kaartdiensten"

YYYYMMDD_HMS=$(date "+%Y%m%d_%H%M%S")

T_DIR=tests/trivial

# Reporting dir: start fresh
R_DIR=${T_DIR}/${YYYYMMDD_HMS}/report
rm -rf ${R_DIR} > /dev/null 2>&1
mkdir -p ${R_DIR}

cp ${T_DIR}/plan.jmx ${T_DIR}/${YYYYMMDD_HMS}/

bash ./entrypoint.sh -Dlog_level.jmeter=DEBUG \
	-JTARGET_HOST=${TARGET_HOST} -JTARGET_PORT=${TARGET_PORT} \
	-JTARGET_PATH=${TARGET_PATH} -JTARGET_KEYWORD=${TARGET_KEYWORD} \
	-n -t ${T_DIR}/plan.jmx -l "${T_DIR}/${YYYYMMDD_HMS}/plan.jtl" -j "${T_DIR}/${YYYYMMDD_HMS}/jmeter.log" \
	-e -o ${R_DIR}

echo "==== jmeter.log ===="
cat "${T_DIR}/${YYYYMMDD_HMS}/jmeter.log"

echo "==== Raw Test Report ===="
cat "${T_DIR}/${YYYYMMDD_HMS}/plan.jtl"

echo "==== HTML Test Report ===="
echo "See HTML test report in ${R_DIR}/${YYYYMMDD_HMS}/index.html"