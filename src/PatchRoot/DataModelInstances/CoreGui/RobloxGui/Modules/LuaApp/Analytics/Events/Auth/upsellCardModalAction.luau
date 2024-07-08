return function(v0, v1, v2, v3, v4, v5, v6)
    assert(type(v1) == "string", "Expected eventContext to be a string");
    assert(type(v3) == "string", "Expected actionType to be a string");
    v0:setRBXEventStream(v1, "modalAction", {
        aType = v3, 
        origin = v4, 
        section = v5, 
        errorCode = v6, 
        field = v2
    });
end;
