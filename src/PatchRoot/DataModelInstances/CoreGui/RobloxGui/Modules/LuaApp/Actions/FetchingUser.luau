local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Action);
local v2 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
return v1(script.Name, function(v3)
    return {
        userId = v3, 
        status = v2.Fetching
    };
end);
