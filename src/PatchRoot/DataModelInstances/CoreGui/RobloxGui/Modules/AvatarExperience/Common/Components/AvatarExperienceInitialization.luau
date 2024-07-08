local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Common.Debug.LogTree).logger("ax.init");
local v4 = require(l_Modules_0.AvatarExperience.Common.Debug.LogHelpers);
local v5 = require(l_CorePackages_0.Cryo);
local v6 = require(l_CorePackages_0.Roact);
local v7 = require(l_CorePackages_0.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.t);
local v9 = require(l_CorePackages_0.Promise);
local v10 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_SwitchTab_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SwitchTab;
local v14 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v16 = require(l_Modules_0.LuaApp.Thunks.WaitUntilIXPUserInit);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v18 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetAvatarData);
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData);
local v20 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetAvatarRules);
local v21 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.ProcessAvatarRules);
local v22 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.GetCatalogMetadata);
local v23 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v24 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v25 = require(l_Modules_0.AvatarExperience.Common.Actions.AvatarExperienceLoaded);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v27 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetRangesAndSliderValuesFromBodyColor3s);
local v28 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v29 = require(l_Modules_0.AvatarExperience.Flags.ColorPickerSliderIXPTest);
local l_selectCurrentLegacyPage_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors.selectCurrentLegacyPage;
local l_game_EngineFeature_0 = game:GetEngineFeature("ClientAvatarUsesColor3sForBodyParts");
local v32 = v6.PureComponent:extend("AvatarExperienceInitialization");
v32.validateProps = v8.strictInterface({
    networking = v8.callback, 
    avatarExperienceActive = v8.boolean, 
    defaultBodyColors = v8.optional(v8.table), 
    extendedBodyColors = v8.optional(v8.table), 
    defaultBodyColorRanges = v8.optional(v8.table), 
    getCatalogMetadata = v8.callback, 
    getAvatarData = v8.callback, 
    receivedAvatarData = v8.callback, 
    getAvatarRules = v8.callback, 
    processAvatarRules = v8.callback, 
    avatarExperienceLoaded = v8.callback, 
    waitUntilIXPUserInit = v8.callback, 
    setRangesAndSliderValuesFromBodyColor3s = v8.callback, 
    ixpService = v8.any
});
v32.init = function(v33)
    v33.pendingBodyColor3s = nil;
    v33:setState({
        localPlayer = l_Players_0.LocalPlayer, 
        userId = not not l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0, 
        getAvatarDataFailed = false, 
        getAvatarRulesFailed = false, 
        getAvatarRulesSuccess = false, 
        ixpLoaded = false
    });
    v33.loadedPromise = v9.new(function(v34, _)
        v33.resolveLoadedPromise = v34;
    end);
    v33.retryAvatarRulesPromise = nil;
    v33.retryAvatarRulesCount = 0;
    v33.loadedPromise:andThen(function()
    end);
    v33.onLocalPlayerChanged = function()
        v3:info("onLocalPlayerChanged: {}", v4.obfuscatePlayer(l_Players_0.LocalPlayer));
        if v33.state.localPlayer == nil then
            v33:setState({
                localPlayer = l_Players_0.LocalPlayer
            });
        end;
    end;
    v33.onUserIdChanged = function()
        v3:info("onUserIdChanged: {}", v4.obfuscatePlayer(l_Players_0.LocalPlayer));
        if v33.state.userId == 0 and l_Players_0.LocalPlayer ~= nil then
            v33:setState({
                userId = l_Players_0.LocalPlayer.UserId
            });
        end;
    end;
end;
v32.getLoadingStatus = function(v36)
    local v37 = false;
    if v36.state.localPlayer ~= nil then
        v37 = v36.state.userId ~= 0;
    end;
    if v37 then
        if v36.state.ixpLoaded then
            if v36.state.getAvatarRulesSuccess then
                return v10.Done;
            else
                return v10.Fetching;
            end;
        else
            return v10.Fetching;
        end;
    else
        return v10.Fetching;
    end;
end;
v32.render = function(v38)
    local l_createFragment_0 = v6.createFragment;
    local v40 = {
        LocalPlayerConn = v6.createElement(l_ExternalEventConnection_0, {
            event = l_Players_0:GetPropertyChangedSignal("LocalPlayer"), 
            callback = v38.onLocalPlayerChanged
        })
    };
    local v41 = false;
    if l_Players_0.LocalPlayer ~= nil then
        v41 = v6.createElement(l_ExternalEventConnection_0, {
            event = l_Players_0.LocalPlayer:GetPropertyChangedSignal("UserId"), 
            callback = v38.onUserIdChanged
        });
    end;
    v40.UserIdConn = v41;
    return l_createFragment_0(v40);
