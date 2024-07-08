return function(v0, v1, v2, v3)
    assert(type(v1) == "string", "Expected eventContext to be a string");
    assert(type(v2) == "string", "Expected actionType to be a string");
    v0:setRBXEventStream(v1, "modalAction", {
        aType = v2, 
        origin = v3
    });
end;
