local l_Parent_0 = script:FindFirstAncestor("TenFootUiShell").Parent;
local v1 = require(l_Parent_0.Navigation);
local l_SwitchTab_0 = require(l_Parent_0.RobloxAppEnums).SwitchTab;
local l_getCurrentNavigationState_0 = v1.getCurrentNavigationState;
local function v5(v4)
    return v4.routes[v4.index].key == l_SwitchTab_0.AvatarExperienceTab;
end;
local function _(v6, v7)
    local v8 = l_getCurrentNavigationState_0(v6);
    local v9 = if not v8 then nil else v8.routeName;
    if not v9 then
        return false;
    else
        return v7[v9];
    end;
end;
return {
    getAutoFocusDisabledForAvatar = function(v11, v12)
        local v13 = v11.routes[v11.index].key == l_SwitchTab_0.AvatarExperienceTab;
        local v14 = l_getCurrentNavigationState_0(v11);
        local v15 = if not v14 then nil else v14.routeName;
        return v13 and not (not not v15 and v12[v15]);
    end, 
    getStackRootIsAvatar = v5
};
