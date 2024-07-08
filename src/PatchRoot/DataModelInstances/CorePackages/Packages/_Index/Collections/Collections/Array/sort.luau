local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Object.None);
local _ = require(l_Parent_1.ES7Types);
local function v6(v4, v5)
    return type(v4) .. tostring(v4) < type(v5) .. tostring(v5);
end;
return function(v7, v8)
    local l_v6_0 = v6;
    if v8 ~= nil and v8 ~= v2 then
        if typeof(v8) ~= "function" then
            error("invalid argument to Array.sort: compareFunction must be a function");
        end;
        l_v6_0 = function(v10, v11)
            local v12 = v8(v10, v11);
            if typeof(v12) ~= "number" then
                error(("invalid result from compare function, expected number but got %s"):format((typeof(v12))));
            end;
            return v12 < 0;
        end;
    end;
    table.sort(v7, l_v6_0);
    return v7;
end;
