#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${script_dir}/common.sh"

print_section "Package Checker"

if ! command_exists git; then
  echo "Git is not available on PATH."
  exit 1
fi

if command_exists dpkg-query; then
  if dpkg-query -W -f='${Status}\n' git 2>/dev/null | grep -q "install ok installed"; then
    print_kv "Package manager" "dpkg/apt"
    print_kv "Git package status" "installed"
    echo
    dpkg-query -W -f='Package: ${Package}\nVersion: ${Version}\nArchitecture: ${Architecture}\nMaintainer: ${Maintainer}\n' git
    echo
    echo "Installed files (first 20):"
    dpkg -L git 2>/dev/null | head -n 20
  else
    echo "Git command exists, but package 'git' is not reported as installed by dpkg."
  fi
else
  echo "dpkg-query not found. This script is intended for Debian/Ubuntu systems."
fi

if command_exists apt-cache; then
  echo
  echo "APT policy:"
  apt-cache policy git | sed -n '1,12p'
fi
