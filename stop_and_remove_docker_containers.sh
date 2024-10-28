#!/bin/bash
if [ -n "$(docker ps -aq)" ]; then
    docker ps -aq | xargs docker stop | xargs docker rm
fi
