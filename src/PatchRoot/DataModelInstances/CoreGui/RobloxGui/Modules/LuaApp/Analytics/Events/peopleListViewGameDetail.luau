local l_Players_0 = game:GetService("Players");
return function(v1, v2, v3, v4, v5, v6)
    assert(type(v2) == "string", "Expected friendId to be a string");
    assert(type(v3) == "number", "Expected position to be a number");
    assert(type(v5) == "number", "Expected number to be a string");
    assert(type(v6) == "string", "Expected fromWhere to be a string");
    assert(type(v4) == "number", "Expected absolutePosition to be a number");
    v1:setRBXEventStream("contactFriendFinder", "goToGameDetailInPeopleList", {
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        friendId = v2, 
        position = v3, 
        absolutePosition = v4, 
        rootPlaceId = v5, 
        fromWhere = v6
    });
end;
