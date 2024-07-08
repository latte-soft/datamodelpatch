local v0 = require(script.Parent.Error);
local function v4(v1)
    if typeof(v1) == "string" then
        local _, v3 = v1:find(":[%d]+: ");
        return v0.new(if not v3 then v1 else v1:sub(v3 + 1), 1);
    else
        return v1;
    end;
end;
return function(v5, ...)
    return xpcall(v5, v4, ...);
end;
