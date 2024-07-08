local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local l_mockableWarn_0 = require(l_Parent_0.FocusNavigationUtils).mockableWarn;
local v3 = require(script.Parent.FocusNavigationContext);
return function()
    local v4 = v1.useContext(v3);
    return v1.useCallback(function(v5, v6)
        if not v4 then
            if _G.__DEV__ then
                l_mockableWarn_0("Could not capture focus with no FocusNavigationService.\n\n" .. "Introduce a ReactFocusNavigation.FocusNavigationProvider " .. "above this component in the tree and provide it with a " .. "value returned from FocusNavigationService.new(...)");
            end;
            return ;
        else
            v4:focusGuiObject(v5, not not v6);
            return ;
        end;
    end, {
        v4
    });
end;
