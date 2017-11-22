local filesystem = require("filesystem")
local component = require("component")
local isfolder = filesystem.isDirectory
local mkdir = filesystem.makeDirectory
_blockid = ""
_nbtroot = {}
_hasnbt = false
_uistate = ""
if isfolder("/hpbuild/structures") == false then mkdir("/hpbuild/structures")
if isfolder("/hpbuild/inventory_handlers") == false then mkdir("/hpbuild/inventory_handlers")
if isfolder("/hpbuild/compressed") == false then mkdir("/hpbuild/compressed")
os.execute("wget https://raw.githubusercontent.com/hpf3/open-computers-structure-scanner/master/inventory%20managers/vanilla.lua /hpbuild/inventory_handlers/vanilla.lua")
os.execute("wget https://raw.githubusercontent.com/hpf3/open-computers-structure-scanner/master/modifiedpackage.lua /lib/package.lua")