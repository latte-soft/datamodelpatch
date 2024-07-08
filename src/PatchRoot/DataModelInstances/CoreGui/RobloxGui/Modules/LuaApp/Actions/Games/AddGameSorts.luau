local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Action);
local _ = require(l_Modules_0.LuaApp.Models.GameSort);
return v1(script.Name, function(v3)
    return {
        sorts = v3
    };
end);
