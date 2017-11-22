local component = require("component")
local filesystem = require('filesystem')
local serial = require('serialization')
local text = require('text')
local admin = component.debug

local build = {}

function build.extractNBT(path)
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
local block.id = id
local block.x = x
local block.y = y
local block.z = z
local block.dat = dat
all = table.pack(table.unpack(all),block)
dat = serial.unserialize(file:read("*l"))
end
return all
end

function build.normal(name,x,y,z)
local file = io.open(tostring('/hpbuild/structures/' .. name .. '/main.lua')
local struct = text.tokenize(file:read(*a))
for i = 0,#struct,2 do
 



