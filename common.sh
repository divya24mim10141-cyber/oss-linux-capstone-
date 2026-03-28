#!/usr/bin/env bash

print_section() {
  printf '== %s ==\n' "$1"
}

print_kv() {
  printf '%s: %s\n' "$1" "$2"
}

command_exists() {
  command -v "$1" >/dev/null 2>&1
}
