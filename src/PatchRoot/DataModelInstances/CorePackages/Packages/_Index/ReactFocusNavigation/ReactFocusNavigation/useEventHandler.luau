local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local _ = require(l_Parent_0.FocusNavigation);
local v3 = require(script.Parent.FocusNavigationContext);
local v4 = require(script.Parent.useComposedRef);
local v5 = require(script.Parent.useEventLifecycleRef);
return function(v6, v7, v8, v9)
    local v10 = v1.useContext(v3);
    return v4(v5(v1.useCallback(function(v11)
        if v10 then
            assert(v11:IsA("GuiObject"), "Event handlers can only be applied to GuiObjects");
            v10:registerEventHandler(v11, v6, v7, v8);
        end;
    end, {
        v10, 
        v6, 
        v7, 
        v8
    }), (v1.useCallback(function(v12)
        if v10 then
            assert(v12:IsA("GuiObject"), "Event handlers can only be applied to GuiObjects");
            v10:deregisterEventHandler(v12, v6, v7, v8);
        end;
    end, {
        v10, 
        v6, 
        v7, 
        v8
    }))), v9);
end;
