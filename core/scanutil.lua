local component = require('component')
local admin = component.debug
admin.connectToBlock(admin.getX(),admin.getY(),admin.getZ())
local world = admin.getWorld()
local filesystem = require('filesystem')
local save = require("save")
_scanver = 1.0
local scanutil = {}

function scanutil.single(x,y,z)
print("scanning block at " .. x,y,z)
 local id = world.getBlockId(x,y,z)
 local meta = world.getMetadata(x,y,z)
 local nbtdat = {}
 if world.hasTileEntity(x,y,z) then
  _nbtroot = world.getTileNBT(x,y,z)
  nbtdat = world.getTileNBT(x,y,z)
 end
 local nbt = world.hasTileEntity(x,y,z)
 local block = {}
 block.id,block.meta,block.nbt,block.nbtdat = id,meta,nbt,nbtdat
 return block
end

function scanutil.area(x1,y1,z1,x2,y2,z2,name)
filesystem.remove(tostring('/hpbuild/structures/' .. name))
if x1 <= x2 then _startx = x1 elseif x2 <= x1 then _startx = x2 end
if y1 <= y2 then _starty = y1 elseif y2 <= y1 then _starty = y2 end
if z1 <= z2 then _startz = z1 elseif z2 <= z1 then _startz = z2 end
if x1 >= x2 then _endx = x1 elseif x2 >= x1 then _endx = x2 end
if y1 >= y2 then _endy = y1 elseif y2 >= y1 then _endy = y2 end
if z1 >= z2 then _endz = z1 elseif z2 >= z1 then _endz = z2 end
local x = _startx
local y = _starty
local z = _startz
print("starting scan")
while y <= _endy do
 z = _startz
 while z <= _endz do
  x = _startx
  while x <= _endx do
   local block = scanutil.single(x,y,z)
   save.basic(block,name)
   x = x + 1
  end
  z = z + 1
 end
 y = y + 1
end
os.sleep(1)
local path = tostring('/hpbuild/structures/' .. name .. '/info.lua')
print(path)
os.sleep(3)
local file = io.open(path,"w")
print(file)
file:write(tostring(name .. '\n' .. 'x ' .. _endx - _startx .. '\n' .. 'y ' .. _endy - _starty .. '\n' .. 'z ' .. _endz - _startz .. '\n' .. 'setup ' .. _setupver .. '\n' .. 'save ' .. _savever .. '\n' .. 'scan ' .. _scanver))
file:close()
end

return scanutil
