local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Action);
local v2 = require(l_Modules_0.LuaApp.ArgCheck);
return v1(script.Name, function(v3, v4, v5, v6)
    v2.isNonNegativeNumber(v3, "SetGlobalContextMenuInset: left");
    v2.isNonNegativeNumber(v4, "SetGlobalContextMenuInset: top");
    v2.isNonNegativeNumber(v5, "SetGlobalContextMenuInset: right");
    v2.isNonNegativeNumber(v6, "SetGlobalContextMenuInset: bottom");
    return {
        left = v3, 
        top = v4, 
        right = v5, 
        bottom = v6
    };
end);
