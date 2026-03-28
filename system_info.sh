#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${script_dir}/common.sh"

print_section "System Info"
print_kv "Timestamp" "$(date -Is)"
print_kv "Hostname" "$(hostname)"
print_kv "Kernel" "$(uname -srmo)"
print_kv "Current user" "$(id -un)"
print_kv "User groups" "$(id -Gn)"
echo

if command_exists git; then
  git_path="$(command -v git)"
  print_kv "Git installed" "yes"
  print_kv "Git path" "${git_path}"
  print_kv "Git version" "$(git --version)"
  print_kv "Resolved binary" "$(readlink -f "${git_path}" 2>/dev/null || echo "${git_path}")"
else
  print_kv "Git installed" "no"
fi

echo
echo "PATH entries:"
tr ':' '\n' <<< "${PATH}"
