local l_Parent_0 = script:FindFirstAncestor("RobloxAppNavigation").Parent;
local v1 = require(l_Parent_0.React);
local l_RobloxStackView_0 = require(l_Parent_0.RoactNavigation).RobloxStackView;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local l_TenFootUiStackView_0 = require(l_Parent_0.TenFootUiShell).Views.TenFootUiStackView;
local _ = require(l_Parent_0.Navigation);
return function(v7)
    if l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot then
        return v1.createElement(l_TenFootUiStackView_0, v7);
    else
        return v1.createElement(l_RobloxStackView_0, v7);
    end;
end;
