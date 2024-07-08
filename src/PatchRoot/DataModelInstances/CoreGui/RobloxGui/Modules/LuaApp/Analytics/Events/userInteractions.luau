return function(v0, v1)
    assert(type(v1) == "string", "Expected eventContext to be a string");
    v0:setRBXEventStream(v1, "userInteractions", nil);
end;
