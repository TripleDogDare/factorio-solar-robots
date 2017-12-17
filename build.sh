#!/bin/bash
set -euo pipefail

SOURCE="${PWD}/src"
INTERM="${PWD}/.pkg"
DESTIN="${PWD}/.zip"
mkdir -p $DESTIN

cd $SOURCE
VERSION="$(jq -r .version info.json)"
NAME="$(jq -r .name info.json)"
TITLE="${NAME}_${VERSION}"
TARGET="${INTERM}/${TITLE}"
mkdir -p "$TARGET"
[ -z "$TARGET" ] && {
	>&2 echo "oh shit"
	exit 100
}
rm -rf "${TARGET}/*"
cp -R "${SOURCE}/." "$TARGET"
cd $INTERM
zip -r "${TITLE}.zip" "$TITLE"
ls
mv "${TITLE}.zip" "$DESTIN/"
