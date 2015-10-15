#!/bin/bash

DIRECTORY="/usr/local/mariadb/var/"

# Check DB Files
if [ "`ls -A $DIRECTORY`" = "" ]; then
  echo "$DIRECTORY not database files, run copy default database files to here"
  cp -r /opt/backup/mysql-data/* $DIRECTORY
fi


# RUN Service
service mariadb start && \
service nginx start && \
service php-fpm start
