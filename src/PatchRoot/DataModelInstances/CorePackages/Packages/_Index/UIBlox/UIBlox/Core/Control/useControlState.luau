local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Parent.React);
local v2 = require(l_Parent_0.Control.Enum.ControlState);
return function()
    local v3, v4 = v1.useState(v2.Initialize);
    return v3, (v1.useCallback(function(_, v6)
        v4(v6);
    end, {}));
end;
