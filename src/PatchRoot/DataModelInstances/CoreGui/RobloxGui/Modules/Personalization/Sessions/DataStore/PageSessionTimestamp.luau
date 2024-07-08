local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Cryo);
local v2 = require(l_Modules_0.Personalization.Sessions.DataStore.SetPageSessionTimestamp);
local _ = require(l_Modules_0.Personalization.DataStoreTypes);
return function(v4, v5)
    v4 = v4 or {};
    if v5.type == v2.name then
        v4 = v1.Dictionary.join(v4, {
            [v5.page] = v5.timestamp
        });
    end;
    return v4;
end;
