local l_useSelector_0 = require(script:FindFirstAncestor("RobloxAppHooks").Parent.RoactUtils).Hooks.RoactRodux.useSelector;
return function()
    return l_useSelector_0(function(v1)
        if v1.TopBar then
            if not v1.TopBar.topBarHeight then
                return 0;
            else
                return v1.TopBar.topBarHeight;
            end;
        else
            return 0;
        end;
    end);
end;
