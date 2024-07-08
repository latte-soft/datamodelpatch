local v0 = require(script.Parent.symbols);
local function v1(v2, v3)
    local v4 = getmetatable(v2);
    v4[v0.Calls] = {};
    for _, v6 in pairs(v4[v0.Children]) do
        if not v3[v6] then
            v3[v6] = true;
            v1(v6, v3);
        end;
    end;
end;
return function(v7)
    v1(v7, {});
end;
