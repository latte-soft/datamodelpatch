local v0 = require(script.Parent.symbols);
return function(v1)
    local v2 = getmetatable(v1);
    if not v2 then
        return false;
    else
        return v2[v0.isMagicMock] ~= nil;
    end;
end;
