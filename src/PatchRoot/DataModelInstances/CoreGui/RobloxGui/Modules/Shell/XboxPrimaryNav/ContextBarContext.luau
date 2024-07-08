local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Shell_0 = l_CoreGui_0:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_Shell_0.XboxPrimaryNav:FindFirstChild("CreateContextBarContext"))();
return {
    LuaContext = v4, 
    RoactContext = v3.createContext(v4)
};
