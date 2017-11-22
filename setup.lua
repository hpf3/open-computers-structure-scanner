local filesystem = require("filesystem")
local component = require("component")
local isfolder = filesystem.isDirectory
local mkdir = filesystem.makeDirectory
_uistate = ""
_startx = 0
_starty = 0
_startz = 0
_endx = 0
_endy = 0
_endz = 0
_setupver = 1.0
_savever = 1.0
_scanver = 1.0
if isfolder("/hpbuild/structures") == false then mkdir("/hpbuild/structures") end
if isfolder("/hpbuild/inventory_handlers") == false then mkdir("/hpbuild/inventory_handlers") end
if isfolder("/hpbuild/compressed") == false then mkdir("/hpbuild/compressed") end
if isfolder("/hpbuild/core") == false then mkdir("/hpbuild/core") end
os.execute("wget -fq https://raw.githubusercontent.com/hpf3/open-computers-structure-scanner/master/inventory%20managers/vanilla.lua /hpbuild/inventory_handlers/vanilla.lua")
os.execute("wget -fq https://raw.githubusercontent.com/hpf3/open-computers-structure-scanner/master/modifiedpackage.lua /lib/package.lua")
os.execute("wget -fq https://raw.githubusercontent.com/hpf3/open-computers-structure-scanner/master/autorun.lua /autorun.lua")
os.execute("wget -fq https://raw.githubusercontent.com/hpf3/open-computers-structure-scanner/master/core/structuresave.lua /hpbuild/core/save.lua")
os.execute("wget -fq https://raw.githubusercontent.com/hpf3/open-computers-structure-scanner/master/core/scanutil.lua /hpbuild/core/scanutil.lua")