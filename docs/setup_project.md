# Requirements
- docker
- bash

## Tested on
- win 10

## Structure
- clis: folder where we can trigger cli without any installation
- configurations: to put all the common things
- containers: to build/push/execute container for this project

## Authenticate account and project
- from the root of this project in bash
- `./automation/init_project`
- copy url to a browser
- authenticate via browser
- copy/paste token
- press enter

## Create cluster
- confirm the cluster is not already created
- `./automation/create_cluster`

## Get credentials for the cluster
- confirm the cluster exist
- `./automation/get_cluster_credentials`

## Build containers
- move to containers folder
- move to the container you want to build folder (for example googleclis)
- ensure you are running with bash
- choose the build number you want `here: 0`
- run `./build.sh 0`

## Push containers
- move to containers folder
- move to the container you want to build folder (for example googleclis)
- ensure you are running with bash
- choose the build number you want `here: 0`
- run `./push.sh 0`
