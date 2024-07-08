local v0 = require(script.Parent.Parent.None);
local v1 = require(script.Parent.copyDeep);
local function v2(...)
    local v3 = {};
    for v4 = 1, select("#", ...) do
        local v5 = select(v4, ...);
        if v5 then
            for v6, v7 in pairs(v5) do
                if v7 == v0 then
                    v3[v6] = nil;
                elseif type(v7) == "table" then
                    if v3[v6] ~= nil and not type(v3[v6] ~= "table") then
                        v3[v6] = v2(v3[v6], v7);
                    else
                        v3[v6] = v1(v7);
                    end;
                else
                    v3[v6] = v7;
                end;
            end;
        end;
    end;
    return v3;
end;
return v2;
