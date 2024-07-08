return function(v0, v1, v2, v3, v4)
    assert(type(v1) == "string", "Expected context to be a string");
    assert(type(v2) == "string", "Expected name to be a string");
    assert(type(v3) == "string", "Expected oldValue to be a string");
    assert(type(v4) == "string", "Expected newValue to be a string");
    v0:setRBXEventStream(v1, "changeAccessibilitySetting", {
        name = v2, 
        oldValue = v3, 
        newValue = v4
    });
end;
