local v0 = require(script:FindFirstAncestor("AppChat").Parent.ArgCheck);
return function(v1, v2)
    v0.isType(v1, "string", "patternMatcher.string");
    v0.isType(v2, "string", "patternMatcher.pattern");
    local v3, v4 = v1:lower():find(v2);
    if v3 then
        return true, {
            prefix = v1:sub(1, v3 - 1), 
            suffix = v1:sub(v4 + 1)
        };
    else
        return false, nil;
    end;
end;
