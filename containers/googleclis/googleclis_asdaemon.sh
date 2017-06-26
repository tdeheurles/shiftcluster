#! /bin/bash

usage() {
  echo -e "${0} requires parameter cli"
  echo -e "cli can be gcloud or kubectl"
  echo -e " "
  echo -e "examples:"
  echo -e "  ${0} gcloud"
  echo -e "  ${0} kubectl"
}

# usage
if [[ ${1} == "" ]]
then usage; exit 1
fi

# stop on any error
set -euo pipefail

# set parameters
container_name=${1}

# load configuration
root_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../.."
configuration_file="${root_directory}/configurations/containers.sh"
. ${configuration_file}

# Cleanup running or existing container
${root_directory}/automation/container_daemon_stop ${container_name}

# This will run the googleclis container and execute the cli selected
# The configurations will be saved in volumes
docker run -d \
  --name ${container_name} \
  -p 8001:8001 \
  -v gcloud-config:/root/.config \
  -v kubectl-config:/root/.kube \
  -v /$(pwd):/currentFolder \
  -w //currentFolder \
  ${containers_googleclis_image}:${containers_googleclis_version} ${@:2} \
  > /dev/null
