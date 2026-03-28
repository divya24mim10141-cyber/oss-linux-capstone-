# An Open Source Audit of Git Version Control System

This project is a Linux shell scripting capstone built around Git as an example of open-source software. It combines technical inspection, philosophical analysis, and practical audit automation.

## Project Goal

The goal is to study Git from two angles:

- technical: how it is installed, where it lives in Linux, how it runs, and how it interacts with system packages, disk, permissions, and logs
- philosophical: why Git was created, how it reflects open-source values, and how it compares with more centralized or proprietary alternatives

## Deliverables

- `report.md`: full audit report structured into Part A to Part D
- `scripts/run_all.sh`: runs the whole audit in sequence
- `scripts/system_info.sh`: collects OS, kernel, user, and Git binary details
- `scripts/package_checker.sh`: verifies Git package installation through `dpkg` and `apt`
- `scripts/disk_permission_auditor.sh`: audits file metadata, ownership, executability, and nearby binaries
- `scripts/log_analyzer.sh`: checks package and system logs for Git-related events
- `scripts/open_source_manifesto_generator.sh`: creates a short open-source manifesto for Git
- `samples/sample_outputs.md`: example output snippets for the written submission

## Suggested Linux Usage

```bash
chmod +x scripts/*.sh
./scripts/run_all.sh
```

Or run scripts individually:

```bash
./scripts/system_info.sh
./scripts/package_checker.sh
./scripts/disk_permission_auditor.sh
./scripts/log_analyzer.sh
./scripts/open_source_manifesto_generator.sh
```

## Notes

- The scripts are written for Debian/Ubuntu-style systems that use `apt` and `dpkg`.
- Most commands work without root, but log visibility may improve with `sudo`.
- The manifesto script writes a Markdown file in the current working directory.
