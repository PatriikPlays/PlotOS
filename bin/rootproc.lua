
local args = ...
local cmd = args[2]
local fs = require("fs")
local process = require("process")
table.remove(args,1)
local proc = nil

if fs.exists("/bin/"..cmd..".lua") then
    proc = process.load(cmd, "/bin/"..cmd..".lua",nil,true,args)


else
    if fs.exists(os.currentDirectory..cmd) then
        --dofile(os.currentDirectory..cmd)
        proc = process.load(cmd,os.currentDirectory..cmd,nil,true,args)
    else
        print("The specified file does not exist")
    end
end

