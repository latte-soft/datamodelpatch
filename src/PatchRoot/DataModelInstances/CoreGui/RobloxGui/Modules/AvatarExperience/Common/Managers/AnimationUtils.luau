local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_InsertService_0 = game:GetService("InsertService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v7 = require(l_Modules_0.LuaApp.mutedError);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v9 = require(l_Modules_0.AvatarExperience.Common.MockAnimationTrack);
local v10 = require(l_Modules_0.AvatarExperience.Common.MockAnimationStreamTrack);
local _ = require(l_Modules_0.AvatarExperience.Common.CategoryTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.Managers.AnimationManagerTypes);
local v14 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectIsTryingOnClassicOrDynamicHead);
local v15 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOutfitTryOnEmoteAnimationAssetId);
local v16 = require(l_CorePackages_0.Cryo);
local v17 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v18 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local v21 = require(l_Modules_0.AvatarExperience.Common.Enum.CatalogCategories);
local v22 = require(l_CorePackages_0.tutils);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_AssetTypeIdStrings_0 = v17.AssetTypeIdStrings;
local v25 = game:DefineFastFlag("FixRiseInAnimationManagerErrors", false);
local v44 = {
    DefaultAnimations = {
        R15 = {
            TOOL = 507768375, 
            WAVE_EMOTE = 507770239
        }, 
        R6 = {
            CLIMB = 180436334, 
            FALL = 180436148, 
            IDLE = 180435571, 
            IDLE_LOOK_AROUND = 180435792, 
            JUMP = 125750702, 
            RUN = 180426354, 
            SIT = 178130996, 
            TOOL_NONE = 182393478, 
            WALK = 180426354, 
            TOOL = 182393478
        }
    }, 
    loadAnimationModel = function(v26, v27, v28)
        if v26 then
            local v29 = nil;
            local _, l_result_1 = pcall(function()
                if not v27 or not v28 then
                    if not v25 then
                        v29 = l_InsertService_0:LoadAsset(v26);
                        return ;
                    else
                        local v30 = nil;
                        local l_BindableEvent_0 = Instance.new("BindableEvent");
                        task.spawn(function()
                            local l_status_0, l_result_0 = pcall(function()
                                v29 = l_InsertService_0:LoadAsset(v26);
                            end);
                            if not l_status_0 then
                                v30 = l_result_0;
                            end;
                            l_BindableEvent_0:Fire();
                        end);
                        l_BindableEvent_0.Event:Wait();
                        if v30 then
                            error(v30);
                        end;
                        return ;
                    end;
                else
                    v29 = l_InsertService_0:LoadLocalAsset("rbxasset://" .. v28(v26));
                    return ;
                end;
            end);
            if not l_result_1 and v29 then
                return v29;
            else
                warn(l_result_1);
                return nil;
            end;
        else
            return nil;
        end;
    end, 
    isSwimAnimation = function(v36)
        if v36.Parent and v36.Parent.Name == "swim" then
            return true;
        else
            return false;
        end;
    end, 
    createStringValue = function(v37, v38)
        local l_StringValue_0 = Instance.new("StringValue");
        l_StringValue_0.Parent = v37;
        l_StringValue_0.Name = v38;
        return l_StringValue_0;
    end, 
    createAnimation = function(v40, v41, v42)
        local l_Animation_0 = Instance.new("Animation");
        l_Animation_0.Parent = v40;
        l_Animation_0.AnimationId = "http://www.roblox.com/asset/?id=" .. v42;
        l_Animation_0.Name = v41;
        return l_Animation_0;
    end
};
v44.createR6AnimationFolder = function()
    local l_Folder_0 = Instance.new("Folder");
    v44.createAnimation(v44.createStringValue(l_Folder_0, "climb"), "ClimbAnim", v44.DefaultAnimations.R6.CLIMB);
    v44.createAnimation(v44.createStringValue(l_Folder_0, "fall"), "FallAnim", v44.DefaultAnimations.R6.FALL);
    local v46 = v44.createStringValue(l_Folder_0, "idle");
    v44.createAnimation(v46, "Animation1", v44.DefaultAnimations.R6.IDLE);
    v44.createAnimation(v46, "Animation2", v44.DefaultAnimations.R6.IDLE_LOOK_AROUND);
    v44.createAnimation(v44.createStringValue(l_Folder_0, "jump"), "JumpAnim", v44.DefaultAnimations.R6.JUMP);
    v44.createAnimation(v44.createStringValue(l_Folder_0, "run"), "RunAnim", v44.DefaultAnimations.R6.RUN);
    v44.createAnimation(v44.createStringValue(l_Folder_0, "sit"), "SitAnim", v44.DefaultAnimations.R6.SIT);
    v44.createAnimation(v44.createStringValue(l_Folder_0, "toolnone"), "ToolNoneAnim", v44.DefaultAnimations.R6.TOOL_NONE);
    v44.createAnimation(v44.createStringValue(l_Folder_0, "walk"), "WalkAnim", v44.DefaultAnimations.R6.WALK);
    v44.createAnimation(l_Folder_0, "Tool", v44.DefaultAnimations.R6.TOOL);
    return l_Folder_0;
