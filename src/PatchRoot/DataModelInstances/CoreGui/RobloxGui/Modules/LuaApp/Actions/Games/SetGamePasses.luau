local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Action);
local v2 = require(l_Modules_0.LuaApp.ArgCheck);
return v1(script.Name, function(v3, v4)
    v2.isType(v3, "string", "universeId");
    v2.isType(v4, "table", "passes");
    return {
        universeId = v3, 
        passes = v4
    };
end);
