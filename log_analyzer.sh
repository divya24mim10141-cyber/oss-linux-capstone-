#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${script_dir}/common.sh"

print_section "Log Analyzer"

echo "-- dpkg.log matches --"
if [[ -r /var/log/dpkg.log ]]; then
  grep -i ' git[: ]\| install git\| upgrade git' /var/log/dpkg.log | tail -n 20 || true
else
  echo "Cannot read /var/log/dpkg.log"
fi

echo
echo "-- apt history matches --"
if [[ -r /var/log/apt/history.log ]]; then
  grep -i 'git' /var/log/apt/history.log | tail -n 20 || true
else
  echo "Cannot read /var/log/apt/history.log"
fi

echo
echo "-- journalctl matches for git.service/git commands --"
if command_exists journalctl; then
  journalctl --no-pager 2>/dev/null | grep -i 'git' | tail -n 20 || true
else
  echo "journalctl not available"
fi

echo
echo "Interpretation:"
echo "Use dpkg and apt logs to confirm when Git was installed or upgraded."
echo "Use system journal output carefully; many matches may come from unrelated applications invoking Git."
