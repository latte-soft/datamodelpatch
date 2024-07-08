local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.assertEqual);
return function(v3, v4)
    v2(typeof(v3), "table", "Attempted to call Dash.includes with argument #1 of type {left:?} not {right:?}");
    if v4 == nil then
        return false;
    else
        for _, v6 in pairs(v3) do
            if v6 == v4 then
                return true;
            end;
        end;
        return false;
    end;
end;
