local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.AccountSecurity.addRawValueMethodToEnum);
local v2 = require(l_CorePackages_0.enumerate);
local v3 = {
    None = "None", 
    Apple = "Apple", 
    Google = "Google", 
    Amazon = "Amazon", 
    Xbox = "Xbox", 
    UWP = "UWP", 
    Web = "Web", 
    Maquettes = "Maquettes", 
    Palisades = "Palisades"
};
local v4 = v2(script.Name, v3);
v1(v4, v3);
return v4;
