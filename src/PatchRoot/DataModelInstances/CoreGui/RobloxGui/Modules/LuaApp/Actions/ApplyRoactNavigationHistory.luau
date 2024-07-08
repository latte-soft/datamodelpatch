local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Action);
local v2 = require(l_Modules_0.LuaApp.ArgCheck);
return v1(script.Name, function(v3)
    return {
        navigationState = v2.isTypeOrNil(v3, "table", "navigationState")
    };
end);
