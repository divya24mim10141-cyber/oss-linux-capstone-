#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${script_dir}/common.sh"

print_section "Disk & Permission Auditor"

git_path="${1:-/usr/bin/git}"

if [[ ! -e "${git_path}" ]]; then
  echo "Target not found: ${git_path}"
  exit 1
fi

echo "Target: ${git_path}"
echo

echo "File metadata:"
stat "${git_path}"
echo

echo "Parent directory permissions:"
ls -ld "$(dirname "${git_path}")"
echo

echo "Disk usage:"
du -h "${git_path}"
echo

echo "Access check:"
[[ -x "${git_path}" ]] && print_kv "Executable" "yes" || print_kv "Executable" "no"
[[ -w "${git_path}" ]] && print_kv "Writable by current user" "yes" || print_kv "Writable by current user" "no"

echo
echo "Nearby Git-related binaries:"
find "$(dirname "${git_path}")" -maxdepth 1 -type f -name 'git*' 2>/dev/null | sort | head -n 20
