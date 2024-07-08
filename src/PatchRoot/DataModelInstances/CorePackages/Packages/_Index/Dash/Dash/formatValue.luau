local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.assertEqual);
return function(v2, v3)
    v3 = v3 or "";
    v1(typeof(v3), "string", "Attempted to call Dash.formatValue with argument #2 of type {left:?} not {right:?}");
    local v4, v5 = v3:find("[A-Za-z#?]+");
    if not v4 then
        local v6 = "s";
        if type(v2) == "number" then
            local _, v8 = math.modf(v2);
            v6 = v8 == 0 and "d" or "f";
        end;
        return ("%" .. v3 .. v6):format((tostring(v2)));
    else
        local v9 = v3:sub(v4, v5);
        local v10 = "%" .. v3:sub(1, v4 - 1) .. v3:sub(v5 + 1) .. "s";
        local v11 = require(l_Parent_0.pretty);
        if v9 == "#?" then
            return v10:format(v11(v2, {
                multiline = true
            }));
        elseif v9 == "?" then
            return v10:format(v11(v2));
        else
            return ("%" .. v3):format(v2);
        end;
    end;
end;
