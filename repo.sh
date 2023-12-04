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

JSON="$OUT/hey.json"
echo "{" > "$JSON"

INDEX="$OUT/hey.index"
rm -f "$INDEX"

remove_trailing_comma()
{
    sed -i '$s/,$//' "$JSON"
}

build-target()
{
    local TARGET="$1"

    echo "  \"$TARGET\": {" >> "$JSON"
    echo "### $TARGET" >> "$INDEX"
    echo "" >> "$INDEX"
    printf "| %-80s | %-80s |\n" "Package" "Command" >> "$INDEX"
    printf "| %-80s | %-80s |\n" "-------" "-------" >> "$INDEX"

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

    remove_trailing_comma
    echo "  }," >> "$JSON"
    echo "" >> "$INDEX"
}

build()
{
    local TARGET="$1"
    local SOFT="$2"
    shift 2

    echo "    \"$SOFT\": {" >> "$JSON"

    rm -rf "$OUT/$TARGET/tmp-$SOFT"
    mkdir -p "$OUT/$TARGET/tmp-$SOFT/$SOFT/$TARGET"
    ./hey -p "$OUT/$TARGET/tmp-$SOFT/$SOFT/$TARGET" -t "$TARGET" install "$SOFT" "$@"
    case "$SOFT" in
        all|pandoc) rm -f "$OUT/$TARGET/tmp-$SOFT/$SOFT/$TARGET/bin/pandoc-lua"
                    rm -f "$OUT/$TARGET/tmp-$SOFT/$SOFT/$TARGET/bin/pandoc-server"
                    ;;
    esac
    (   cd "$OUT/$TARGET/tmp-$SOFT" && \
        XZ_OPT=-6 tar -cJf "../$SOFT.tar.xz" .
        rm -rf "$OUT/$TARGET/tmp-$SOFT"
    ) &

    local URL="https://cdelord.fr/hey/$TARGET/$SOFT"

    cat <<EOF > "$OUT/$TARGET/$SOFT.sh"
#!/usr/bin/env sh

set -e

URL="$URL.tar.xz"

[ -z "\$PREFIX" ] && PREFIX=~/.local
if ! [ -d \$PREFIX ]
then
    printf "%s: not a directory" "\$PREFIX"
    exit 1
fi

archive=\$(mktemp).tar.xz
printf "Download %s\n" "\$URL"
curl --fail --location --output "\$archive" "\$URL"
printf "Install %s in %s\n" "$SOFT" "\$PREFIX"
tar -xJv -C "\$PREFIX" --strip-components=2 -f "\$archive"
EOF

    echo "      \"archive\": \"$TARGET/$SOFT.tar.xz\"," >> "$JSON"
    echo "      \"webinstall\": \"curl -sSL $URL.sh | sh\"," >> "$JSON"

    printf "| %-80s | %-80s |\n" "[$SOFT]($URL.tar.xz)" "\`curl -sSL $URL.sh \\| sh\`" >> "$INDEX"

    remove_trailing_comma
    echo "    }," >> "$JSON"
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

remove_trailing_comma
echo "}" >> "$JSON"

figlet "Finalizing..."
wait
