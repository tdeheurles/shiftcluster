#! /bin/bash

# usage
if [[ ${1} == "" ]]
then echo -e "${0} requires parameter build\nexample: ${0} 0"; exit 1
fi

# stop on any error
set -euo pipefail

# set parameters
build=${1}

# load configuration
build_folder="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
configuration_file="${build_folder}/../../configurations/containers.sh"
. ${configuration_file}

# push container
docker push $containers_googleclis
