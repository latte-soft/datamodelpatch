local v0 = require(script:FindFirstAncestor("AppChat").Parent.ArgCheck);
return function(v1, v2, v3)
    v0.isType(v1, "table", "addMessage.messages");
    v0.isType(v2, "string", "addMessage.value");
    if v2 == "" then
        return v1;
    else
        table.insert(v1, not not v3 and {
            placeId = v2
        } or {
            content = v2
        });
        return v1;
    end;
end;
