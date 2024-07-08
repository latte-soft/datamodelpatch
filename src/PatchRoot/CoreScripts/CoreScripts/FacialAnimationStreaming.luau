local _ = game:GetService("VRService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("RobloxReplicatedStorage");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v8 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v9 = require(l_RobloxGui_0.Modules.Common.IXPServiceWrapper);
local v10 = require(l_RobloxGui_0.Modules.Logger):new(script.Name);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.CallProtocol).CallProtocol.default;
local l_Enums_0 = require(l_CorePackages_0.Workspace.Packages.CallProtocol).Enums;
local l_game_EngineFeature_0 = game:GetEngineFeature("LoadStreamAnimationReplaceErrorsWithTelemetryFeature");
local l_game_EngineFeature_1 = game:GetEngineFeature("FaceAnimatorNotifyLODRecommendCameraInputDisable");
local v15 = game:DefineFastFlag("FacialAnimationStreamingClearTrackImprovementsV2", false);
game:DefineFastFlag("FacialAnimationStreamingValidateAnimatorBeforeRemoving", false);
game:DefineFastFlag("FacialAnimationStreamingSearchForReplacementWhenRemovingAnimator", false);
game:DefineFastFlag("StopStreamTrackOnDeath", false);
game:DefineFastFlag("FacialAnimationStreamingClearAllConnectionsFix", false);
game:DefineFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C", false);
local v16 = game:DefineFastFlag("FacialAnimationStreamingCheckPauseStateAfterEmote2", false);
local v17 = require(l_RobloxGui_0.Modules.Flags.GetFFlagAvatarChatServiceEnabled);
local v18 = if not v17() then nil else game:GetService("AvatarChatService");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local l_FacialAnimationStreamingServiceV2_0 = game:GetService("FacialAnimationStreamingServiceV2");
local v21 = game:DefineFastFlag("UXForCameraPerformanceEnabled", false);
local v22 = game:DefineFastInt("UXForCameraPerformanceSessionDelay", 300);
local v23 = game:DefineFastInt("UXForCameraPerformanceDeviceDelay", 43200);
local v24 = require(l_RobloxGui_0.Modules.Flags.GetFFlagUXForCameraPerformanceIXPEnabled);
local v25 = require(l_RobloxGui_0.Modules.Flags.GetFStringUXForCameraPerformanceIXPLayerName);
local v26 = require(l_RobloxGui_0.Modules.FacialAnimationStreaming.FacialAnimationStreamingHeartbeatStats);
if l_FaceAnimatorService_0 and l_FacialAnimationStreamingServiceV2_0 then
    l_FaceAnimatorService_0.FlipHeadOrientation = true;
    local v27 = require(l_RobloxGui_0.Modules.Emote.EmoteHelper);
    local v28 = require(l_RobloxGui_0.Modules.Tracker.TrackerMenu);
    local v29 = require(l_RobloxGui_0.Modules.Tracker.TrackerPromptType);
    local l_default_1 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
    local v31 = {
        CharacterAdded = "CharacterAdded", 
        CharacterRemoving = "CharacterRemoving", 
        CharacterDescendantAdded = "CharacterDescendantAdded", 
        CharacterDescendantRemoving = "CharacterDescendantRemoving", 
        AnimatorDataModelReady = "AnimatorDataModelReady", 
        PlayerEmoted = "PlayerEmoted", 
        PlayerChatted = "PlayerChatted", 
        EmoteFinished = "EmoteFinished", 
        PlayerDied = "PlayerDied"
    };
    local _ = v8:FormatByKey("Feature.FaceChat.Message.PlaceUnavailable");
    local v33 = false;
    local v34 = os.time();
    local v35 = {};
    local v36 = {};
    local v37 = {};
    local v38 = {};
    local v39 = {};
    local v40 = {};
    local v41 = nil;
    local v42 = nil;
    local v43 = nil;
    local v44 = nil;
    local v45 = nil;
    local function _(v46, v47)
        local v48 = "";
        local v49 = "";
        if v47 then
            if v47.UserId then
                v48 = tostring(v47.UserId);
            end;
            if v47.Name then
                v49 = v47.Name;
            end;
        end;
        v10:trace(string.format("%s {id: %s, name: %s}.", v46, v48, v49));
    end;
    local function _(v51, v52)
        if not (not v38[v51.UserId] or not v38[v51.UserId][v52]) then
            v38[v51.UserId][v52]:Disconnect();
            v38[v51.UserId][v52] = nil;
        end;
    end;
    local function v59(v54)
        if not game:GetFastFlag("FacialAnimationStreamingClearAllConnectionsFix") then
            for _, v56 in ipairs(v31) do
                if not (not v38[v54.UserId] or not v38[v54.UserId][v56]) then
                    v38[v54.UserId][v56]:Disconnect();
                    v38[v54.UserId][v56] = nil;
                end;
            end;
        else
            for _, v58 in pairs(v31) do
                if not (not v38[v54.UserId] or not v38[v54.UserId][v58]) then
                    v38[v54.UserId][v58]:Disconnect();
                    v38[v54.UserId][v58] = nil;
                end;
            end;
        end;
        v38[v54.UserId] = {};
    end;
    local function v63(v60)
        local v61 = "";
        local v62 = "";
        if v60 then
            if v60.UserId then
                v61 = tostring(v60.UserId);
            end;
            if v60.Name then
                v62 = v60.Name;
            end;
        end;
        v10:trace(string.format("%s {id: %s, name: %s}.", "clearCharacterAnimations", v61, v62));
        if v37[v60.UserId] then
            if not v15 then
                if v37[v60.UserId].animation then
                    v37[v60.UserId].animation:Destroy();
                    v37[v60.UserId].animation = nil;
                end;
                if v37[v60.UserId].animationTrack then
                    v37[v60.UserId].animationTrack:Stop(0);
                    v37[v60.UserId].animationTrack:Destroy();
                    v37[v60.UserId].animationTrack = nil;
                end;
            else
                if v37[v60.UserId].animationTrack then
                    v37[v60.UserId].animationTrack:Stop(0);
                    v37[v60.UserId].animationTrack = nil;
                end;
                if v37[v60.UserId].animation then
                    v37[v60.UserId].animation = nil;
                end;
            end;
            v37[v60.UserId] = nil;
        end;
    end;
    local function v65(v64)
        if not v64 or not v64.Character then
            return nil;
        else
            return v64.Character:FindFirstChildWhichIsA("FaceControls", true);
        end;
    end;
    local function v67(v66)
        if not v66.Character then
            return nil;
        else
            return v66.Character:FindFirstChildOfClass("Humanoid");
        end;
    end;
    local function v70(v68)
        local v69 = if not v68.Character then nil else v68.Character:FindFirstChildOfClass("Humanoid");
        if not v69 then
            return nil;
        else
            return v69:FindFirstChildOfClass("Animator");
        end;
    end;
    local function _(v71)
        if not (not v37[v71.UserId] or not v37[v71.UserId].animationTrack) then
            local v72 = "";
            local v73 = "";
            if v71 then
                if v71.UserId then
                    v72 = tostring(v71.UserId);
                end;
                if v71.Name then
                    v73 = v71.Name;
                end;
            end;
            v10:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v72, v73));
            v37[v71.UserId].animationTrack:AdjustWeight(0.1, 0.5);
        end;
    end;
    local function _(v75)
        if not (not v37[v75.UserId] or not v37[v75.UserId].animationTrack) then
            local v76 = "";
            local v77 = "";
            if v75 then
                if v75.UserId then
                    v76 = tostring(v75.UserId);
                end;
                if v75.Name then
                    v77 = v75.Name;
                end;
            end;
            v10:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", v76, v77));
            v37[v75.UserId].animationTrack:AdjustWeight(1, 0.5);
        end;
    end;
    local function _()
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if l_LocalPlayer_0 then
            if not (l_FaceAnimatorService_0.AudioAnimationEnabled or l_FaceAnimatorService_0.VideoAnimationEnabled) then
                if not (not v37[l_LocalPlayer_0.UserId] or not v37[l_LocalPlayer_0.UserId].animationTrack) then
                    local v80 = "";
                    local v81 = "";
                    if l_LocalPlayer_0 then
                        if l_LocalPlayer_0.UserId then
                            v80 = tostring(l_LocalPlayer_0.UserId);
                        end;
                        if l_LocalPlayer_0.Name then
                            v81 = l_LocalPlayer_0.Name;
                        end;
                    end;
                    v10:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v80, v81));
                    v37[l_LocalPlayer_0.UserId].animationTrack:AdjustWeight(0.1, 0.5);
                end;
            elseif not (not v37[l_LocalPlayer_0.UserId] or not v37[l_LocalPlayer_0.UserId].animationTrack) then
                local v82 = "";
                local v83 = "";
                if l_LocalPlayer_0 then
                    if l_LocalPlayer_0.UserId then
                        v82 = tostring(l_LocalPlayer_0.UserId);
                    end;
                    if l_LocalPlayer_0.Name then
                        v83 = l_LocalPlayer_0.Name;
                    end;
                end;
                v10:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", v82, v83));
                v37[l_LocalPlayer_0.UserId].animationTrack:AdjustWeight(1, 0.5);
                return ;
            end;
            return ;
        else
            return ;
        end;
    end;
    local function v98(v85, v86, v87)
        local v88 = string.format("handleEmote {isChatTriggered:%s}", (tostring(v87)));
        local v89 = "";
        local v90 = "";
        if v85 then
            if v85.UserId then
                v89 = tostring(v85.UserId);
            end;
            if v85.Name then
                v90 = v85.Name;
            end;
        end;
        v10:trace(string.format("%s {id: %s, name: %s}.", v88, v89, v90));
        if v86 then
            v88 = v31.EmoteFinished;
            if not (not v38[v85.UserId] or not v38[v85.UserId][v88]) then
                v38[v85.UserId][v88]:Disconnect();
                v38[v85.UserId][v88] = nil;
            end;
            if not (not v37[v85.UserId] or not v37[v85.UserId].animationTrack) then
                v88 = "";
                v89 = "";
                if v85 then
                    if v85.UserId then
                        v88 = tostring(v85.UserId);
                    end;
                    if v85.Name then
                        v89 = v85.Name;
                    end;
                end;
                v10:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v88, v89));
                v37[v85.UserId].animationTrack:AdjustWeight(0.1, 0.5);
            end;
            v38[v85.UserId][v31.EmoteFinished] = v27.createEmoteFinishEvent(v85, v86, v87):Connect(function()
                local l_v85_0 = v85;
                local l_EmoteFinished_0 = v31.EmoteFinished;
                if not (not v38[l_v85_0.UserId] or not v38[l_v85_0.UserId][l_EmoteFinished_0]) then
                    v38[l_v85_0.UserId][l_EmoteFinished_0]:Disconnect();
                    v38[l_v85_0.UserId][l_EmoteFinished_0] = nil;
                end;
                if not v16 then
                    l_v85_0 = v85;
                    if not (not v37[l_v85_0.UserId] or not v37[l_v85_0.UserId].animationTrack) then
                        l_EmoteFinished_0 = "";
                        local v93 = "";
                        if l_v85_0 then
                            if l_v85_0.UserId then
                                l_EmoteFinished_0 = tostring(l_v85_0.UserId);
                            end;
                            if l_v85_0.Name then
                                v93 = l_v85_0.Name;
                            end;
                        end;
                        v10:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", l_EmoteFinished_0, v93));
                        v37[l_v85_0.UserId].animationTrack:AdjustWeight(1, 0.5);
                    end;
                elseif not (l_FaceAnimatorService_0.AudioAnimationEnabled or l_FaceAnimatorService_0.VideoAnimationEnabled) then
                    l_EmoteFinished_0 = v85;
                    if not (not v37[l_EmoteFinished_0.UserId] or not v37[l_EmoteFinished_0.UserId].animationTrack) then
                        local v94 = "";
                        local v95 = "";
                        if l_EmoteFinished_0 then
                            if l_EmoteFinished_0.UserId then
                                v94 = tostring(l_EmoteFinished_0.UserId);
                            end;
                            if l_EmoteFinished_0.Name then
                                v95 = l_EmoteFinished_0.Name;
                            end;
                        end;
                        v10:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v94, v95));
                        v37[l_EmoteFinished_0.UserId].animationTrack:AdjustWeight(0.1, 0.5);
                        return ;
                    end;
                else
                    l_EmoteFinished_0 = v85;
                    if not (not v37[l_EmoteFinished_0.UserId] or not v37[l_EmoteFinished_0.UserId].animationTrack) then
                        local v96 = "";
                        local v97 = "";
                        if l_EmoteFinished_0 then
                            if l_EmoteFinished_0.UserId then
                                v96 = tostring(l_EmoteFinished_0.UserId);
                            end;
                            if l_EmoteFinished_0.Name then
                                v97 = l_EmoteFinished_0.Name;
                            end;
                        end;
                        v10:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", v96, v97));
                        v37[l_EmoteFinished_0.UserId].animationTrack:AdjustWeight(1, 0.5);
                        return ;
                    end;
                end;
            end);
        end;
    end;
    local function v103(v99, v100)
        if if not v99.Character then nil else v99.Character:FindFirstChildOfClass("Humanoid") then
            local v101 = nil;
            if string.sub(v100, 1, 3) == "/e " then
                v101 = string.sub(v100, 4);
            elseif string.sub(v100, 1, 7) == "/emote " then
                v101 = string.sub(v100, 8);
            end;
            if not (not v101 or not v27.LegacyDefaultEmotes[v101]) then
                wait(v27.EMOTE_LOOP_TRANSITION_WAIT_TIME);
                local v102 = v27.getAnyActiveDefaultChatTriggeredEmoteTrack(v99);
                if v102 then
                    v98(v99, v102, true);
                end;
            end;
        end;
    end;
    local function v118(v104, v105)
        if v105 then
            if v105.Parent and v105.Parent:IsA("Humanoid") then
                if not v37[v104.UserId] then
                    local l_AnimatorDataModelReady_0 = v31.AnimatorDataModelReady;
                    if not (not v38[v104.UserId] or not v38[v104.UserId][l_AnimatorDataModelReady_0]) then
                        v38[v104.UserId][l_AnimatorDataModelReady_0]:Disconnect();
                        v38[v104.UserId][l_AnimatorDataModelReady_0] = nil;
                    end;
                    l_AnimatorDataModelReady_0 = function()
                        local v107 = {
                            animation = Instance.new("TrackerStreamAnimation")
                        };
                        v107.animationTrack = v105:LoadStreamAnimation(v107.animation);
                        if not l_game_EngineFeature_0 or v107.animationTrack then
                            v107.animationTrack.Priority = Enum.AnimationPriority.Idle;
                            v107.animationTrack:Play(0.1, 1);
                            v37[v104.UserId] = v107;
                            local v108 = l_FaceAnimatorService_0.AudioAnimationEnabled or l_FaceAnimatorService_0.VideoAnimationEnabled;
                            if not (not (v104 == l_Players_0.LocalPlayer) or v108) then
                                local l_v104_0 = v104;
                                if not (not v37[l_v104_0.UserId] or not v37[l_v104_0.UserId].animationTrack) then
                                    local v110 = "";
                                    local v111 = "";
                                    if l_v104_0 then
                                        if l_v104_0.UserId then
                                            v110 = tostring(l_v104_0.UserId);
                                        end;
                                        if l_v104_0.Name then
                                            v111 = l_v104_0.Name;
                                        end;
                                    end;
                                    v10:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v110, v111));
                                    v37[l_v104_0.UserId].animationTrack:AdjustWeight(0.1, 0.5);
                                end;
                            end;
                            if game:GetFastFlag("FacialAnimationStreamingValidateAnimatorBeforeRemoving") then
                                v39[v104.UserId] = v105;
                            end;
                            return ;
                        else
                            return ;
                        end;
                    end;
                    if not v105:IsDescendantOf(game) then
                        v38[v104.UserId][v31.AnimatorDataModelReady] = v105.AncestryChanged:Connect(function(_, _)
                            if v105:IsDescendantOf(game) then
                                local l_v104_1 = v104;
                                local l_AnimatorDataModelReady_1 = v31.AnimatorDataModelReady;
                                if not (not v38[l_v104_1.UserId] or not v38[l_v104_1.UserId][l_AnimatorDataModelReady_1]) then
                                    v38[l_v104_1.UserId][l_AnimatorDataModelReady_1]:Disconnect();
                                    v38[l_v104_1.UserId][l_AnimatorDataModelReady_1] = nil;
                                end;
                                l_AnimatorDataModelReady_0();
                            end;
                        end);
                        return ;
                    else
                        l_AnimatorDataModelReady_0();
                        return ;
                    end;
                else
                    local v116 = "";
                    local v117 = "";
                    if v104 then
                        if v104.UserId then
                            v116 = tostring(v104.UserId);
                        end;
                        if v104.Name then
                            v117 = v104.Name;
                        end;
                    end;
                    v10:trace(string.format("%s {id: %s, name: %s}.", "onAnimatorAdded already done; skipping", v116, v117));
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    local function v124(v119, v120)
        if v120 then
            local l_PlayerEmoted_0 = v31.PlayerEmoted;
            if not (not v38[v119.UserId] or not v38[v119.UserId][l_PlayerEmoted_0]) then
                v38[v119.UserId][l_PlayerEmoted_0]:Disconnect();
                v38[v119.UserId][l_PlayerEmoted_0] = nil;
            end;
            v38[v119.UserId][v31.PlayerEmoted] = v120.EmoteTriggered:Connect(function(v122, v123)
                if v122 then
                    v98(v119, v123, false);
                end;
            end);
            if game:GetFastFlag("StopStreamTrackOnDeath") then
                l_PlayerEmoted_0 = v31.PlayerDied;
                if not (not v38[v119.UserId] or not v38[v119.UserId][l_PlayerEmoted_0]) then
                    v38[v119.UserId][l_PlayerEmoted_0]:Disconnect();
                    v38[v119.UserId][l_PlayerEmoted_0] = nil;
                end;
                v38[v119.UserId][v31.PlayerDied] = v120.Died:Connect(function()
                    v63(v119);
                end);
            end;
            return ;
        else
            return ;
        end;
    end;
    local function v135(v125, v126)
        assert(game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C"));
        if v125 ~= l_Players_0.LocalPlayer then
            return ;
        elseif v40[v125.UserId] ~= nil and v126 == v40[v125.UserId] then
            return ;
        else
            v40[v125.UserId] = v126;
            if not v40[v125.UserId] then
                if not l_FaceAnimatorService_0.AudioAnimationEnabled then
                    local v127 = "";
                    local v128 = "";
                    if v125 then
                        if v125.UserId then
                            v127 = tostring(v125.UserId);
                        end;
                        if v125.Name then
                            v128 = v125.Name;
                        end;
                    end;
                    v10:trace(string.format("%s {id: %s, name: %s}.", "FaceControls NOT found -> won't disable A2C (already is disabled)...", v127, v128));
                    return ;
                else
                    local v129 = "";
                    local v130 = "";
                    if v125 then
                        if v125.UserId then
                            v129 = tostring(v125.UserId);
                        end;
                        if v125.Name then
                            v130 = v125.Name;
                        end;
                    end;
                    v10:trace(string.format("%s {id: %s, name: %s}.", "FaceControls NOT found -> disabling A2C...", v129, v130));
                    l_FaceAnimatorService_0.AudioAnimationEnabled = false;
                    return ;
                end;
            elseif not l_default_1 or l_default_1.localMuted then
                local v131 = "";
                local v132 = "";
                if v125 then
                    if v125.UserId then
                        v131 = tostring(v125.UserId);
                    end;
                    if v125.Name then
                        v132 = v125.Name;
                    end;
                end;
                v10:trace(string.format("%s {id: %s, name: %s}.", "FaceControls found -> won't enable A2C (Mic is MUTED)...", v131, v132));
                return ;
            else
                local v133 = "";
                local v134 = "";
                if v125 then
                    if v125.UserId then
                        v133 = tostring(v125.UserId);
                    end;
                    if v125.Name then
                        v134 = v125.Name;
                    end;
                end;
                v10:trace(string.format("%s {id: %s, name: %s}.", "FaceControls found -> enabling A2C (Mic is ON)...", v133, v134));
                l_FaceAnimatorService_0.AudioAnimationEnabled = true;
                return ;
            end;
        end;
    end;
    local function v138(v136, v137)
        if v137:IsDescendantOf(game) then
            if not v137:IsA("Animator") then
                if not v137:IsA("Humanoid") then
                    if not (not game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") or not v137:IsA("MeshPart")) and v137.Name == "Head" then
                        v135(v136, v65(v136));
                        return ;
                    elseif not (not game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") or not v137:IsA("FaceControls")) then
                        v135(v136, v137);
                    end;
                else
                    v124(v136, v137);
                    return ;
                end;
            else
                v118(v136, v137);
                return ;
            end;
        end;
    end;
    local function v145(v139, v140)
        if not v140:IsA("Animator") then
            if not v140:IsA("Humanoid") then
                if not (not game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") or (not v140:IsA("MeshPart") or v140.Name ~= "Head") and not v140:IsA("FaceControls")) then
                    v135(v139, v65(v139));
                end;
            else
                local l_PlayerEmoted_1 = v31.PlayerEmoted;
                if not (not v38[v139.UserId] or not v38[v139.UserId][l_PlayerEmoted_1]) then
                    v38[v139.UserId][l_PlayerEmoted_1]:Disconnect();
                    v38[v139.UserId][l_PlayerEmoted_1] = nil;
                end;
                if game:GetFastFlag("StopStreamTrackOnDeath") then
                    l_PlayerEmoted_1 = v31.PlayerDied;
                    if not (not v38[v139.UserId] or not v38[v139.UserId][l_PlayerEmoted_1]) then
                        v38[v139.UserId][l_PlayerEmoted_1]:Disconnect();
                        v38[v139.UserId][l_PlayerEmoted_1] = nil;
                        return ;
                    end;
                end;
            end;
        elseif not game:GetFastFlag("FacialAnimationStreamingValidateAnimatorBeforeRemoving") then
            local l_AnimatorDataModelReady_2 = v31.AnimatorDataModelReady;
            if not (not v38[v139.UserId] or not v38[v139.UserId][l_AnimatorDataModelReady_2]) then
                v38[v139.UserId][l_AnimatorDataModelReady_2]:Disconnect();
                v38[v139.UserId][l_AnimatorDataModelReady_2] = nil;
            end;
            v63(v139);
            return ;
        elseif v140 == v39[v139.UserId] then
            local l_AnimatorDataModelReady_3 = v31.AnimatorDataModelReady;
            if not (not v38[v139.UserId] or not v38[v139.UserId][l_AnimatorDataModelReady_3]) then
                v38[v139.UserId][l_AnimatorDataModelReady_3]:Disconnect();
                v38[v139.UserId][l_AnimatorDataModelReady_3] = nil;
            end;
            v63(v139);
            v39[v139.UserId] = nil;
            if game:GetFastFlag("FacialAnimationStreamingSearchForReplacementWhenRemovingAnimator") then
                local v144 = if not v139.Character then nil else v139.Character:FindFirstChildOfClass("Humanoid");
                l_AnimatorDataModelReady_3 = if not v144 then nil else v144:FindFirstChildOfClass("Animator");
                if l_AnimatorDataModelReady_3 then
                    v118(v139, l_AnimatorDataModelReady_3);
                    return ;
                end;
            end;
        end;
    end;
    local function v152(v146, v147)
        local v148 = "";
        local v149 = "";
        if v146 then
            if v146.UserId then
                v148 = tostring(v146.UserId);
            end;
            if v146.Name then
                v149 = v146.Name;
            end;
        end;
        v10:trace(string.format("%s {id: %s, name: %s}.", "Player character added", v148, v149));
        v148 = v31.CharacterDescendantAdded;
        if not (not v38[v146.UserId] or not v38[v146.UserId][v148]) then
            v38[v146.UserId][v148]:Disconnect();
            v38[v146.UserId][v148] = nil;
        end;
        v148 = v31.CharacterDescendantRemoving;
        if not (not v38[v146.UserId] or not v38[v146.UserId][v148]) then
            v38[v146.UserId][v148]:Disconnect();
            v38[v146.UserId][v148] = nil;
        end;
        v38[v146.UserId][v31.CharacterDescendantAdded] = v147.DescendantAdded:Connect(function(v150)
            v138(v146, v150);
        end);
        v38[v146.UserId][v31.CharacterDescendantRemoving] = v147.DescendantRemoving:Connect(function(v151)
            v145(v146, v151);
        end);
        if game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") then
            v135(v146, v65(v146));
        end;
        v124(v146, v67(v146));
        v118(v146, v70(v146));
    end;
    local function v157(v153, _)
        local v155 = "";
        local v156 = "";
        if v153 then
            if v153.UserId then
                v155 = tostring(v153.UserId);
            end;
            if v153.Name then
                v156 = v153.Name;
            end;
        end;
        v10:trace(string.format("%s {id: %s, name: %s}.", "Player character removing", v155, v156));
        if not game:GetFastFlag("FacialAnimationStreamingClearAllConnectionsFix") then
            v59(v153);
        else
            v155 = v31.CharacterDescendantAdded;
            if not (not v38[v153.UserId] or not v38[v153.UserId][v155]) then
                v38[v153.UserId][v155]:Disconnect();
                v38[v153.UserId][v155] = nil;
            end;
            v155 = v31.CharacterDescendantRemoving;
            if not (not v38[v153.UserId] or not v38[v153.UserId][v155]) then
                v38[v153.UserId][v155]:Disconnect();
                v38[v153.UserId][v155] = nil;
            end;
        end;
        v63(v153);
    end;
    local function v167(v158)
        local v159 = "";
        local v160 = "";
        if v158 then
            if v158.UserId then
                v159 = tostring(v158.UserId);
            end;
            if v158.Name then
                v160 = v158.Name;
            end;
        end;
        v10:trace(string.format("%s {id: %s, name: %s}.", "Player update", v159, v160));
        v159 = v36[v158.UserId];
        v59(v158);
        if not v159 then
            v160 = "";
            local v161 = "";
            if v158 then
                if v158.UserId then
                    v160 = tostring(v158.UserId);
                end;
                if v158.Name then
                    v161 = v158.Name;
                end;
            end;
            v10:trace(string.format("%s {id: %s, name: %s}.", "Player update - left", v160, v161));
            v63(v158);
            return ;
        elseif not v37[v158.UserId] then
            v160 = "";
            local v162 = "";
            if v158 then
                if v158.UserId then
                    v160 = tostring(v158.UserId);
                end;
                if v158.Name then
                    v162 = v158.Name;
                end;
            end;
            v10:trace(string.format("%s {id: %s, name: %s}.", "Player update - joined", v160, v162));
            if v158.Character then
                v152(v158, v158.Character);
            end;
            v38[v158.UserId][v31.CharacterAdded] = v158.CharacterAdded:Connect(function(v163)
                v152(v158, v163);
            end);
            v38[v158.UserId][v31.CharacterRemoving] = v158.CharacterRemoving:Connect(function(v164)
                v157(v158, v164);
            end);
            v38[v158.UserId][v31.PlayerChatted] = v158.Chatted:Connect(function(v165)
                v103(v158, v165);
            end);
            return ;
        else
            v160 = "";
            local v166 = "";
            if v158 then
                if v158.UserId then
                    v160 = tostring(v158.UserId);
                end;
                if v158.Name then
                    v166 = v158.Name;
                end;
            end;
            v10:trace(string.format("%s {id: %s, name: %s}.", "Player already setup", v160, v166));
            return ;
        end;
    end;
    local function _(v168, v169)
        if not (not v37[v168] or not v37[v168].animationTrack) then
            v37[v168].animationTrack:TogglePause(v169);
        end;
    end;
    local function v173()
        for _, v172 in ipairs(l_Players_0:GetPlayers()) do
            v36[v172.UserId] = true;
            v167(v172);
        end;
    end;
    local function v200()
        local v174 = l_default_1:getService();
        local l_UserId_0 = l_Players_0.LocalPlayer.UserId;
        l_default_1.participantsUpdate.Event:Connect(function(v176)
            for v177, v178 in pairs(v176) do
                local v179 = tonumber(v177);
                if v179 ~= l_UserId_0 then
                    local l_isMutedLocally_0 = v178.isMutedLocally;
                    if not (not v37[v179] or not v37[v179].animationTrack) then
                        v37[v179].animationTrack:TogglePause(l_isMutedLocally_0);
                    end;
                end;
            end;
        end);
        if not v174 then
            v10:trace("Could not find VoiceChatService");
        else
            v174.ParticipantsStateChanged:Connect(function(v181, v182, _)
                for _, v185 in ipairs(v181) do
                    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v185);
                    if l_l_Players_0_PlayerByUserId_0 then
                        local v187 = "";
                        local v188 = "";
                        if l_l_Players_0_PlayerByUserId_0 then
                            if l_l_Players_0_PlayerByUserId_0.UserId then
                                v187 = tostring(l_l_Players_0_PlayerByUserId_0.UserId);
                            end;
                            if l_l_Players_0_PlayerByUserId_0.Name then
                                v188 = l_l_Players_0_PlayerByUserId_0.Name;
                            end;
                        end;
                        v10:trace(string.format("%s {id: %s, name: %s}.", "Player leaving chat", v187, v188));
                        v35[l_l_Players_0_PlayerByUserId_0.UserId] = nil;
                        v167(l_l_Players_0_PlayerByUserId_0);
                    end;
                end;
                for _, v190 in ipairs(v182) do
                    local l_l_Players_0_PlayerByUserId_1 = l_Players_0:GetPlayerByUserId(v190);
                    if l_l_Players_0_PlayerByUserId_1 then
                        local v192 = "";
                        local v193 = "";
                        if l_l_Players_0_PlayerByUserId_1 then
                            if l_l_Players_0_PlayerByUserId_1.UserId then
                                v192 = tostring(l_l_Players_0_PlayerByUserId_1.UserId);
                            end;
                            if l_l_Players_0_PlayerByUserId_1.Name then
                                v193 = l_l_Players_0_PlayerByUserId_1.Name;
                            end;
                        end;
                        v10:trace(string.format("%s {id: %s, name: %s}.", "Player joining chat", v192, v193));
                        v35[l_l_Players_0_PlayerByUserId_1.UserId] = true;
                        v167(l_l_Players_0_PlayerByUserId_1);
                    end;
                end;
            end);
        end;
        l_Players_0.PlayerRemoving:Connect(function(v194)
            local v195 = "";
            local v196 = "";
            if v194 then
                if v194.UserId then
                    v195 = tostring(v194.UserId);
                end;
                if v194.Name then
                    v196 = v194.Name;
                end;
            end;
            v10:trace(string.format("%s {id: %s, name: %s}.", "Player leaving game", v195, v196));
            v36[v194.UserId] = nil;
            v167(v194);
        end);
        l_Players_0.PlayerAdded:Connect(function(v197)
            local v198 = "";
            local v199 = "";
            if v197 then
                if v197.UserId then
                    v198 = tostring(v197.UserId);
                end;
                if v197.Name then
                    v199 = v197.Name;
                end;
            end;
            v10:trace(string.format("%s {id: %s, name: %s}.", "Player joining game", v198, v199));
            v36[v197.UserId] = true;
            v167(v197);
        end);
    end;
    local function v201(v202)
        if v24() then
            local l_status_0, l_result_0 = pcall(function()
                return v9:GetLayerData(v25());
            end);
            if l_status_0 then
                if l_result_0 then
                    if not l_result_0.UXForCameraPerformanceEnabled then
                        return ;
                    end;
                else
                    return ;
                end;
            else
                return ;
            end;
        end;
        local v205 = os.time() - v34;
        if not v202 and v205 < v22 then
            task.delay(v22 - v205, function()
                v201(true);
            end);
            return ;
        else
            local v206 = 0;
            local l_status_1, l_result_1 = pcall(function()
                return l_AppStorageService_0:GetItem("CameraPerformanceUXUnixTimestamp");
            end);
            if not l_status_1 then
                return ;
            else
                v206 = tonumber(l_result_1);
                if os.time() - v206 < v23 then
                    return ;
                else
                    pcall(function()
                        l_AppStorageService_0:SetItem("CameraPerformanceUXUnixTimestamp", (tostring(v206)));
                        l_AppStorageService_0:Flush();
                        v28:showPrompt(v29.LODCameraRecommendDisable);
                        l_RbxAnalyticsService_0:SendEventDeferred("client", "avatarChat", "UXForCameraPerformanceShown", {
                            userId = l_Players_0.LocalPlayer.UserId, 
                            pid = tostring(game.PlaceId)
                        });
                    end);
                    return ;
                end;
            end;
        end;
    end;
    InitializeVoiceChat = function()
        local function v209()
            v173();
            v200();
        end;
        if not l_default_1 then
            v173();
            v200();
            return ;
        else
            l_default_1:asyncInit():catch(function(_)
                v10:trace("VoiceChat:asyncInit failed (possibly denied mic permission)");
            end):finally(v209);
            v43 = l_default_1.muteChanged.Event:connect(function(v211)
                if not game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") then
                    v10:trace("Syncing audio processing with VoiceChat mute changed: muted=" .. tostring(v211));
                    l_FaceAnimatorService_0.AudioAnimationEnabled = not v211;
                    return ;
                else
                    local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
                    local v213 = if not not l_LocalPlayer_1 and l_LocalPlayer_1.Character then l_LocalPlayer_1.Character:FindFirstChildWhichIsA("FaceControls", true) else nil;
                    v10:trace("Syncing audio processing with VoiceChat mute changed: muted=" .. tostring(v211) .. " hasFaceControls=" .. tostring(v213 ~= nil));
                    l_FaceAnimatorService_0.AudioAnimationEnabled = not v211 and v213 ~= nil;
                    return ;
                end;
            end);
            local v214 = false;
            if l_default_1.localMuted ~= nil then
                v10:trace("Syncing audio processing with VoiceChat mute status: muted=" .. tostring(l_default_1.localMuted));
                v214 = not l_default_1.localMuted;
            end;
            if game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") then
                local l_LocalPlayer_2 = l_Players_0.LocalPlayer;
                local v216 = if not not l_LocalPlayer_2 and l_LocalPlayer_2.Character then l_LocalPlayer_2.Character:FindFirstChildWhichIsA("FaceControls", true) else nil;
                v10:trace("Syncing audio processing with Dynamic Head status: hasFaceControls=" .. tostring(v216 ~= nil));
                v214 = v214 and v216 ~= nil;
            end;
            l_FaceAnimatorService_0.AudioAnimationEnabled = v214;
            return ;
        end;
    end;
    CleanupVoiceChat = function()
        if v43 then
            v43:Disconnect();
            v43 = nil;
        end;
    end;
    InitializeFacialAnimationStreaming = function(v217)
        if not v33 then
            v33 = true;
            v41 = l_FaceAnimatorService_0.TrackerError:Connect(function(v218)
                v10:trace(string.format("%s {id: %s, name: %s}.", string.format("TrackerError: %s", (tostring(v218))), "", ""));
                if v218 == Enum.TrackerError.VideoNoPermission then
                    v28:showPrompt(v29.VideoNoPermission);
                    return ;
                elseif v218 == Enum.TrackerError.VideoUnsupported then
                    v28:showPrompt(v29.VideoUnsupported);
                    return ;
                elseif v218 == Enum.TrackerError.UnsupportedDevice then
                    v28:showPrompt(v29.UnsupportedDevice);
                    return ;
                else
                    v28:showPrompt(v29.NotAvailable);
                    return ;
                end;
            end);
            if not v17() then
                local l_status_2, l_result_2 = pcall(l_FacialAnimationStreamingServiceV2_0.ResolveStateForUser, l_FacialAnimationStreamingServiceV2_0, l_Players_0.LocalPlayer.UserId);
                if l_status_2 then
                    l_FaceAnimatorService_0:Init(l_FacialAnimationStreamingServiceV2_0:IsVideoEnabled(v217) and l_FacialAnimationStreamingServiceV2_0:IsVideoEnabled(l_result_2), l_FacialAnimationStreamingServiceV2_0:IsAudioEnabled(v217) and l_FacialAnimationStreamingServiceV2_0:IsAudioEnabled(l_result_2));
                else
                    local l_LocalPlayer_3 = l_Players_0.LocalPlayer;
                    local v222 = "";
                    local v223 = "";
                    if l_LocalPlayer_3 then
                        if l_LocalPlayer_3.UserId then
                            v222 = tostring(l_LocalPlayer_3.UserId);
                        end;
                        if l_LocalPlayer_3.Name then
                            v223 = l_LocalPlayer_3.Name;
                        end;
                    end;
                    v10:trace(string.format("%s {id: %s, name: %s}.", "Failed to resolve state for user.", v222, v223));
                    return ;
                end;
            else
                l_FaceAnimatorService_0:Init(v18:IsEnabled(v217, Enum.AvatarChatServiceFeature.UserVideo), v18:IsEnabled(v217, Enum.AvatarChatServiceFeature.UserAudio));
            end;
            if l_game_EngineFeature_1 then
                v42 = l_FaceAnimatorService_0.TrackerPrompt:Connect(function(v224)
                    v10:trace(string.format("%s {id: %s, name: %s}.", string.format("TrackerPrompt: %s", (tostring(v224))), "", ""));
                    if v224 == Enum.TrackerPromptEvent.LODCameraRecommendDisable then
                        if not v21 then
                            v28:showPrompt(v29.LODCameraRecommendDisable);
                        else
                            v201();
                            return ;
                        end;
                    end;
                end);
            end;
            l_default_0:getCallState():andThen(function(v225)
                if v33 then
                    if v225.status ~= l_Enums_0.CallStatus.Idle.rawValue() and v225.status ~= l_Enums_0.CallStatus.Ringing.rawValue() then
                        l_FaceAnimatorService_0.VideoAnimationEnabled = v225.camEnabled;
                    else
                        l_FaceAnimatorService_0.VideoAnimationEnabled = false;
                    end;
                    InitializeVoiceChat();
                    v26.Initialize();
                    return ;
                else
                    return ;
                end;
            end);
            return ;
        else
            return ;
        end;
    end;
    CleanupFacialAnimationStreaming = function()
        if v33 then
            v33 = false;
            CleanupVoiceChat();
            v26.Cleanup();
            for _, v227 in ipairs(l_Players_0:GetPlayers()) do
                v36[v227.UserId] = nil;
                v167(v227);
            end;
            if v41 then
                v41:Disconnect();
                v41 = nil;
            end;
            if v44 then
                v44:Disconnect();
                v44 = nil;
            end;
            if v45 then
                v45:Disconnect();
                v45 = nil;
            end;
            if not (not l_game_EngineFeature_1 or not v42) then
                v42:Disconnect();
                v42 = nil;
            end;
            return ;
        else
            return ;
        end;
    end;
    local function _(v228, v229, v230)
        v10:trace(string.format("[onThrottleUpdate] allowed: %s, optedIn:%s, state: %s", tostring(v228), tostring(v229), (tostring(v230))));
        if not v228 or not l_FacialAnimationStreamingServiceV2_0:IsServerEnabled(v230) then
            CleanupFacialAnimationStreaming();
            if v229 then
                v28:showPrompt(v29.FeatureDisabled);
            end;
            return ;
        else
            InitializeFacialAnimationStreaming(v230);
            return ;
        end;
    end;
    local function v233(v232)
        v10:trace(string.format("[updateWithServiceState] state: %s", (tostring(v232))));
        if not v17() then
            CleanupFacialAnimationStreaming();
            return ;
        elseif not (v18:IsEnabled(v232, Enum.AvatarChatServiceFeature.UserAudioEligible) or v18:IsEnabled(v232, Enum.AvatarChatServiceFeature.UserVideoEligible)) or not v18:IsPlaceEnabled() then
            CleanupFacialAnimationStreaming();
            return ;
        else
            InitializeFacialAnimationStreaming(v232);
            return ;
        end;
    end;
    v44 = l_FaceAnimatorService_0:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(function()
        local l_LocalPlayer_4 = l_Players_0.LocalPlayer;
        if l_LocalPlayer_4 then
            if not (l_FaceAnimatorService_0.AudioAnimationEnabled or l_FaceAnimatorService_0.VideoAnimationEnabled) then
                if not (not v37[l_LocalPlayer_4.UserId] or not v37[l_LocalPlayer_4.UserId].animationTrack) then
                    local v235 = "";
                    local v236 = "";
                    if l_LocalPlayer_4 then
                        if l_LocalPlayer_4.UserId then
                            v235 = tostring(l_LocalPlayer_4.UserId);
                        end;
                        if l_LocalPlayer_4.Name then
                            v236 = l_LocalPlayer_4.Name;
                        end;
                    end;
                    v10:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v235, v236));
                    v37[l_LocalPlayer_4.UserId].animationTrack:AdjustWeight(0.1, 0.5);
                end;
            elseif not (not v37[l_LocalPlayer_4.UserId] or not v37[l_LocalPlayer_4.UserId].animationTrack) then
                local v237 = "";
                local v238 = "";
                if l_LocalPlayer_4 then
                    if l_LocalPlayer_4.UserId then
                        v237 = tostring(l_LocalPlayer_4.UserId);
                    end;
                    if l_LocalPlayer_4.Name then
                        v238 = l_LocalPlayer_4.Name;
                    end;
                end;
                v10:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", v237, v238));
                v37[l_LocalPlayer_4.UserId].animationTrack:AdjustWeight(1, 0.5);
                return ;
            end;
            return ;
        else
            return ;
        end;
    end);
    v45 = l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(function()
        local l_LocalPlayer_5 = l_Players_0.LocalPlayer;
        if l_LocalPlayer_5 then
            if not (l_FaceAnimatorService_0.AudioAnimationEnabled or l_FaceAnimatorService_0.VideoAnimationEnabled) then
                if not (not v37[l_LocalPlayer_5.UserId] or not v37[l_LocalPlayer_5.UserId].animationTrack) then
                    local v240 = "";
                    local v241 = "";
                    if l_LocalPlayer_5 then
                        if l_LocalPlayer_5.UserId then
                            v240 = tostring(l_LocalPlayer_5.UserId);
                        end;
                        if l_LocalPlayer_5.Name then
                            v241 = l_LocalPlayer_5.Name;
                        end;
                    end;
                    v10:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v240, v241));
                    v37[l_LocalPlayer_5.UserId].animationTrack:AdjustWeight(0.1, 0.5);
                end;
            elseif not (not v37[l_LocalPlayer_5.UserId] or not v37[l_LocalPlayer_5.UserId].animationTrack) then
                local v242 = "";
                local v243 = "";
                if l_LocalPlayer_5 then
                    if l_LocalPlayer_5.UserId then
                        v242 = tostring(l_LocalPlayer_5.UserId);
                    end;
                    if l_LocalPlayer_5.Name then
                        v243 = l_LocalPlayer_5.Name;
                    end;
                end;
                v10:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", v242, v243));
                v37[l_LocalPlayer_5.UserId].animationTrack:AdjustWeight(1, 0.5);
                return ;
            end;
            return ;
        else
            return ;
        end;
    end);
    if not v17() then
        l_FacialAnimationStreamingServiceV2_0:GetPropertyChangedSignal("ServiceState"):Connect(function()
            v233(l_FacialAnimationStreamingServiceV2_0.ServiceState);
        end);
        v233(l_FacialAnimationStreamingServiceV2_0.ServiceState);
    elseif not v18.ClientFeaturesInitialized then
        local v244 = nil;
        do
            local l_v244_0 = v244;
            l_v244_0 = v18:GetPropertyChangedSignal("ClientFeatures"):Connect(function()
                v233(v18.ClientFeatures);
                l_v244_0:Disconnect();
            end);
        end;
    else
        v233(v18.ClientFeatures);
    end;
    return ;
else
    return ;
end;
