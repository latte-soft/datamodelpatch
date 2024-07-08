local l_Players_0 = game:GetService("Players");
return function(v1, v2, v3, v4, v5, v6, v7)
    assert(type(v2) == "string", "Expected playerId to be a string");
    assert(type(v3) == "string", "Expected placeId to be a string");
    assert(type(v4) == "number", "Expected rootPlaceId to be a number");
    if v5 then
        assert(type(v5) == "string", "Expected gameInstanceId to be a string");
    end;
    if v6 then
        assert(type(v6) == "string", "Expected joinAttemptId to be a string");
    end;
    if v7 then
        assert(type(v7) == "string", "Expected source to be a string");
    end;
    v1:setRBXEventStream("PlacesList", "joinGameInPlacesList", {
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        playerId = v2, 
        placeId = v3, 
        rootPlaceId = v4, 
        gameInstanceId = v5, 
        joinAttemptJoinId = v6, 
        source = v7
    });
end;
