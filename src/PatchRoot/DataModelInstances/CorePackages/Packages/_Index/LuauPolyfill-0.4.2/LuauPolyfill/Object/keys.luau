local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Set);
local v2 = require(l_Parent_0.instanceof);
local _ = require(l_Parent_0.types);
return function(v4)
    if v4 == nil then
        error("cannot extract keys from a nil value");
    end;
    local v5 = typeof(v4);
    local v6 = nil;
    if v5 == "table" then
        v6 = {};
        if not v2(v4, v1) then
            for v7 in pairs(v4) do
                table.insert(v6, v7);
            end;
            return v6;
        else
            return v6;
        end;
    else
        if v5 == "string" then
            local v8 = v4:len();
            v6 = table.create(v8);
            for v9 = 1, v8 do
                v6[v9] = tostring(v9);
            end;
        end;
        return v6;
    end;
end;
