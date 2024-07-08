local l_Parent_0 = script:FindFirstAncestor("UserLib").Parent;
local l_makeActionCreator_0 = require(l_Parent_0.Rodux).makeActionCreator;
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
return l_makeActionCreator_0(script.Name, function(v3, v4, v5, v6, v7, v8, v9, v10, v11)
    local v12 = 0;
    if v9 ~= nil then
        local v13 = l_DateTime_0.fromIsoDate(v9);
        if v13 ~= nil then
            v12 = v13:GetUnixTimestamp();
        end;
    end;
    return {
        userId = v3, 
        presence = v4, 
        lastLocation = v5, 
        placeId = v6, 
        rootPlaceId = v7, 
        gameInstanceId = v8, 
        lastOnline = v12, 
        universeId = v10, 
        previousUniverseId = v11
    };
end);
