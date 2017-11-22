local file = require('filesystem')
local text = require('text')
local serial = require('serialization')
local save = {}
_savever = 1.0



local function nbtsave(dat,name)
dat.value.x.value = dat.value.x.value - _startx
dat.value.y.value = dat.value.y.value - _starty
dat.value.z.value = dat.value.z.value - _startz
local nbtfile = io.open(tostring('/hpbuild/structures/' .. name .. '/nbtbasic/nbtbasic.lua'),"a")
nbtfile:write(tostring(serial.serialize(dat) .. "\n"))
nbtfile:close()
end








function save.basic(block,name)
local id,meta,nbt,nbtdat = table.unpack(block)
if file.isDirectory(tostring('/hpbuild/structures/' .. name)) == false then
file.makeDirectory(tostring('/hpbuild/structures/' .. name .. '/nbtbasic'))
end
local build = io.open(tostring('/hpbuild/structures/' .. name .. '/main.lua'),"a")
build:write(tostring(id .. " " .. meta .. " "))
build:close()
if nbt then nbtsave(nbtdat,name) end
end

return save