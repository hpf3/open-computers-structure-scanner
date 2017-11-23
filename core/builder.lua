local component = require("component")
local filesystem = require('filesystem')
local serial = require('serialization')
local text = require('text')
local admin = component.debug
local world = admin.getPlayer("hpf3").getWorld()

local builder = {}

function builder.extractNBT(path)
local file = io.open(path,"r")
local nbt = {}
local id = ""
local all = {}
local x,y,z = 0,0,0
local dat = serial.unserialize(file:read("*l"))
while dat ~= nil do
id = dat.value.id.value
x = dat.value.x.value
y = dat.value.y.value
z = dat.value.z.value
dat.value.id = nil
dat.value.x = nil
dat.value.y = nil
dat.value.z = nil
local block = {}
block.id = id
block.x = x
block.y = y
block.z = z
block.dat = dat
all = table.pack(table.unpack(all),block)
dat = serial.unserialize(file:read("*l"))
end
return all
end

function builder.normal(name)
local info = io.open(tostring('/hpbuild/structures/' .. name .. '/info.lua'))
local line{"ice","cream"}
while line ~= nil do
line = text.tokenize(info:read(*l))
if line[1] == "x" then
_endx = _startx + line[2]
elseif line[1] == "y" then
_endy = _starty + line[2]
elseif line[1] == "z" then
_endz = _startz + line[2]
end
end
local x = _startx
local y = _starty
local z = _startz
local file = io.open(tostring('/hpbuild/structures/' .. name .. '/main.lua'))
local struct = text.tokenize(file:read(*a))
for i = 0,#struct,2 do
 world.setBlock(x,y,z,struct[i],struct[i + 1])
 x = x + 1
 if x > _endx then
  z = z + 1
  x = _startx
 elseif  x > _endx then
  y = y + 1
  z = _startz
 end
end
end
return builder
