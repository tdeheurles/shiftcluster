#! /bin/bash

# stop on any error
set -euo pipefail

# dockerhub account where to store images
containers_docker_account="tdeheurles"
containers_maintainer="thibault deheurles <tdeheurles@gmail.com>"
containers_baseimage="ubuntu"

# project containers details
containers_googleclis_image="${containers_docker_account}/googleclis"
containers_googleclis_version="0"
