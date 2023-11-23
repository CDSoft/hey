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

build-target()
{
    local TARGET="$1"
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

    "$OUT/luax/bin/luax" -t "$TARGET" -o "$OUT/hey-$TARGET" hey.lua

    "$OUT/luax/bin/luax" \
        -e "fs.ls[[$OUT/$TARGET/*.pkg]]:map(F.compose{fs.splitext,fs.basename}):foreach(print)" \
        > "$OUT/$TARGET/packages.lst"
}

build()
{
    local TARGET="$1"
    local SOFT="$2"
    shift 2
    rm -rf "$OUT/$TARGET/tmp-$SOFT"
    mkdir -p "$OUT/$TARGET/tmp-$SOFT"
    ./hey -p "$OUT/$TARGET/tmp-$SOFT" -t "$TARGET" install "$SOFT" "$@"
    case "$SOFT" in
        pandoc) rm -f "$OUT/$TARGET/tmp-$SOFT/bin/pandoc-lua"
                rm -f "$OUT/$TARGET/tmp-$SOFT/bin/pandoc-server"
                ;;
    esac
    ./pack.lua "$OUT/$TARGET/tmp-$SOFT" "$OUT/$TARGET/$SOFT.pkg"
    rm -rf "$OUT/$TARGET/tmp-$SOFT"
}

build-luax()
{
    rm -rf "$OUT/luax"
    mkdir -p "$OUT/luax"
    ./hey -p "$OUT/luax" install luax
    trap 'rm -rf $OUT/luax' EXIT
}

cp hey "$OUT/hey"

build-luax

build-target x86_64-linux-musl
build-target x86_64-linux-gnu

build-target aarch64-linux-musl
build-target aarch64-linux-gnu

build-target x86_64-macos-none
build-target aarch64-macos-none

build-target x86_64-windows-gnu
