local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.AppPage);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v6 = require(l_Modules_0.LuaApp.AppPageProperties);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.AppRouterParamsContext);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.makeAppRouterRootNavigator);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarRouteContext);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.makeAvatarRoute);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreenProperties);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local function _(v13)
    local l_name_0 = v13.name;
    if not (l_name_0 ~= v4.AvatarExperienceWrapper) or l_name_0 == v4.AvatarExperienceWrapperTransparent then
        l_name_0 = v13.extraProps.routeName;
    end;
    return l_name_0;
end;
local function v28(v16, v17)
    local v18 = v5.getActiveScreenNavigationState(v16.state);
    local v19 = not not v18.params and v18.params.detail or nil;
    local l_routeName_0 = v18.routeName;
    local v21 = v11[l_routeName_0];
    local v22 = v21 and v21.isTransparent;
    local v23 = 0;
    for v24 = #v17, 1, -1 do
        local v25 = v17[v24];
        local l_name_1 = v25.name;
        if not (l_name_1 ~= v4.AvatarExperienceWrapper) or l_name_1 == v4.AvatarExperienceWrapperTransparent then
            l_name_1 = v25.extraProps.routeName;
        end;
        local l_l_name_1_0 = l_name_1;
        if l_l_name_1_0 == l_routeName_0 and v25.detail == v19 then
            return true;
        elseif not v6[l_l_name_1_0] or v6[l_l_name_1_0].renderUnderlyingPage then
            if v22 then
                v23 = v23 + 1;
                if v23 >= 1 then
                    return false;
                end;
            end;
        else
            return false;
        end;
    end;
    return false;
end;
return function(v29)
    local v30 = v8(v29);
    local v31 = v2.PureComponent:extend("AppRouterRootContainer");
    v31.render = function(v32)
        local l_navigation_0 = v32.props.navigation;
        return v2.createElement(v7.Provider, {
            value = v32.props.params
        }, {
            AvatarRouteProvider = v2.createElement(v9.Provider, {
                value = v10(l_navigation_0, (v28(l_navigation_0, v32.props.currentRoute)))
            }, {
                navigation = v2.createElement(v30, {
                    navigation = l_navigation_0
                }), 
                androidBackButtonNavigationHandler = v32.props.renderAndroidBackButtonNavigationHandler(l_navigation_0)
            })
        });
    end;
    v31 = v3.connect(function(v34, _)
        local l_history_0 = v34.Navigation.history;
        return {
            currentRoute = l_history_0[#l_history_0]
        };
    end, nil)(v31);
    v31.router = v30.router;
    return v31;
end;
