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

INDEX="$OUT/hey.index"
rm -f "$INDEX"

build-target()
{
    local TARGET="$1"

    {
        echo "### $TARGET"
        echo ""
        printf "| %-88s | %-80s |\n" "Package" "Command"
        printf "| %-88s | %-80s |\n" "-------" "-------"
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

    rm -rf "$TMP"
    mkdir -p "$TMP/$SOFT_NAME/$TARGET"
    ./hey -p "$TMP/$SOFT_NAME/$TARGET" -t "$TARGET" install "$SOFT" "$@"
    (   cd "$TMP" && \
        XZ_OPT=-6 tar -cJf "$ARCHIVE" --transform="s|^./||" .
        rm -rf "$TMP"
    ) &

    local URL="https://cdelord.fr/hey"

    cat <<EOF > "$SCRIPT"
#!/usr/bin/env sh

set -e

ARCHIVE_URL="$URL/$ARCHIVE_NAME"

[ -z "\$PREFIX" ] && PREFIX=~/.local
if ! [ -d \$PREFIX ]
then
    printf "%s: not a directory" "\$PREFIX"
    exit 1
fi

tmp="\$(mktemp --directory --tmpdir hey.XXXXXX)"
archive="\$tmp/$ARCHIVE_NAME"
trap 'rm -rf "\$tmp"' EXIT
printf "Download %s\n" "\$ARCHIVE_URL"
curl --fail --output "\$archive" "\$ARCHIVE_URL"
printf "Install %s in %s\n" "$SOFT_NAME" "\$PREFIX"
tar xJvf "\$archive" --strip-components=2 -C "\$PREFIX"
EOF

    printf "| %-88s | %-80s |\n" "[$SOFT_NAME]($URL/$ARCHIVE_NAME) $DESCR" "\`curl $URL/$SCRIPT_NAME \\| sh\`" >> "$INDEX"
}

cp hey "$OUT/hey"

build-target x86_64-linux-musl
build-target x86_64-linux-gnu

build-target aarch64-linux-musl
build-target aarch64-linux-gnu

build-target x86_64-macos-none
build-target aarch64-macos-none

build-target x86_64-windows-gnu

figlet "Finalizing..."
wait