end;
v32.checkHasLoaded = function(v42)
    if v42.loadedPromise:getStatus() ~= v9.Status.Resolved and v42:getLoadingStatus() == v10.Done then
        v3:info("avatarExperienceLoaded");
        v42.props.avatarExperienceLoaded();
        v42.resolveLoadedPromise();
    end;
end;
v32.maybeSetRangesAndSliderValuesFromBodyColor3s = function(v43)
    if v43.pendingBodyColor3s == nil then
        return ;
    elseif #v43.props.defaultBodyColorRanges == 0 then
        return ;
    else
        v43.props.setRangesAndSliderValuesFromBodyColor3s(v43.pendingBodyColor3s);
        return ;
    end;
end;
v32.processAvatarDataWithOldBodyColors = function(v44, v45)
    v44.props.receivedAvatarData((v5.Dictionary.join(v45, {
        bodyColors = v23.convertBodyColor3HexesToIds(v45.bodyColor3s or {}, v44.props.extendedBodyColors)
    })));
end;
v32.getAvatarData = function(v46)
    v9.all({
        v46.props.getAvatarData(v46.props.networking), 
        v46.loadedPromise
    }):andThen(function(v47)
        local v48 = v47[1];
        v3:debug("getAvatarData results valid: {}", v48 ~= nil);
        if v48 then
            local v49 = v28.readTestVariable(v29.EnabledForUser);
            if not l_game_EngineFeature_0 then
                if not v49 then
                    v46.props.receivedAvatarData(v48);
                else
                    v46:applyAvatarDataWithModifiedBodyColor3s(v48, (v23.convertBodyColorsToColor3s(v48.bodyColors or {})));
                    return ;
                end;
            else
                local v50 = v48.bodyColor3s or {};
                if not v49 then
                    if not v46.props.defaultBodyColors or v5.isEmpty(v46.props.defaultBodyColors) then
                        v46.lastAvatarData = v48;
                        return ;
                    else
                        v46:processAvatarDataWithOldBodyColors(v48);
                        return ;
                    end;
                else
                    v46:applyAvatarDataWithModifiedBodyColor3s(v48, (v23.convertBodyColor3HexesToColor3s(v50)));
                    return ;
                end;
            end;
        end;
    end):catch(function(v51)
        v3:info("getAvatarData failed: {}", v51);
        v46:setState({
            getAvatarDataFailed = true
        });
    end);
end;
v32.applyAvatarDataWithModifiedBodyColor3s = function(v52, v53, v54)
    v52.props.receivedAvatarData((v5.Dictionary.join(v53, {
        bodyColor3s = v54
    })));
    v52.pendingBodyColor3s = v54;
    v52:maybeSetRangesAndSliderValuesFromBodyColor3s();
end;
v32.maybeStartRetryAvatarRules = function(v55)
    if v55.retryAvatarRulesPromise and v55.retryAvatarRulesPromise:getStatus() ~= v9.Status.Resolved then
        return ;
    else
        v55.retryAvatarRulesCount = v55.retryAvatarRulesCount + 1;
        v55.retryAvatarRulesPromise = v9.delay(2 * math.pow(2, v55.retryAvatarRulesCount - 1)):andThen(function()
            v55:getAvatarRules();
        end);
        return ;
    end;
end;
v32.getAvatarRules = function(v56)
    v9.all({
        v56.props.getAvatarRules():andThen(function(v57)
            v56:setState({
                getAvatarRulesSuccess = true
            });
            return v57;
        end, function(v58)
            v3:info("getAvatarRules failed: {}", v58);
            v56:setState({
                getAvatarRulesFailed = true
            });
            v56:maybeStartRetryAvatarRules();
        end), 
        v56.loadedPromise
    }):andThen(function(v59)
        local v60 = v59[1];
        v3:debug("getAvatarRules results valid: {}", v60 ~= nil);
        if v60 then
            v56.props.processAvatarRules(v60);
        end;
    end);
end;
v32.checkIXPInitialized = function(v61)
    if v61.state.userId ~= 0 then
        v61.props.waitUntilIXPUserInit(v61.props.ixpService, v61.state.userId):andThen(function()
            v61:setState({
                ixpLoaded = true
            });
        end);
    end;
