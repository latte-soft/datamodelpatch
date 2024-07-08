local v0 = require(script:FindFirstAncestor("AppChat").Parent.ArgCheck);
return function(v1, ...)
    v0.isType(v1, "table", "isKeyCodePressed.pressedKeys");
    local v2 = {
        ...
    };
    for _, v4 in ipairs(v1) do
        for _, v6 in ipairs(v2) do
            if v4.KeyCode == v6 then
                return true;
            end;
        end;
    end;
    return false;
end;
