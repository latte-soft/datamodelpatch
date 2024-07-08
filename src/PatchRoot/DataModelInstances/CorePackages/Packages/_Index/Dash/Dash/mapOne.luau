local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.assertEqual);
return function(v3, v4)
    v2(typeof(v3), "table", "Attempted to call Dash.mapOne with argument #1 of type {left:?} not {right:?}");
    for v5, v6 in pairs(v3) do
        local v7 = nil;
        v7 = if not v4 then v6 else v4(v6, v5);
        if v7 ~= nil then
            return v7;
        end;
    end;
end;
