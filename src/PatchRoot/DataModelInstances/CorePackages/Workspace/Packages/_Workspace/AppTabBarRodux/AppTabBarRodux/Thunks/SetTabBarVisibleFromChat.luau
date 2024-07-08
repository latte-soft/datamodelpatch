local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppTabBarRodux");
local v1 = require(l_script_FirstAncestor_0.Parent.ArgCheck);
local v2 = require(l_script_FirstAncestor_0.Actions.SetTabBarVisible);
return function(v3)
    v1.isType(v3, "boolean", "SetTabBarVisibleFromChat.isVisible");
    return function(v4)
        local v5 = v4:getState();
        if not v5.ChatAppReducer.ToggleChatPaused and v5.TabBarVisible ~= v3 then
            v4:dispatch(v2(v3));
        end;
    end;
end;
