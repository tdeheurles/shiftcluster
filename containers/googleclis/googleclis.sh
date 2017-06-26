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
cli_selected=${1}

# load configuration
root_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../.."
configuration_file="${root_directory}/configurations/containers.sh"
. ${configuration_file}

# This will run the googleclis container and execute the cli selected
# The configurations will be saved in volumes
docker run --rm -ti \
  -v gcloud-config:/root/.config \
  -v kubectl-config:/root/.kube \
  -v /${root_directory}:/root_directory \
  -w //root_directory \
  ${containers_googleclis_image}:${containers_googleclis_version} ${@}
