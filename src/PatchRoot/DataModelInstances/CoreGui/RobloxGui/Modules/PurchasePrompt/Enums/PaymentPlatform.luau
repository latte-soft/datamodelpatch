local l_Parent_0 = script.Parent.Parent;
local l_enumerate_0 = require(game:GetService("CorePackages").PurchasePromptDeps).enumerate;
local v2 = require(l_Parent_0.Utils.addRawValueMethodToEnum);
local v3 = {
    None = "None", 
    Apple = "Apple", 
    Google = "Google", 
    Amazon = "Amazon", 
    Xbox = "Xbox", 
    UWP = "UWP", 
    Midas = "Midas", 
    Web = "Web", 
    Maquettes = "Maquettes", 
    Palisades = "Palisades"
};
local v4 = l_enumerate_0(script.Name, v3);
v2(v4, v3);
return v4;
