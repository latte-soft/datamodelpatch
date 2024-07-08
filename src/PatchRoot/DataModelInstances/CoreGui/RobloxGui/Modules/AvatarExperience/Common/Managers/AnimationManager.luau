local l_CoreGui_0 = game:GetService("CoreGui");
local l_InsertService_0 = game:GetService("InsertService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_CorePackages_0.Logging);
local v7 = require(l_Modules_0.AvatarExperience.Common.Managers.PPEAnimationUtils);
local v8 = require(l_Modules_0.AvatarExperience.Common.Managers.AnimationUtils);
local v9 = require(l_Modules_0.AvatarExperience.Common.Managers.AnimationManagerTypes);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v12 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v13 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v14 = require(l_Modules_0.AvatarExperience.Common.Actions.PlayingSwimAnimation);
local v15 = require(l_Modules_0.LuaApp.mutedError);
local v16 = require(l_CorePackages_0.Promise);
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v19 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v21 = require(l_CorePackages_0.Packages.Dash);
local v22 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectShouldPlayMoodAnimationsUsingOutfitTryOn);
local v23 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectIsToolEquipped);
local v24 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOutfitTryOnMoodAnimationAssetId);
local v25 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOutfitTryOnIdleAnimationAssetId);
local v26 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOutfitTryOnEmoteAnimationAssetId);
local v27 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local v28 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local l_AnimationTrackWithConnectionsTypes_0 = v9.AnimationTrackWithConnectionsTypes;
local l_AssetTypeIdStrings_0 = v11.AssetTypeIdStrings;
local v31 = require(l_Modules_0.AvatarExperience.Flags.UniversalAppCameraIXPTest);
local v32 = require(l_Modules_0.AvatarExperience.Common.Debug.LogTree).logger("ax.init");
local v33 = game:DefineFastFlag("AXSilenceNAMMutedError", false);
local v34 = {
    EnteredAX = "EnteredAX", 
    NewEquippedAssets = "NewEquippedAssets", 
    NewOutfitTryOn = "NewOutfitTryOn"
};
local v35 = {};
v35.__index = v35;
v35.new = function(v36, v37, v38)
    local v39 = {};
    setmetatable(v39, v35);
    v39.destroyed = false;
    v39.started = false;
    v39.store = v36;
    v39.avatarRoute = v38;
    v39.animationTrackWithConnectionsByType = {};
    v39.unresolvedStateTransitions = {};
    v39.shouldMoveToNextValidMainBodyAnimation = false;
    v39.stoppedButNotEndedATWCsByName = {};
    local v40 = v8.createR6AnimationFolder();
    local v41 = l_InsertService_0:LoadLocalAsset("rbxasset://avatar/animations/humanoidR15AnimateChildren.rbxm");
    v39.animationTrackNameIndex = 0;
    v8.createAnimation(v41, "Tool", v8.DefaultAnimations.R15.TOOL);
    v8.createAnimation(v8.createStringValue(v41, "wave"), "WaveAnim", v8.DefaultAnimations.R15.WAVE_EMOTE);
    v40.Name = "Animations";
    v41.Name = "Animations";
    v37:setupAnimations(v40, v41);
    v39.currentStateDigest = {};
    v39.currentAssetIdsToLoad = {};
    v39.currentLoadedAssets = {};
    v39.debugLoadAssetsFromFiles = false;
    v39.stateSummaryAtLastVersionUpdate = {
        equippedAssetsSummary = {}, 
        outfitTryOnSummary = {}
    };
    v39.equippedAssetsSummaryTriggeringLookAround = {};
    v39.outfitTryOnSummaryTriggeringLookAround = {};
    return v39;
end;
v35.setToolManager = function(v42, v43)
    v42.toolManager = v43;
end;
v35.start = function(v44)
    if not v44.started then
        v44.started = true;
        v44.shouldMoveToNextValidMainBodyAnimation = false;
        v44:cleanupAllAnimationTracks();
        v44.storeChangedConnection = v44.store.changed:connect(function(v45, v46)
            local l_avatarRoute_0 = v44.avatarRoute;
            v44:update(v45, v46, l_avatarRoute_0, l_avatarRoute_0);
        end);
        if v44.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter then
            return ;
        else
            v6.warn("Tried to start AnimationManager without a character");
            return ;
        end;
    else
        v15("calling AnimationManager:start when already started");
        return ;
    end;
end;
v35.stop = function(v48)
    if v48.started then
        v48.started = false;
        if v48.loadAssetsPromise then
            v48.loadAssetsPromise:cancel();
        end;
        v48:cleanupAllAnimationTracks();
        if v48.storeChangedConnection then
            v48.storeChangedConnection:disconnect();
            v48.storeChangedConnection = nil;
        end;
        return ;
    else
        v15("calling AnimationManager:stop when not started");
        return ;
    end;
end;
v35.onDestroy = function(v49)
    if v49.loadAssetsPromise then
        v49.loadAssetsPromise:cancel();
    end;
    v49.destroyed = true;
end;
v35.updateAvatarRoute = function(v50, v51, v52)
    v50.avatarRoute = v51;
    local v53 = v50.store:getState();
    v50:update(v53, v53, v51, v52);
