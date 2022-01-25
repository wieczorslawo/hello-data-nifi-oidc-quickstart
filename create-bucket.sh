#!/usr/bin/env bash

set -e

cd "$(dirname $0)"

./nifi-cli.sh registry create-bucket --bucketName $1
