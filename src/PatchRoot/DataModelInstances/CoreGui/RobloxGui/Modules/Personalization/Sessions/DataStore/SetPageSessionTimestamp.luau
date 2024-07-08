local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local v2 = require(l_Modules_0.Common.Action);
local v3 = require(l_Modules_0.LuaApp.mutedError);
return v2(script.Name, function(v4)
    if v1[v4] == nil then
        v3("SetPageSessionTimestamp action expects page to be a valid page type, %s is not in AppPage", v4);
    end;
    return {
        page = v4, 
        timestamp = tick()
    };
end);
