#!/usr/bin/env bash

set -e

cd "$(dirname $0)"

docker-compose -f docker-compose.yml -f docker-compose-tools.yml run nifi-cli "$@"
