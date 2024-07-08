local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.Personalization.Games.Discovery.SetDiscoveryNextPageId);
return function(v1, v2)
    local v3 = v1 or "";
    if v2.type == v0.name then
        v3 = v2.nextPageId;
    end;
    return v3;
end;
