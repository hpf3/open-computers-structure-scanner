local filesystem = require("filesystem")
local component = require("component")
local isfolder = filesystem.isDirectory
local mkdir = filesystem.makeDirectory
_blockid = ""
_nbtroot = {}
_hasnbt = false
_uistate = ""
if isfolder("/hpbuild/structures") == false then mkdir("/hpbuild/structures") end
if isfolder("/hpbuild/inventory_handlers") == false then mkdir("/hpbuild/inventory_handlers") end
if isfolder("/hpbuild/compressed") == false then mkdir("/hpbuild/compressed") end
if isfolder("/hpbuild/core") == false then mkdir("/hpbuild/core") end
os.execute("wget -fq https://raw.githubusercontent.com/hpf3/open-computers-structure-scanner/master/inventory%20managers/vanilla.lua /hpbuild/inventory_handlers/vanilla.lua")
os.execute("wget -fq https://raw.githubusercontent.com/hpf3/open-computers-structure-scanner/master/modifiedpackage.lua /lib/package.lua")
os.execute("wget -fq https://raw.githubusercontent.com/hpf3/open-computers-structure-scanner/master/autorun.lua /autorun.lua")
os.execute("wget -fq https://raw.githubusercontent.com/hpf3/open-computers-structure-scanner/master/structuresave.lua /hpbuild/core/save.lua")