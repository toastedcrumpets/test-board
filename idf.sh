#!/bin/bash
# Run the ESP-IDF container with the current directory mounted as /project
# (option z is needed for selinux issues) We use the current user id, so that
# files created in the container are owned by the current user
docker run --rm -v $PWD/firmware:/project:z -w /project -u $UID -e HOME=/tmp -it espressif/idf:release-v5.4