end;
v44.convertToStringValues = function(v47)
    for _, v49 in v47, nil, nil do
        if v49.ClassName ~= "StringValue" then
            v7("instance should be StringValue.");
            return {};
        end;
    end;
    return v47;
end;
v44.convertToAnimations = function(v50)
    for _, v52 in v50, nil, nil do
        if v52.ClassName ~= "Animation" then
            v7("instance should be Animation.");
            return {};
        end;
    end;
    return v50;
end;
v44.getWeightedAnimations = function(v53)
    local v54 = {};
    local v55 = 0;
    for _, v57 in next, v53, nil do
        local l_Weight_0 = v57:FindFirstChild("Weight");
        local v59 = not l_Weight_0 and 1 or l_Weight_0.Value;
        if v59 > 0 then
            v54[v57] = v59;
            v55 = v55 + v59;
        end;
    end;
    return v54, v55;
end;
v44.getHumanoidFromCharacter = function(v60)
    if not v60 then
        return nil;
    else
        return v60:FindFirstChildOfClass("Humanoid");
    end;
end;
v44.getAnimatorFromCharacter = function(v61)
    local v62 = v44.getHumanoidFromCharacter(v61);
    if not v62 then
        return nil;
    else
        return v62:FindFirstChildOfClass("Animator");
    end;
end;
v44.animationTrackWithConnectionsIsPlaying = function(v63)
    if v63 then
        assert(v63, "animationTrackWithId should be non-nil. Silence type checker.");
        if v63.animationTrack then
            assert(v63.animationTrack, "animationTrackWithId.animationTrack should be non-nil. Silence type checker.");
            return v63.animationTrack.IsPlaying;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v44.animationTrackWithConnectionsIsPlayingThisAssetId = function(v64, v65)
    if not (v64 and v64.assetId == v65) or not v44.animationTrackWithConnectionsIsPlaying(v64) then
        return false;
    else
        return true;
    end;
end;
v44.getRandomAnimation = function(v66, v67)
    local v68 = math.random() * v67;
    for v69, v70 in next, v66, nil do
        if v68 <= v70 then
            return v69;
        else
            v68 = v68 - v70;
        end;
    end;
    return nil;
end;
v44.animatorLoadAnimationTrack = function(v71, v72, v73)
    local v74 = v44.getAnimatorFromCharacter(v71);
    if not v74 then
        return nil;
    elseif not v73 then
        return v74:LoadAnimation(v72);
    else
        return (v9.new());
    end;
end;
v44.animatorLoadTrackerStreamAnimationTrack = function(v75, v76, v77)
    local v78 = v44.getAnimatorFromCharacter(v75);
    if not v78 then
        return nil;
    elseif not v77 then
        assert(l_Players_0, "assert Players cannot be nil. Silences type checker");
        assert(l_Players_0.LocalPlayer, "assert LocalPlayer is not nil. Silences type checker");
        return v78:LoadStreamAnimationForSelfieView_deprecated(v76, l_Players_0.LocalPlayer);
    else
        return (v10.new());
    end;
