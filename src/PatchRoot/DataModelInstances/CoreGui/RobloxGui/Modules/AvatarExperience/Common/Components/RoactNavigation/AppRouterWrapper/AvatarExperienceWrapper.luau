local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactNavigation);
local v4 = require(l_CorePackages_0.RoactRodux);
local _ = require(l_CorePackages_0.Packages.React);
local v6 = require(l_Modules_0.LuaApp.Navigation.AndroidBackButtonNavigationHandler.Container);
local v7 = require(l_Modules_0.LuaApp.Navigation.isRootRouteInRN);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = require(l_Modules_0.LuaApp.Actions.ApplySetNavigationLocked);
local v11 = require(l_Modules_0.LuaApp.AppPage);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.makeNavigationStateLogger);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.makeAppRouterRootContainer);
local v14 = v2.Component:extend("AvatarExperienceWrapper");
v14.validateProps = v9.strictInterface({
    routeName = v9.string, 
    params = v9.interface({
        detail = v9.string
    }), 
    currentAppPageName = v9.optional(v9.string), 
    currentAppPageDetail = v9.optional(v9.string), 
    unlockNavigation = v9.callback
});
v14.init = function(v15)
    v15.navigationAppContainer = v3.createAppContainer(v13(v15.props.routeName), nil);
    v15.isAndroidBackButtonHandlerDisabled = l_memoize_0(function(v16, v17, v18)
        local v19;
        if v16 ~= v11.AvatarExperienceWrapper then
            v19 = false;
            if not (v16 == v11.AvatarExperienceWrapperTransparent) then
                goto label0;
            end;
        end;
        v19 = v17 == v18;
        ::label0::;
        return not v19;
    end);
    v15.renderAndroidBackButtonNavigationHandler = l_memoize_0(function(v20)
        return function(v21)
            return v2.createElement(v6, {
                canGoBackInRN = not v7(v21.state), 
                navigateBackInRN = v21.pop, 
                disabled = v20
            });
        end;
    end);
    local v22 = v12("AvatarExperienceWrapper:" .. v15.props.routeName);
    v15.onNavigationStateChange = function(v23, v24, v25)
        v22(v23, v24, v25);
        if not v24.isTransitioning then
            v15.props.unlockNavigation();
        end;
    end;
end;
v14.render = function(v26)
    return v2.createElement(v26.navigationAppContainer, {
        onNavigationStateChange = v26.onNavigationStateChange, 
        renderAndroidBackButtonNavigationHandler = v26.renderAndroidBackButtonNavigationHandler((v26.isAndroidBackButtonHandlerDisabled(v26.props.currentAppPageName, v26.props.currentAppPageDetail, not not v26.props.params and v26.props.params.detail or nil))), 
        params = v26.props.params
    });
end;
return (v4.connect(function(v27, _)
    local v29 = v27.Navigation.history[#v27.Navigation.history];
    local v30 = v29[#v29];
    return {
        currentAppPageName = not not v30 and v30.name or nil, 
        currentAppPageDetail = not not v30 and v30.detail or nil
    };
end, function(v31)
    return {
        unlockNavigation = function()
            v31(v10(false));
        end
    };
end)(v14));
