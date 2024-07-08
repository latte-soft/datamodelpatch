local v0 = require(script.Parent.Parent.Object.None);
local function v3(v1, v2)
    return type(v1) .. tostring(v1) < type(v2) .. tostring(v2);
end;
return function(v4, v5)
    local l_v3_0 = v3;
    if v5 ~= nil and v5 ~= v0 then
        if typeof(v5) ~= "function" then
            error("invalid argument to Array.sort: compareFunction must be a function");
        end;
        l_v3_0 = function(v7, v8)
            local v9 = v5(v7, v8);
            if typeof(v9) ~= "number" then
                error(("invalid result from compare function, expected number but got %s"):format((typeof(v9))));
            end;
            return v9 < 0;
        end;
    end;
    table.sort(v4, l_v3_0);
    return v4;
end;
