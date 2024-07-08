local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Cryo);
local v2 = require(l_Modules_0.LuaApp.Actions.Games.SetOmniRecommendationsMetadataRequestStatus);
return function(v3, v4)
    v3 = v3 or {};
    if v4.type == v2.name then
        local v5 = {};
        for v6, v7 in pairs(v4.contentIds) do
            v5[v6] = v1.Dictionary.join(v3[v6] or {}, v7);
        end;
        v3 = v1.Dictionary.join(v3, v5);
    end;
    return v3;
end;
