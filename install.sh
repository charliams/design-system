#!/usr/bin/env bash
# Install design-system Claude Code skills to ~/.claude/skills/
# Run from the design-system repo root: ./install.sh
# Safe to run multiple times — overwrites with the latest version of each skill.

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/skills"
TARGET_DIR="$HOME/.claude/skills"

if [ ! -d "$SOURCE_DIR" ]; then
  echo "No skills/ directory found in $SCRIPT_DIR"
  exit 1
fi

count=0
for skill_dir in "$SOURCE_DIR"/*/; do
  [ -d "$skill_dir" ] || continue
  name="$(basename "$skill_dir")"
  mkdir -p "$TARGET_DIR/$name"
  cp "$skill_dir"*.md "$TARGET_DIR/$name/" 2>/dev/null || true
  echo "  Installed: $name"
  count=$((count + 1))
done

if [ "$count" -eq 0 ]; then
  echo "No skill directories found in $SOURCE_DIR"
  exit 1
fi

echo ""
echo "$count skill(s) installed to $TARGET_DIR"
echo ""
echo "Available in Claude Code as:"
for skill_dir in "$SOURCE_DIR"/*/; do
  [ -d "$skill_dir" ] || continue
  echo "  /$(basename "$skill_dir")"
done
