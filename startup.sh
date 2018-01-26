#!/bin/bash -e

array=(${MKR_INSTALL_PACKAGE})
for pkg in ${array[@]}; do
  mkr plugin install "${pkg}"
done
export PATH=$PATH:/opt/mackerel-agent/plugins/bin

conf=/etc/mackerel-agent/mackerel-metrics-collect-agent.conf
s3cmd get "${CONF_S3_URI}" "${conf}"
exec mackerel-metrics-collect-agent -conf "${conf}"
