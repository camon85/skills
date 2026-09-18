#!/usr/bin/env sh
set -eu

usage() {
  printf '%s\n' 'Usage: scripts/install.sh {codex|antigravity|claude} [--copy]'
  exit 64
}

[ "$#" -ge 1 ] && [ "$#" -le 2 ] || usage

agent=$1
mode=${2:---link}
[ "$mode" = '--link' ] || [ "$mode" = '--copy' ] || usage

source_dir=$(CDPATH= cd -- "$(dirname -- "$0")/../skills/pair-programming-tutor" && pwd)

case "$agent" in
  codex) target_dir="${HOME}/.agents/skills" ;;
  antigravity) target_dir="${HOME}/.gemini/config/skills" ;;
  claude) target_dir="${HOME}/.claude/skills" ;;
  *) usage ;;
esac

target="${target_dir}/pair-programming-tutor"
mkdir -p "$target_dir"

if [ "$mode" = '--copy' ]; then
  if [ -e "$target" ] || [ -L "$target" ]; then
    printf '%s\n' "Refusing to overwrite existing target: $target" >&2
    printf '%s\n' 'Remove it yourself after checking its contents, then retry.' >&2
    exit 1
  fi
  cp -R "$source_dir" "$target"
  printf 'Copied pair-programming-tutor to %s\n' "$target"
else
  ln -sfn "$source_dir" "$target"
  printf 'Linked pair-programming-tutor to %s\n' "$target"
fi
