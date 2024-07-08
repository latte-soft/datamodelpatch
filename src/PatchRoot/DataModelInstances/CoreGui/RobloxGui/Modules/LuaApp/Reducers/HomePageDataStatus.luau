local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Actions.SetHomePageDataStatus);
local v2 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
return function(v3, v4)
    v3 = v3 or v2.NotStarted;
    if v4.type == v1.name then
        v3 = v4.status;
    end;
    return v3;
end;
