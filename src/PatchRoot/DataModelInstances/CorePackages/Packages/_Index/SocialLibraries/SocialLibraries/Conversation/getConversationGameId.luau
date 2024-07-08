local l_UserModel_0 = require(script:FindFirstAncestor("SocialLibraries").dependencies).UserModel;
return function(v1, v2, v3)
    if not v1.pinnedGame or not v1.pinnedGame.universeId then
        local v4 = {};
        local l_pairs_0 = pairs;
        local v6 = v1.participants or {};
        for _, v8 in l_pairs_0(v6) do
            local v9 = v3[v8];
            if not (not ((v9 ~= nil and v8 ~= v2) and v9.presence == l_UserModel_0.PresenceType.IN_GAME) or not v9.rootPlaceId) then
                v4[v9.rootPlaceId] = v4[v9.rootPlaceId] or 0;
                v4[v9.rootPlaceId] = v4[v9.rootPlaceId] + 1;
            end;
        end;
        l_pairs_0 = nil;
        v6 = 0;
        for v10, v11 in pairs(v4) do
            if v6 < v11 then
                l_pairs_0 = v10;
                v6 = v11;
            end;
        end;
        return not not l_pairs_0 and tostring(l_pairs_0) or nil;
    else
        return (tostring(v1.pinnedGame.universeId));
    end;
end;
