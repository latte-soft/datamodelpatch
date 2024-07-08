local l_EnableOptionalPlaceIdForUserIdGameJoins_0 = require(script:FindFirstAncestor("ExperienceService").Parent.SharedFlags).EnableOptionalPlaceIdForUserIdGameJoins;
local _ = require(script.Parent.GameProtocolTypes);
local v2 = {
    new = function()
        return {
            referralPage = "LuaChat"
        };
    end
};
v2.fromPlaceId = function(v3)
    local v4 = v2.new();
    v4.placeId = v3;
    return v4;
end;
v2.fromUserId = function(v5, v6)
    local v7 = v2.new();
    v7.userId = v5;
    if l_EnableOptionalPlaceIdForUserIdGameJoins_0() then
        v7.placeId = v6;
    end;
    return v7;
end;
v2.fromPlaceInstance = function(v8, v9)
    local v10 = v2.new();
    v10.placeId = v8;
    v10.gameInstanceId = v9;
    return v10;
end;
v2.fromConversationId = function(v11, v12)
    local v13 = v2.new();
    v13.placeId = v11;
    v13.conversationId = v12;
    return v13;
end;
v2.fromParams = function(v14)
    local v15 = v2.new();
    for v16, v17 in pairs(v14) do
        v15[v16] = v17;
    end;
    return v15;
end;
return v2;