end;
v35.update = function(v54, v55, v56, v57, v58)
    if v55.AvatarExperience.AvatarScene.Character.CurrentCharacter then
        local v59 = v54:createStateDigest(v55, v57);
        local v60 = v54:createStateTransitions(v55, v56, v57, v58);
        local v61 = v54:getAssetIdsToLoad(v59, v55);
        local v62 = v21.shallowEqual(v54.currentStateDigest, v59);
        local v63 = v21.shallowEqual(v54.currentAssetIdsToLoad, v61);
        v54.currentStateDigest = v59;
        v54.currentAssetIdsToLoad = v61;
        for v64, v65 in pairs(v60) do
            if v65 then
                v54.unresolvedStateTransitions[v64] = v65;
            end;
        end;
        local v66 = false;
        for _, v68 in pairs(v54.unresolvedStateTransitions) do
            if v68 then
                v66 = true;
                break;
            end;
        end;
        if (not v62 or not v63) or v66 then
            if v54.loadAssetsPromise then
                if v62 and v63 then
                    assert(v66, "hasUnresolvedTransition should be true");
                    if v54.onUpdateFinished then
                        v54.onUpdateFinished(v60, v59, v61, nil);
                    end;
                    return ;
                else
                    v54.loadAssetsPromise:cancel();
                    v54.loadAssetsPromise = nil;
                end;
            end;
            assert(v54.loadAssetsPromise == nil, "self.loadAssetsPromise should be nil");
            v54.loadAssetsPromise = v54:makeLoadAssetsPromise(v59, v61);
            v54.loadAssetsPromise:andThen(function(v69)
                v54.loadAssetsPromise = nil;
                v54.currentLoadedAssets = v69;
                if not v54.destroyed then
                    assert(v21.shallowEqual(v54.currentStateDigest, v59), "stateDigest should match");
                    assert(v21.shallowEqual(v54.currentAssetIdsToLoad, v61), "assetIdsToLoad should match");
                    v54:playLoadedAssets(v59, v61, v69);
                    if v54.onUpdateFinished then
                        v54.onUpdateFinished(v60, v59, v61, v69);
                    end;
                    return v16.resolve();
                else
                    return ;
                end;
            end):catch(function(v70)
                v54.loadAssetsPromise = nil;
                v6.warn("Error in loadAssetsPromise: " .. tostring(v70));
                if v54.onUpdateFinished then
                    v54.onUpdateFinished(v60, v59, v61, {});
                end;
            end);
            return ;
        else
            if v54.onUpdateFinished then
                v54.onUpdateFinished(v60, v59, v61, nil);
            end;
            return ;
        end;
    else
        if v54.onUpdateFinished then
            v54.onUpdateFinished(nil, nil, nil, nil);
        end;
        return ;
    end;
end;
v35.createStateTransitions = function(v71, v72, v73, v74, v75)
    local l_CurrentCharacter_0 = v72.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    local l_CurrentCharacter_1 = v73.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    assert(l_CurrentCharacter_0, "currentCharacter should be non-nil. Silence type checker.");
    return {
        didUpdateCharacter = l_CurrentCharacter_0 ~= l_CurrentCharacter_1, 
        didMoveOutOfPPE = v8.getDidMoveOutOfPPE(v12.routeIsProfilePictureEditor(v75), v12.routeIsProfilePictureEditor(v74), v74.isVisible), 
        didSomethingThatShouldTriggerLookAround = v71:getDidSomethingThatShouldTriggerLookAround(l_CurrentCharacter_0, v72, v73, v74, v75)
    };
