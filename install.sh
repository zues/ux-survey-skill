#!/bin/bash
set -e

COMMAND_FILE="commands/ux-survey.md"

if [ ! -f "$COMMAND_FILE" ]; then
  echo "Error: $COMMAND_FILE not found. Run this script from the repo root." >&2
  exit 1
fi

# Default: user-level install
INSTALL_DIR="$HOME/.claude/commands"

# Project-level if run from inside a project with .claude/
if [ -d ".claude" ]; then
  INSTALL_DIR=".claude/commands"
fi

mkdir -p "$INSTALL_DIR"
cp "$COMMAND_FILE" "$INSTALL_DIR/ux-survey.md"
echo "✓ /ux-survey installed to $INSTALL_DIR"
