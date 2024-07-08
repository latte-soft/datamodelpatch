local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactNavigation);
local v6 = require(l_CorePackages_0.RoactRodux);
local v7 = require(l_Modules_0.AvatarExperience.Common.Actions.CompleteExternalNavigation);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v9 = v4.PureComponent:extend("ExternalNavigationHandler");
local v10 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v12 = require(l_Modules_0.AvatarExperience.Common.Debug.LogTree).logger("ax.rn.externalnav");
local v13 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXClothingSortingDeeplink);
v9.render = function(_)
    return nil;
end;
v9.didMount = function(v15)
    v15:processNavigationRequest();
end;
v9.didUpdate = function(v16, _)
    v16:processNavigationRequest();
end;
local function v20(v18, v19)
    return v5.Actions.navigate({
        routeName = v8.LandingPageSwitchNavigator, 
        action = v5.Actions.navigate({
            routeName = v18, 
            params = v19
        })
    });
end;
local function v22(v21)
    return v5.Actions.navigate({
        routeName = v8.ItemDetails, 
        params = v3.Dictionary.join(v21, {
            isFirstItemDetails = true
        })
    });
end;
v9.processNavigationRequest = function(v23)
    local l_completeExternalNavigation_0 = v23.props.completeExternalNavigation;
    local l_externalNavigationRequest_0 = v23.props.externalNavigationRequest;
    if l_externalNavigationRequest_0.completedRequestId ~= l_externalNavigationRequest_0.requestId then
        l_completeExternalNavigation_0(l_externalNavigationRequest_0.requestId);
        v23:navigateToScreen(l_externalNavigationRequest_0.screen, l_externalNavigationRequest_0.params);
    end;
end;
v9.navigateToScreen = function(v26, v27, v28)
    v12:info("navigateToScreen: {}, params: {}", v27, v28);
    local l_navigation_0 = v26.props.navigation;
    local v30 = nil;
    if v13() then
        v30 = function(v31)
            l_navigation_0.navigate(v8.AvatarExperienceMainStackNavigator, {}, v5.StackActions.reset({
                actions = v31, 
                index = 2
            }));
        end;
    end;
    if v27 == v8.ItemDetails then
        if not v13() then
            l_navigation_0.navigate(v8.AvatarExperienceMainStackNavigator, {}, v5.StackActions.reset({
                actions = {
                    v20(v8.Catalog, {}), 
                    v22(v28)
                }, 
                index = 2
            }));
            return ;
        else
            v30({
                v20(v8.Catalog, {}), 
                v22(v28)
            });
            return ;
        end;
    elseif v13() and v27 == v8.LayeredClothingSort then
        v30({
            v20(v8.Catalog, {}), 
            v5.Actions.navigate({
                routeName = v27
            })
        });
        return ;
    elseif not (v27 ~= v8.AvatarExperienceLandingPage) or v27 == v8.AvatarEditor then
        l_navigation_0.navigate(v27);
        return ;
    elseif v10.isAvatarBackground(v27) or v27 == v8.Catalog then
        l_navigation_0.navigate(v27, v28);
        return ;
    else
        warn("[ExternalNavigationHandler] Invalid screen:", v27);
        return ;
    end;
end;
return (v6.connect(function(v32, _)
    return {
        externalNavigationRequest = v32.AvatarExperience.ExternalNavigationRequest
    };
end, function(v34)
    return {
        completeExternalNavigation = function(v35)
            v34(v7(v35));
        end
    };
end)(v9));
