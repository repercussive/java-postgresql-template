#!/bin/bash

docker cp sample.sql postgresdb:/home/

commands=$(cat <<EOF
PGPASSWORD=password
echo """
    CREATE DATABASE sample;
    \c sample;
    \i /home/sample.sql
""" | psql -U postgres
EOF
)

docker exec postgresdb bash -c "$commands"
