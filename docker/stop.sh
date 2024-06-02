#!/usr/bin/env bash

  for cid in $(docker ps --format '{{.ID}}');
  do
    docker stop ${cid}
  done;

  for sc in $(docker ps -a --format '{{.ID}}:{{.Status}}'|grep -e "Exited\|Created"|awk -F":" '{print $1}');
  do
    docker rm $sc;
  done;

  for x in $(docker images -f dangling=true -q);
  do
    docker rmi -f $x
  done;
  exit 0;

