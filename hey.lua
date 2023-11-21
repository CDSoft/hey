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

local F = require "F"
local fs = require "fs"
local sys = require "sys"
local http = require "socket.http"

local target = F{sys.arch, sys.os, sys.abi}:str"-"
local url = "http://cdelord.fr/hey"/target

local _packages = nil
local function packages()
    _packages = _packages or http.request(url/"packages.lst")
    return F(_packages):words()
end

local function help()
    print("Install CDSoft programs for "..target)
    print("")
    print("Options:")
    print("", "list", "List available packages")
    print("", "all", "Install all available packages")
    print("", "<dir>", "Change the installation prefix (default: ~/.local)")
    print("", "<name>", "Install the packet <name>")
    os.exit()
end

if #arg == 0 then
    help()
end

local prefix = os.getenv "HOME" / ".local"

local function install(name)
    assert(fs.is_dir(prefix))
    local archive_url = url/name..".pkg"
    print("Download", archive_url)
    local archive = http.request(archive_url)
    archive = assert(archive:unlz4())
    print("Install ", name.." to "..prefix)
    local i = 1
    while i ~= nil and i < #archive do
        local magic1, filename,
              magic2, mode,
              magic3, mtime,
              magic4, content,
              j = string.unpack("<s1s2s1I4s1I4s1s4", archive, i)
        assert(magic1 == "<FILE>")
        assert(magic2 == "<MODE>")
        assert(magic3 == "<TIME>")
        assert(magic4 == "<CONTENT>")
        local magic5, crc, k = string.unpack("<s1I4", archive, j)
        assert(k)
        assert(magic5 == "<CRC>")
        assert(archive:sub(i, j-1):crc32() == crc)
        content = assert(assert(content):unlz4())
        i = k
        fs.mkdirs(prefix/F(filename):dirname())
        print("", "", prefix/filename, #content.." bytes")
        assert(fs.write(prefix/filename, content))
        assert(fs.chmod(prefix/filename, mode))
        assert(fs.touch(prefix/filename, mtime))
    end
end

F.foreach(arg, function(a)
    if a == "help" then
        help()
    elseif a == "list" then
        print("Available packages:")
        packages():foreach(function(name) print("", name) end)
    elseif a == "all" then
        packages():foreach(install)
    elseif fs.is_dir(a) then
        prefix = a
    elseif packages():elem(a) then
        install(a)
    else
        print("Unknown package", a)
        os.exit(1)
    end
end)