end;
v35.shouldResumeLookAroundAfterCharacterSwap = function(v78, v79, v80, v81, v82, v83)
    if v80 ~= v81 then
        if v78:animationTrackWithConnectionsIsPlaying(l_AnimationTrackWithConnectionsTypes_0.LookAround) then
            if not (v78.lookAroundReason == v34.EnteredAX) or not v79 then
                if not (v78.lookAroundReason == v34.NewEquippedAssets) or not v8.getEquippedAssetSummariesMatch(v82, v78.equippedAssetsSummaryTriggeringLookAround) then
                    if v78.lookAroundReason == v34.NewOutfitTryOn then
                        assert(v78.outfitTryOnSummaryTriggeringLookAround, "self.outfitTryOnSummaryTriggeringLookAround should be non-nil");
                        if v8.getOutfitTryOnSummariesMatch(v83, v78.outfitTryOnSummaryTriggeringLookAround) then
                            return true;
                        end;
                    end;
                    return false;
                else
                    return true;
                end;
            else
                return true;
            end;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v35.getDidSomethingThatShouldTriggerLookAround = function(v84, v85, v86, v87, v88, v89)
    local v90 = v8.getHumanoidFromCharacter(v85);
    if v90 then
        assert(v90, "humanoid should not be nil. Silence type checker");
        if Enum.HumanoidRigType.R15 ~= v90.RigType then
            return false;
        elseif not v12.routeIsProfilePictureEditor(v88) then
            local l_isVisible_0 = v88.isVisible;
            local l_isVisible_1 = v89.isVisible;
            if not l_isVisible_0 or l_isVisible_1 then
                local l_CurrentCharacter_2 = v87.AvatarExperience.AvatarScene.Character.CurrentCharacter;
                local l_CharacterVersion_0 = v86.AvatarExperience.AvatarScene.Character.CharacterVersion;
                local l_CharacterVersion_1 = v87.AvatarExperience.AvatarScene.Character.CharacterVersion;
                local l_EquippedAssets_0 = v86.AvatarExperience.AvatarEditor.Character.EquippedAssets;
                local l_OutfitTryOn_0 = v86.AvatarExperience.AvatarScene.OutfitTryOn;
                local v98 = l_CharacterVersion_1 ~= l_CharacterVersion_0;
                local v99 = v8.getEquippedAssetsSummary(l_EquippedAssets_0);
                local v100 = v8.getOutfitTryOnSummary(l_OutfitTryOn_0);
                local l_equippedAssetsSummary_0 = v84.stateSummaryAtLastVersionUpdate.equippedAssetsSummary;
                local l_outfitTryOnSummary_0 = v84.stateSummaryAtLastVersionUpdate.outfitTryOnSummary;
                if v98 then
                    v84.stateSummaryAtLastVersionUpdate.equippedAssetsSummary = v99;
                    v84.stateSummaryAtLastVersionUpdate.outfitTryOnSummary = v100;
                    if not v8.getEquippedAssetsSummaryHasNewItems(v99, l_equippedAssetsSummary_0) then
                        if v8.getOutfitTryOnSummaryHasNewItems(v100, l_outfitTryOnSummary_0) then
                            v84.lookAroundReason = v34.NewOutfitTryOn;
                            v84.outfitTryOnSummaryTriggeringLookAround = v100;
                            return true;
                        end;
                    else
                        v84.lookAroundReason = v34.NewEquippedAssets;
                        v84.equippedAssetsSummaryTriggeringLookAround = v99;
                        return true;
                    end;
                end;
                if not v84:shouldResumeLookAroundAfterCharacterSwap(l_isVisible_0, v85, l_CurrentCharacter_2, v99, v100) then
                    return false;
                else
                    return true;
                end;
            else
                v84.lookAroundReason = v34.EnteredAX;
                return true;
            end;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v35.createStateDigest = function(v103, v104, v105)
    local l_name_0 = v105.opaque.name;
    local v107 = v12.getCategoryInfoFromState(v104, v105);
    local v108, v109 = v8.getAllowsTryingEmotesOrAnimations(v104, v105);
    local v110 = false;
    if v107.PageType == v11.PageType.Emotes then
        v110 = l_name_0 == v28.AvatarEditor;
    end;
    local v111 = false;
    if v107.PageType == v11.PageType.Animation then
        v111 = l_name_0 == v28.AvatarEditor;
    end;
    local v112 = nil;
    v112 = not (v104.AvatarExperience.AvatarEditor.Character.AvatarType == v10.AvatarType.R6) and v22(v104);
    local v113 = v12.routeIsProfilePictureEditor(v105);
    local v114 = false;
    if (v113 and l_name_0 == v28.ProfilePictureEditorFinal) and v104.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode == v27.FullBody then
        v114 = true;
    end;
    local v115 = false;
    local l_CurrentCharacter_3 = v103.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
    if not (not l_CurrentCharacter_3 or not l_CurrentCharacter_3:FindFirstChildOfClass("Tool")) then
        v115 = true;
    end;
    local v117, v118 = v8.canPlayCameraBasedMoodAnimation(v104, v107.CanAnimateCameraBasedMood == true, v108);
    local v119 = v13.readTestVariable(v31.EnabledForUser);
    return {
        isInPPE = v113, 
        isInAX = v105.isVisible, 
        toolEquipped = v23(v104), 
        curCategoryInfo = v107, 
        isAvatarBackground = v12.isAvatarBackground(v105.current.name), 
        pageAllowsForTryingOnEmotes = v108, 
        pageAllowsForTryingOnAnimations = v109, 
        pageHasBothAnimsAndEmotes = v108 and v109, 
        pageIsEditorEmotes = v110, 
        pageIsEditorAnimations = v111, 
        shouldPlayMoodAnimations = v112, 
        canPlayCameraBasedMoodAnimation = if not v119 then nil else v117, 
        receivedOutfitInfo = if not v119 then nil else v118, 
        ppeFinalPageFullView = v114, 
        hasTool = v115, 
        cameraButtonEnabled = if not v119 then nil else v104.AvatarExperience.CameraButton.enabled
    };
end;
v35.getAssetIdsToLoad = function(v120, v121, v122)
    if not v121.isInPPE then
        local v123 = {};
        if v121.shouldPlayMoodAnimations then
            local v124 = v24(v122);
            if not v124 then
                v123.moodAssetId = v19.getEquippedMoodAssetId(v122);
            else
                v123.moodAssetId = v124;
            end;
        end;
        v123.mainBodyAssetId = v120:getMainBodyAssetId(v121, v122);
        return v123;
    else
        return v7.getAssetIdsToLoad(v122, v121.shouldPlayMoodAnimations);
    end;
end;
v35.getMainBodyAssetId = function(v125, v126, v127)
    if v127.AvatarExperience.AvatarEditor.Character.AvatarType == v10.AvatarType.R6 then
        return nil;
    elseif not v126.isAvatarBackground then
        local v128 = v125:getTryOnMainBodyAssetId(v126, v127);
        if not v128 then
            if v126.pageIsEditorEmotes then
                local v129 = v127.AvatarExperience.AvatarEditor.EquippedEmotes.slotInfo[v127.AvatarExperience.AvatarEditor.EquippedEmotes.selectedSlot];
                if not (not v129 or not v129.assetId) then
                    return v129.assetId;
                end;
            end;
            if v126.pageIsEditorAnimations then
                local v130 = v8.getAssetTypeIdStringForCategory(v126.curCategoryInfo);
                if v130 then
                    local l_EquippedAssets_1 = v127.AvatarExperience.AvatarEditor.Character.EquippedAssets;
                    local v132 = l_EquippedAssets_1 and l_EquippedAssets_1[v130];
                    local v133 = not not v132 and next(v132) or nil;
                    if not v133 then
                        return nil;
                    else
                        return v133;
                    end;
                end;
            end;
            local v134 = v8.getEquippedIdleAnimation(v127);
            if not v134 then
                return nil;
            else
                return v134;
            end;
        else
            return v128;
        end;
    else
        return v125:getAvatarBackgroundAssetId(v127);
    end;