end;
v44.loadAnimStringValuesFromString = function(v79, v80, v81)
    local v82 = tonumber(v79);
    if v82 then
        assert(v82, "assetIdAsNumber is not nil. Silences type checker");
        local v83 = v44.loadAnimationModel(v82, v80, v81);
        if v83 then
            assert(v83, "animationModel is not nil. Silence type checker.");
            local l_R15Anim_0 = v83:FindFirstChild("R15Anim");
            if not l_R15Anim_0 then
                local v85 = {};
                for _, v87 in v83:GetChildren() do
                    if v87:IsA("Animation") then
                        local l_StringValue_1 = Instance.new("StringValue");
                        l_StringValue_1.Name = v87.Name;
                        v87.Parent = l_StringValue_1;
                        v85[#v85 + 1] = l_StringValue_1;
                    end;
                end;
                if #v85 > 0 then
                    return v85;
                else
                    return nil;
                end;
            else
                return v44.convertToStringValues(l_R15Anim_0:GetChildren());
            end;
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
v44.getAssetTypeIdStringForCategory = l_memoize_0(function(v89)
    if not (not v89 or not v89.AssetTypeIdStrings) and #v89.AssetTypeIdStrings == 1 then
        return v89.AssetTypeIdStrings[1];
    else
        return nil;
    end;
end);
v44.hasMissingIds = l_memoize_0(function(v90, v91)
    if v90 ~= nil and next(v90) then
        for v92, _ in v90, nil, nil do
            if not v91[v92] then
                return true;
            end;
        end;
        return false;
    else
        return false;
    end;
end);
v44.getEquippedAssetsSummary = l_memoize_0(function(v94)
    local v95 = {};
    if v94 then
        for v96, v97 in v94, nil, nil do
            if not v6.assetTypeIdIsAnimationOrEmote(v96) then
                local v98 = {};
                for v99, _ in v97, nil, nil do
                    v98[v99] = true;
                end;
                v95[v96] = v98;
            end;
        end;
    end;
    return v95;
end);
v44.getEquippedAssetSummariesMatch = l_memoize_0(function(v101, v102)
    return v22.deepEqual(v101, v102);
end);
v44.getOutfitTryOnSummary = l_memoize_0(function(v103)
    local v104 = {};
    if not (not v103 or not v103.TryOnItems) then
        for v105, v106 in v103.TryOnItems, nil, nil do
            if not (not (not (v106.itemType == v17.ItemType.Bundle) or v106.itemSubType ~= v17.BundleTypeIdStrings.Animations) or v106.itemType == v17.ItemType.Asset and v6.assetTypeIdIsAnimationOrEmote(v106.itemSubType)) then
                v104[v105] = {
                    itemType = v106.itemType, 
                    itemSubType = v106.itemSubType
                };
            end;
        end;
    end;
    return v104;
end);
v44.getOutfitTryOnSummariesMatch = l_memoize_0(function(v107, v108)
    return v22.deepEqual(v107, v108);
end);
v44.getEquippedAssetsSummaryHasNewItems = l_memoize_0(function(v109, v110)
    for v111, v112 in v109, nil, nil do
        local v113 = {};
        if v110[v111] then
            v113 = v110[v111];
        end;
        if v44.hasMissingIds(v112, v113) then
            return true;
        end;
    end;
    return false;
end);
v44.getOutfitTryOnSummaryHasNewItems = function(v114, v115)
    for v116, _ in v114, nil, nil do
        if not v115[v116] then
            return true;
        end;
    end;
    return false;
end;
v44.cleanupAnimationTrackWithConnections = function(v118)
    if v118 then
        assert(v118, "Assert animationTrackWithConnections is not nil, silence type checker");
        if v118.stoppedConnection then
            v118.stoppedConnection:Disconnect();
            v118.stoppedConnection = nil;
        end;
        if v118.endedConnection then
            v118.endedConnection:Disconnect();
            v118.endedConnection = nil;
        end;
        if v118.didLoopConnection then
            v118.didLoopConnection:Disconnect();
            v118.didLoopConnection = nil;
        end;
        if v118.animationTrack then
            v118.animationTrack:Stop();
            v118.animationTrack:Destroy();
            v118.animationTrack = nil;
        end;
        return ;
    else
        return ;
    end;
end;
v44.getDidMoveOutOfPPE = function(v119, v120, v121)
    if v119 then
        if v120 then
            if not v121 then
                return true;
            end;
        else
            return true;
        end;
    end;
    return false;
end;
v44.getEquippedIdleAnimation = function(v122)
    local l_EquippedAssets_0 = v122.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local v124 = l_EquippedAssets_0 and l_EquippedAssets_0[l_AssetTypeIdStrings_0.IdleAnimation];
    return not not v124 and next(v124) or nil;
end;
v44.ableToAnimateHead = function(v125)
    local v126, v127, v128 = v14(v125);
    if not v126 then
        if not (v125.AvatarExperience.AvatarEditor.Character.AvatarType == v17.AvatarType.R6) then
            if not v127 then
                local l_EquippedAssets_1 = v125.AvatarExperience.AvatarEditor.Character.EquippedAssets;
                local v130 = l_EquippedAssets_1 and l_EquippedAssets_1[v17.AssetTypeIdStrings.DynamicHead];
                local v131 = false;
                if v130 ~= nil then
                    v131 = not v16.isEmpty(v130);
                end;
                return v131, v128;
            else
                return true, v128;
            end;
        else
            return false, v128;
        end;
    else
        return false, v128;
    end;
end;
v44.adjustATWCWeight = function(v132, v133)
    if v132.animationTrack then
        assert(v132.animationTrack, "assert animationTrackWithConnections.animationTrack is not nil. Silences Type checker");
        v132.animationTrack:AdjustWeight(v133);
    end;
end;
v44.getAllowsTryingEmotesOrAnimations = function(v134, v135)
    local l_name_0 = v135.opaque.name;
    local v137 = v18.getCategoryInfoFromState(v134, v135);
    if not (v137.PageType ~= v17.PageType.AllAnimation and l_name_0 ~= v19.CatalogSearch) or v137.NavigationKey == v21.Recommended then
        return true, true;
    else
        return v137.PageType == v17.PageType.Emotes, v137.PageType == v17.PageType.Animation;
    end;
end;
v44.canPlayCameraBasedMoodAnimation = function(v138, v139, v140)
    if v139 then
        local v141 = v15(v138);
        local l_LastAnimOrEmoteToggledItem_0 = v138.AvatarExperience.AvatarScene.OutfitTryOn.LastAnimOrEmoteToggledItem;
        local v143 = not not l_LastAnimOrEmoteToggledItem_0 and l_LastAnimOrEmoteToggledItem_0.itemId == v141;
        local v144, v145 = v44.ableToAnimateHead(v138);
        return v144 and not (v143 and v140), v145;
    else
        return false, true;
    end;
end;
v44.waitForAnimationAndPosingToResolve = function(v146)
    task.spawn(function()
        l_RunService_0.PreAnimation:Wait();
        l_RunService_0.PostSimulation:Wait();
        v146();
    end);
end;
return v44;
