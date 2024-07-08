local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v6 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v9 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetPageLoaded);
local v12 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v13 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v14 = require(l_Modules_0.AvatarExperience.Common.Managers.CharacterMover);
local v15 = require(l_Modules_0.AvatarExperience.Common.Managers.SaveManager);
local v16 = require(l_Modules_0.AvatarExperience.Common.Managers.CharacterManager);
local v17 = require(l_Modules_0.AvatarExperience.Common.Managers.BackgroundSceneManager);
local v18 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local l_AppPage_0 = v18.AppPage;
local l_SwitchTab_0 = v18.SwitchTab;
local v21 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v22 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v23 = require(l_Modules_0.LuaApp.AppPageProperties);
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v25 = require(l_Modules_0.AvatarExperience.Common.Context.wrapWithSceneInteractionEvents);
local v26 = require(l_Modules_0.AvatarExperience.Common.Managers.AvatarSceneSky);
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local v28 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectHasAvatarData);
local v29 = require(l_Modules_0.LuaApp.Common.withThrottleFramerateGivenPolicy);
local v30 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v32 = require(l_CorePackages_0.Cryo);
local v33 = require(l_Modules_0.AvatarExperience.Common.Context.useBodyDataEventsContext);
local v34 = require(l_Modules_0.AvatarExperience.Common.Components.AfterAvatarExperienceLoaded);
local v35 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v36 = require(l_Modules_0.AvatarExperience.Flags.AXAlternateLandingPageIXP);
local v37 = game:DefineFastFlag("AvatarSceneManagerSwitchTabFix", false);
local l_GetFFlagColorPickerSliderOptimization_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagColorPickerSliderOptimization;
local v39 = require(l_Modules_0.AvatarExperience.Common.Debug.LogTree).logger("ax.scene");
local v40 = v2.PureComponent:extend("AvatarSceneManager");
v40.defaultProps = {
    renderSky = true, 
    shouldManageBackground = true, 
    alternateAvatarLandingScreenFullscreenEnabled = false, 
    allowCameraMovements = true
};
v40.init = function(v41)
    local l_analytics_0 = v41.props.analytics;
    local l_appAnalytics_0 = v41.props.appAnalytics;
    local l_avatarExperienceAnalytics_0 = v41.props.avatarExperienceAnalytics;
    local l_networking_0 = v41.props.networking;
    local l_interactionEvents_0 = v41.props.interactionEvents;
    local l_store_0 = v41.props.store;
    local l_setBodyColors_0 = v41.props.setBodyColors;
    local l_avatarRoute_0 = v41.props.avatarRoute;
    local l_shouldManageBackground_0 = v41.props.shouldManageBackground;
    v41.running = false;
    v41.characterManagerRunning = false;
    v41.finishedInitializing = false;
    task.spawn(function()
        v41.characterMover = v14.new(l_store_0, l_avatarExperienceAnalytics_0, l_avatarRoute_0, l_interactionEvents_0, v41.props.allowCameraMovements);
        if not l_GetFFlagColorPickerSliderOptimization_0() then
            v41.characterManager = v16.new(l_store_0, l_networking_0, l_appAnalytics_0, l_avatarRoute_0, v41.characterMover);
        else
            v41.characterManager = v16.new(l_store_0, l_networking_0, l_appAnalytics_0, l_avatarRoute_0, v41.characterMover, l_setBodyColors_0);
        end;
        if l_shouldManageBackground_0 then
            v41.backgroundSceneManager = v17.new(l_store_0, l_networking_0, l_avatarRoute_0);
        end;
        v41.saveManager = v15.new(l_store_0, l_networking_0, l_analytics_0);
        v41.finishedInitializing = true;
        if not v41.destroyed then
            v41:updateManagers();
            return ;
        else
            v41:onDestroy();
            return ;
        end;
    end);
end;
local v51 = {
    [v24.AvatarEditor] = true, 
    [v24.Catalog] = true, 
    [v24.AvatarExperienceLandingPage] = true, 
    [v24.AvatarBackground] = true, 
    [v24.AvatarExperienceRoot] = true, 
    [v24.ProfilePictureEditorEmotes] = true, 
    [v24.TryOnItem] = true, 
    [l_AppPage_0.AvatarExperienceWrapper] = true, 
    [l_AppPage_0.AvatarExperienceWrapperTransparent] = true, 
    [l_SwitchTab_0.AvatarExperienceTab] = not not v37 or nil
};
local function _(v52)
    return v51[v52.name] or false;
end;
local function v57(v54)
    if v54 then
        for v55 = #v54, 1, -1 do
            local v56 = v54[v55];
            if not (v51[v56.name] or false) then
                if not (v23[v56.name] and v23[v56.name].renderUnderlyingPage) then
                    return false;
                end;
            else
                return true;
            end;
        end;
        return false;
    else
        return false;
    end;
