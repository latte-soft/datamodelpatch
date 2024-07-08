local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_SetTabBarVisible_0 = require(l_CorePackages_0.Workspace.Packages.AppTabBarRodux).Actions.SetTabBarVisible;
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceMainStackNavigator);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.getActiveChildNavigationOptionsSafely);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v11 = game:DefineFastFlag("AXStopUsingSystemBarAppPolicy", false);
local v12 = v3.Component:extend("AvatarExperienceMainStackContainer");
v12.didMount = function(v13)
    v13:setTabBarVisibility(v13.props);
end;
v12.willUpdate = function(v14, v15)
    v14:setTabBarVisibility(v15);
end;
v12.setTabBarVisibility = function(_, v17)
    if v17.avatarRoute.isVisible then
        local v18 = v8(v17.navigation);
        local v19 = nil;
        v19 = if not v11 then v17.shouldSystemBarUsuallyBePresent and true or v18.tabBarVisible == true else v18.tabBarVisible == true;
        if v19 ~= v17.tabBarVisible then
            v17.setTabBarVisible(v19);
        end;
        return ;
    else
        return ;
    end;
end;
v12.render = function(v20)
    return v3.createElement(v7, {
        navigation = v20.props.navigation
    });
end;
local function v23(v21, _)
    return {
        tabBarVisible = v21.TabBarVisible
    };
end;
local function v26(v24)
    return {
        setTabBarVisible = function(v25)
            v24(l_SetTabBarVisible_0(v25));
        end
    };
end;
if not v11 then
    v12 = l_RoactAppPolicy_0.connect(function(v27, _)
        return {
            shouldSystemBarUsuallyBePresent = v27.getShouldSystemBarUsuallyBePresent()
        };
    end)(v12);
end;
v12 = v4.connect(v23, v26)((v6(v12)));
v12.router = v7.router;
return v12;
