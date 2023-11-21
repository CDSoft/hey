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

There is a download helper for each supported platform:

| Download helper                                                               | Platform                  |
| ----------------------------------------------------------------------------- | ------------------------- |
| [hey-x86_64-linux-gnu](https://cdelord.fr/hey/hey-x86_64-linux-gnu)           | 64-bit Intel Linux (libc) |
| [hey-x86_64-linux-musl](https://cdelord.fr/hey/hey-x86_64-linux-musl)         | 64-bit Intel Linux (musl) |
| [hey-aarch64-linux-gnu](https://cdelord.fr/hey/hey-aarch64-linux-gnu)         | 64-bit ARM Linux (libc)   |
| [hey-aarch64-linux-musl](https://cdelord.fr/hey/hey-aarch64-linux-musl)       | 64-bit ARM Linux (musl)   |
| [hey-x86_64-macos-none](https://cdelord.fr/hey/hey-x86_64-macos-none)         | 64-bit Intel MacOS        |
| [hey-aarch64-macos-none](https://cdelord.fr/hey/hey-aarch64-macos-none)       | 64-bit ARM MacOS          |
| [hey-x86_64-windows-gnu](https://cdelord.fr/hey/hey-x86_64-windows-gnu.exe)   | 64-bit Intel Windows      |

Just download the installer for your favorite platform. E.g.:

```
$ wget https://cdelord.fr/hey/hey-x86_64-linux-musl
$ chmod +x hey-x86_64-linux-musl
```

## Usage

### Help

```
$ hey-x86_64-linux-musl help
Install CDSoft programs for x86_64-linux-musl

Options:
    list    List available packages
    all     Install all available packages
    <dir>   Change the installation prefix (default: ~/.local)
    <name>  Install the packet <name>
```

### Packages

```
$ hey-x86_64-linux-musl list
Available packages:
        bang
        calculadoira
        ditaa
        lsvg
        luax
        panda
        pandoc
        plantuml
        tagref
        typst
        ypp
```

Note that `panda` and `pandoc` packages also install `pandoc-latex-template` and `pandoc-panam-css`.

### Example

E.g. to install LuaX and Bang in `path/to/my/softs`:

```
$ hey-x86_64-linux-musl path/to/my/softs luax bang
...
```

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
