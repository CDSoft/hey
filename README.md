hey
===

`hey` is an helper script to install some [CDSoft](https://github.com/CDSoft) programs and related softwares.

Usage
=====

## Help

```
$ hey help
usage: hey options command arguments

Options:
    -p prefix   installation prefix (~/.local by default)

Commands:
    help        prints this help message
    list        list available packets
    install     install a packet

install arguments
    packages    package names to install
                (see list)
```

## Packages

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

## Example

E.g. to install LuaX and Bang in `path/to/my/softs`:

```
$ hey -p path/to/my/softs install luax bang
...
```

Note that the installation of LuaX can be long, especially on older computers.
