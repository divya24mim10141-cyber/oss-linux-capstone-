# Sample Outputs

These example snippets can be used in the written submission or presentation to show what the scripts are expected to produce on a Linux machine.

## `system_info.sh`

```text
== System Info ==
Timestamp: 2026-03-28T11:10:24+05:30
Hostname: ubuntu-dev
Kernel: Linux 6.8.0-31-generic x86_64 GNU/Linux
Current user: student
User groups: student sudo docker

Git installed: yes
Git path: /usr/bin/git
Git version: git version 2.43.0
Resolved binary: /usr/bin/git
```

## `package_checker.sh`

```text
== Package Checker ==
Package manager: dpkg/apt
Git package status: installed

Package: git
Version: 1:2.43.0-1ubuntu7
Architecture: amd64
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
```

## `disk_permission_auditor.sh`

```text
== Disk & Permission Auditor ==
Target: /usr/bin/git

File metadata:
Access: (0755/-rwxr-xr-x)
Uid: (0/root)
Gid: (0/root)

Access check:
Executable: yes
Writable by current user: no
```

## `log_analyzer.sh`

```text
== Log Analyzer ==
-- dpkg.log matches --
2026-03-25 09:42:18 install git:amd64 <none> 1:2.43.0-1ubuntu7

-- apt history matches --
Commandline: apt install git
Install: git:amd64 (1:2.43.0-1ubuntu7)
```

## `open_source_manifesto_generator.sh`

```text
Manifesto written to manifesto_git.md
```
