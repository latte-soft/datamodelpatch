local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Parent.React);
local v3 = require(l_Parent_1.Core.Control.Enum.ControlState);
local v4 = require(l_Parent_0.Control.Hooks.useGuiControlState);
return function(v5, v6, v7)
    local v8, v9 = v2.useBinding(v3.Initialize);
    local v12, _ = v4(v5, v2.useCallback(function(v10, v11)
        v9((tostring(v11)));
        if v6 then
            v6(v10, v11);
        end;
    end, {}), v7);
    return v12, v8;
end;
