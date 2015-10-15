#!/bin/bash

CONTAINER="${1};"

if [ "$CONTAINER" == "" ]; then
echo "please enter container name";
echo "ex: sh create.sh laravel5";
exit;
fi

docker run -idt \
--name $CONTAINER \
-p 80:8080 \
-p 81:8081 \
-p 3306:3306 \
imagine10255/centos6-lnmp:v2.0.1