end;
v40.updateManagers = function(v58)
    if v58.finishedInitializing then
        local l_routeHistory_0 = v58.props.routeHistory;
        local v60 = l_routeHistory_0[#l_routeHistory_0];
        local v61 = nil;
        v61 = if v58.props.shouldStart ~= nil then v58.props.shouldStart else v58.props.avatarRoute.isVisible or v57(v60);
        if not v61 or v58.running then
            if not (v61 or not v58.running) then
                v58:stop();
            end;
            return ;
        else
            v58:start();
            return ;
        end;
    else
        return ;
    end;
end;
v40.didMount = function(v62)
    v62:updateManagers();
end;
v40.willUnmount = function(v63)
    if v63.running then
        v63:stop();
    end;
    if v63.finishedInitializing then
        v63:onDestroy();
    end;
    v63.destroyed = true;
end;
v40.callUpdateAvatarRoute = function(_, v65, v66, v67)
    if v65 then
        v65:updateAvatarRoute(v66, v67);
    end;
end;
v40.shouldResetFullViewForPage = function(v68, v69)
    if v68.props.fullView[v69] == nil then
        return false;
    else
        return v68.props.fullView[v69] ~= v13.None;
    end;
end;
v40.resetFullView = function(v70, v71)
    local v72 = v22.FullViewPageDefaults[v71];
    if v72 == nil then
        return ;
    else
        local v73 = true;
        if v71 ~= v24.Catalog then
            v73 = v71 == v24.CatalogSearch;
        end;
        if not (not v73 or not v70.props.isPortrait) then
            v72 = if not v70.props.alternateAvatarLandingScreenFullscreenEnabled then v13.None else v13.UIFullView;
        end;
        if v70.props.fullView[v71] ~= v72 then
            v70.props.setFullView(v70.props.avatarExperienceAnalytics, v71, v72);
        end;
        return ;
    end;
end;
v40.onAvatarDataReady = function(v74)
    if not v74.running then
        if v74.finishedInitializing then
            v74.characterManager:maybeInitializeModel(v74.props.store:getState());
        end;
        return ;
    else
        v74:maybeStartCharacterAndSaveManager();
        return ;
    end;
end;
v40.didUpdate = function(v75, v76)
    if not (not v75.props.receivedAvatarData or v76.receivedAvatarData) then
        v75:onAvatarDataReady();
    end;
    v75:updateManagers();
    local l_avatarRoute_1 = v75.props.avatarRoute;
    local l_avatarRoute_2 = v76.avatarRoute;
    if l_avatarRoute_1 ~= l_avatarRoute_2 then
        v75:callUpdateAvatarRoute(v75.characterMover, l_avatarRoute_1, l_avatarRoute_2);
        if v75.backgroundSceneManager then
            v75:callUpdateAvatarRoute(v75.backgroundSceneManager, l_avatarRoute_1, l_avatarRoute_2);
        end;
        v75:callUpdateAvatarRoute(v75.characterManager, l_avatarRoute_1, l_avatarRoute_2);
        v75:callUpdateAvatarRoute(v75.saveManager, l_avatarRoute_1, l_avatarRoute_2);
    end;
end;
v40.render = function(v79)
    if not v79.props.renderSky then
        return ;
    else
        return v2.createElement(v26);
    end;
end;
v40.maybeStartCharacterAndSaveManager = function(v80)
    if not v80.characterManagerRunning and v80.props.receivedAvatarData then
        v80.characterManager:start();
        v80.saveManager:start();
        v80.characterManagerRunning = true;
        return ;
    else
        return ;
    end;
end;
v40.stopCharacterAndSaveManager = function(v81)
    if v81.characterManagerRunning then
        v81.characterManager:stop();
        v81.saveManager:stop();
        v81.characterManagerRunning = false;
        return ;
    else
        return ;
    end;
end;
v40.start = function(v82)
    v39:info("AvatarSceneManager:start()");
    if not v82.running then
        if v82.backgroundSceneManager then
            v82.props.setThrottleFramerateEnabled(false);
            v82.backgroundSceneManager:start();
        end;
        v82.running = true;
        v82:maybeStartCharacterAndSaveManager();
        v82.characterMover:start();
        v82.props.setPageLoaded();
        v82.props.notificationService:ActionEnabled(Enum.AppShellActionType.AvatarEditorPageLoaded);
        return ;
    else
        return ;
    end;
end;
v40.stop = function(v83)
    v39:info("AvatarSceneManager:stop()");
    if v83.running then
        v83.props.setThrottleFramerateEnabled(true);
        v83.running = false;
        v83:stopCharacterAndSaveManager();
        if v83.backgroundSceneManager then
            v83.backgroundSceneManager:stop();
        end;
        v83.characterMover:stop();
        return ;
    else
        return ;
    end;
end;
v40.onDestroy = function(v84)
    v84.characterManager:onDestroy();
    if v84.backgroundSceneManager then
        v84.backgroundSceneManager:onDestroy();
    end;
    v84.characterMover:onDestroy();
    v84.saveManager:onDestroy();
end;
v40 = v29((l_RoactAppPolicy_0.connect(function(v85)
    return {
        allowCameraMovements = v85.getAllowCameraMovements()
    };
end)((v34(v35.connectTestVariables({
    alternateAvatarLandingScreenFullscreenEnabled = v36.GetFullScreenEnabled
})((v27((v25((v4.connect(function(v86, _)
    return {
        isPortrait = v30(v86), 
        fullView = v86.AvatarExperience.Common.FullView, 
        avatarPageLoaded = v86.AvatarExperience.AvatarEditor.PageLoaded, 
        receivedAvatarData = v28(v86), 
        routeHistory = v86.Navigation.history
    };
end, function(v88)
    return {
        setPageLoaded = function()
            v88(v11(true));
        end, 
        setFullView = function(v89, v90, v91)
            v88(v12(v89, v90, v91));
        end
    };
end)((l_RoactServices_0.connect({
    analytics = v5, 
    appAnalytics = v6, 
    avatarExperienceAnalytics = v21, 
    networking = v9, 
    notificationService = l_AppNotificationService_0
})(v40))))))))), false)))));
if not l_GetFFlagColorPickerSliderOptimization_0() then
    return v40;
else
    return function(v92)
        return v3.createElement(v40, (v32.Dictionary.join(v33(), v92)));
    end;
end;