end;
v35.getAvatarBackgroundAssetId = function(_, v136)
    if v136.AvatarExperience.Common.PlayEmoteInBackground.shouldPlayEmoteInBackground then
        for _, v138 in v136.AvatarExperience.AvatarEditor.EquippedEmotes.slotInfo, nil, nil do
            if v138.assetId then
                return v138.assetId;
            end;
        end;
        local v139 = v8.getEquippedIdleAnimation(v136);
        if not v139 then
            return nil;
        else
            return v139;
        end;
    else
        return nil;
    end;
end;
v35.getTryOnMainBodyAssetId = function(_, v141, v142)
    local l_TryOn_0 = v142.AvatarExperience.AvatarScene.TryOn;
    local l_OutfitTryOn_1 = v142.AvatarExperience.AvatarScene.OutfitTryOn;
    if v141.pageAllowsForTryingOnEmotes then
        local v145 = v26(v142);
        if v145 then
            if not v141.pageHasBothAnimsAndEmotes then
                return v145;
            else
                local l_LastAnimOrEmoteToggledItem_0 = l_OutfitTryOn_1.LastAnimOrEmoteToggledItem;
                if l_LastAnimOrEmoteToggledItem_0 and l_LastAnimOrEmoteToggledItem_0.itemId == v145 then
                    return v145;
                end;
            end;
        end;
    end;
    if not (not v141.pageAllowsForTryingOnAnimations or not l_TryOn_0.AnimationPreview) and l_TryOn_0.AnimationPreviewAssetTypeIdString ~= l_AssetTypeIdStrings_0.EmoteAnimation then
        return l_TryOn_0.AnimationPreview;
    else
        local v147 = v25(v142);
        if not v147 then
            return nil;
        else
            return v147;
        end;
    end;
end;
v35.getMultiTryOnTriedOnEmote = function(_, v149)
    for v150, v151 in v149.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, nil, nil do
        if v151.itemSubType == l_AssetTypeIdStrings_0.EmoteAnimation then
            return v150;
        end;
    end;
    return nil;
end;
v35.makeLoadAssetsPromise = function(v152, v153, v154)
    return v16.new(function(v155, _, v157)
        v157(function()
            v7.maybeNoteLoadingFinished(v152.store);
        end);
        if not v153.isInPPE then
            local v158 = {};
            if v154.moodAssetId then
                v158.moodAnimStringValues = v8.loadAnimStringValuesFromString(v154.moodAssetId, v152.debugLoadAssetsFromFiles, v152.mapAssetIdToFileName);
            end;
            if v154.mainBodyAssetId then
                v158.mainBodyAnimStringValues = v8.loadAnimStringValuesFromString(v154.mainBodyAssetId, v152.debugLoadAssetsFromFiles, v152.mapAssetIdToFileName);
            end;
            local v159 = {};
            if v158.moodAnimStringValues then
                v21.append(v159, v158.moodAnimStringValues);
            end;
            if v158.mainBodyAnimStringValues then
                v21.append(v159, v158.mainBodyAnimStringValues);
            end;
            if not (not (#v159 > 0) or v152.debugLoadAssetsFromFiles) then
                l_ContentProvider_0:PreloadAsync(v159);
            end;
            v155(v158);
            return ;
        else
            v155(v7.makeLoadedAssets(v152.store, v153, v154));
            return ;
        end;
    end);
end;
v35.playLoadedAssets = function(v160, v161, v162, v163)
    if v160.unresolvedStateTransitions.didUpdateCharacter then
        v160:cleanupAllAnimationTracks();
        v160.unresolvedStateTransitions.didUpdateCharacter = false;
    end;
    if not v161.isInPPE then
        if v160.unresolvedStateTransitions.didMoveOutOfPPE then
            local l_CurrentCharacter_4 = v160.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
            v7.undoOldProfilePictureEditorPose(v160.store, l_CurrentCharacter_4, (v8.getHumanoidFromCharacter(l_CurrentCharacter_4)));
        end;
        v160.unresolvedStateTransitions.didMoveOutOfPPE = false;
        v160:updateToolAnimation(v161);
        v160:updateMoodAnimation(v161, v162, v163);
        if v13.readTestVariable(v31.EnabledForUser) then
            v160:updateCameraBasedMoodAnimation(v161);
        end;
        if not v160.unresolvedStateTransitions.didSomethingThatShouldTriggerLookAround then
            v160:updateMainBodyAnimation(v161, v162, v163);
        else
            v160:updateMainBodyAnimationAfterPlayingLookAround(v161, v162, v163);
        end;
        v160.unresolvedStateTransitions.didSomethingThatShouldTriggerLookAround = false;
        return ;
    else
        v160:stopAnimationsAndMaybeProceedWithPPEPosing();
        return ;
    end;
end;
v35.cleanupAllAnimationTracks = function(v165)
    for _, v167 in pairs(l_AnimationTrackWithConnectionsTypes_0) do
        v8.cleanupAnimationTrackWithConnections(v165.animationTrackWithConnectionsByType[v167]);
        v165.animationTrackWithConnectionsByType[v167] = nil;
    end;
    for _, v169 in v165.stoppedButNotEndedATWCsByName, nil, nil do
        v8.cleanupAnimationTrackWithConnections(v169);
    end;
    v165.stoppedButNotEndedATWCsByName = {};
end;
v35.stopAnimationsAndMaybeProceedWithPPEPosing = function(v170)
    assert(v170.currentStateDigest.isInPPE, "Must be in PPE");
    assert(v170.currentStateDigest.isInAX, "Must be in in AX");
    for _, v172 in pairs(l_AnimationTrackWithConnectionsTypes_0) do
        v170:stopAnimationTrackWithConnections(v172, 0.02);
    end;
    v170:maybeProceedWithPPEPosing();
end;
v35.maybeProceedWithPPEPosing = function(v173)
    local function v176()
        if v173.currentStateDigest.isInPPE then
            if v173.currentStateDigest.isInAX then
                if not v173.loadAssetsPromise then
                    if not v173:animationsAreMovingAvatar() then
                        local l_CurrentCharacter_5 = v173.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
                        if l_CurrentCharacter_5 then
                            local v175 = v8.getHumanoidFromCharacter(l_CurrentCharacter_5);
                            if v175 then
                                v7.applyNewProfilePictureEditorPose(v173.store, l_CurrentCharacter_5, v175, v173.currentLoadedAssets.keyframesForPose);
                            end;
                        end;
                        return ;
                    else
                        return ;
                    end;
                else
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v8.waitForAnimationAndPosingToResolve(function()
        v176();
    end);
end;
v35.animationTrackWithConnectionsIsPlaying = function(v177, v178)
    local v179 = v177.animationTrackWithConnectionsByType[v178];
    if not v179 then
        return false;
    else
        return v8.animationTrackWithConnectionsIsPlaying(v179);
    end;
end;
v35.animationsAreMovingAvatar = function(v180)
    for _, v182 in pairs(l_AnimationTrackWithConnectionsTypes_0) do
        if v180:animationTrackWithConnectionsIsPlaying(v182) then
            return true;
        end;
    end;
    if not next(v180.stoppedButNotEndedATWCsByName) then
        return false;
    else
        return true;
    end;
end;
v35.updateToolAnimation = function(v183, v184)
    assert(not v184.isInPPE, "Should not be in PPE");
    if v184.toolEquipped then
        local l_CurrentCharacter_6 = v183.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
        local l_Animations_0 = l_CurrentCharacter_6.Animations;
        local v187 = nil;
        local v188 = nil;
        local v189 = nil;
        if l_Animations_0 then
            v187 = l_Animations_0.Tool;
            if v187 then
                v188 = v8.animatorLoadAnimationTrack(l_CurrentCharacter_6, v187, v183.debugLoadAssetsFromFiles);
                v189 = v19.getAssetIdFromContent(v187.AnimationId);
            end;
        end;
        if v189 and v188 then
            assert(v189, "newToolAnimationAssetId is not nil. Silence type checker");
            if not v8.animationTrackWithConnectionsIsPlayingThisAssetId(v183.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.ToolHold], v189) then
                v183:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.ToolHold);
                assert(v188, "toolHoldAnimationTrack is not nil. Silence type checker");
                assert(v189, "newToolAnimationAssetId should be non-nil");
                local v190 = {
                    assetId = v189
                };
                v190.stoppedConnection = v188.Stopped:Connect(function()
                    v183:handleStoppedConnection(v188, v190);
                end);
                v190.endedConnection = v188.Ended:Connect(function()
                    v183:handleEndedConnection(v188);
                end);
                v190.animationTrack = v188;
                v190.animationTrack.Name = v183:getNextAnimationTrackName("ToolHold");
                v183.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.ToolHold] = v190;
                v188:Play(0.1);
                v183:recordAnimationTrackProgress(v190.animationTrack.Name, "Playing");
                return ;
            else
                return ;
            end;
        else
            v183:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.ToolHold);
            return ;
        end;
    else
        v183:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.ToolHold);
        return ;
    end;
