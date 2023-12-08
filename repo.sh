#!/bin/bash

# This file is part of hey.
#
# hey is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# hey is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with hey.  If not, see <https://www.gnu.org/licenses/>.
#
# For further information about hey you can visit
# https://cdelord.fr/hey

OUT=$1
if ! [ -d "$OUT" ]
then
    echo "usage: repo.sh <output directory>"
    exit 1
fi

INDEX="$OUT/hey-table.md"
rm -f "$INDEX"

build-target()
{
    local TARGET="$1"

    {
        echo "### $TARGET"
        echo ""
        case "$TARGET" in
            *windows*)  echo "| Package | Zip file |" ;;
            *)          echo "| Package | Command |" ;;
        esac
                        echo "| ------- | ------- |"
    } >> "$INDEX"

    build "$TARGET" all
    build "$TARGET" luax
    build "$TARGET" bang
    build "$TARGET" calculadoira
    build "$TARGET" lsvg
    build "$TARGET" panda pandoc-latex-template pandoc-panam-css
    build "$TARGET" tagref
    build "$TARGET" ypp
    build "$TARGET" ditaa
    build "$TARGET" pandoc pandoc-latex-template pandoc-panam-css
    build "$TARGET" plantuml
    build "$TARGET" typst

    echo "" >> "$INDEX"
}

build()
{
    local TARGET="$1"
    local SOFT="$2"
    shift 2

    local SOFT_NAME=$SOFT
    local DESCR=""
    case $SOFT in
        all)    SOFT_NAME=cdsoft; DESCR="(all packages)" ;;
    esac

    local TMP="$OUT/$TARGET-$SOFT_NAME"
    local ARCHIVE="$OUT/$SOFT_NAME-$TARGET.tar.xz"
    local SCRIPT="$OUT/$SOFT_NAME-$TARGET.sh"
    local ARCHIVE_NAME
    local SCRIPT_NAME
    ARCHIVE_NAME="$(basename "$ARCHIVE")"
    SCRIPT_NAME="$(basename "$SCRIPT")"

    local ARCHIVE_ZIP="$OUT/$SOFT_NAME-$TARGET.zip"
    local ARCHIVE_ZIP_NAME
    ARCHIVE_ZIP_NAME="$(basename "$ARCHIVE_ZIP")"

    rm -rf "$TMP"
    mkdir -p "$TMP/$SOFT_NAME/$TARGET"
    ./hey -p "$TMP/$SOFT_NAME/$TARGET" -t "$TARGET" install "$SOFT" "$@"
    (   cd "$TMP" && \
        case "$TARGET" in
            *windows*)  rm -f "$ARCHIVE_ZIP"; zip -q -6 -r "$ARCHIVE_ZIP" . ;;
            *)          XZ_OPT=-6 tar -cJf "$ARCHIVE" --transform="s|^./||" . ;;
        esac
        rm -rf "$TMP"
    ) &

    local URL="https://cdelord.fr/hey"

    case "$TARGET" in
        *windows*)
            echo "| [$SOFT_NAME]($URL/$ARCHIVE_ZIP_NAME) $DESCR | [$ARCHIVE_ZIP_NAME]($URL/$ARCHIVE_ZIP_NAME) |" >> "$INDEX"
            ;;
        *)
            echo "| [$SOFT_NAME]($URL/$ARCHIVE_NAME) $DESCR | \`curl $URL/$SCRIPT_NAME \\| sh\`" >> "$INDEX"
            cat <<EOF > "$SCRIPT"
#!/usr/bin/env sh

SOFT_NAME="$SOFT_NAME"
ARCHIVE_NAME="$ARCHIVE_NAME"
ARCHIVE_URL="$URL/\$ARCHIVE_NAME"

set -e

[ -z "\$PREFIX" ] && PREFIX=~/.local
if ! [ -d \$PREFIX ]
then
    echo "\$PREFIX: not a directory"
    exit 1
fi

tmp="\$(mktemp --directory --tmpdir hey.XXXXXX)"
archive="\$tmp/\$ARCHIVE_NAME"
trap 'rm -rf "\$tmp"' EXIT
echo "Download \$ARCHIVE_URL"
curl --fail --output "\$archive" "\$ARCHIVE_URL"
echo "Install \$SOFT_NAME in \$PREFIX"
tar xJvf "\$archive" --strip-components=2 -C "\$PREFIX"
EOF
            ;;
    esac
}

cp hey "$OUT/hey"

build-target x86_64-linux-musl
build-target x86_64-linux-gnu

build-target aarch64-linux-musl
build-target aarch64-linux-gnu

build-target x86_64-macos-none
build-target aarch64-macos-none

build-target x86_64-windows-gnu

pandoc -t gfm "$INDEX" -o "$INDEX"

figlet "Finalizing..."
wait
