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
$ curl -sSL http://cdelord.fr/hey/$SOFT-$TARGET.sh | sh
```

The installation path can be changed with the environment variable `PATH`.
The default installation path is `~/.local`.

## Example

E.g. to install LuaX and Bang on Linux with musl in `path/to/my/softs`:

```
$ PREFIX=path/to/my/softs
$ curl -sSL http://cdelord.fr/hey/luax-x86_64-linux-musl.sh | sh
$ curl -sSL http://cdelord.fr/hey/bang-x86_64-linux-musl.sh | sh
```

## Available binary archives

### x86_64-linux-musl

| Package                                                                                  | Command                                                                          |
| -------                                                                                  | -------                                                                          |
| [cdsoft](https://cdelord.fr/hey/cdsoft-x86_64-linux-musl.tar.xz) (all packages)          | `curl -sSL https://cdelord.fr/hey/cdsoft-x86_64-linux-musl.sh \| sh`             |
| [luax](https://cdelord.fr/hey/luax-x86_64-linux-musl.tar.xz)                             | `curl -sSL https://cdelord.fr/hey/luax-x86_64-linux-musl.sh \| sh`               |
| [bang](https://cdelord.fr/hey/bang-x86_64-linux-musl.tar.xz)                             | `curl -sSL https://cdelord.fr/hey/bang-x86_64-linux-musl.sh \| sh`               |
| [calculadoira](https://cdelord.fr/hey/calculadoira-x86_64-linux-musl.tar.xz)             | `curl -sSL https://cdelord.fr/hey/calculadoira-x86_64-linux-musl.sh \| sh`       |
| [lsvg](https://cdelord.fr/hey/lsvg-x86_64-linux-musl.tar.xz)                             | `curl -sSL https://cdelord.fr/hey/lsvg-x86_64-linux-musl.sh \| sh`               |
| [panda](https://cdelord.fr/hey/panda-x86_64-linux-musl.tar.xz)                           | `curl -sSL https://cdelord.fr/hey/panda-x86_64-linux-musl.sh \| sh`              |
| [tagref](https://cdelord.fr/hey/tagref-x86_64-linux-musl.tar.xz)                         | `curl -sSL https://cdelord.fr/hey/tagref-x86_64-linux-musl.sh \| sh`             |
| [ypp](https://cdelord.fr/hey/ypp-x86_64-linux-musl.tar.xz)                               | `curl -sSL https://cdelord.fr/hey/ypp-x86_64-linux-musl.sh \| sh`                |
| [ditaa](https://cdelord.fr/hey/ditaa-x86_64-linux-musl.tar.xz)                           | `curl -sSL https://cdelord.fr/hey/ditaa-x86_64-linux-musl.sh \| sh`              |
| [pandoc](https://cdelord.fr/hey/pandoc-x86_64-linux-musl.tar.xz)                         | `curl -sSL https://cdelord.fr/hey/pandoc-x86_64-linux-musl.sh \| sh`             |
| [plantuml](https://cdelord.fr/hey/plantuml-x86_64-linux-musl.tar.xz)                     | `curl -sSL https://cdelord.fr/hey/plantuml-x86_64-linux-musl.sh \| sh`           |
| [typst](https://cdelord.fr/hey/typst-x86_64-linux-musl.tar.xz)                           | `curl -sSL https://cdelord.fr/hey/typst-x86_64-linux-musl.sh \| sh`              |

### x86_64-linux-gnu

| Package                                                                                  | Command                                                                          |
| -------                                                                                  | -------                                                                          |
| [cdsoft](https://cdelord.fr/hey/cdsoft-x86_64-linux-gnu.tar.xz) (all packages)           | `curl -sSL https://cdelord.fr/hey/cdsoft-x86_64-linux-gnu.sh \| sh`              |
| [luax](https://cdelord.fr/hey/luax-x86_64-linux-gnu.tar.xz)                              | `curl -sSL https://cdelord.fr/hey/luax-x86_64-linux-gnu.sh \| sh`                |
| [bang](https://cdelord.fr/hey/bang-x86_64-linux-gnu.tar.xz)                              | `curl -sSL https://cdelord.fr/hey/bang-x86_64-linux-gnu.sh \| sh`                |
| [calculadoira](https://cdelord.fr/hey/calculadoira-x86_64-linux-gnu.tar.xz)              | `curl -sSL https://cdelord.fr/hey/calculadoira-x86_64-linux-gnu.sh \| sh`        |
| [lsvg](https://cdelord.fr/hey/lsvg-x86_64-linux-gnu.tar.xz)                              | `curl -sSL https://cdelord.fr/hey/lsvg-x86_64-linux-gnu.sh \| sh`                |
| [panda](https://cdelord.fr/hey/panda-x86_64-linux-gnu.tar.xz)                            | `curl -sSL https://cdelord.fr/hey/panda-x86_64-linux-gnu.sh \| sh`               |
| [tagref](https://cdelord.fr/hey/tagref-x86_64-linux-gnu.tar.xz)                          | `curl -sSL https://cdelord.fr/hey/tagref-x86_64-linux-gnu.sh \| sh`              |
| [ypp](https://cdelord.fr/hey/ypp-x86_64-linux-gnu.tar.xz)                                | `curl -sSL https://cdelord.fr/hey/ypp-x86_64-linux-gnu.sh \| sh`                 |
| [ditaa](https://cdelord.fr/hey/ditaa-x86_64-linux-gnu.tar.xz)                            | `curl -sSL https://cdelord.fr/hey/ditaa-x86_64-linux-gnu.sh \| sh`               |
| [pandoc](https://cdelord.fr/hey/pandoc-x86_64-linux-gnu.tar.xz)                          | `curl -sSL https://cdelord.fr/hey/pandoc-x86_64-linux-gnu.sh \| sh`              |
| [plantuml](https://cdelord.fr/hey/plantuml-x86_64-linux-gnu.tar.xz)                      | `curl -sSL https://cdelord.fr/hey/plantuml-x86_64-linux-gnu.sh \| sh`            |
| [typst](https://cdelord.fr/hey/typst-x86_64-linux-gnu.tar.xz)                            | `curl -sSL https://cdelord.fr/hey/typst-x86_64-linux-gnu.sh \| sh`               |

### aarch64-linux-musl

| Package                                                                                  | Command                                                                          |
| -------                                                                                  | -------                                                                          |
| [cdsoft](https://cdelord.fr/hey/cdsoft-aarch64-linux-musl.tar.xz) (all packages)         | `curl -sSL https://cdelord.fr/hey/cdsoft-aarch64-linux-musl.sh \| sh`            |
| [luax](https://cdelord.fr/hey/luax-aarch64-linux-musl.tar.xz)                            | `curl -sSL https://cdelord.fr/hey/luax-aarch64-linux-musl.sh \| sh`              |
| [bang](https://cdelord.fr/hey/bang-aarch64-linux-musl.tar.xz)                            | `curl -sSL https://cdelord.fr/hey/bang-aarch64-linux-musl.sh \| sh`              |
| [calculadoira](https://cdelord.fr/hey/calculadoira-aarch64-linux-musl.tar.xz)            | `curl -sSL https://cdelord.fr/hey/calculadoira-aarch64-linux-musl.sh \| sh`      |
| [lsvg](https://cdelord.fr/hey/lsvg-aarch64-linux-musl.tar.xz)                            | `curl -sSL https://cdelord.fr/hey/lsvg-aarch64-linux-musl.sh \| sh`              |
| [panda](https://cdelord.fr/hey/panda-aarch64-linux-musl.tar.xz)                          | `curl -sSL https://cdelord.fr/hey/panda-aarch64-linux-musl.sh \| sh`             |
| [tagref](https://cdelord.fr/hey/tagref-aarch64-linux-musl.tar.xz)                        | `curl -sSL https://cdelord.fr/hey/tagref-aarch64-linux-musl.sh \| sh`            |
| [ypp](https://cdelord.fr/hey/ypp-aarch64-linux-musl.tar.xz)                              | `curl -sSL https://cdelord.fr/hey/ypp-aarch64-linux-musl.sh \| sh`               |
| [ditaa](https://cdelord.fr/hey/ditaa-aarch64-linux-musl.tar.xz)                          | `curl -sSL https://cdelord.fr/hey/ditaa-aarch64-linux-musl.sh \| sh`             |
| [pandoc](https://cdelord.fr/hey/pandoc-aarch64-linux-musl.tar.xz)                        | `curl -sSL https://cdelord.fr/hey/pandoc-aarch64-linux-musl.sh \| sh`            |
| [plantuml](https://cdelord.fr/hey/plantuml-aarch64-linux-musl.tar.xz)                    | `curl -sSL https://cdelord.fr/hey/plantuml-aarch64-linux-musl.sh \| sh`          |
| [typst](https://cdelord.fr/hey/typst-aarch64-linux-musl.tar.xz)                          | `curl -sSL https://cdelord.fr/hey/typst-aarch64-linux-musl.sh \| sh`             |

### aarch64-linux-gnu

| Package                                                                                  | Command                                                                          |
| -------                                                                                  | -------                                                                          |
| [cdsoft](https://cdelord.fr/hey/cdsoft-aarch64-linux-gnu.tar.xz) (all packages)          | `curl -sSL https://cdelord.fr/hey/cdsoft-aarch64-linux-gnu.sh \| sh`             |
| [luax](https://cdelord.fr/hey/luax-aarch64-linux-gnu.tar.xz)                             | `curl -sSL https://cdelord.fr/hey/luax-aarch64-linux-gnu.sh \| sh`               |
| [bang](https://cdelord.fr/hey/bang-aarch64-linux-gnu.tar.xz)                             | `curl -sSL https://cdelord.fr/hey/bang-aarch64-linux-gnu.sh \| sh`               |
| [calculadoira](https://cdelord.fr/hey/calculadoira-aarch64-linux-gnu.tar.xz)             | `curl -sSL https://cdelord.fr/hey/calculadoira-aarch64-linux-gnu.sh \| sh`       |
| [lsvg](https://cdelord.fr/hey/lsvg-aarch64-linux-gnu.tar.xz)                             | `curl -sSL https://cdelord.fr/hey/lsvg-aarch64-linux-gnu.sh \| sh`               |
| [panda](https://cdelord.fr/hey/panda-aarch64-linux-gnu.tar.xz)                           | `curl -sSL https://cdelord.fr/hey/panda-aarch64-linux-gnu.sh \| sh`              |
| [tagref](https://cdelord.fr/hey/tagref-aarch64-linux-gnu.tar.xz)                         | `curl -sSL https://cdelord.fr/hey/tagref-aarch64-linux-gnu.sh \| sh`             |
| [ypp](https://cdelord.fr/hey/ypp-aarch64-linux-gnu.tar.xz)                               | `curl -sSL https://cdelord.fr/hey/ypp-aarch64-linux-gnu.sh \| sh`                |
| [ditaa](https://cdelord.fr/hey/ditaa-aarch64-linux-gnu.tar.xz)                           | `curl -sSL https://cdelord.fr/hey/ditaa-aarch64-linux-gnu.sh \| sh`              |
| [pandoc](https://cdelord.fr/hey/pandoc-aarch64-linux-gnu.tar.xz)                         | `curl -sSL https://cdelord.fr/hey/pandoc-aarch64-linux-gnu.sh \| sh`             |
| [plantuml](https://cdelord.fr/hey/plantuml-aarch64-linux-gnu.tar.xz)                     | `curl -sSL https://cdelord.fr/hey/plantuml-aarch64-linux-gnu.sh \| sh`           |
| [typst](https://cdelord.fr/hey/typst-aarch64-linux-gnu.tar.xz)                           | `curl -sSL https://cdelord.fr/hey/typst-aarch64-linux-gnu.sh \| sh`              |

### x86_64-macos-none

| Package                                                                                  | Command                                                                          |
| -------                                                                                  | -------                                                                          |
| [cdsoft](https://cdelord.fr/hey/cdsoft-x86_64-macos-none.tar.xz) (all packages)          | `curl -sSL https://cdelord.fr/hey/cdsoft-x86_64-macos-none.sh \| sh`             |
| [luax](https://cdelord.fr/hey/luax-x86_64-macos-none.tar.xz)                             | `curl -sSL https://cdelord.fr/hey/luax-x86_64-macos-none.sh \| sh`               |
| [bang](https://cdelord.fr/hey/bang-x86_64-macos-none.tar.xz)                             | `curl -sSL https://cdelord.fr/hey/bang-x86_64-macos-none.sh \| sh`               |
| [calculadoira](https://cdelord.fr/hey/calculadoira-x86_64-macos-none.tar.xz)             | `curl -sSL https://cdelord.fr/hey/calculadoira-x86_64-macos-none.sh \| sh`       |
| [lsvg](https://cdelord.fr/hey/lsvg-x86_64-macos-none.tar.xz)                             | `curl -sSL https://cdelord.fr/hey/lsvg-x86_64-macos-none.sh \| sh`               |
| [panda](https://cdelord.fr/hey/panda-x86_64-macos-none.tar.xz)                           | `curl -sSL https://cdelord.fr/hey/panda-x86_64-macos-none.sh \| sh`              |
| [tagref](https://cdelord.fr/hey/tagref-x86_64-macos-none.tar.xz)                         | `curl -sSL https://cdelord.fr/hey/tagref-x86_64-macos-none.sh \| sh`             |
| [ypp](https://cdelord.fr/hey/ypp-x86_64-macos-none.tar.xz)                               | `curl -sSL https://cdelord.fr/hey/ypp-x86_64-macos-none.sh \| sh`                |
| [ditaa](https://cdelord.fr/hey/ditaa-x86_64-macos-none.tar.xz)                           | `curl -sSL https://cdelord.fr/hey/ditaa-x86_64-macos-none.sh \| sh`              |
| [pandoc](https://cdelord.fr/hey/pandoc-x86_64-macos-none.tar.xz)                         | `curl -sSL https://cdelord.fr/hey/pandoc-x86_64-macos-none.sh \| sh`             |
| [plantuml](https://cdelord.fr/hey/plantuml-x86_64-macos-none.tar.xz)                     | `curl -sSL https://cdelord.fr/hey/plantuml-x86_64-macos-none.sh \| sh`           |
| [typst](https://cdelord.fr/hey/typst-x86_64-macos-none.tar.xz)                           | `curl -sSL https://cdelord.fr/hey/typst-x86_64-macos-none.sh \| sh`              |

### aarch64-macos-none

| Package                                                                                  | Command                                                                          |
| -------                                                                                  | -------                                                                          |
| [cdsoft](https://cdelord.fr/hey/cdsoft-aarch64-macos-none.tar.xz) (all packages)         | `curl -sSL https://cdelord.fr/hey/cdsoft-aarch64-macos-none.sh \| sh`            |
| [luax](https://cdelord.fr/hey/luax-aarch64-macos-none.tar.xz)                            | `curl -sSL https://cdelord.fr/hey/luax-aarch64-macos-none.sh \| sh`              |
| [bang](https://cdelord.fr/hey/bang-aarch64-macos-none.tar.xz)                            | `curl -sSL https://cdelord.fr/hey/bang-aarch64-macos-none.sh \| sh`              |
| [calculadoira](https://cdelord.fr/hey/calculadoira-aarch64-macos-none.tar.xz)            | `curl -sSL https://cdelord.fr/hey/calculadoira-aarch64-macos-none.sh \| sh`      |
| [lsvg](https://cdelord.fr/hey/lsvg-aarch64-macos-none.tar.xz)                            | `curl -sSL https://cdelord.fr/hey/lsvg-aarch64-macos-none.sh \| sh`              |
| [panda](https://cdelord.fr/hey/panda-aarch64-macos-none.tar.xz)                          | `curl -sSL https://cdelord.fr/hey/panda-aarch64-macos-none.sh \| sh`             |
| [tagref](https://cdelord.fr/hey/tagref-aarch64-macos-none.tar.xz)                        | `curl -sSL https://cdelord.fr/hey/tagref-aarch64-macos-none.sh \| sh`            |
| [ypp](https://cdelord.fr/hey/ypp-aarch64-macos-none.tar.xz)                              | `curl -sSL https://cdelord.fr/hey/ypp-aarch64-macos-none.sh \| sh`               |
| [ditaa](https://cdelord.fr/hey/ditaa-aarch64-macos-none.tar.xz)                          | `curl -sSL https://cdelord.fr/hey/ditaa-aarch64-macos-none.sh \| sh`             |
| [pandoc](https://cdelord.fr/hey/pandoc-aarch64-macos-none.tar.xz)                        | `curl -sSL https://cdelord.fr/hey/pandoc-aarch64-macos-none.sh \| sh`            |
| [plantuml](https://cdelord.fr/hey/plantuml-aarch64-macos-none.tar.xz)                    | `curl -sSL https://cdelord.fr/hey/plantuml-aarch64-macos-none.sh \| sh`          |
| [typst](https://cdelord.fr/hey/typst-aarch64-macos-none.tar.xz)                          | `curl -sSL https://cdelord.fr/hey/typst-aarch64-macos-none.sh \| sh`             |

### x86_64-windows-gnu

| Package                                                                                  | Command                                                                          |
| -------                                                                                  | -------                                                                          |
| [cdsoft](https://cdelord.fr/hey/cdsoft-x86_64-windows-gnu.tar.xz) (all packages)         | `curl -sSL https://cdelord.fr/hey/cdsoft-x86_64-windows-gnu.sh \| sh`            |
| [luax](https://cdelord.fr/hey/luax-x86_64-windows-gnu.tar.xz)                            | `curl -sSL https://cdelord.fr/hey/luax-x86_64-windows-gnu.sh \| sh`              |
| [bang](https://cdelord.fr/hey/bang-x86_64-windows-gnu.tar.xz)                            | `curl -sSL https://cdelord.fr/hey/bang-x86_64-windows-gnu.sh \| sh`              |
| [calculadoira](https://cdelord.fr/hey/calculadoira-x86_64-windows-gnu.tar.xz)            | `curl -sSL https://cdelord.fr/hey/calculadoira-x86_64-windows-gnu.sh \| sh`      |
| [lsvg](https://cdelord.fr/hey/lsvg-x86_64-windows-gnu.tar.xz)                            | `curl -sSL https://cdelord.fr/hey/lsvg-x86_64-windows-gnu.sh \| sh`              |
| [panda](https://cdelord.fr/hey/panda-x86_64-windows-gnu.tar.xz)                          | `curl -sSL https://cdelord.fr/hey/panda-x86_64-windows-gnu.sh \| sh`             |
| [tagref](https://cdelord.fr/hey/tagref-x86_64-windows-gnu.tar.xz)                        | `curl -sSL https://cdelord.fr/hey/tagref-x86_64-windows-gnu.sh \| sh`            |
| [ypp](https://cdelord.fr/hey/ypp-x86_64-windows-gnu.tar.xz)                              | `curl -sSL https://cdelord.fr/hey/ypp-x86_64-windows-gnu.sh \| sh`               |
| [ditaa](https://cdelord.fr/hey/ditaa-x86_64-windows-gnu.tar.xz)                          | `curl -sSL https://cdelord.fr/hey/ditaa-x86_64-windows-gnu.sh \| sh`             |
| [pandoc](https://cdelord.fr/hey/pandoc-x86_64-windows-gnu.tar.xz)                        | `curl -sSL https://cdelord.fr/hey/pandoc-x86_64-windows-gnu.sh \| sh`            |
| [plantuml](https://cdelord.fr/hey/plantuml-x86_64-windows-gnu.tar.xz)                    | `curl -sSL https://cdelord.fr/hey/plantuml-x86_64-windows-gnu.sh \| sh`          |
| [typst](https://cdelord.fr/hey/typst-x86_64-windows-gnu.tar.xz)                          | `curl -sSL https://cdelord.fr/hey/typst-x86_64-windows-gnu.sh \| sh`             |

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