end;
v35.updateMoodAnimation = function(v191, v192, v193, v194)
    assert(not v192.isInPPE, "Should not be in PPE");
    if not (v193.moodAssetId ~= nil) or v194.moodAnimStringValues == nil then
        v191:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.Mood);
        return ;
    else
        assert(v193.moodAssetId, "assetIdsToLoad.moodAssetId is non-nil. Silence type checker");
        assert(v194.moodAnimStringValues, "loadedAssets.moodAnimStringValues is non-nil. Silence type checker");
        if not v8.animationTrackWithConnectionsIsPlayingThisAssetId(v191.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.Mood], v193.moodAssetId) then
            v191:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.Mood);
            assert(v194.moodAnimStringValues, "loadedAssets.moodAnimStringValues is not nil.  Silences type checker");
            local v195 = nil;
            local v196 = nil;
            if v194.moodAnimStringValues[1] then
                v196 = v194.moodAnimStringValues[1]:GetChildren();
            end;
            if v196 then
                local v197 = v196[1];
                if v197 then
                    assert(v197.ClassName == "Animation", "moodAnim should be an animation.");
                    v195 = v8.animatorLoadAnimationTrack(v191.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter, v197, v191.debugLoadAssetsFromFiles);
                end;
            end;
            if v195 then
                assert(v195, "moodAnimationTrack is not nil. Silences type checker");
                local v198 = {
                    assetId = v193.moodAssetId
                };
                v198.stoppedConnection = v195.Stopped:Connect(function()
                    v191:handleStoppedConnection(v195, v198);
                end);
                v198.endedConnection = v195.Ended:Connect(function()
                    v191:handleEndedConnection(v195);
                end);
                v198.animationTrack = v195;
                v198.animationTrack.Name = v191:getNextAnimationTrackName("Mood");
                assert(v191.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.Mood] == nil, "self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.Mood] should be empty");
                v191.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.Mood] = v198;
                v195:Play();
                v191:recordAnimationTrackProgress(v198.animationTrack.Name, "Playing");
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
end;
v35.updateCameraBasedMoodAnimation = function(v199, v200)
    assert(not v200.isInPPE, "Should not be in PPE");
    local v201 = v199.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.CameraStream];
    if v200.cameraButtonEnabled then
        if v201 then
            if not v200.receivedOutfitInfo or v200.canPlayCameraBasedMoodAnimation then
                if v8.animationTrackWithConnectionsIsPlaying(v201) then
                    v8.adjustATWCWeight(v201, 1);
                    return ;
                end;
            else
                v8.adjustATWCWeight(v201, 1.0E-4);
                return ;
            end;
        end;
        v199:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.CameraStream);
        local v202 = {};
        local v203 = v8.animatorLoadTrackerStreamAnimationTrack(v199.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter, Instance.new("TrackerStreamAnimation"), v199.debugLoadAssetsFromFiles);
        assert(v203, "cameraBasedMoodAnimationTrack is not nil. If it is ever nil, it should be investigated if a dependent flag is missing");
        v202.animationTrack = v203;
        v202.animationTrack.Name = v199:getNextAnimationTrackName("CameraBasedMoodAnimation");
        v202.stoppedConnection = v203.Stopped:Connect(function()
            v199:handleStoppedConnection(v203, v202);
            v199:handleEndedConnection(v203);
        end);
        v203.Priority = Enum.AnimationPriority.Action4;
        assert(v199.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.CameraStream] == nil, "self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.CameraStream] should be empty");
        v199.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.CameraStream] = v202;
        v203:Play();
        v199:recordAnimationTrackProgress(v202.animationTrack.Name, "Playing");
        if not (not v200.receivedOutfitInfo or v200.canPlayCameraBasedMoodAnimation) then
            v8.adjustATWCWeight(v202, 1.0E-4);
        end;
        return ;
    else
        v199:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.CameraStream);
        l_FaceAnimatorService_0:Stop();
        return ;
    end;
