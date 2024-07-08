local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Cryo);
local v6 = require(l_Modules_0.LuaApp.AppPage);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v8 = require(l_Modules_0.LuaApp.AppPageProperties);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.RouteInfo);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarRoute);
local v11 = require(l_Modules_0.AvatarExperience.Common.isComponent);
local v12 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarRouteContext);
local v14 = require(l_Modules_0.AvatarExperience.Common.withContextValue);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.LuaApp.Reducers.Navigation);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_SwitchTab_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SwitchTab;
local function _(v19)
    local v20 = true;
    if v19 ~= v7.AvatarExperienceRoot then
        v20 = v19 == l_SwitchTab_0.AvatarExperienceTab;
    end;
    return v20;
end;
return function(v22)
    v12.assert(v11(v22), "withAppRoute must be called with a Roact component");
    local function v27(v23)
        for v24 = #v23, 1, -1 do
            local v25 = v23[v24];
            local v26 = v8[v25.name];
            if not (v26 ~= nil and v26.renderUnderlyingPage) then
                return v25;
            end;
        end;
        return {
            name = v7.None
        };
    end;
    local function _(v28)
        local v29 = true;
        if v28.name ~= v6.AvatarExperienceWrapper then
            v29 = v28.name == v6.AvatarExperienceWrapperTransparent;
        end;
        return v29;
    end;
    local function v36(v31)
        local l_name_0 = v31.name;
        local l_l_name_0_0 = l_name_0;
        if v31.detail then
            l_l_name_0_0 = l_l_name_0_0 .. ":" .. v31.detail;
        end;
        local v34 = v31.extraProps or {};
        local v35 = true;
        if v31.name ~= v6.AvatarExperienceWrapper then
            v35 = v31.name == v6.AvatarExperienceWrapperTransparent;
        end;
        if v35 then
            l_name_0 = v34.routeName;
            v34 = v34.params;
        end;
        return v9.new(l_name_0, l_l_name_0_0, (v5.Dictionary.join(v34, {
            detail = v31.detail
        })));
    end;
    local v37 = v3.PureComponent:extend("AppRouteWrapper");
    v37.getAvatarRoute = function(v38)
        local l_currentNavigationRoute_0 = v38.props.currentNavigationRoute;
        local v40 = l_currentNavigationRoute_0[#l_currentNavigationRoute_0];
        local l_name_1 = v40.name;
        local v42 = true;
        if l_name_1 ~= v7.AvatarExperienceRoot then
            v42 = l_name_1 == l_SwitchTab_0.AvatarExperienceTab;
        end;
        if not v42 then
            v42 = v27(l_currentNavigationRoute_0);
            local l_name_2 = v42.name;
            l_name_1 = true;
            if l_name_2 ~= v7.AvatarExperienceRoot then
                l_name_1 = l_name_2 == l_SwitchTab_0.AvatarExperienceTab;
            end;
            if not l_name_1 then
                l_name_1 = v10.new;
                l_name_2 = {
                    current = v36(v40), 
                    opaque = v36(v42)
                };
                local v44 = true;
                if v40.name ~= v6.AvatarExperienceWrapper then
                    v44 = v40.name == v6.AvatarExperienceWrapperTransparent;
                end;
                if not v44 then
                    v44 = true;
                    if v42.name ~= v6.AvatarExperienceWrapper then
                        v44 = v42.name == v6.AvatarExperienceWrapperTransparent;
                    end;
                end;
                l_name_2.isVisible = v44;
                l_name_2.isOverlayVisible = v38.props.centralOverlayShowing;
                return l_name_1(l_name_2);
            else
                return v10.new({
                    current = v36(v40), 
                    opaque = v38.props.avatarRoute.opaque, 
                    isVisible = true, 
                    isOverlayVisible = v38.props.centralOverlayShowing
                });
            end;
        else
            return v38.props.avatarRoute;
        end;
    end;
    v37.render = function(v45)
        return v3.createElement(v22, v5.Dictionary.join(v45.props, {
            avatarRoute = v45:getAvatarRoute(), 
            currentNavigationRoute = v5.None, 
            centralOverlayShowing = v5.None
        }));
    end;
    return (v14(v4.connect(function(v46, v47)
        local _ = nil;
        local _ = nil;
        return {
            currentNavigationRoute = v46.Navigation.history[#v46.Navigation.history], 
            avatarRoute = v47.avatarRoute or v46.AvatarExperience.AvatarScene.AvatarRoute, 
            centralOverlayShowing = v46.CentralOverlay.OverlayType ~= nil
        };
    end, nil)(v37), v13.Consumer, "avatarRoute", {
        required = false
    }));
end;
