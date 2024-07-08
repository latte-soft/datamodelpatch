local l_Parent_0 = script:FindFirstAncestor("TenFootUiGlobalNav").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactOtter);
local l_FocusNavigationContext_0 = require(l_Parent_0.ReactFocusNavigation).FocusNavigationContext;
local l_useDescendantHasFocus_0 = require(l_Parent_0.FocusNavigationUtils).useDescendantHasFocus;
local v5 = {
    stiffness = 711.1, 
    damping = 40, 
    mass = 1
};
return function(v6)
    local v7, v8 = v1.useState(v6);
    local v9 = v1.useContext(l_FocusNavigationContext_0);
    local v10 = v1.useRef(nil);
    local v11 = l_useDescendantHasFocus_0(v10.current);
    local v13, v14 = v2.useAnimatedBinding(not v7 and 1 or 0, function(v12)
        if v12 == 1 then
            v8(false);
        end;
    end);
    v1.useEffect(function()
        if not v6 then
            v14(v2.spring(1, v5));
            return ;
        else
            v8(true);
            v14(v2.spring(0, v5));
            return ;
        end;
    end, {
        v6
    });
    v1.useEffect(function()
        if not ((not v9 or v6) or not v11) then
            v9:focusGuiObject(nil, true);
        end;
    end, {
        v6, 
        v11
    });
    return {
        isVisible = v7, 
        transparency = v13, 
        ref = v10
    };
end;
