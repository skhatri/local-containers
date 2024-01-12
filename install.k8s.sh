#!/usr/bin/env bash

set -xe -o pipefail

name=$1
if [[ -n $name ]];then
  helm upgrade --install ${name} ${name}
  exit $?;
fi;


helm upgrade --install postgres postgres
helm upgrade --install pg-data pg-data

helm upgrade --install cassandra cassandra
helm upgrade --install cass-data cass-data

helm upgrade --install kafka kafka
helm upgrade --install kafka-setup kafka-setup

helm upgrade --install airflow airflow

