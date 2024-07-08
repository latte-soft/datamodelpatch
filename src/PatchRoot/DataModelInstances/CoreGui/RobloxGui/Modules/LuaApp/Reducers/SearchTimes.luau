local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Cryo);
local v2 = require(l_Modules_0.LuaApp.Actions.SetSearchTime);
return function(v3, v4)
    v3 = v3 or {};
    if v4.type == v2.name then
        v3 = v1.Dictionary.join(v3, {
            [v4.searchUuid] = v4.searchTime
        });
    end;
    return v3;
end;
