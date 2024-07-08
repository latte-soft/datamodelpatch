local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_Actions_0 = require(l_CorePackages_0.RoactNavigation).Actions;
local v4 = require(l_CorePackages_0.Cryo);
local _ = require(l_CorePackages_0.Packages.Dash);
local v6 = require(l_CorePackages_0.Logging);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v8 = require(l_Modules_0.AvatarExperience.Common.Debug.LogTree).logger("ax.rn.navutils");
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceActions);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local _ = require(l_Modules_0.AvatarExperience.Catalog.SearchTypes);
local v13 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXEnableOutfitAttribution);
local v14 = {};
local function _(v15)
    if not l_RunService_0:IsStudio() then
        warn(v15);
        return ;
    else
        error(v15);
        return ;
    end;
end;
v14.instantTransitionConfig = function()
    return {
        transitionSpec = {
            frequency = 100000, 
            dampingRatio = 1
        }
    };
end;
v14.navigateToSearch = function(v17, v18, v19)
    v14.closeFiltersAndItemDetails(v17);
    v14.closeTryOnManager(v17);
    v17.dispatch(v10.clearScreens({
        v11.CatalogSearch
    }));
    v17.dispatch(l_Actions_0.navigate({
        routeName = v11.CatalogSearch, 
        params = {
            detail = v18, 
            searchParams = v19
        }, 
        key = tostring(v18)
    }));
end;
v14.isWithinViewContext = function(v20, v21)
    if not (not v20 or not v20.previousPages) and #v21 > 0 then
        return #v4.List.filter(v20.previousPages, function(v22)
            return v22.name == v21;
        end) > 0;
    else
        v6.warn("NavigationUtils.isWithinViewContext() failed because you forget to provide a valid avatarRoute");
        return false;
    end;
end;
v14.isFirstItemDetailsPage = function(v23)
    return v23 and v23.getParam("isFirstItemDetails");
end;
v14.closeFocusedScreen = function(v24)
    v24.dispatch(l_Actions_0.back(nil));
end;
v14.closeFiltersAndItemDetails = function(v25)
    local v26 = {
        v11.ItemDetails, 
        v11.SortAndFilters
    };
    if v13 then
        v26 = v4.List.join(v26, {
            v11.OutfitDetails
        });
    end;
    v25.dispatch(v10.clearScreens(v26));
end;
v14.closeTryOnManager = function(v27)
    v27.dispatch(v10.clearScreens({
        v11.TryOnManager
    }));
end;
v14.getRootNavigation = function(v28)
    local l_v28_0 = v28;
    while l_v28_0 do
        v28 = l_v28_0;
        l_v28_0 = not not v28._dangerouslyGetParent and v28._dangerouslyGetParent() or nil;
    end;
    return v28;
end;
local v30 = {};
local function _(v31)
    local v32 = v30[v31];
    if v32 == nil then
        local v33 = "Invalid modal screen name: " .. v31;
        if not l_RunService_0:IsStudio() then
            warn(v33);
            return v31;
        else
            error(v33);
            return v31;
        end;
    else
        return v32;
    end;
end;
v14.showCatalogPrompt = function(v35, v36, v37, v38)
    if v37 then
        local l_v36_0 = v36;
        local v40 = v30[l_v36_0];
        if v40 == nil then
            local v41 = "Invalid modal screen name: " .. l_v36_0;
            if not l_RunService_0:IsStudio() then
                warn(v41);
            else
                error(v41);
            end;
            v36 = l_v36_0;
        else
            v36 = v40;
        end;
    end;
    v35.navigate(v36, v38);
end;
v14.closeAllDialogs = function(v42)
    v42.navigate(v11.AvatarExperienceMainStackNavigator);
end;
local function v43()
end;
local function _(v44)
    return (not not v44 and v44.state) and v44.state.routeName or "<UnknownRoute>";
end;
local function _(v46)
    if v46 == v43 then
        return "no-op";
    elseif v46 == nil then
        return "nil";
    else
        return "callback";
    end;
end;
v14.removeOnOverlayClosed = function(v48)
    local l_onOverlayClosed_0 = (v48.state.params or {}).onOverlayClosed;
    if l_onOverlayClosed_0 then
        v48.setParams({
            onOverlayClosed = v43
        });
    end;
    if v8.active[v8.Levels.Debug] then
        v8:debug("removeOnOverlayClosed, routeName={}", (not not v48 and v48.state) and v48.state.routeName or "<UnknownRoute>");
    end;
    return l_onOverlayClosed_0;
end;
v14.invokeOnOverlayClosed = function(v50)
    local v51 = v50.getParam("onOverlayClosed");
    if v8.active[v8.Levels.Debug] then
        v8:debug("invokeOnOverlayClosed, routeName={}, onOverlayClosed={}", (not not v50 and v50.state) and v50.state.routeName or "<UnknownRoute>", v51 == v43 and "no-op" or (v51 == nil and "nil" or "callback"));
    end;
    if v51 then
        v51();
    end;
end;
v14.closeOverlay = function(v52)
    v14.invokeOnOverlayClosed(v52);
    v52.goBack();
end;
v14.navigateFromOverlay = function(v53, ...)
    v14.invokeOnOverlayClosed(v53);
    v53.navigate(...);
end;
v14.navigateToNextOverlay = function(v54, v55, v56, ...)
    local v57 = v14.removeOnOverlayClosed(v54);
    if v8.active[v8.Levels.Debug] then
        v8:debug("navigateToNextOverlay {} -> {}, onOverlayClosed={}", (not not v54 and v54.state) and v54.state.routeName or "<UnknownRoute>", v55, v57 == v43 and "no-op" or (v57 == nil and "nil" or "callback"));
    end;
    v54.replace(v55, v4.Dictionary.join(v56 or {}, {
        onOverlayClosed = v57
    }), ...);
end;
v14.getActiveScreenNavigationState = function(v58)
    while v58.routes do
        v58 = v58.routes[v58.index];
    end;
    return v58;
end;
return v14;
