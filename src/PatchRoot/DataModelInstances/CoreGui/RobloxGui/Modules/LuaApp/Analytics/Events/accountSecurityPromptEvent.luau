return function(v0, v1, v2, v3)
    assert(type(v2) == "string", "expected promptType to be a string");
    assert(type(v3) == "string", "expected modalState to be a string");
    v0:setRBXEventStream(v1, "accountSecurityPromptEvent", {
        promptType = v2, 
        state = v3
    });
end;
