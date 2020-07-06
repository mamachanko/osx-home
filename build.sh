#!/usr/bin/env bash

set -euxo pipefail

cd "$(dirname "$0")"

docker build --tag mamachanko/dev:latest .

