#!/usr/bin/env sh
set -eu

usage() {
  printf '%s\n' 'Usage: scripts/install.sh {codex|antigravity|claude} [skill-name] [--copy]'
  exit 64
}

[ "$#" -ge 1 ] && [ "$#" -le 3 ] || usage

agent=$1
skill_name=${2:-pair-programming-tutor}
mode=${3:---link}
[ "$skill_name" != "--copy" ] || { mode=--copy; skill_name=pair-programming-tutor; }
[ "$skill_name" != "--link" ] || { mode=--link; skill_name=pair-programming-tutor; }
[ "$mode" = '--link' ] || [ "$mode" = '--copy' ] || usage

source_dir=$(CDPATH= cd -- "$(dirname -- "$0")/../skills/$skill_name" && pwd)

case "$agent" in
  codex) target_dir="${HOME}/.agents/skills" ;;
  antigravity) target_dir="${HOME}/.gemini/config/skills" ;;
  claude) target_dir="${HOME}/.claude/skills" ;;
  *) usage ;;
esac

target="${target_dir}/${skill_name}"
mkdir -p "$target_dir"

if [ "$mode" = '--copy' ]; then
  if [ -e "$target" ] || [ -L "$target" ]; then
    printf '%s\n' "Refusing to overwrite existing target: $target" >&2
    printf '%s\n' 'Remove it yourself after checking its contents, then retry.' >&2
    exit 1
  fi
  cp -R "$source_dir" "$target"
  printf 'Copied %s to %s\n' "$skill_name" "$target"
else
  ln -sfn "$source_dir" "$target"
  printf 'Linked %s to %s\n' "$skill_name" "$target"
fi
