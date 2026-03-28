#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${script_dir}/common.sh"

project_name="${1:-Git}"
output_file="${2:-manifesto_${project_name,,}.md}"

cat > "${output_file}" <<EOF
# Open Source Manifesto for ${project_name}

${project_name} matters because it proves that collaboration infrastructure can be shared, audited, modified, and governed in public.

## Principles

- Freedom over dependence: developers should not be locked behind a proprietary gatekeeper to collaborate on code.
- Transparency over secrecy: version history should be inspectable and reproducible.
- Decentralization over monopoly: every clone should carry the power to continue the work.
- Responsibility over passivity: contributors should be trusted with strong tools and accountable for how they use them.

## Claim

${project_name} is more than a utility. It is an argument that software development works best when authority is distributed, history is open, and participation is not restricted to those who control a central server.

## Closing

Open source is not only a licensing choice. It is a social design choice. Tools like ${project_name} succeed because they align technical architecture with human autonomy.
EOF

print_kv "Manifesto written to" "${output_file}"
