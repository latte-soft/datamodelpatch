return function(v0, v1, v2, v3)
    assert(type(v1) == "string", "Expected eventContext to be a string");
    assert(type(v2) == "string", "Expected field to be a string");
    assert(type(v3) == "string", "Expected errorText to be a string");
    v0:setRBXEventStream(v1, "formFieldValidation", {
        field = v2, 
        error = v3
    });
end;
