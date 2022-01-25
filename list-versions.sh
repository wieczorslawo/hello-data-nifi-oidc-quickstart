#!/usr/bin/env bash

set -e

cd "$(dirname $0)"

bucket_id=$(./nifi-cli.sh registry list-buckets -ot json | jq ".[].identifier")
flow_id=$(./nifi-cli.sh registry list-flows --bucketIdentifier $bucket_id -ot json | jq ".[].identifier")

./nifi-cli.sh registry list-flow-versions --flowIdentifier $flow_id