end;
local function _()
    return l_game_EngineFeature_0 and not v28.readTestVariable(v29.EnabledForUser);
end;
v32.checkForLocalPlayer = function(v63)
    local v64 = l_Players_0.LocalPlayer ~= v63.state.localPlayer;
    local v65 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId ~= v63.state.userId;
    if not (not v64 and not v65) then
        v63:setState({
            localPlayer = l_Players_0.LocalPlayer, 
            userId = not not l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0
        });
    end;
end;
v32.didMount = function(v66)
    v66:checkForLocalPlayer();
    v3:info("AvatarExperienceInitialization:didMount");
    v66.props.getCatalogMetadata(v66.props.networking);
    v66:getAvatarData();
    v66:getAvatarRules();
    v66:checkIXPInitialized();
    v66:checkHasLoaded();
end;
v32.didUpdate = function(v67, v68, v69)
    v67:checkForLocalPlayer();
    v67:checkHasLoaded();
    if not (not v67.props.avatarExperienceActive or v68.avatarExperienceActive) then
        if v67.state.getAvatarDataFailed then
            v67:setState({
                getAvatarDataFailed = false
            });
            v67:getAvatarData();
        end;
        if v67.state.getAvatarRulesFailed then
            v67:setState({
                getAvatarRulesFailed = false
            });
            v67:getAvatarRules();
        end;
    end;
    if v67.state.userId ~= v69.userId then
        v67:checkIXPInitialized();
    end;
    if #v68.defaultBodyColorRanges == 0 and #v67.props.defaultBodyColorRanges ~= 0 then
        v67:maybeSetRangesAndSliderValuesFromBodyColor3s();
    end;
    if not (not ((l_game_EngineFeature_0 and not v28.readTestVariable(v29.EnabledForUser)) and v67.props.defaultBodyColors ~= v68.defaultBodyColors) or not v67.lastAvatarData) then
        v67:processAvatarDataWithOldBodyColors(v67.lastAvatarData);
        v67.lastAvatarData = nil;
    end;
end;
v32.willUnmount = function(v70)
    v3:info("AvatarExperienceInitialization:willUnmount");
    if v70.loadedPromise:getStatus() ~= v9.Status.Resolved then
        v70.loadedPromise:cancel();
    end;
    if v70.retryAvatarRulesPromise and v70.retryAvatarRulesPromise:getStatus() ~= v9.Status.Resolved then
        v70.retryAvatarRulesPromise:cancel();
        v70.retryAvatarRulesPromise = nil;
    end;
end;
v32 = l_RoactServices_0.connect({
    networking = v14
})((v7.connect(function(v71, _)
    local v73 = l_selectCurrentLegacyPage_0(v71);
    local v74 = true;
    if v73.name ~= l_SwitchTab_0.AvatarExperienceTab then
        v74 = v73.name == v15.AvatarExperienceRoot;
    end;
    local v75 = nil;
    local v76 = nil;
    local l_DefaultBodyColorRanges_0 = v71.AvatarExperience.AvatarEditor.DefaultBodyColorRanges;
    if l_game_EngineFeature_0 and not v28.readTestVariable(v29.EnabledForUser) then
        v75 = v71.AvatarExperience.AvatarEditor.DefaultBodyColors;
        v76 = v71.AvatarExperience.AvatarEditor.ExtendedBodyColors;
    end;
    return {
        defaultBodyColorRanges = l_DefaultBodyColorRanges_0, 
        defaultBodyColors = v75, 
        extendedBodyColors = v76, 
        avatarExperienceActive = v74
    };
end, function(v78)
    return {
        getAvatarData = function(v79)
            return v78(v18(v79));
        end, 
        receivedAvatarData = function(v80)
            return v78(v19(v80));
        end, 
        getAvatarRules = function()
            return v78(v20);
        end, 
        processAvatarRules = function(v81)
            return v78(v21(v81));
        end, 
        avatarExperienceLoaded = function()
            return v78(v25());
        end, 
        waitUntilIXPUserInit = function(v82, v83)
            return v78(v16(v82, v83));
        end, 
        getCatalogMetadata = function(v84)
            return v78(v22(v84));
        end, 
        setRangesAndSliderValuesFromBodyColor3s = function(v85)
            v78(v27(v85));
        end
    };
end)(v32)));
return function(v86)
    return v6.createElement(v24.Consumer, {
        render = function(v87)
            return v6.createElement(v32, (v5.Dictionary.join(v86, {
                ixpService = v87
            })));
        end
    });
end;
