local v0 = require(script.Parent.Parent.None);
local v1 = require(script.Parent.copyDeep);
local function v2(...)
    local v3 = {};
    local v4 = 1;
    for v5 = 1, select("#", ...) do
        local v6 = select(v5, ...);
        if v6 then
            for v7 = 1, #v6 do
                if type(v6[v7]) == "table" then
                    if v3[v4] ~= nil and not type(v3[v4] ~= "table") then
                        v3[v4] = v2(v3[v4], v6[v7]);
                    else
                        v3[v4] = v1(v6[v7]);
                    end;
                elseif v6[v7] ~= v0 then
                    v3[v4] = v6[v7];
                end;
                v4 = v4 + 1;
            end;
        end;
    end;
    return v3;
end;
return v2;
