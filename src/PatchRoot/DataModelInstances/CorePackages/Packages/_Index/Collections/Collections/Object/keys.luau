local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_0.Parent.Parent;
local v3 = require(l_Parent_1.Set);
local _ = require(l_Parent_2.ES7Types);
local v5 = require(l_Parent_2.InstanceOf);
return function(v6)
    if v6 == nil then
        error("cannot extract keys from a nil value");
    end;
    local v7 = typeof(v6);
    local v8 = nil;
    if v7 == "table" then
        v8 = {};
        if not v5(v6, v3) then
            for v9 in pairs(v6) do
                table.insert(v8, v9);
            end;
            return v8;
        else
            return v8;
        end;
    else
        if v7 == "string" then
            local v10 = v6:len();
            v8 = table.create(v10);
            for v11 = 1, v10 do
                v8[v11] = tostring(v11);
            end;
        end;
        return v8;
    end;
end;
