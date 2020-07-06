#!/usr/bin/env bash

set -euo pipefail

main() {
  echo 
  echo "👷 installing ..."
  echo 
  install_brew
  install_software
  install_tmuxfiles
  echo 
  echo "👷 done installing. ✅"
  echo 
}

install_brew() {
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash
}

install_software() {
  echo
  echo "  will brew install:"
  echo
  brew bundle list --all
  echo
  echo "  let's brew"
  echo
  brew bundle install --file="$(pwd)/Brewfile"
  brew bundle check
  echo
  echo "  done brewing"
  echo
}

install_tmuxfiles() {
  curl -fsSL https://raw.githubusercontent.com/luan/tmuxfiles/master/install | bash
}

main

