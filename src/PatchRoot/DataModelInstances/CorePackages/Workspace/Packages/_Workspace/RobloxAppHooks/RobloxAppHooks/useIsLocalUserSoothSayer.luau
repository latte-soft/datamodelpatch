local l_useSelector_0 = require(script:FindFirstAncestor("RobloxAppHooks").Parent.RoactUtils).Hooks.RoactRodux.useSelector;
return function()
    return l_useSelector_0(function(v1)
        return v1.IsLocalUserSoothsayer;
    end);
end;