end;
v35.updateMainBodyAnimationAfterPlayingLookAround = function(v204, v205, v206, v207)
    assert(not v205.isInPPE, "Should not be in PPE");
    local l_mainBodyAnimStringValues_0 = v207.mainBodyAnimStringValues;
    local l_mainBodyAssetId_0 = v206.mainBodyAssetId;
    if not l_mainBodyAnimStringValues_0 then
        local v210, v211 = v204:getFallbackMainBodyAnimStringValuesAndMockAssetId(v205);
        l_mainBodyAnimStringValues_0 = v210;
        l_mainBodyAssetId_0 = v211;
    end;
    local v212 = nil;
    if l_mainBodyAnimStringValues_0 then
        local v213, _ = v8.getWeightedAnimations(v8.convertToAnimations(l_mainBodyAnimStringValues_0[1]:GetChildren()));
        local v215 = nil;
        local v216 = nil;
        for v217, v218 in next, v213, nil do
            if not (v215 ~= nil) or v218 < v216 then
                v215 = v217;
                v216 = v218;
            end;
        end;
        if v215 then
            v212 = v8.animatorLoadAnimationTrack(v204.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter, v215, v204.debugLoadAssetsFromFiles);
        end;
    end;
    if v212 and l_mainBodyAssetId_0 then
        assert(v212, "lookAroundTrack is not nil. Silences type checker");
        assert(l_mainBodyAssetId_0, "assetId is not nil. Silences type checker");
        if not v8.animationTrackWithConnectionsIsPlayingThisAssetId(v204.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.LookAround], l_mainBodyAssetId_0) then
            v204:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.LookAround);
            v204:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.MainBody);
            v212.Looped = true;
            local v219 = {
                assetId = l_mainBodyAssetId_0
            };
            v219.stoppedConnection = v212.Stopped:Connect(function()
                v204:handleStoppedConnection(v212, v219);
            end);
            v219.endedConnection = v212.Ended:Connect(function()
                v204:handleEndedConnection(v212);
            end);
            v219.didLoopConnection = v212.DidLoop:Connect(function()
                if not v204.destroyed then
                    v204:recordAnimationTrackProgress(v212.Name, "Looped");
                    v204:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.LookAround);
                    v204:updateMainBodyAnimation(v205, v206, v207);
                    return ;
                else
                    return ;
                end;
            end);
            v219.animationTrack = v212;
            v219.animationTrack.Name = v204:getNextAnimationTrackName("LookAround");
            assert(v204.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.LookAround] == nil, "self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.LookAround] should be empty");
            v204.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.LookAround] = v219;
            v212:Play(0.1);
            v204:recordAnimationTrackProgress(v219.animationTrack.Name, "Playing");
            return ;
        else
            return ;
        end;
    else
        v204:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.LookAround);
        v204:updateMainBodyAnimation(v205, v206, v207);
        return ;
    end;
