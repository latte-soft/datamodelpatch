local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.ArgCheck);
return require(l_Modules_0.Common.Action)(script.Name, function(v2)
    v1.isType(v2, "table", "SetNativeRobuxProducts: nativeRobuxProducts");
    return {
        nativeRobuxProducts = v2
    };
end);
