#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "$0")"

main() {
  echo
  echo "🥒 setting up ..."
  echo
  include_from_zshrc  
  echo
  echo "🥒 setup done. ✅"
  echo
}

include_from_zshrc() {
cat <<-EOF >> ~/.zshrc
# include osx-home config
source ~/workspace/osx-home/includeme
EOF
}

main

