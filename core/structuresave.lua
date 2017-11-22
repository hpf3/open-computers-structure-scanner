local files = require('filesystem')
local text = require('text')
local serial = require('serialization')
local save = {}
_savever = 1.0



local function nbtsave(dat,name)
dat.value.x.value = dat.value.x.value - _startx
dat.value.y.value = dat.value.y.value - _starty
dat.value.z.value = dat.value.z.value - _startz
local nbtfiles = io.open(tostring('/hpbuild/structures/' .. name .. '/nbtbasic/nbtbasic.lua'),"a")
nbtfiles:write(tostring(serial.serialize(dat) .. "\n"))
nbtfiles:close()
end








function save.basic(block,name)
local id,meta,nbt,nbtdat = table.unpack(block)
if files.isDirectory(tostring('/hpbuild/structures/' .. name)) == false then
files.makeDirectory(tostring('/hpbuild/structures/' .. name .. '/nbtbasic'))
end
local file = io.open(tostring('/hpbuild/structures/' .. name .. '/main.lua'),"a")
file:write(tostring(id .. " " .. meta .. " "))
file:close()
if nbt then nbtsave(nbtdat,name) end
end

return save