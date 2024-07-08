local l_Players_0 = game:GetService("Players");
return function(v1, v2, v3, v4, v5, v6, v7)
    assert(type(v2) == "string", "Expected buttonName to be a string");
    assert(type(v3) == "string", "Expected friendId to be a string");
    assert(type(v4) == "number", "Expected position to be a number");
    local v8 = true;
    if v5 ~= nil then
        v8 = type(v5) == "string";
    end;
    assert(v8, "Expected context to be nil or string");
    assert(type(v6) == "number", "Expected absolutePosition to be a number");
    v8 = true;
    if v7 ~= nil then
        v8 = type(v7) == "table";
    end;
    assert(v8, "Expected extraArgs to be nil or table");
    v1:setRBXEventStream(v5 or "contactFriendFinder", "buttonClick", {
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        friendId = v3, 
        position = v4, 
        btn = v2, 
        absolutePosition = v6, 
        universeId = if not v7 then nil else v7.universeId, 
        source = if not v7 then nil else v7.source
    });
end;
