return function(v0, v1, v2, v3, v4, v5)
    assert(type(v1) == "string", "Expected eventContext to be a string");
    assert(type(v2) == "string", "Expected field to be a string");
    assert(type(v3) == "string", "Expected actionType to be a string");
    if v4 ~= nil then
        assert(type(v4) == "string", "Expected origin to be a string");
    end;
    if v5 ~= nil then
        assert(type(v5) == "string", "Expected btn to be a string");
    end;
    v0:setRBXEventStream(v1, "formInteraction", {
        field = v2, 
        aType = v3, 
        origin = v4, 
        btn = v5
    });
end;
