#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
root_dir="$(cd "${script_dir}/.." && pwd)"
source "${script_dir}/common.sh"

output_dir="${root_dir}/outputs"
mkdir -p "${output_dir}"

print_section "Git Audit Runner"
print_kv "Output directory" "${output_dir}"
echo

run_and_capture() {
  local name="$1"
  shift

  local target_file="${output_dir}/${name}.txt"
  print_kv "Running" "${name}"
  "$@" | tee "${target_file}"
  echo
}

run_and_capture "system_info" "${script_dir}/system_info.sh"
run_and_capture "package_checker" "${script_dir}/package_checker.sh"
run_and_capture "disk_permission_auditor" "${script_dir}/disk_permission_auditor.sh"
run_and_capture "log_analyzer" "${script_dir}/log_analyzer.sh"

pushd "${root_dir}" >/dev/null
"${script_dir}/open_source_manifesto_generator.sh" Git "${output_dir}/manifesto_git.md" | tee "${output_dir}/manifesto_generator.txt"
popd >/dev/null

echo
print_kv "Audit complete" "yes"
