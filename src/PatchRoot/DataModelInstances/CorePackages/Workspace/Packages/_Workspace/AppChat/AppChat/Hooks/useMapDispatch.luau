local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v2 = require(l_Parent_0.React);
return function(v3)
    local v4 = l_useDispatch_0();
    return v2.useMemo(function()
        return v3(v4);
    end, {
        v4, 
        v3
    });
end;
