return function(v0, v1, v2, v3, v4)
    assert(type(v1) == "string", "Expected eventContext to be a string");
    assert(type(v2) == "string", "Expected buttonName to be a string");
    assert(type(v3) == "string", "Expected userField to be a string");
    assert(type(v4) == "string", "Expected suggestion to be a string");
    v0:setRBXEventStream(v1, "buttonClick", {
        btn = v2, 
        userField = v3, 
        suggestion = v4
    });
end;
