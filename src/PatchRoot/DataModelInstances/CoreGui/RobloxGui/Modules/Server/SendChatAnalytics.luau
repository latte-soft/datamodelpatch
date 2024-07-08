local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
return function(v1, v2)
    if not v2 then
        v2 = {};
    end;
    assert(v2 ~= nil, "eventTable must not be nil");
    v2.gameId = tostring(game.GameId);
    v2.placeId = tostring(game.PlaceId);
    l_RbxAnalyticsService_0:SendEventDeferred("rcc", "lua_chat_system", v1, v2);
end;
