#!/usr/bin/env luax
--[[
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
--]]

local F=  require "F"
local fs = require "fs"

local root = arg[1]
local out = arg[2]

assert(root and out, "usage: pack.lua <source dir> <output file.pkg>")

local archive = F{}

fs.ls(root/"**")
: foreach(function(fullname)
    local st = fs.stat(fullname)
    if st.type == "file" then
        local name = st.name:strip_prefix(root..fs.sep)
        local content = assert(fs.read(st.name))
        archive[#archive+1] = string.pack("<s1s2s1I4s1I4s1s4",
            "<FILE>", name,
            "<MODE>", st.mode,
            "<TIME>", st.mtime,
            "<CONTENT>", assert(content:lz4())
        )
        archive[#archive+1] = string.pack("<s1I4", "<CRC>", archive[#archive]:crc32())
    end
end)

fs.write(out, archive:str():lz4())
