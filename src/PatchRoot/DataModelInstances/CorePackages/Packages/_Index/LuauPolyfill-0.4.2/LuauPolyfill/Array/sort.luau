local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Object.None);
local _ = require(l_Parent_0.types);
local function v5(v3, v4)
    return type(v3) .. tostring(v3) < type(v4) .. tostring(v4);
end;
return function(v6, v7)
    local l_v5_0 = v5;
    if v7 ~= nil and v7 ~= v1 then
        if typeof(v7) ~= "function" then
            error("invalid argument to Array.sort: compareFunction must be a function");
        end;
        l_v5_0 = function(v9, v10)
            local v11 = v7(v9, v10);
            if typeof(v11) ~= "number" then
                error(("invalid result from compare function, expected number but got %s"):format((typeof(v11))));
            end;
            return v11 < 0;
        end;
    end;
    table.sort(v6, l_v5_0);
    return v6;
end;