end;
v35.updateMainBodyAnimation = function(v220, v221, v222, v223)
    assert(not v221.isInPPE, "Should not be in PPE");
    local l_mainBodyAnimStringValues_1 = v223.mainBodyAnimStringValues;
    local l_mainBodyAssetId_1 = v222.mainBodyAssetId;
    if not l_mainBodyAnimStringValues_1 then
        local v226, v227 = v220:getFallbackMainBodyAnimStringValuesAndMockAssetId(v221);
        l_mainBodyAnimStringValues_1 = v226;
        l_mainBodyAssetId_1 = v227;
    end;
    if (not l_mainBodyAnimStringValues_1 or not l_mainBodyAssetId_1) or #l_mainBodyAnimStringValues_1 == 0 then
        v220:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.LookAround);
        v220:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.MainBody);
        return ;
    else
        assert(l_mainBodyAnimStringValues_1, "animStringValues is not nil. Silences type checker");
        assert(l_mainBodyAssetId_1, "assetId is not nil.  Silences type checker");
        local v228 = v220.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.MainBody];
        local v229 = v220.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.LookAround];
        if not v8.animationTrackWithConnectionsIsPlayingThisAssetId(v228, l_mainBodyAssetId_1) then
            if not v8.animationTrackWithConnectionsIsPlayingThisAssetId(v229, l_mainBodyAssetId_1) then
                local v230 = 1;
                if v220.shouldMoveToNextValidMainBodyAnimation then
                    v230 = v230 % #l_mainBodyAnimStringValues_1 + 1;
                end;
                local v231, v232 = v220:selectBestMainBodyAnimation(l_mainBodyAnimStringValues_1, v230);
                if not v231 then
                    v220:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.LookAround);
                    v220:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.MainBody);
                    return ;
                else
                    v220:playMainBodyAnimation(v231, l_mainBodyAnimStringValues_1, l_mainBodyAssetId_1, v232);
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
end;
v35.playMainBodyAnimation = function(v233, v234, v235, v236, v237, v238)
    local v239 = v238 or 0;
    local v240 = v8.animatorLoadAnimationTrack(v233.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter, v234, v233.debugLoadAssetsFromFiles);
    if v240 then
        assert(v240, "animationTrack is not nil.  Silences type checker");
        local l_PlayingSwimAnimation_0 = v233.store:getState().AvatarExperience.AvatarScene.Character.PlayingSwimAnimation;
        local v242 = v8.isSwimAnimation(v234);
        if l_PlayingSwimAnimation_0 ~= v242 then
            v233.store:dispatch(v14(v242));
        end;
        v240.Looped = true;
        local v243 = {
            assetId = v236
        };
        v243.stoppedConnection = v240.Stopped:Connect(function()
            v233:handleStoppedConnection(v240, v243);
        end);
        v243.endedConnection = v240.Ended:Connect(function()
            v233:handleEndedConnection(v240);
        end);
        v243.didLoopConnection = v240.DidLoop:Connect(function()
            if not v233.destroyed then
                v233:recordAnimationTrackProgress(v240.Name, "Looped");
                local v244 = v233.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.MainBody];
                if v244 == nil then
                    return ;
                else
                    assert(v244, "mainBodyAnimationTrackWithConnections is non nil. Silence type checker");
                    if v244.animationTrack ~= v240 then
                        return ;
                    elseif v233.started then
                        v239 = v239 + 1;
                        local v245, v246 = v8.getWeightedAnimations(v8.convertToAnimations((v235[v237]:GetChildren())));
                        local v247 = v8.getRandomAnimation(v245, v246) or v234;
                        assert(v247, "newAnimation not nil.  Silences type checker");
                        local v248 = false;
                        if v239 % 4 == 0 then
                            if not v233.shouldMoveToNextValidMainBodyAnimation then
                                v233.shouldMoveToNextValidMainBodyAnimation = true;
                            else
                                v233.shouldMoveToNextValidMainBodyAnimation = false;
                            end;
                            v248 = true;
                        end;
                        if v248 or v247 ~= v234 then
                            v233:playMainBodyAnimation(v247, v235, v236, v237);
                        end;
                        return ;
                    else
                        v240:Stop();
                        return ;
                    end;
                end;
            else
                return ;
            end;
        end);
        v233:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.LookAround);
        v233:stopAnimationTrackWithConnections(l_AnimationTrackWithConnectionsTypes_0.MainBody);
        v243.animationTrack = v240;
        v243.animationTrack.Name = v233:getNextAnimationTrackName("MainBody");
        assert(v233.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.MainBody] == nil, "self.animationTrackWithConnectionsByType[AnimationTrackWithConnectionsTypes.MainBody] should be empty");
        v233.animationTrackWithConnectionsByType[l_AnimationTrackWithConnectionsTypes_0.MainBody] = v243;
        v240:Play(0.1);
        v233:recordAnimationTrackProgress(v243.animationTrack.Name, "Playing");
        return ;
    else
        return ;
    end;
end;
v35.selectBestMainBodyAnimation = function(v249, v250, v251)
    local v252, v253 = v249:findNextPlayableWeightedAnimations(v250, v251);
    local v254, v255 = next(v252);
    if v254 then
        local l_v254_0 = v254;
        local l_v255_0 = v255;
        for v258, v259 in v252, nil, nil do
            if l_v255_0 < v259 then
                l_v254_0 = v258;
                l_v255_0 = v259;
            end;
        end;
        return l_v254_0, v253;
    else
        return nil, v253;
    end;
end;
v35.findNextPlayableWeightedAnimations = function(_, v261, v262)
    for _ = 1, #v261 do
        local v264 = if not v261[v262] then nil else v261[v262]:GetChildren();
        if v264 then
            local v265, v266 = v8.getWeightedAnimations((v8.convertToAnimations(v264)));
            if v266 > 0 then
                return v265, v262;
            end;
        end;
        v262 = v262 % #v261 + 1;
    end;
    return {}, v262;
end;
v35.getFallbackMainBodyAnimStringValuesAndMockAssetId = function(v267, v268)
    local l_CurrentCharacter_7 = v267.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
    assert(l_CurrentCharacter_7, "currentCharacter is not nil");
    if not v268.isAvatarBackground then
        local l_IdleAnimation_0 = l_AssetTypeIdStrings_0.IdleAnimation;
        if not (not v268.pageIsEditorAnimations or not v268.curCategoryInfo) then
            l_IdleAnimation_0 = v8.getAssetTypeIdStringForCategory(v268.curCategoryInfo);
        end;
        local v271 = v267:getAnimStringValuesAssignedToCharacter(l_IdleAnimation_0, l_CurrentCharacter_7);
        local v272 = nil;
        if not (not v271 or not l_IdleAnimation_0) then
            v272 = "character_" .. l_IdleAnimation_0;
        end;
        return v271, v272;
    else
        local l_wave_0 = l_CurrentCharacter_7.Animations:FindFirstChild("wave");
        if not l_wave_0 then
            return nil, nil;
        else
            return {
                l_wave_0
            }, "character_defaultWave";
        end;
    end;
