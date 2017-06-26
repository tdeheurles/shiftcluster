#!/bin/bash

# stop on any error
set -euo pipefail

gke_cluster_name="shiftcluster"
gke_num_nodes=1
gke_machine_types="n1-standard-1"
