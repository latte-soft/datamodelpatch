local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.RoactInspector.Utils.getSymbol);
local l_startsWith_0 = require(l_Parent_1.Dash).startsWith;
return function(v4, v5)
    if v4 == nil then
        return nil;
    else
        local v6 = v4[v5];
        if v6 == nil and typeof(v5) == "number" then
            v6 = v4[tostring(v5)];
        end;
        if not (not (v6 == nil and typeof(v5) == "string") or not l_startsWith_0(v5, "Symbol(")) then
            v6 = v2(v4, (v5:sub(8, -2)));
        end;
        return v6;
    end;
end;
