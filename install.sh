#!/bin/bash
set -euo pipefail

source ./build.sh

MOD_DIR="${HOME}/.factorio/mods"
mkdir -p "$MOD_DIR"
cd "$DESTIN"
cp "${TITLE}.zip" "$MOD_DIR"

