local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local _ = require(l_Parent_0.FocusNavigation);
local v3 = require(script.Parent.FocusNavigationContext);
local v4 = require(script.Parent.useComposedRef);
local v5 = require(script.Parent.useEventLifecycleRef);
return function(v6, v7)
    local v8 = v1.useContext(v3);
    return v4(v5(v1.useCallback(function(v9)
        if v8 then
            assert(v9:IsA("GuiObject"), "FocusBehaviors can only be applied to GuiObjects");
            v8:registerFocusBehavior(v9, v6);
        end;
    end, {
        v8, 
        v6
    }), (v1.useCallback(function(v10)
        if v8 then
            assert(v10:IsA("GuiObject"), "FocusBehaviors can only be applied to GuiObjects");
            v8:deregisterFocusBehavior(v10, v6);
        end;
    end, {
        v8, 
        v6
    }))), v7);
end;
