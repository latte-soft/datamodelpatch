return function(v0, v1, v2, v3, v4)
    assert(type(v1) == "string", "Expected eventContext to be a string");
    assert(type(v2) == "string", "Expected state to be a string");
    assert(type(v3) == "table", "Expected suggestions to be a table");
    assert(type(v4) == "string", "Expected suggestion to be a string");
    v0:sendEventDeferred(v1, "usernameSuggestionShown", {
        state = v2, 
        suggestions = ("[%*]"):format((table.concat(v3, ","))), 
        field = v4
    });
end;
