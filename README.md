# hey

`hey` is a set of tools to install some [CDSoft](https://github.com/CDSoft) programs and related softwares.
These softwares can be installed from sources (recommended) or binaries (may be outdated).

[`hey`](https://github.com/CDSoft/hey) is available at [github.com/CDSoft](https://github.com/CDSoft/hey).

# Installation from sources

This chapter describes the installation of the latest versions of these softwares.
To install other version, please use instructions on their web sites.

## Download

[`hey`](https://cdelord.fr/hey/hey) is a single bash script that compiles and installs CDSoft programs.

Just download it and run.

```
$ wget https://cdelord.fr/hey/hey
$ chmod +x hey
```

## Usage

### Help

```
$ hey help
usage: hey options command arguments

Options:
    -p prefix   installation prefix (~/.local by default)
    -t target   LuaX target (cross-compilation)

Commands:
    help        prints this help message
    list        list available packets
    install     install a packet

install arguments
    packages    package names to install
                (see list)
```

### Packages

```
$ hey list
all     install all packets

======== CDSoft softwares =====================================================
bang    Ninja file generator scriptable in LuaX
calculadoira
        simple yet powerful calculator
lsvg    LuaX interpreter specialized to generate SVG images
luax    Lua eXtended, a Lua interpreter with a better REPL and useful libraries
panda   Pandoc Lua filter that works on internal Pandoc’s AST
tagref  Maintain cross-references in your code
ypp     Yet another preprocessor, scriptable in LuaX

======== Other softwares ======================================================
ditaa   DIagrams Through Ascii Art
pandoc  Swiss-army knife to convert from and to a bunch of document formats
pandoc-latex-template
        Clean pandoc LaTeX template to convert your markdown files to PDF or LaTeX
pandoc-panam-css
        Pan Am: Simple CSS for Pandoc
plantuml
        PlantUML
typst   Focus on your text and let Typst take care of layout and formatting
```

| Package                         | Sources                                                     |
| ------------------------------- | ----------------------------------------------------------- |
| `bang`                          | <https://github.com/CDSoft/bang>                            |
| `calculadoira`                  | <https://github.com/CDSoft/calculadoira>                    |
| `lsvg`                          | <https://github.com/CDSoft/lsvg>                            |
| `luax`                          | <https://github.com/CDSoft/luax>                            |
| `panda`                         | <https://github.com/CDSoft/panda>                           |
| `tagref`                        | <https://github.com/CDSoft/tagref>                          |
| `ypp`                           | <https://github.com/CDSoft/ypp>                             |
| `ditaa`                         | <https://github.com/stathissideris/ditaa>                   |
| `pandoc`                        | <https://pandoc.org>                                        |
| `pandoc-latex-template`         | <https://github.com/Wandmalfarbe/pandoc-latex-template>     |
| `pandoc-panam-css`              | <https://github.com/CDSoft/pan-am>                          |
| `plantuml`                      | <https://github.com/plantuml/plantuml>                      |
| `typst`                         | <https://github.com/typst/typst>                            |

### Example

E.g. to install LuaX and Bang in `path/to/my/softs`:

```
$ hey -p path/to/my/softs install luax bang
...
```

Note that the installation of LuaX can be long, especially on older computers.

# Installation of precompiled binaries

This chapter describes the installation of the (more or less) latest versions of these softwares
using binary repositories.

## Download

There is a download helper for each supported platform and package:

```sh
$ curl -sSL http://cdelord.fr/hey/$TARGET/$SOFT.sh | sh
```

## Example

E.g. to install LuaX and Bang in `path/to/my/softs`:

```
$ PREFIX=path/to/my/softs
$ curl -sSL http://cdelord.fr/hey/x86_64-linux-musl/luax.sh | sh
$ curl -sSL http://cdelord.fr/hey/x86_64-linux-musl/bang.sh | sh
```

## Available binary archives

### x86_64-linux-musl

| Package                                                                          | Command                                                                          |
| -------                                                                          | -------                                                                          |
| [all](https://cdelord.fr/hey/x86_64-linux-musl/all.tar.xz)                       | `curl -sSL https://cdelord.fr/hey/x86_64-linux-musl/all.sh \| sh`                |
| [luax](https://cdelord.fr/hey/x86_64-linux-musl/luax.tar.xz)                     | `curl -sSL https://cdelord.fr/hey/x86_64-linux-musl/luax.sh \| sh`               |
| [bang](https://cdelord.fr/hey/x86_64-linux-musl/bang.tar.xz)                     | `curl -sSL https://cdelord.fr/hey/x86_64-linux-musl/bang.sh \| sh`               |
| [calculadoira](https://cdelord.fr/hey/x86_64-linux-musl/calculadoira.tar.xz)     | `curl -sSL https://cdelord.fr/hey/x86_64-linux-musl/calculadoira.sh \| sh`       |
| [lsvg](https://cdelord.fr/hey/x86_64-linux-musl/lsvg.tar.xz)                     | `curl -sSL https://cdelord.fr/hey/x86_64-linux-musl/lsvg.sh \| sh`               |
| [panda](https://cdelord.fr/hey/x86_64-linux-musl/panda.tar.xz)                   | `curl -sSL https://cdelord.fr/hey/x86_64-linux-musl/panda.sh \| sh`              |
| [tagref](https://cdelord.fr/hey/x86_64-linux-musl/tagref.tar.xz)                 | `curl -sSL https://cdelord.fr/hey/x86_64-linux-musl/tagref.sh \| sh`             |
| [ypp](https://cdelord.fr/hey/x86_64-linux-musl/ypp.tar.xz)                       | `curl -sSL https://cdelord.fr/hey/x86_64-linux-musl/ypp.sh \| sh`                |
| [ditaa](https://cdelord.fr/hey/x86_64-linux-musl/ditaa.tar.xz)                   | `curl -sSL https://cdelord.fr/hey/x86_64-linux-musl/ditaa.sh \| sh`              |
| [pandoc](https://cdelord.fr/hey/x86_64-linux-musl/pandoc.tar.xz)                 | `curl -sSL https://cdelord.fr/hey/x86_64-linux-musl/pandoc.sh \| sh`             |
| [plantuml](https://cdelord.fr/hey/x86_64-linux-musl/plantuml.tar.xz)             | `curl -sSL https://cdelord.fr/hey/x86_64-linux-musl/plantuml.sh \| sh`           |
| [typst](https://cdelord.fr/hey/x86_64-linux-musl/typst.tar.xz)                   | `curl -sSL https://cdelord.fr/hey/x86_64-linux-musl/typst.sh \| sh`              |

### x86_64-linux-gnu

| Package                                                                          | Command                                                                          |
| -------                                                                          | -------                                                                          |
| [all](https://cdelord.fr/hey/x86_64-linux-gnu/all.tar.xz)                        | `curl -sSL https://cdelord.fr/hey/x86_64-linux-gnu/all.sh \| sh`                 |
| [luax](https://cdelord.fr/hey/x86_64-linux-gnu/luax.tar.xz)                      | `curl -sSL https://cdelord.fr/hey/x86_64-linux-gnu/luax.sh \| sh`                |
| [bang](https://cdelord.fr/hey/x86_64-linux-gnu/bang.tar.xz)                      | `curl -sSL https://cdelord.fr/hey/x86_64-linux-gnu/bang.sh \| sh`                |
| [calculadoira](https://cdelord.fr/hey/x86_64-linux-gnu/calculadoira.tar.xz)      | `curl -sSL https://cdelord.fr/hey/x86_64-linux-gnu/calculadoira.sh \| sh`        |
| [lsvg](https://cdelord.fr/hey/x86_64-linux-gnu/lsvg.tar.xz)                      | `curl -sSL https://cdelord.fr/hey/x86_64-linux-gnu/lsvg.sh \| sh`                |
| [panda](https://cdelord.fr/hey/x86_64-linux-gnu/panda.tar.xz)                    | `curl -sSL https://cdelord.fr/hey/x86_64-linux-gnu/panda.sh \| sh`               |
| [tagref](https://cdelord.fr/hey/x86_64-linux-gnu/tagref.tar.xz)                  | `curl -sSL https://cdelord.fr/hey/x86_64-linux-gnu/tagref.sh \| sh`              |
| [ypp](https://cdelord.fr/hey/x86_64-linux-gnu/ypp.tar.xz)                        | `curl -sSL https://cdelord.fr/hey/x86_64-linux-gnu/ypp.sh \| sh`                 |
| [ditaa](https://cdelord.fr/hey/x86_64-linux-gnu/ditaa.tar.xz)                    | `curl -sSL https://cdelord.fr/hey/x86_64-linux-gnu/ditaa.sh \| sh`               |
| [pandoc](https://cdelord.fr/hey/x86_64-linux-gnu/pandoc.tar.xz)                  | `curl -sSL https://cdelord.fr/hey/x86_64-linux-gnu/pandoc.sh \| sh`              |
| [plantuml](https://cdelord.fr/hey/x86_64-linux-gnu/plantuml.tar.xz)              | `curl -sSL https://cdelord.fr/hey/x86_64-linux-gnu/plantuml.sh \| sh`            |
| [typst](https://cdelord.fr/hey/x86_64-linux-gnu/typst.tar.xz)                    | `curl -sSL https://cdelord.fr/hey/x86_64-linux-gnu/typst.sh \| sh`               |

### aarch64-linux-musl

| Package                                                                          | Command                                                                          |
| -------                                                                          | -------                                                                          |
| [all](https://cdelord.fr/hey/aarch64-linux-musl/all.tar.xz)                      | `curl -sSL https://cdelord.fr/hey/aarch64-linux-musl/all.sh \| sh`               |
| [luax](https://cdelord.fr/hey/aarch64-linux-musl/luax.tar.xz)                    | `curl -sSL https://cdelord.fr/hey/aarch64-linux-musl/luax.sh \| sh`              |
| [bang](https://cdelord.fr/hey/aarch64-linux-musl/bang.tar.xz)                    | `curl -sSL https://cdelord.fr/hey/aarch64-linux-musl/bang.sh \| sh`              |
| [calculadoira](https://cdelord.fr/hey/aarch64-linux-musl/calculadoira.tar.xz)    | `curl -sSL https://cdelord.fr/hey/aarch64-linux-musl/calculadoira.sh \| sh`      |
| [lsvg](https://cdelord.fr/hey/aarch64-linux-musl/lsvg.tar.xz)                    | `curl -sSL https://cdelord.fr/hey/aarch64-linux-musl/lsvg.sh \| sh`              |
| [panda](https://cdelord.fr/hey/aarch64-linux-musl/panda.tar.xz)                  | `curl -sSL https://cdelord.fr/hey/aarch64-linux-musl/panda.sh \| sh`             |
| [tagref](https://cdelord.fr/hey/aarch64-linux-musl/tagref.tar.xz)                | `curl -sSL https://cdelord.fr/hey/aarch64-linux-musl/tagref.sh \| sh`            |
| [ypp](https://cdelord.fr/hey/aarch64-linux-musl/ypp.tar.xz)                      | `curl -sSL https://cdelord.fr/hey/aarch64-linux-musl/ypp.sh \| sh`               |
| [ditaa](https://cdelord.fr/hey/aarch64-linux-musl/ditaa.tar.xz)                  | `curl -sSL https://cdelord.fr/hey/aarch64-linux-musl/ditaa.sh \| sh`             |
| [pandoc](https://cdelord.fr/hey/aarch64-linux-musl/pandoc.tar.xz)                | `curl -sSL https://cdelord.fr/hey/aarch64-linux-musl/pandoc.sh \| sh`            |
| [plantuml](https://cdelord.fr/hey/aarch64-linux-musl/plantuml.tar.xz)            | `curl -sSL https://cdelord.fr/hey/aarch64-linux-musl/plantuml.sh \| sh`          |
| [typst](https://cdelord.fr/hey/aarch64-linux-musl/typst.tar.xz)                  | `curl -sSL https://cdelord.fr/hey/aarch64-linux-musl/typst.sh \| sh`             |

### aarch64-linux-gnu

| Package                                                                          | Command                                                                          |
| -------                                                                          | -------                                                                          |
| [all](https://cdelord.fr/hey/aarch64-linux-gnu/all.tar.xz)                       | `curl -sSL https://cdelord.fr/hey/aarch64-linux-gnu/all.sh \| sh`                |
| [luax](https://cdelord.fr/hey/aarch64-linux-gnu/luax.tar.xz)                     | `curl -sSL https://cdelord.fr/hey/aarch64-linux-gnu/luax.sh \| sh`               |
| [bang](https://cdelord.fr/hey/aarch64-linux-gnu/bang.tar.xz)                     | `curl -sSL https://cdelord.fr/hey/aarch64-linux-gnu/bang.sh \| sh`               |
| [calculadoira](https://cdelord.fr/hey/aarch64-linux-gnu/calculadoira.tar.xz)     | `curl -sSL https://cdelord.fr/hey/aarch64-linux-gnu/calculadoira.sh \| sh`       |
| [lsvg](https://cdelord.fr/hey/aarch64-linux-gnu/lsvg.tar.xz)                     | `curl -sSL https://cdelord.fr/hey/aarch64-linux-gnu/lsvg.sh \| sh`               |
| [panda](https://cdelord.fr/hey/aarch64-linux-gnu/panda.tar.xz)                   | `curl -sSL https://cdelord.fr/hey/aarch64-linux-gnu/panda.sh \| sh`              |
| [tagref](https://cdelord.fr/hey/aarch64-linux-gnu/tagref.tar.xz)                 | `curl -sSL https://cdelord.fr/hey/aarch64-linux-gnu/tagref.sh \| sh`             |
| [ypp](https://cdelord.fr/hey/aarch64-linux-gnu/ypp.tar.xz)                       | `curl -sSL https://cdelord.fr/hey/aarch64-linux-gnu/ypp.sh \| sh`                |
| [ditaa](https://cdelord.fr/hey/aarch64-linux-gnu/ditaa.tar.xz)                   | `curl -sSL https://cdelord.fr/hey/aarch64-linux-gnu/ditaa.sh \| sh`              |
| [pandoc](https://cdelord.fr/hey/aarch64-linux-gnu/pandoc.tar.xz)                 | `curl -sSL https://cdelord.fr/hey/aarch64-linux-gnu/pandoc.sh \| sh`             |
| [plantuml](https://cdelord.fr/hey/aarch64-linux-gnu/plantuml.tar.xz)             | `curl -sSL https://cdelord.fr/hey/aarch64-linux-gnu/plantuml.sh \| sh`           |
| [typst](https://cdelord.fr/hey/aarch64-linux-gnu/typst.tar.xz)                   | `curl -sSL https://cdelord.fr/hey/aarch64-linux-gnu/typst.sh \| sh`              |

### x86_64-macos-none

| Package                                                                          | Command                                                                          |
| -------                                                                          | -------                                                                          |
| [all](https://cdelord.fr/hey/x86_64-macos-none/all.tar.xz)                       | `curl -sSL https://cdelord.fr/hey/x86_64-macos-none/all.sh \| sh`                |
| [luax](https://cdelord.fr/hey/x86_64-macos-none/luax.tar.xz)                     | `curl -sSL https://cdelord.fr/hey/x86_64-macos-none/luax.sh \| sh`               |
| [bang](https://cdelord.fr/hey/x86_64-macos-none/bang.tar.xz)                     | `curl -sSL https://cdelord.fr/hey/x86_64-macos-none/bang.sh \| sh`               |
| [calculadoira](https://cdelord.fr/hey/x86_64-macos-none/calculadoira.tar.xz)     | `curl -sSL https://cdelord.fr/hey/x86_64-macos-none/calculadoira.sh \| sh`       |
| [lsvg](https://cdelord.fr/hey/x86_64-macos-none/lsvg.tar.xz)                     | `curl -sSL https://cdelord.fr/hey/x86_64-macos-none/lsvg.sh \| sh`               |
| [panda](https://cdelord.fr/hey/x86_64-macos-none/panda.tar.xz)                   | `curl -sSL https://cdelord.fr/hey/x86_64-macos-none/panda.sh \| sh`              |
| [tagref](https://cdelord.fr/hey/x86_64-macos-none/tagref.tar.xz)                 | `curl -sSL https://cdelord.fr/hey/x86_64-macos-none/tagref.sh \| sh`             |
| [ypp](https://cdelord.fr/hey/x86_64-macos-none/ypp.tar.xz)                       | `curl -sSL https://cdelord.fr/hey/x86_64-macos-none/ypp.sh \| sh`                |
| [ditaa](https://cdelord.fr/hey/x86_64-macos-none/ditaa.tar.xz)                   | `curl -sSL https://cdelord.fr/hey/x86_64-macos-none/ditaa.sh \| sh`              |
| [pandoc](https://cdelord.fr/hey/x86_64-macos-none/pandoc.tar.xz)                 | `curl -sSL https://cdelord.fr/hey/x86_64-macos-none/pandoc.sh \| sh`             |
| [plantuml](https://cdelord.fr/hey/x86_64-macos-none/plantuml.tar.xz)             | `curl -sSL https://cdelord.fr/hey/x86_64-macos-none/plantuml.sh \| sh`           |
| [typst](https://cdelord.fr/hey/x86_64-macos-none/typst.tar.xz)                   | `curl -sSL https://cdelord.fr/hey/x86_64-macos-none/typst.sh \| sh`              |

### aarch64-macos-none

| Package                                                                          | Command                                                                          |
| -------                                                                          | -------                                                                          |
| [all](https://cdelord.fr/hey/aarch64-macos-none/all.tar.xz)                      | `curl -sSL https://cdelord.fr/hey/aarch64-macos-none/all.sh \| sh`               |
| [luax](https://cdelord.fr/hey/aarch64-macos-none/luax.tar.xz)                    | `curl -sSL https://cdelord.fr/hey/aarch64-macos-none/luax.sh \| sh`              |
| [bang](https://cdelord.fr/hey/aarch64-macos-none/bang.tar.xz)                    | `curl -sSL https://cdelord.fr/hey/aarch64-macos-none/bang.sh \| sh`              |
| [calculadoira](https://cdelord.fr/hey/aarch64-macos-none/calculadoira.tar.xz)    | `curl -sSL https://cdelord.fr/hey/aarch64-macos-none/calculadoira.sh \| sh`      |
| [lsvg](https://cdelord.fr/hey/aarch64-macos-none/lsvg.tar.xz)                    | `curl -sSL https://cdelord.fr/hey/aarch64-macos-none/lsvg.sh \| sh`              |
| [panda](https://cdelord.fr/hey/aarch64-macos-none/panda.tar.xz)                  | `curl -sSL https://cdelord.fr/hey/aarch64-macos-none/panda.sh \| sh`             |
| [tagref](https://cdelord.fr/hey/aarch64-macos-none/tagref.tar.xz)                | `curl -sSL https://cdelord.fr/hey/aarch64-macos-none/tagref.sh \| sh`            |
| [ypp](https://cdelord.fr/hey/aarch64-macos-none/ypp.tar.xz)                      | `curl -sSL https://cdelord.fr/hey/aarch64-macos-none/ypp.sh \| sh`               |
| [ditaa](https://cdelord.fr/hey/aarch64-macos-none/ditaa.tar.xz)                  | `curl -sSL https://cdelord.fr/hey/aarch64-macos-none/ditaa.sh \| sh`             |
| [pandoc](https://cdelord.fr/hey/aarch64-macos-none/pandoc.tar.xz)                | `curl -sSL https://cdelord.fr/hey/aarch64-macos-none/pandoc.sh \| sh`            |
| [plantuml](https://cdelord.fr/hey/aarch64-macos-none/plantuml.tar.xz)            | `curl -sSL https://cdelord.fr/hey/aarch64-macos-none/plantuml.sh \| sh`          |
| [typst](https://cdelord.fr/hey/aarch64-macos-none/typst.tar.xz)                  | `curl -sSL https://cdelord.fr/hey/aarch64-macos-none/typst.sh \| sh`             |

### x86_64-windows-gnu

| Package                                                                          | Command                                                                          |
| -------                                                                          | -------                                                                          |
| [all](https://cdelord.fr/hey/x86_64-windows-gnu/all.tar.xz)                      | `curl -sSL https://cdelord.fr/hey/x86_64-windows-gnu/all.sh \| sh`               |
| [luax](https://cdelord.fr/hey/x86_64-windows-gnu/luax.tar.xz)                    | `curl -sSL https://cdelord.fr/hey/x86_64-windows-gnu/luax.sh \| sh`              |
| [bang](https://cdelord.fr/hey/x86_64-windows-gnu/bang.tar.xz)                    | `curl -sSL https://cdelord.fr/hey/x86_64-windows-gnu/bang.sh \| sh`              |
| [calculadoira](https://cdelord.fr/hey/x86_64-windows-gnu/calculadoira.tar.xz)    | `curl -sSL https://cdelord.fr/hey/x86_64-windows-gnu/calculadoira.sh \| sh`      |
| [lsvg](https://cdelord.fr/hey/x86_64-windows-gnu/lsvg.tar.xz)                    | `curl -sSL https://cdelord.fr/hey/x86_64-windows-gnu/lsvg.sh \| sh`              |
| [panda](https://cdelord.fr/hey/x86_64-windows-gnu/panda.tar.xz)                  | `curl -sSL https://cdelord.fr/hey/x86_64-windows-gnu/panda.sh \| sh`             |
| [tagref](https://cdelord.fr/hey/x86_64-windows-gnu/tagref.tar.xz)                | `curl -sSL https://cdelord.fr/hey/x86_64-windows-gnu/tagref.sh \| sh`            |
| [ypp](https://cdelord.fr/hey/x86_64-windows-gnu/ypp.tar.xz)                      | `curl -sSL https://cdelord.fr/hey/x86_64-windows-gnu/ypp.sh \| sh`               |
| [ditaa](https://cdelord.fr/hey/x86_64-windows-gnu/ditaa.tar.xz)                  | `curl -sSL https://cdelord.fr/hey/x86_64-windows-gnu/ditaa.sh \| sh`             |
| [pandoc](https://cdelord.fr/hey/x86_64-windows-gnu/pandoc.tar.xz)                | `curl -sSL https://cdelord.fr/hey/x86_64-windows-gnu/pandoc.sh \| sh`            |
| [plantuml](https://cdelord.fr/hey/x86_64-windows-gnu/plantuml.tar.xz)            | `curl -sSL https://cdelord.fr/hey/x86_64-windows-gnu/plantuml.sh \| sh`          |
| [typst](https://cdelord.fr/hey/x86_64-windows-gnu/typst.tar.xz)                  | `curl -sSL https://cdelord.fr/hey/x86_64-windows-gnu/typst.sh \| sh`             |

# License

    This file is part of hey.

    hey is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    hey is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with hey.  If not, see <https://www.gnu.org/licenses/>.

    For further information about hey you can visit
    https://cdelord.fr/hey
