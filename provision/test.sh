#!/bin/bash

# Test script which performs the following tasks:

# Create image
# Boot instances
# Launch Qserv containers
# Lauch integration tests

# @author  Oualid Achbal, IN2P3
# @author  Fabrice Jammes, IN2P3

set -e
set -x

DIR=$(cd "$(dirname "$0")"; pwd -P)

usage() {
  cat << EOD

Usage: `basename $0` [options]

  Available options:
    -h          this message
    -c          update CentOS7/Docker snapshot
    -p          provision Qserv cluster on Openstack

  Create up to date CentOS7 snapshot and use it to provision Qserv cluster on
  Openstack
  If no option provided, use '-p -S' by default.

  Pre-requisites: Openstack RC file need to be sourced and $DIR/env-openstack.sh available.

EOD
}

# get the options
while getopts hcp c ; do
    case $c in
        h) usage ; exit 0 ;;
        c) CREATE="TRUE" ;;
        p) PROVISION="TRUE" ;;
        \?) usage ; exit 2 ;;
    esac
done
shift $(($OPTIND - 1))

if [ $# -ne 0 ] ; then
    usage
    exit 2
fi

if [ "$OPTIND" -eq 1 ]; then
    PROVISION="TRUE"
fi

. "$DIR/env-openstack.sh"

if [ -n "$CREATE" ]; then
    echo "Create up to date snapshot image"
    "$DIR/create-image.py" --cleanup --config "$CONF_FILE" -vv
fi

if [ -n "$PROVISION" ]; then
    echo "Provision Qserv cluster on Openstack"
    "$DIR/provision-qserv.py" --cleanup --config "$CONF_FILE" --nb-servers "$NB_SERVERS" -vv
fi

. "$DIR/env-infrastructure.sh"