end;
v35.getAnimStringValuesAssignedToCharacter = function(v274, v275, v276)
    local l_AvatarType_0 = v274.store:getState().AvatarExperience.AvatarEditor.Character.AvatarType;
    local v278 = {};
    if v276 then
        assert(v276, "currentCharacter is not nil.  Silences type checker");
        local l_Animations_1 = v276:FindFirstChild("Animations");
        if l_Animations_1 == nil then
            return nil;
        else
            assert(l_Animations_1, "animations is not nil.  Silences type checker");
            if v275 == l_AssetTypeIdStrings_0.ClimbAnimation then
                table.insert(v278, l_Animations_1:FindFirstChild("climb"));
            elseif v275 == l_AssetTypeIdStrings_0.FallAnimation then
                table.insert(v278, l_Animations_1:FindFirstChild("fall"));
            elseif v275 == l_AssetTypeIdStrings_0.IdleAnimation then
                table.insert(v278, l_Animations_1:FindFirstChild("idle"));
            elseif v275 == l_AssetTypeIdStrings_0.JumpAnimation then
                table.insert(v278, l_Animations_1:FindFirstChild("jump"));
            elseif v275 == l_AssetTypeIdStrings_0.RunAnimation then
                table.insert(v278, l_Animations_1:FindFirstChild("run"));
            elseif v275 == l_AssetTypeIdStrings_0.WalkAnimation then
                table.insert(v278, l_Animations_1:FindFirstChild("walk"));
            elseif v275 == l_AssetTypeIdStrings_0.EmoteAnimation then
                table.insert(v278, l_Animations_1:FindFirstChild("idle"));
            elseif v275 == l_AssetTypeIdStrings_0.SwimAnimation then
                if l_AvatarType_0 == v10.AvatarType.R15 then
                    table.insert(v278, l_Animations_1:FindFirstChild("swim"));
                    table.insert(v278, l_Animations_1:FindFirstChild("swimidle"));
                else
                    local l_run_0 = l_Animations_1:FindFirstChild("run");
                    if l_run_0 then
                        local v281 = l_run_0:Clone();
                        v281.Name = "swim";
                        table.insert(v278, v281);
                    end;
                end;
            end;
            return v8.convertToStringValues(v278);
        end;
    else
        return nil;
    end;
end;
v35.stopAnimationTrackWithConnections = function(v282, v283, v284)
    local v285 = v282.animationTrackWithConnectionsByType[v283];
    if v285 then
        if v285.didLoopConnection then
            v285.didLoopConnection:Disconnect();
        end;
        v282.animationTrackWithConnectionsByType[v283] = nil;
        if not v8.animationTrackWithConnectionsIsPlaying(v285) then
            if not (not v285 or not v285.animationTrack) then
                v285.animationTrack:Destroy();
            end;
        else
            assert(v285, "animationTrackWithConnections is not nil. Silences type checker");
            assert(v285.animationTrack, "animationTrackWithConnections.animationTrack is not nil. Silences type checker");
            v285.animationTrack:Stop(v284);
            return ;
        end;
    end;
end;
v35.handleStoppedConnection = function(v286, v287, v288)
    if not v286.destroyed then
        v286:recordAnimationTrackProgress(v287.Name, "Stopped");
        assert(v287, "animationTrack should be non-nil");
        assert(v287.Name, "animationTrack name should be set");
        assert(v286.stoppedButNotEndedATWCsByName[v287.Name] == nil, "animationTrack should not be in stoppedButNotEndedATWCsByName yet");
        v286.stoppedButNotEndedATWCsByName[v287.Name] = v288;
        return ;
    else
        return ;
    end;
end;
v35.handleEndedConnection = function(v289, v290)
    assert(v290, "originalTrack should exist");
    if not v289.destroyed then
        v289:recordAnimationTrackProgress(v290.Name, "Ended");
        if not v289.stoppedButNotEndedATWCsByName[v290.Name] then
            v32:info(string.format("\"%s\" missing from self.stoppedButNotEndedATWCsByName: ", v290.Name) .. v289:getAnimationTrackRecordString(v290.Name));
            if not v33 then
                v15("originalTrack missing from self.stoppedButNotEndedATWCsByName");
            end;
        end;
        v290:Destroy();
        v289.stoppedButNotEndedATWCsByName[v290.Name] = nil;
        if v289.started then
            v289:maybeProceedWithPPEPosing();
        end;
        return ;
    else
        return ;
    end;
end;
v35.setOnUpdateFinished = function(v291, v292)
    v291.onUpdateFinished = v292;
end;
v35.setDebugLoadAssetsFromFiles = function(v293, v294, v295)
    v293.debugLoadAssetsFromFiles = v294;
    v293.mapAssetIdToFileName = v295;
end;
v35.getNextAnimationTrackName = function(v296, v297)
    v296.animationTrackNameIndex = v296.animationTrackNameIndex + 1;
    return "AnimationTrack_" .. v297 .. "_" .. tostring(v296.animationTrackNameIndex);
end;
v35.recordAnimationTrackProgress = function(v298, v299, v300)
    if v298.animationTrackNameToHistory == nil then
        v298.animationTrackNameToHistory = {};
    end;
    local v301 = v298.animationTrackNameToHistory[v299];
    if v301 == nil then
        v301 = {};
        v298.animationTrackNameToHistory[v299] = v301;
    end;
    table.insert(v301, v300);
end;
v35.getAnimationTrackRecordString = function(v302, v303)
    local v304 = "Name = " .. v303;
    local v305 = v302.animationTrackNameToHistory[v303];
    if v305 == nil then
        v305 = {};
    end;
    for _, v307 in v305, nil, nil do
        v304 = v304 .. ", " .. v307;
    end;
    return v304;
end;
return v35;
