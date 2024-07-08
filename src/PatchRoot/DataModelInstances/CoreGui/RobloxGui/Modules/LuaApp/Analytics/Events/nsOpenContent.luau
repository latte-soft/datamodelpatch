return function(v0, v1, v2)
    assert(type(v1) == "string", "Expected eventContext to be a string");
    assert(type(v2) == "number", "Expected countOfUnreadNotifications to be a number");
    v0:setRBXEventStream(v1, "nsOpenContent", {
        property = v2
    });
end;
