local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Set);
local v2 = require(l_Parent_0.instanceof);
return function(v3)
    if v3 == nil then
        error("cannot extract keys from a nil value");
    end;
    local v4 = typeof(v3);
    local v5 = {};
    if v4 == "table" then
        if not v2(v3, v1) then
            for v6 in pairs(v3) do
                table.insert(v5, v6);
            end;
            return v5;
        else
            return v5;
        end;
    else
        if v4 == "string" then
            local v7 = v3:len();
            v5 = table.create(v7);
            for v8 = 1, v7 do
                v5[v8] = tostring(v8);
            end;
        end;
        return v5;
    end;
end;
