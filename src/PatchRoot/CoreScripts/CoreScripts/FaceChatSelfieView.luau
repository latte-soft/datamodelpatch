debugPrint = function(__)
end;
local v1 = nil;
local v2 = nil;
local l_game_EngineFeature_0 = game:GetEngineFeature("AvatarJointUpgradeFeature");
local l_game_EngineFeature_1 = game:GetEngineFeature("LoadStreamAnimationForSelfieViewApiEnabled");
local l_game_EngineFeature_2 = game:GetEngineFeature("AnimatorAndADFRefactorInternal");
local l_game_EngineFeature_3 = game:GetEngineFeature("PlayerViewRemoteEventSupport");
local l_FacialAnimationStreamingServiceV2_0 = game:GetService("FacialAnimationStreamingServiceV2");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_VRService_0 = game:GetService("VRService");
local v11 = game:DefineFastFlag("SelfViewCameraDefaultButtonInViewPort", false);
local v12 = game:DefineFastFlag("SelfViewLookUpHumanoidByType", false);
local v13 = game:DefineFastFlag("SelfViewHumanoidNilCheck", false);
local v14 = game:DefineFastFlag("SelfViewMoreNilChecks", false);
local v15 = game:DefineFastFlag("SelfViewAvoidErrorOnWrongFaceControlsParenting", false);
local v16 = game:DefineFastFlag("SelfViewUpdatedCamFraming", false);
local v17 = game:DefineFastFlag("SelfViewGetRidOfFalselyRenderedFaceDecal", false);
local v18 = game:DefineFastFlag("SelfViewRemoveVPFWhenClosed", false);
local v19 = game:DefineFastFlag("SelfViewTweaksPass", false);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CharacterUtility_0 = require(l_CorePackages_0.Thumbnailing).CharacterUtility;
local l_CFrameUtility_0 = require(l_CorePackages_0.Thumbnailing).CFrameUtility;
local v23 = require(l_CorePackages_0.Promise);
local l_CoreGui_0 = game:GetService("CoreGui");
local __ = game:GetService("StarterGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_RunService_0 = game:GetService("RunService");
local v28 = require(l_CorePackages_0.InGameServices.MouseIconOverrideService);
local v29 = require(l_CorePackages_0.Symbol).named("SelfieViewCursorOverride");
local l_Players_0 = game:GetService("Players");
local __ = game:GetService("UserInputService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_SocialService_0 = game:GetService("SocialService");
local l_UserInputService_1 = game:GetService("UserInputService");
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local l_game_Service_0 = game:FindService("FaceAnimatorService");
local l_game_Service_1 = game:FindService("VideoCaptureService");
local v38 = require(l_RobloxGui_0.Modules.SelfView.Analytics).new();
local v39 = require(l_RobloxGui_0.Modules.Logger):new(script.Name);
local v40 = require(l_RobloxGui_0.Modules.Tracker.TrackerMenu);
local v41 = require(l_RobloxGui_0.Modules.Tracker.TrackerPromptType);
local v42 = UDim2.fromOffset(15, 25);
local v43 = UDim2.new(0.15, 0, 0.4, 0);
local v44 = Color3.new(1, 1, 1);
local __ = l_RunService_0:IsStudio();
local v46 = require(l_RobloxGui_0.Modules.SelfView.toggleSelfViewSignal);
local v47 = require(l_RobloxGui_0.Modules.Settings.getCamMicPermissions);
local v48 = require(l_RobloxGui_0.Modules.Settings.Analytics.VoiceAnalytics);
local v49 = require(l_RobloxGui_0.Modules.SelfView.publicApi);
local v50 = require(l_RobloxGui_0.Modules.Flags.GetFFlagAvatarChatServiceEnabled);
local l_GetFFlagIrisGyroEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIrisGyroEnabled;
local l_GetFFlagSelfViewPositionDragFixEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSelfViewPositionDragFixEnabled;
local v53 = if not v50() then nil else game:GetService("AvatarChatService");
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local v55 = require(l_RobloxGui_0.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount);
local v56 = require(l_RobloxGui_0.Modules.Flags.GetFFlagJoinWithoutMicPermissions);
local v57 = require(l_RobloxGui_0.Modules.Flags.getFFlagEnableAlwaysAvailableCamera);
local v58 = game:DefineFastFlag("MockOpenSelfViewForCameraUser", false);
local v59 = require(l_RobloxGui_0.Modules.Flags.GetFFlagRemoveInGameChatBubbleChatReferences);
local v60 = nil;
local v61 = game:DefineFastInt("SelfViewTooltipLifetime", 10);
local v62 = require(l_RobloxGui_0.Modules.SelfView.mountSelfViewOnCloseTooltip);
local v63 = require(l_RobloxGui_0.Modules.SelfView.mountSelfViewOnOpenTooltip);
local v64 = nil;
local v65 = require(l_RobloxGui_0.Modules.Settings.isCamEnabledForUserAndPlace);
local v66 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Helpers.displayCameraDeniedToast);
if v59() then
    v66 = require(l_RobloxGui_0.Modules.VoiceChat.Helpers.displayCameraDeniedToast);
end;
local l_Images_0 = require(l_CorePackages_0.UIBlox).App.ImageSet.Images;
local v68 = l_Images_0["icons/controls/video"];
local v69 = l_Images_0["icons/controls/videoOff"];
local v70 = l_Images_0["icons/controls/microphoneMute"];
local v71 = l_Images_0["icons/controls/microphone_small"];
local v72 = nil;
local v73 = Vector3.new(0, 0.105, -0.25);
local v74 = Vector3.new(0, 1.5, 0);
local v75 = 1.31;
local v76 = 0;
local v77 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceChatUILogging);
local v78 = require(l_RobloxGui_0.Modules.Flags.GetFFlagShowMicConnectingIconAndToast);
local v79 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoiceMuteAnalytics);
local v80 = nil;
if v79() then
    v80 = v48.new(l_RbxAnalyticsService_0, "LegacySelfView");
end;
local v81 = nil;
local v82 = nil;
local v83 = nil;
local v84 = {};
local v85 = nil;
local v86 = nil;
local v87 = nil;
local v88 = nil;
local v89 = nil;
local v90 = nil;
local v91 = nil;
local v92 = {};
local v93 = {};
local v94 = nil;
local v95 = nil;
local v96 = nil;
local v97 = nil;
local v98 = nil;
local v99 = nil;
local v100 = nil;
local v101 = Vector3.new(1.1721, 1.1811, 1.1578);
local v102 = nil;
local v103 = nil;
local v104 = nil;
local v105 = nil;
local v106 = nil;
local v107 = nil;
local v108 = nil;
local v109 = nil;
local v110 = nil;
local v111 = nil;
local v112 = nil;
local v113 = false;
local v114 = nil;
local v115 = false;
local v116 = nil;
local v117 = false;
local v118 = 0;
local v119 = false;
local v120 = false;
local v121 = false;
local v122 = true;
local v123 = false;
local v124 = false;
local v125 = false;
local function __()
    if not v56() then
        if not v57() then
            return v124 and not l_default_0:VoiceChatEnded();
        else
            return v124;
        end;
    else
        return v125 and (not l_default_0:VoiceChatEnded() or v122);
    end;
end;
local v127 = false;
local v128 = false;
local v129 = false;
local v130 = nil;
local v131 = false;
local v132 = nil;
local v133 = nil;
local v134 = nil;
local v135 = {
    "Head", 
    "UpperTorso", 
    "LowerTorso", 
    "Torso", 
    "LeftFoot", 
    "LeftLowerLeg", 
    "LeftUpperLeg", 
    "RightFoot", 
    "RightLowerLeg", 
    "RightUpperLeg", 
    "LeftHand", 
    "LeftLowerArm", 
    "LeftUpperArm", 
    "RightHand", 
    "RightLowerArm", 
    "RightUpperArm"
};
local v136 = {};
local __ = {
    "Head", 
    "Left Arm", 
    "Left Leg", 
    "Right Arm", 
    "Right Leg", 
    "Torso"
};
local v138 = {
    Accessory = "Accessory", 
    Animator = "Animator", 
    Attachment = "Attachment", 
    AnimationConstraint = if not l_game_EngineFeature_0 then nil else "AnimationConstraint", 
    BallSocketConstraint = if not l_game_EngineFeature_0 then nil else "BallSocketConstraint", 
    BodyColors = "BodyColors", 
    CharacterMesh = "CharacterMesh", 
    Decal = "Decal", 
    FaceControls = "FaceControls", 
    Humanoid = "Humanoid", 
    HumanoidDescription = "HumanoidDescription", 
    MeshPart = "MeshPart", 
    Motor6D = "Motor6D", 
    NumberValue = "NumberValue", 
    Pants = "Pants", 
    Part = "Part", 
    Shirt = "Shirt", 
    ShirtGraphic = "ShirtGraphic", 
    SpecialMesh = "SpecialMesh", 
    StringValue = "StringValue", 
    SurfaceAppearance = "SurfaceAppearance", 
    Vector3Value = "Vector3Value", 
    WrapTarget = "WrapTarget", 
    Weld = "Weld", 
    WrapLayer = "WrapLayer", 
    WeldConstraint = "WeldConstraint", 
    AccessoryWeld = "AccessoryWeld", 
    PackageLink = "PackageLink", 
    Folder = "Folder", 
    RigidConstraint = "RigidConstraint"
};
local v139 = {
    Accessory = "Accessory", 
    CharacterMesh = "CharacterMesh", 
    Decal = "Decal", 
    MeshPart = "MeshPart", 
    Pants = "Pants", 
    Part = "Part", 
    Shirt = "Shirt", 
    ShirtGraphic = "ShirtGraphic", 
    SpecialMesh = "SpecialMesh", 
    SurfaceAppearance = "SurfaceAppearance"
};
v39:trace("Self View 03-20-2024__1");
local v140 = {};
local v141 = {
    AnimationPlayed = "AnimationPlayed", 
    AnimationPlayedCoreScript = "AnimationPlayedCoreScript", 
    DescendantAdded = "DescendantAdded", 
    DescendantRemoving = "DescendantRemoving", 
    HeadSize = "HeadSize", 
    Color = "Color", 
    CharacterAdded = "CharacterAdded", 
    CharacterRemoving = "CharacterRemoving", 
    HumanoidStateChanged = "HumanoidStateChanged"
};
getShouldDisplaySelfieView = function()
    local v142 = false;
    if not v58 then
        pcall(function()
            if l_AppStorageService_0:GetItem("ShowSelfieViewForCameraUser") == "true" then
                v142 = true;
            end;
        end);
        return v142;
    else
        return true;
    end;
end;
setSelfieViewDisplayInAppStorage = function(v143)
    pcall(function()
        l_AppStorageService_0:SetItem("ShowSelfieViewForCameraUser", not v143 and "false" or "true");
    end);
end;
shouldDisplaySelfViewTooltip = function(v144)
    if v57() and v65() then
        local v145 = false;
        if not v58 then
            pcall(function()
                v145 = l_AppStorageService_0:GetItem(v144) == "true";
            end);
            return v145;
        else
            return true;
        end;
    else
        return false;
    end;
end;
displaySelfieViewByDefault = function()
    if not ((not v57() or not v65()) or not getShouldDisplaySelfieView()) and v60 ~= nil then
        v60(true);
    end;
end;
getRelativePosition = function(v146)
    if v146.Parent then
        local l_AbsoluteSize_0 = v146.Parent.AbsoluteSize;
        return UDim2.new(v146.AbsolutePosition.X / l_AbsoluteSize_0.X, 0, v146.AbsolutePosition.Y / l_AbsoluteSize_0.Y, 0);
    else
        return v146.Size;
    end;
end;
getRelativeSize = function(v148)
    if v148.Parent then
        local l_AbsoluteSize_1 = v148.Parent.AbsoluteSize;
        debugPrint("uiObject.AbsoluteSize.X:" .. tostring(v148.AbsoluteSize.X) .. ",uiObject.AbsoluteSize.Y:" .. tostring(v148.AbsoluteSize.Y) .. ",screenSize.X:" .. tostring(l_AbsoluteSize_1.X) .. ",screenSize.Y:" .. tostring(l_AbsoluteSize_1.Y));
        return UDim2.new(v148.AbsoluteSize.X / l_AbsoluteSize_1.X, 0, v148.AbsoluteSize.Y / l_AbsoluteSize_1.Y, 0);
    else
        return v148.Size;
    end;
end;
startSelfViewSession = function()
    v49.setSelfViewIsOpenAndVisible(true);
    local v150 = getRelativePosition(v108);
    local v151 = getRelativeSize(v108);
    v38:reportSelfViewSessionStarted(math.floor(v108.AbsolutePosition.X), math.floor(v108.AbsolutePosition.Y), math.floor(v108.AbsoluteSize.X), math.floor(v108.AbsoluteSize.Y), v150.X, v150.Y, v151.X, v151.Y);
    debugPrint("selfViewPublicApi.getSelfViewIsOpenAndVisible(): " .. tostring(v49.getSelfViewIsOpenAndVisible()));
end;
stopSelfViewSession = function()
    v49.setSelfViewIsOpenAndVisible(false);
    v38:reportSelfViewSessionStopped();
    debugPrint("selfViewPublicApi.getSelfViewIsOpenAndVisible(): " .. tostring(v49.getSelfViewIsOpenAndVisible()));
end;
getShouldBeEnabledCoreGuiSetting = function()
    return true;
end;
updateSelfViewButtonVisibility = function()
    local v152 = 0;
    if not v55() then
        if v123 then
            v152 = v152 + 1;
        end;
    elseif v65() then
        v152 = v152 + 1;
    end;
    if if not v56() then if v57() then v124 else v124 and not l_default_0:VoiceChatEnded() else v125 and (not l_default_0:VoiceChatEnded() or v122) then
        v152 = v152 + 1;
    end;
    if v108 ~= nil then
        local l_v108_FirstChild_0 = v108:FindFirstChild("MicButton", true);
        local l_v108_FirstChild_1 = v108:FindFirstChild("CamButton", true);
        local v155 = v152 == 2 and 0.5 or 1;
        if l_v108_FirstChild_0 then
            l_v108_FirstChild_0.Size = UDim2.new(v155, -4, 1, -4);
            l_v108_FirstChild_0.Visible = if not v56() then if v57() then v124 else v124 and not l_default_0:VoiceChatEnded() else v125 and (not l_default_0:VoiceChatEnded() or v122);
        end;
        if l_v108_FirstChild_1 then
            l_v108_FirstChild_1.Size = UDim2.new(v155, -4, 1, -4);
            local l_v123_0 = v123;
            if v55() then
                l_v123_0 = v65();
            end;
            l_v108_FirstChild_1.Visible = l_v123_0;
        end;
    end;
end;
local v157 = {};
if game:GetEngineFeature("VoiceChatSupported") then
    v157 = {
        [Enum.VoiceChatState.Joining] = l_default_0.VOICE_STATE.CONNECTING, 
        [Enum.VoiceChatState.JoiningRetry] = l_default_0.VOICE_STATE.CONNECTING, 
        [Enum.VoiceChatState.Joined] = l_default_0.VOICE_STATE.MUTED, 
        [Enum.VoiceChatState.Leaving] = l_default_0.VOICE_STATE.MUTED, 
        [Enum.VoiceChatState.Failed] = l_default_0.VOICE_STATE.ERROR
    };
end;
initVoiceChatServiceManager = function()
    local l_MUTED_0 = l_default_0.VOICE_STATE.MUTED;
    if v57() then
        l_MUTED_0 = l_default_0.VOICE_STATE.CONNECTING;
    end;
    local v159 = 0;
    local function v163(v160, v161)
        if v160 == l_MUTED_0 and v161 == v159 then
            return ;
        else
            l_MUTED_0 = v160;
            v159 = v161;
            if v160 == l_default_0.VOICE_STATE.MUTED then
                v110.Size = UDim2.fromOffset(32, 32);
                v110.Image = v70.Image;
                if v110.ImageRectOffset ~= v70.ImageRectOffset then
                    v110.ImageRectOffset = v70.ImageRectOffset;
                end;
                v110.ImageRectSize = v70.ImageRectSize;
            else
                local v162 = l_default_0:VoiceStateToIcon(v160, v161, "New");
                v110.Size = UDim2.fromOffset(16, 20);
                v110.Image = v162;
                v110.ImageRectOffset = Vector2.new(0, 0);
                v110.ImageRectSize = Vector2.new(0, 0);
            end;
            v110.Position = UDim2.new(0.5, 0, 0.5, 0);
            if v160 == l_default_0.VOICE_STATE.INACTIVE then
                v110.Size = UDim2.fromOffset(19, 19);
                v110.Image = v71.Image;
                v110.ImageRectOffset = v71.ImageRectOffset;
                v110.ImageRectSize = v71.ImageRectSize;
                return ;
            else
                if v160 == l_default_0.VOICE_STATE.TALKING then
                    v110.Position = UDim2.new(0.5, 0, 0.5, -1);
                end;
                return ;
            end;
        end;
    end;
    local v164 = false;
    local function v166(v165)
        if not v165 then
            if not v164 then
                l_RunService_0:BindToRenderStep("SelfViewVoiceIndicatorRenderStepped", Enum.RenderPriority.First.Value + 1, function()
                    v163(l_MUTED_0, math.random());
                end);
                v164 = true;
            end;
        elseif v164 then
            l_RunService_0:UnbindFromRenderStep("SelfViewVoiceIndicatorRenderStepped");
            v164 = false;
            return ;
        end;
    end;
    l_default_0.talkingChanged.Event:Connect(function(v167)
        if not v167 then
            v163(l_default_0.VOICE_STATE.INACTIVE, v159);
            return ;
        else
            v163(l_default_0.VOICE_STATE.TALKING, v159);
            return ;
        end;
    end);
    l_default_0.muteChanged.Event:Connect(function(v168)
        v166(v168);
        debugPrint("Self View: VoiceChatServiceManager.muteChanged.Event, muted: " .. tostring(v168));
        v163(not not v168 and l_default_0.VOICE_STATE.MUTED or l_default_0.VOICE_STATE.INACTIVE, v159);
    end);
    l_default_0:asyncInit():andThen(function()
        local v169 = l_default_0:getService();
        if v169 then
            if v56() then
                v125 = true;
            end;
            displaySelfieViewByDefault();
            v169.StateChanged:Connect(function(__, v171)
                local v172 = v157[v171];
                if v78() then
                    v172 = l_default_0:GetVoiceStateFromEnum(v171);
                end;
                if not v172 then
                    if v171 == Enum.VoiceChatState.Ended then
                        updateSelfViewButtonVisibility();
                    end;
                    return ;
                else
                    if not ((not v78() or v172 == l_default_0.VOICE_STATE.CONNECTING) or not v122) then
                        v122 = false;
                    end;
                    v163(v172, v159);
                    return ;
                end;
            end);
        end;
    end):catch(function()
        if v77() then
            v39:warning("Failed to init VoiceChatServiceManager");
        end;
    end);
end;
local v173 = false;
getPermissions = function()
    v39:trace("Self View: getPermissions()");
    v47(function(v174)
        v123 = v174.hasCameraPermissions;
        v124 = v174.hasMicPermissions;
        updateSelfViewButtonVisibility();
        if not (not v124 or v173) then
            initVoiceChatServiceManager();
            v173 = true;
        end;
    end, nil, nil, "FaceChatSelfieView.getPermissions");
end;
getMicPermission = function()
    v47(function(v175)
        v124 = v175.hasMicPermissions;
        if not v56() then
            if not (not v124 or v173) then
                initVoiceChatServiceManager();
                v173 = true;
            end;
        elseif not v173 then
            initVoiceChatServiceManager();
            v173 = true;
            return ;
        end;
    end, {
        l_default_1.Permissions.MICROPHONE_ACCESS
    }, nil, "FaceChatSelfieView.getMicPermission");
end;
getCameraPermissionWithoutRequest = function()
    v47(function(v176)
        v123 = v176.hasCameraPermissions;
    end, {
        l_default_1.Permissions.CAMERA_ACCESS
    }, true);
end;
local function __(v177, v178)
    local l_v177_FirstChild_0 = v177:FindFirstChild(v178);
    if l_v177_FirstChild_0 then
        l_v177_FirstChild_0:Destroy();
    end;
end;
setCloneDirty = function(v181)
    if not v181 then
        v76 = 0;
        return ;
    else
        v76 = 0.35;
        return ;
    end;
end;
local v182 = {};
local v183 = false;
local __ = function()
    for __, v185 in v182, nil, nil do
        v185:Disconnect();
    end;
    v182 = {};
end;
constrainTargetPositionToScreen = function(v187, v188, v189)
    if v187 == nil then
        return ;
    else
        local v190 = {
            X = v189.X, 
            Y = v189.Y
        };
        v190.X = math.min(v190.X, (v188.X - 3) - v187.AbsoluteSize.X);
        v190.Y = math.min(v190.Y, (v188.Y - 3) - v187.AbsoluteSize.Y);
        v190.X = math.max(3, v190.X);
        v190.Y = math.max(3, v190.Y);
        return UDim2.fromOffset(v190.X, v190.Y);
    end;
end;
local function v196(v191, v192, v193, v194)
    if v191.Parent then
        local v195 = v192 - v193;
        v191.Position = constrainTargetPositionToScreen(v191, v191.Parent.AbsoluteSize, {
            X = (v195 + v194).X, 
            Y = (v195 + v194).Y
        });
        return ;
    else
        return ;
    end;
end;
local function __()
    if not l_VRService_0.VREnabled then
        v121 = true;
        v28.push(v29, Enum.OverrideMouseIconBehavior.ForceShow);
    end;
end;
local function __()
    if v121 then
        v121 = false;
        v28.pop(v29);
    end;
end;
local function v214(v199, v200)
    local l_UserInputType_0 = v200.UserInputType;
    if l_UserInputType_0 ~= Enum.UserInputType.MouseButton1 and l_UserInputType_0 ~= Enum.UserInputType.Touch then
        return ;
    elseif not v183 then
        v183 = true;
        local l_Position_0 = v200.Position;
        local v203 = Vector3.new(v199.AbsolutePosition.X, v199.AbsolutePosition.Y, 0);
        for __, v205 in v182, nil, nil do
            v205:Disconnect();
        end;
        v182 = {};
        table.insert(v182, (l_UserInputService_1.InputChanged:Connect(function(v206)
            if v183 then
                if l_GetFFlagSelfViewPositionDragFixEnabled_0() then
                    v199.AnchorPoint = Vector2.new(0, 0);
                end;
                local l_UserInputType_1 = v206.UserInputType;
                if l_UserInputType_1 == Enum.UserInputType.Touch and v206 ~= v200 then
                    return ;
                elseif l_UserInputType_1 ~= Enum.UserInputType.MouseMovement and l_UserInputType_1 ~= Enum.UserInputType.Touch then
                    return ;
                elseif v206.UserInputState ~= Enum.UserInputState.Change then
                    return ;
                else
                    v196(v199, v206.Position, l_Position_0, v203);
                    return ;
                end;
            else
                return ;
            end;
        end)));
        table.insert(v182, (l_UserInputService_1.InputEnded:Connect(function(v208)
            local l_UserInputType_2 = v208.UserInputType;
            if l_UserInputType_2 ~= Enum.UserInputType.MouseButton1 and l_UserInputType_2 ~= Enum.UserInputType.Touch then
                return ;
            else
                v183 = false;
                for __, v211 in v182, nil, nil do
                    v211:Disconnect();
                end;
                v182 = {};
                v199.Position = getRelativePosition(v199);
                l_AppStorageService_0:SetItem("SelfViewPosition", v199.AbsolutePosition.X .. "," .. v199.AbsolutePosition.Y);
                return ;
            end;
        end)));
        table.insert(v182, (l_UserInputService_1.WindowFocusReleased:Connect(function()
            for __, v213 in v182, nil, nil do
                v213:Disconnect();
            end;
            v182 = {};
        end)));
        return ;
    else
        return ;
    end;
end;
createCloneAnchor = function()
    if v102 ~= nil then
        v102:Destroy();
        v102 = nil;
    end;
    local l_WorldModel_0 = Instance.new("WorldModel");
    l_WorldModel_0.Parent = v98;
    v102 = l_WorldModel_0;
end;
connectToScreenOrientationChange = function()
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if not l_LocalPlayer_0 then
        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    end;
    if l_LocalPlayer_0 then
        local l_PlayerGui_0 = l_LocalPlayer_0:FindFirstChildOfClass("PlayerGui");
        while not l_PlayerGui_0 do
            l_LocalPlayer_0.ChildAdded:wait();
            l_PlayerGui_0 = l_LocalPlayer_0:FindFirstChildOfClass("PlayerGui");
        end;
        v90 = l_PlayerGui_0:GetPropertyChangedSignal("CurrentScreenOrientation"):Connect(function()
            if not (not v108 or not v108.Parent) then
                v108.Position = constrainTargetPositionToScreen(v108, v108.Parent.AbsoluteSize, (Vector3.new(v108.AbsolutePosition.X, v108.AbsolutePosition.Y, 0)));
                v108.Position = getRelativePosition(v108);
            end;
        end);
        return ;
    else
        return ;
    end;
end;
clearObserver = function(v218)
    if v140[v218] then
        v140[v218]:Disconnect();
        v140[v218] = nil;
    end;
end;
local function __()
    for v219 in v140, nil, nil do
        clearObserver(v219);
    end;
end;
clearCloneCharacter = function()
    if v103 then
        v103:Destroy();
        v103 = nil;
    end;
    if v102 == nil then
        return ;
    else
        local l_SelfAvatar_0 = v102:FindFirstChild("SelfAvatar");
        if l_SelfAvatar_0 then
            l_SelfAvatar_0:Destroy();
        end;
        createCloneAnchor();
        return ;
    end;
end;
clearClone = function()
    debugPrint("Self View: clearClone()");
    stopRenderStepped();
    clearObserver(v141.AnimationPlayed);
    clearObserver(v141.AnimationPlayedCoreScript);
    if v85 then
        v85:Disconnect();
        v85 = nil;
    end;
    if v86 then
        v86:Disconnect();
        v86 = nil;
    end;
    if v87 then
        v87:Disconnect();
        v87 = nil;
    end;
    if v88 then
        v88:Disconnect();
        v88 = nil;
    end;
    if v89 then
        v89:Disconnect();
        v89 = nil;
    end;
    v114 = nil;
    v97 = nil;
    v91 = nil;
    v92 = {};
    clearCloneCharacter();
end;
clearViewportFrame = function()
    if v98 then
        v98:Destroy();
    end;
    if v100 then
        v100:Destroy();
    end;
end;
local function v224(v222)
    debugPrint("Self View: setIsOpen(): " .. tostring(v222));
    v113 = v222;
    setSelfieViewDisplayInAppStorage(v222);
    if not v113 then
        v104 = nil;
        v94 = nil;
        v95 = nil;
        for v223 in v140, nil, nil do
            clearObserver(v223);
        end;
        clearObserver(v141.CharacterAdded);
        clearObserver(v141.CharacterRemoving);
        clearClone();
        if v90 then
            v90:Disconnect();
            v90 = nil;
        end;
        prepMicAndCamPropertyChangedSignalHandler();
        v112.Visible = false;
        trackSelfViewSessionAsNeeded();
        if v18 then
            clearViewportFrame();
        end;
        return ;
    else
        ReInit(l_Players_0.LocalPlayer);
        return ;
    end;
end;
createViewportFrame = function()
    v100 = Instance.new("Frame");
    v100.Name = "SelfViewFrame";
    v100.Position = UDim2.new(0, 0, 0, 0);
    v100.Size = UDim2.new(1, 0, 1, 0);
    v100.BackgroundTransparency = 1;
    v100.Parent = v108;
    v98 = Instance.new("ViewportFrame");
    v98.Position = UDim2.new(0, 0, 0, 0);
    v98.Size = UDim2.new(1, 0, 1, -35);
    v98.BackgroundColor3 = Color3.new(0, 0, 0);
    v98.BorderColor3 = Color3.new(0.6, 0.5, 0.4);
    v98.BorderSizePixel = 2;
    v98.BackgroundTransparency = 0.65;
    v98.Parent = v100;
    v98.Ambient = Color3.new(0.7529411765, 0.7098039216, 0.7137254902);
    v98.LightColor = Color3.new(1, 0.9960784314, 0.9960784314);
    v98.LightDirection = Vector3.new(9.5, -12, 7.5);
    v98.BackgroundColor3 = Color3.new(0.0990616, 0.138109, 0.452827);
    v98.IsMirrored = true;
    Instance.new("UICorner").Parent = v100;
    Instance.new("UICorner").Parent = v98;
    local l_UIStroke_0 = Instance.new("UIStroke");
    l_UIStroke_0.Parent = v100;
    l_UIStroke_0.Thickness = 3;
    l_UIStroke_0.Color = v44;
    l_UIStroke_0 = Instance.new("UIStroke");
    l_UIStroke_0.Parent = v98;
    l_UIStroke_0.Thickness = 2.5;
    l_UIStroke_0.Color = v44;
    v99 = Instance.new("Camera");
    v99.FieldOfView = 52.5;
    v98.CurrentCamera = v99;
    v99.Parent = v98;
    return v98;
end;
getViewportFrame = function()
    if v98 then
        clearViewportFrame();
    end;
    v98 = createViewportFrame();
    return v98;
end;
local function v276()
    local v226 = 0;
    if not v55() or not v11 then
        if v123 then
            v226 = v226 + 1;
        end;
    elseif v65() then
        v226 = v226 + 1;
    end;
    if if not v56() then if v57() then v124 else v124 and not l_default_0:VoiceChatEnded() else v125 and (not l_default_0:VoiceChatEnded() or v122) then
        v226 = v226 + 1;
    end;
    if v108 then
        v108:Destroy();
    end;
    v108 = Instance.new("Frame");
    v108.Name = "SelfView";
    v108.Parent = v72;
    v108.Active = true;
    v108.Size = v43;
    local l_v42_0 = v42;
    v108.BackgroundTransparency = 1;
    v108.InputBegan:Connect(function(v228)
        v214(v108, v228);
    end);
    v108.MouseEnter:Connect(function()
        if not l_VRService_0.VREnabled then
            v121 = true;
            v28.push(v29, Enum.OverrideMouseIconBehavior.ForceShow);
        end;
    end);
    v108.MouseLeave:Connect(function()
        if v121 then
            v121 = false;
            v28.pop(v29);
        end;
    end);
    v108.Visible = false;
    local l_UIAspectRatioConstraint_0 = Instance.new("UIAspectRatioConstraint");
    l_UIAspectRatioConstraint_0.Parent = v108;
    l_UIAspectRatioConstraint_0.AspectRatio = 0.833;
    l_UIAspectRatioConstraint_0.AspectType = "ScaleWithParentSize";
    l_UIAspectRatioConstraint_0.DominantAxis = "Width";
    local l_UISizeConstraint_0 = Instance.new("UISizeConstraint");
    l_UISizeConstraint_0.Parent = v108;
    l_UISizeConstraint_0.MaxSize = Vector2.new(140, 140);
    l_UISizeConstraint_0.MinSize = Vector2.new(95, 95);
    pcall(function()
        local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem("SelfViewPosition");
        if l_l_AppStorageService_0_Item_0 then
            local v232 = string.split(l_l_AppStorageService_0_Item_0, ",");
            local __ = UDim2.fromOffset(v232[1], v232[2]);
            l_v42_0 = constrainTargetPositionToScreen(v108, v108.Parent.AbsoluteSize, {
                X = v232[1], 
                Y = v232[2]
            });
        end;
    end);
    v108.Position = l_v42_0;
    v108.Position = getRelativePosition(v108);
    v109 = Instance.new("Frame");
    v109.Name = "BottomButtonsFrame";
    v109.Position = UDim2.new(0, 0, 1, -35);
    v109.Size = UDim2.new(1, 0, 0, 36);
    v109.BackgroundColor3 = v44;
    v109.BackgroundTransparency = 0;
    v109.BorderSizePixel = 0;
    v109.Parent = v108;
    local l_UIPadding_0 = Instance.new("UIPadding");
    l_UIPadding_0.Parent = v109;
    l_UIPadding_0.PaddingBottom = UDim.new(0, 0);
    l_UIPadding_0.PaddingLeft = UDim.new(0, 0);
    l_UIPadding_0.PaddingRight = UDim.new(0, 0);
    l_UIPadding_0.PaddingTop = UDim.new(0, 3);
    local l_UIListLayout_0 = Instance.new("UIListLayout");
    l_UIListLayout_0.Parent = v109;
    l_UIListLayout_0.Padding = UDim.new(0, 5);
    l_UIListLayout_0.FillDirection = Enum.FillDirection.Horizontal;
    l_UIListLayout_0.HorizontalAlignment = Enum.HorizontalAlignment.Center;
    l_UIListLayout_0.VerticalAlignment = Enum.VerticalAlignment.Center;
    l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
    local v236 = v226 == 2 and 0.5 or 1;
    local l_ImageButton_0 = Instance.new("ImageButton");
    l_ImageButton_0.Name = "MicButton";
    l_ImageButton_0.Parent = v109;
    l_ImageButton_0.Position = UDim2.new(0, 0, 0, 0);
    l_ImageButton_0.Size = UDim2.new(v236, -4, 1, -4);
    l_ImageButton_0.Image = "rbxasset://textures/SelfView/whiteRect.png";
    l_ImageButton_0.ImageColor3 = Color3.new(0.294117, 0.294117, 0.294117);
    l_ImageButton_0.BackgroundTransparency = 1;
    l_ImageButton_0.LayoutOrder = 0;
    l_ImageButton_0.ZIndex = 2;
    l_ImageButton_0.Visible = if not v56() then if v57() then v124 else v124 and not l_default_0:VoiceChatEnded() else v125 and (not l_default_0:VoiceChatEnded() or v122);
    l_ImageButton_0.Activated:Connect(function()
        local v238 = l_default_0:getService();
        debugPrint("Self View: micButton.Activated(), voiceService:" .. tostring(v238) .. ",hasMicPermissions:" .. tostring(v124));
        if not (not v238 or not if not v56() then if v57() then v124 else v124 and not l_default_0:VoiceChatEnded() else v125 and (not l_default_0:VoiceChatEnded() or v122)) then
            if not v78() or not v122 then
                l_default_0:ToggleMic("LegacySelfView");
                v38:setLastCtx("SelfView");
                if v80 then
                    v80:onToggleMuteSelf(not l_default_0.localMuted);
                end;
            else
                l_default_0:ShowVoiceChatLoadingMessage();
                return ;
            end;
        end;
    end);
    Instance.new("UICorner").Parent = l_ImageButton_0;
    local l_ImageButton_1 = Instance.new("ImageButton");
    l_ImageButton_1.Name = "CamButton";
    l_ImageButton_1.Parent = v109;
    l_ImageButton_1.Position = UDim2.new(0, 0, 0, 0);
    l_ImageButton_1.Size = UDim2.new(v236, -4, 1, -4);
    l_ImageButton_1.Image = "rbxasset://textures/SelfView/whiteRect.png";
    l_ImageButton_1.ImageColor3 = Color3.new(0.294117, 0.294117, 0.294117);
    l_ImageButton_1.BackgroundTransparency = 1;
    l_ImageButton_1.LayoutOrder = 1;
    l_ImageButton_1.ZIndex = 3;
    local l_v123_1 = v123;
    if v55() then
        l_v123_1 = v65();
    end;
    l_ImageButton_1.Visible = l_v123_1;
    l_ImageButton_1.Activated:Connect(function()
        debugPrint("Self View: camButton.Activated(), hasCameraPermissions:" .. tostring(v123));
        local function __()
            if l_game_Service_0 and l_game_Service_0:IsStarted() then
                l_game_Service_0.VideoAnimationEnabled = not l_game_Service_0.VideoAnimationEnabled;
                v38:setLastCtx("SelfView");
                return ;
            else
                updateVideoButton(false);
                return ;
            end;
        end;
        if not v55() then
            if not v123 then
                updateVideoButton(false);
                return ;
            elseif l_game_Service_0 and l_game_Service_0:IsStarted() then
                l_game_Service_0.VideoAnimationEnabled = not l_game_Service_0.VideoAnimationEnabled;
                v38:setLastCtx("SelfView");
                return ;
            else
                updateVideoButton(false);
                return ;
            end;
        elseif not v123 then
            v47(function(v242)
                v123 = v242.hasCameraPermissions;
                if not v242.hasCameraPermissions then
                    v66();
                    updateVideoButton(false);
                    return ;
                elseif l_game_Service_0 and l_game_Service_0:IsStarted() then
                    l_game_Service_0.VideoAnimationEnabled = not l_game_Service_0.VideoAnimationEnabled;
                    v38:setLastCtx("SelfView");
                    return ;
                else
                    updateVideoButton(false);
                    return ;
                end;
            end, {
                l_default_1.Permissions.CAMERA_ACCESS
            });
            return ;
        elseif l_game_Service_0 and l_game_Service_0:IsStarted() then
            l_game_Service_0.VideoAnimationEnabled = not l_game_Service_0.VideoAnimationEnabled;
            v38:setLastCtx("SelfView");
            return ;
        else
            updateVideoButton(false);
            return ;
        end;
    end);
    Instance.new("UICorner").Parent = l_ImageButton_1;
    v110 = Instance.new("ImageLabel");
    v110.Name = "MicIcon";
    v110.Parent = l_ImageButton_0;
    v110.AnchorPoint = Vector2.new(0.5, 0.5);
    v110.Position = UDim2.new(0.5, 0, 0.5, 0);
    if not v78() or not v122 then
        v110.Size = UDim2.new(0, 32, 0, 32);
        v110.Image = v70.Image;
        v110.ImageRectOffset = v70.ImageRectOffset;
        v110.ImageRectSize = v70.ImageRectSize;
    else
        v110.Size = UDim2.fromOffset(16, 20);
        v110.Image = l_default_0:GetIcon("Connecting", "New");
        v110.ImageRectOffset = Vector2.new(0, 0);
        v110.ImageRectSize = Vector2.new(0, 0);
    end;
    v110.BackgroundTransparency = 1;
    v110.ZIndex = 2;
    v111 = Instance.new("ImageLabel");
    v111.Name = "CamIcon";
    v111.Parent = l_ImageButton_1;
    v111.AnchorPoint = Vector2.new(0.5, 0.5);
    v111.Position = UDim2.new(0.5, 0, 0.5, 0);
    v111.Size = UDim2.new(0, 32, 0, 32);
    v111.Image = v69.Image;
    v111.ImageRectOffset = v69.ImageRectOffset;
    v111.ImageRectSize = v69.ImageRectSize;
    v111.BackgroundTransparency = 1;
    v111.ZIndex = 2;
    if not v18 then
        local l_Frame_0 = Instance.new("Frame");
        l_Frame_0.Name = "SelfViewFrame";
        l_Frame_0.Position = UDim2.new(0, 0, 0, 0);
        l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
        l_Frame_0.BackgroundTransparency = 1;
        l_Frame_0.Parent = v108;
        v98 = Instance.new("ViewportFrame");
        v98.Position = UDim2.new(0, 0, 0, 0);
        v98.Size = UDim2.new(1, 0, 1, -35);
        v98.BackgroundColor3 = Color3.new(0, 0, 0);
        v98.BorderColor3 = Color3.new(0.6, 0.5, 0.4);
        v98.BorderSizePixel = 2;
        v98.BackgroundTransparency = 0.65;
        v98.Parent = l_Frame_0;
        v98.Ambient = Color3.new(0.7529411765, 0.7098039216, 0.7137254902);
        v98.LightColor = Color3.new(1, 0.9960784314, 0.9960784314);
        v98.LightDirection = Vector3.new(9.5, -12, 7.5);
        v98.BackgroundColor3 = Color3.new(0.0990616, 0.138109, 0.452827);
        v98.IsMirrored = true;
        v112 = Instance.new("ImageLabel");
        v112.Name = "IndicatorCircle";
        v112.Parent = v108;
        v112.Position = UDim2.new(1, -25, 0, 4);
        v112.Size = UDim2.new(0, 22, 0, 22);
        v112.Image = "rbxasset://textures/SelfView/SelfView_icon_indicator_off.png";
        v112.BackgroundTransparency = 1;
        v112.Visible = false;
        v112.ZIndex = 4;
        local l_ImageButton_2 = Instance.new("ImageButton");
        l_ImageButton_2.Name = "CloseButton";
        l_ImageButton_2.AnchorPoint = Vector2.new(0, 0.5);
        l_ImageButton_2.Parent = v108;
        l_ImageButton_2.Position = UDim2.fromOffset(0, 16);
        l_ImageButton_2.Size = UDim2.new(0, 34, 0, 34);
        l_ImageButton_2.Image = "rbxasset://textures/SelfView/whiteRect.png";
        l_ImageButton_2.ImageTransparency = 1;
        l_ImageButton_2.BackgroundTransparency = 1;
        l_ImageButton_2.BackgroundColor3 = Color3.new(0.137254, 0.137254, 0.137254);
        l_ImageButton_2.ZIndex = 2;
        local l_ImageLabel_0 = Instance.new("ImageLabel");
        l_ImageLabel_0.Name = "CloseButtonIcon";
        l_ImageLabel_0.Parent = l_ImageButton_2;
        l_ImageLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
        l_ImageLabel_0.Position = UDim2.new(0, 17, 0, 17);
        l_ImageLabel_0.Size = UDim2.new(0, 32, 0, 32);
        l_ImageLabel_0.Image = "rbxasset://textures/SelfView/SelfView_icon_close.png";
        l_ImageLabel_0.ImageTransparency = 0;
        l_ImageLabel_0.BackgroundTransparency = 1;
        l_ImageLabel_0.ZIndex = 2;
        local l_ImageLabel_1 = Instance.new("ImageLabel");
        l_ImageLabel_1.Name = "FaceIcon";
        l_ImageLabel_1.Parent = v108;
        l_ImageLabel_1.AnchorPoint = Vector2.new(0.5, 0.5);
        l_ImageLabel_1.Position = UDim2.new(0, 17, 0, 17);
        l_ImageLabel_1.Size = UDim2.new(0, 32, 0, 32);
        l_ImageLabel_1.Image = "rbxasset://textures/SelfView/SelfView_icon_faceToggle_on.png";
        l_ImageLabel_1.BackgroundTransparency = 1;
        l_ImageLabel_1.ZIndex = 2;
        l_ImageLabel_1.Visible = false;
        l_ImageLabel_1.Parent = l_ImageButton_2;
        local function __()
            if not v113 then
                l_ImageButton_0.Visible = false;
                l_ImageButton_1.Visible = false;
                l_ImageButton_2.Visible = false;
                return ;
            else
                l_ImageButton_0.Visible = true;
                l_ImageButton_1.Visible = true;
                l_ImageButton_2.Visible = true;
                return ;
            end;
        end;
        local function v255(v248, v249, v250)
            v224(v248);
            if not v113 then
                l_ImageButton_0.Visible = false;
                l_ImageButton_1.Visible = false;
                l_ImageButton_2.Visible = false;
            else
                l_ImageButton_0.Visible = true;
                l_ImageButton_1.Visible = true;
                l_ImageButton_2.Visible = true;
            end;
            if not v18 then
                l_Frame_0.Visible = v248;
            end;
            v109.Visible = v248;
            l_ImageLabel_0.Visible = v248;
            l_ImageLabel_1.Visible = not v248;
            l_ImageButton_2.BackgroundTransparency = not v248 and 0.5 or 1;
            if not v113 then
                l_ImageButton_0.Position = UDim2.new(0, 40, 0, -1);
                l_ImageButton_0.Size = UDim2.new(0, 34, 0, 34);
                l_ImageButton_0.ImageTransparency = 0.3;
                l_ImageButton_1.Position = UDim2.new(0, 80, 0, -1);
                l_ImageButton_1.Size = UDim2.new(0, 34, 0, 34);
                l_ImageButton_1.ImageTransparency = 0.3;
                v112.Position = UDim2.new(0, 20, 0, -10);
                v108.Active = false;
                v108.Visible = false;
                if not v2 then
                    if v1 then
                        v1:Destroy();
                        v1 = nil;
                    end;
                else
                    local v251 = nil;
                    local l_v2_0 = v2;
                    local l_v1_0 = v1;
                    do
                        local l_v251_0 = v251;
                        l_v251_0 = v2.Stopped:Connect(function()
                            l_v2_0:Destroy();
                            if l_v1_0 then
                                l_v1_0:Destroy();
                            end;
                            l_v251_0:Disconnect();
                        end);
                        v2:Stop(0);
                        v2 = nil;
                    end;
                end;
                if shouldDisplaySelfViewTooltip("ShowSelfieViewClosedTooltip") then
                    v62({
                        fallbackText = "You can find your camera and self-view controls here", 
                        translationKey = "Feature.Avatar.Message.FTUXSelfieViewClosedTooltip", 
                        tooltipLifetime = v61
                    });
                    pcall(function()
                        l_AppStorageService_0:SetItem("ShowSelfieViewClosedTooltip", "false");
                    end);
                end;
            else
                l_ImageButton_0.Position = UDim2.new(0, 0, 0, 0);
                l_ImageButton_0.Size = UDim2.new(0.5, -4, 1, -4);
                l_ImageButton_0.ImageTransparency = 0;
                l_ImageButton_1.Position = UDim2.new(0, 0, 0, 0);
                l_ImageButton_1.Size = UDim2.new(0.5, -4, 1, -4);
                l_ImageButton_1.ImageTransparency = 0;
                v112.Position = UDim2.new(1, -25, 0, 4);
                if v249 ~= nil then
                    v108.Position = v249;
                end;
                if v250 ~= nil then
                    v108.AnchorPoint = v250;
                end;
                v108.Active = true;
                v108.Visible = true;
                if shouldDisplaySelfViewTooltip("ShowSelfieViewOpenedTooltip") then
                    v64 = v63({
                        fallbackText = "Use your camera to make your avatar smile and move just like you", 
                        translationKey = "Feature.Avatar.Message.FTUXSelfieViewOpenedTooltip", 
                        anchorPoint = v108.AnchorPoint, 
                        position = v108.Position, 
                        size = v108.Size, 
                        bottomButtonsFramePosition = v109.Position, 
                        bottomButtonsFrameSize = v109.Size, 
                        aspectRatio = l_UIAspectRatioConstraint_0.AspectRatio, 
                        maxSize = l_UISizeConstraint_0.MaxSize, 
                        minSize = l_UISizeConstraint_0.MinSize, 
                        tooltipLifetime = v61
                    });
                    pcall(function()
                        l_AppStorageService_0:SetItem("ShowSelfieViewOpenedTooltip", "false");
                    end);
                end;
            end;
            v109.Visible = v113;
        end;
        v60 = v255;
        l_ImageButton_2.Activated:Connect(function()
            v255(not v113);
        end);
        if v130 then
            v130:disconnect();
        end;
        v130 = v46:connect(function()
            v255(not v113);
        end);
        if v133 then
            v133:Disconnect();
            v133 = nil;
        end;
        if v134 then
            v134:Disconnect();
            v134 = nil;
        end;
        v133 = l_SocialService_0.SelfViewVisible:Connect(function(v256)
            if not v113 then
                local v257 = nil;
                local v258 = nil;
                if v256 == Enum.SelfViewPosition.TopLeft then
                    v257 = UDim2.new(0, 24, 0, 24);
                    v258 = Vector2.new(0, 0);
                elseif v256 == Enum.SelfViewPosition.TopRight then
                    v257 = UDim2.new(1, -24, 0, 24);
                    v258 = Vector2.new(1, 0);
                elseif v256 == Enum.SelfViewPosition.BottomLeft then
                    v257 = UDim2.new(0, 24, 1, -24);
                    v258 = Vector2.new(0, 1);
                elseif v256 == Enum.SelfViewPosition.BottomRight then
                    v257 = UDim2.new(1, -24, 1, -24);
                    v258 = Vector2.new(1, 1);
                end;
                v255(true, v257, v258);
                if v257 ~= nil then
                    l_AppStorageService_0:SetItem("SelfViewPosition", v108.AbsolutePosition.X .. "," .. v108.AbsolutePosition.Y);
                end;
            end;
        end);
        v134 = l_SocialService_0.SelfViewHidden:Connect(function()
            if v113 then
                if not (not v57() or not v64) then
                    v64.unmount();
                    v64 = nil;
                end;
                v255(false);
            end;
        end);
        Instance.new("UICorner").Parent = l_ImageButton_2;
        if not v18 then
            Instance.new("UICorner").Parent = l_Frame_0;
            Instance.new("UICorner").Parent = v98;
            local l_UIStroke_1 = Instance.new("UIStroke");
            l_UIStroke_1.Parent = l_Frame_0;
            l_UIStroke_1.Thickness = 3;
            l_UIStroke_1.Color = v44;
            l_UIStroke_1 = Instance.new("UIStroke");
            l_UIStroke_1.Parent = v98;
            l_UIStroke_1.Thickness = 2.5;
            l_UIStroke_1.Color = v44;
        end;
        createCloneAnchor();
        if not v18 then
            v99 = Instance.new("Camera");
            v99.FieldOfView = 52.5;
            v98.CurrentCamera = v99;
            v99.Parent = v98;
        end;
        if not v90 then
            connectToScreenOrientationChange();
        end;
    else
        if v113 then
            getViewportFrame();
        end;
        v112 = Instance.new("ImageLabel");
        v112.Name = "IndicatorCircle";
        v112.Parent = v108;
        v112.Position = UDim2.new(1, -25, 0, 4);
        v112.Size = UDim2.new(0, 22, 0, 22);
        v112.Image = "rbxasset://textures/SelfView/SelfView_icon_indicator_off.png";
        v112.BackgroundTransparency = 1;
        v112.Visible = false;
        v112.ZIndex = 4;
        local l_ImageButton_3 = Instance.new("ImageButton");
        l_ImageButton_3.Name = "CloseButton";
        l_ImageButton_3.AnchorPoint = Vector2.new(0, 0.5);
        l_ImageButton_3.Parent = v108;
        l_ImageButton_3.Position = UDim2.fromOffset(0, 16);
        l_ImageButton_3.Size = UDim2.new(0, 34, 0, 34);
        l_ImageButton_3.Image = "rbxasset://textures/SelfView/whiteRect.png";
        l_ImageButton_3.ImageTransparency = 1;
        l_ImageButton_3.BackgroundTransparency = 1;
        l_ImageButton_3.BackgroundColor3 = Color3.new(0.137254, 0.137254, 0.137254);
        l_ImageButton_3.ZIndex = 2;
        local l_ImageLabel_2 = Instance.new("ImageLabel");
        l_ImageLabel_2.Name = "CloseButtonIcon";
        l_ImageLabel_2.Parent = l_ImageButton_3;
        l_ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5);
        l_ImageLabel_2.Position = UDim2.new(0, 17, 0, 17);
        l_ImageLabel_2.Size = UDim2.new(0, 32, 0, 32);
        l_ImageLabel_2.Image = "rbxasset://textures/SelfView/SelfView_icon_close.png";
        l_ImageLabel_2.ImageTransparency = 0;
        l_ImageLabel_2.BackgroundTransparency = 1;
        l_ImageLabel_2.ZIndex = 2;
        local l_ImageLabel_3 = Instance.new("ImageLabel");
        l_ImageLabel_3.Name = "FaceIcon";
        l_ImageLabel_3.Parent = v108;
        l_ImageLabel_3.AnchorPoint = Vector2.new(0.5, 0.5);
        l_ImageLabel_3.Position = UDim2.new(0, 17, 0, 17);
        l_ImageLabel_3.Size = UDim2.new(0, 32, 0, 32);
        l_ImageLabel_3.Image = "rbxasset://textures/SelfView/SelfView_icon_faceToggle_on.png";
        l_ImageLabel_3.BackgroundTransparency = 1;
        l_ImageLabel_3.ZIndex = 2;
        l_ImageLabel_3.Visible = false;
        l_ImageLabel_3.Parent = l_ImageButton_3;
        local function __()
            if not v113 then
                l_ImageButton_0.Visible = false;
                l_ImageButton_1.Visible = false;
                l_ImageButton_3.Visible = false;
                return ;
            else
                l_ImageButton_0.Visible = true;
                l_ImageButton_1.Visible = true;
                l_ImageButton_3.Visible = true;
                return ;
            end;
        end;
        local function v271(v264, v265, v266)
            v224(v264);
            if not v113 then
                l_ImageButton_0.Visible = false;
                l_ImageButton_1.Visible = false;
                l_ImageButton_3.Visible = false;
            else
                l_ImageButton_0.Visible = true;
                l_ImageButton_1.Visible = true;
                l_ImageButton_3.Visible = true;
            end;
            if not v18 then
                v100.Visible = v264;
            end;
            v109.Visible = v264;
            l_ImageLabel_2.Visible = v264;
            l_ImageLabel_3.Visible = not v264;
            l_ImageButton_3.BackgroundTransparency = not v264 and 0.5 or 1;
            if not v113 then
                l_ImageButton_0.Position = UDim2.new(0, 40, 0, -1);
                l_ImageButton_0.Size = UDim2.new(0, 34, 0, 34);
                l_ImageButton_0.ImageTransparency = 0.3;
                l_ImageButton_1.Position = UDim2.new(0, 80, 0, -1);
                l_ImageButton_1.Size = UDim2.new(0, 34, 0, 34);
                l_ImageButton_1.ImageTransparency = 0.3;
                v112.Position = UDim2.new(0, 20, 0, -10);
                v108.Active = false;
                v108.Visible = false;
                if not v2 then
                    if v1 then
                        v1:Destroy();
                        v1 = nil;
                    end;
                else
                    local v267 = nil;
                    local l_v2_1 = v2;
                    local l_v1_1 = v1;
                    do
                        local l_v267_0 = v267;
                        l_v267_0 = v2.Stopped:Connect(function()
                            l_v2_1:Destroy();
                            if l_v1_1 then
                                l_v1_1:Destroy();
                            end;
                            l_v267_0:Disconnect();
                        end);
                        v2:Stop(0);
                        v2 = nil;
                    end;
                end;
                if shouldDisplaySelfViewTooltip("ShowSelfieViewClosedTooltip") then
                    v62({
                        fallbackText = "You can find your camera and self-view controls here", 
                        translationKey = "Feature.Avatar.Message.FTUXSelfieViewClosedTooltip", 
                        tooltipLifetime = v61
                    });
                    pcall(function()
                        l_AppStorageService_0:SetItem("ShowSelfieViewClosedTooltip", "false");
                    end);
                end;
            else
                l_ImageButton_0.Position = UDim2.new(0, 0, 0, 0);
                l_ImageButton_0.Size = UDim2.new(0.5, -4, 1, -4);
                l_ImageButton_0.ImageTransparency = 0;
                l_ImageButton_1.Position = UDim2.new(0, 0, 0, 0);
                l_ImageButton_1.Size = UDim2.new(0.5, -4, 1, -4);
                l_ImageButton_1.ImageTransparency = 0;
                v112.Position = UDim2.new(1, -25, 0, 4);
                if v265 ~= nil then
                    v108.Position = v265;
                end;
                if v266 ~= nil then
                    v108.AnchorPoint = v266;
                end;
                v108.Active = true;
                v108.Visible = true;
                if shouldDisplaySelfViewTooltip("ShowSelfieViewOpenedTooltip") then
                    v64 = v63({
                        fallbackText = "Use your camera to make your avatar smile and move just like you", 
                        translationKey = "Feature.Avatar.Message.FTUXSelfieViewOpenedTooltip", 
                        anchorPoint = v108.AnchorPoint, 
                        position = v108.Position, 
                        size = v108.Size, 
                        bottomButtonsFramePosition = v109.Position, 
                        bottomButtonsFrameSize = v109.Size, 
                        aspectRatio = l_UIAspectRatioConstraint_0.AspectRatio, 
                        maxSize = l_UISizeConstraint_0.MaxSize, 
                        minSize = l_UISizeConstraint_0.MinSize, 
                        tooltipLifetime = v61
                    });
                    pcall(function()
                        l_AppStorageService_0:SetItem("ShowSelfieViewOpenedTooltip", "false");
                    end);
                end;
            end;
            v109.Visible = v113;
        end;
        v60 = v271;
        l_ImageButton_3.Activated:Connect(function()
            v271(not v113);
        end);
        if v130 then
            v130:disconnect();
        end;
        v130 = v46:connect(function()
            v271(not v113);
        end);
        if v133 then
            v133:Disconnect();
            v133 = nil;
        end;
        if v134 then
            v134:Disconnect();
            v134 = nil;
        end;
        v133 = l_SocialService_0.SelfViewVisible:Connect(function(v272)
            if not v113 then
                local v273 = nil;
                local v274 = nil;
                if v272 == Enum.SelfViewPosition.TopLeft then
                    v273 = UDim2.new(0, 24, 0, 24);
                    v274 = Vector2.new(0, 0);
                elseif v272 == Enum.SelfViewPosition.TopRight then
                    v273 = UDim2.new(1, -24, 0, 24);
                    v274 = Vector2.new(1, 0);
                elseif v272 == Enum.SelfViewPosition.BottomLeft then
                    v273 = UDim2.new(0, 24, 1, -24);
                    v274 = Vector2.new(0, 1);
                elseif v272 == Enum.SelfViewPosition.BottomRight then
                    v273 = UDim2.new(1, -24, 1, -24);
                    v274 = Vector2.new(1, 1);
                end;
                v271(true, v273, v274);
                if v273 ~= nil then
                    l_AppStorageService_0:SetItem("SelfViewPosition", v108.AbsolutePosition.X .. "," .. v108.AbsolutePosition.Y);
                end;
            end;
        end);
        v134 = l_SocialService_0.SelfViewHidden:Connect(function()
            if v113 then
                if not (not v57() or not v64) then
                    v64.unmount();
                    v64 = nil;
                end;
                v271(false);
            end;
        end);
        Instance.new("UICorner").Parent = l_ImageButton_3;
        if not v18 then
            Instance.new("UICorner").Parent = v100;
            Instance.new("UICorner").Parent = v98;
            local l_UIStroke_2 = Instance.new("UIStroke");
            l_UIStroke_2.Parent = v100;
            l_UIStroke_2.Thickness = 3;
            l_UIStroke_2.Color = v44;
            l_UIStroke_2 = Instance.new("UIStroke");
            l_UIStroke_2.Parent = v98;
            l_UIStroke_2.Thickness = 2.5;
            l_UIStroke_2.Color = v44;
        end;
        createCloneAnchor();
        if not v18 then
            v99 = Instance.new("Camera");
            v99.FieldOfView = 52.5;
            v98.CurrentCamera = v99;
            v99.Parent = v98;
        end;
        if not v90 then
            connectToScreenOrientationChange();
        end;
    end;
end;
toggleIndicator = function(v277)
    debugPrint("Self View: toggleIndicator(), mode: " .. tostring(v277) .. ",hasMicPermissions:" .. tostring(v124) .. ",hasCameraPermissions:" .. tostring(v123));
    if v112 then
        local l_v112_0 = v112;
        local v279;
        if not ((not (not (v277 ~= Enum.TrackerMode.Audio) or v277 == Enum.TrackerMode.AudioVideo) or not if not v56() then if v57() then v124 else v124 and not l_default_0:VoiceChatEnded() else v125 and (not l_default_0:VoiceChatEnded() or v122)) or not v109) then
            v279 = v109.Visible;
            if v279 then
                goto label0;
            end;
        end;
        if v277 ~= Enum.TrackerMode.Video then
            v279 = false;
            if not (v277 == Enum.TrackerMode.AudioVideo) then
                goto label0;
            end;
        end;
        v279 = (v123 and v109) and v109.Visible;
        ::label0::;
        l_v112_0.Visible = v279;
        if not (v277 ~= Enum.TrackerMode.AudioVideo) or v277 == Enum.TrackerMode.Audio then
            v112.Image = "rbxasset://textures/SelfView/SelfView_icon_indicator_on.png";
            return ;
        else
            v112.Image = "rbxasset://textures/SelfView/SelfView_icon_indicator_off.png";
        end;
    end;
end;
showNoDynamicHeadInfoIfNeeded = function()
    if not v131 then
        if v132 == false then
            v131 = true;
            v40:showPrompt(v41.NoDynamicHeadEquipped);
        end;
        return ;
    else
        return ;
    end;
end;
updateVideoButton = function(v280)
    if not v280 then
        if v111 then
            v111.Image = v69.Image;
            v111.ImageRectOffset = v69.ImageRectOffset;
            v111.ImageRectSize = v69.ImageRectSize;
        end;
        return ;
    else
        if v111 then
            v111.Image = v68.Image;
            v111.ImageRectOffset = v68.ImageRectOffset;
            v111.ImageRectSize = v68.ImageRectSize;
        end;
        showNoDynamicHeadInfoIfNeeded();
        return ;
    end;
end;
local function v284()
    v96 = Enum.TrackerMode.None;
    if not l_game_Service_0.AudioAnimationEnabled or l_game_Service_0.VideoAnimationEnabled then
        if (l_game_Service_0.AudioAnimationEnabled or not l_game_Service_0.VideoAnimationEnabled) or not l_game_Service_0:IsStarted() then
            if not ((not l_game_Service_0.AudioAnimationEnabled or not l_game_Service_0.VideoAnimationEnabled) or not l_game_Service_0:IsStarted()) then
                v96 = Enum.TrackerMode.AudioVideo;
            end;
        else
            v96 = Enum.TrackerMode.Video;
        end;
    else
        v96 = Enum.TrackerMode.Audio;
    end;
    v39:trace("Self View: onUpdateTrackerMode(), currentTrackerMode: " .. tostring(v96) .. ",cachedMode:" .. tostring(v97));
    local l_updateVideoButton_0 = updateVideoButton;
    local v282;
    if v96 ~= Enum.TrackerMode.AudioVideo then
        v282 = false;
        if not (v96 == Enum.TrackerMode.Video) then
            goto label1;
        end;
    end;
    v282 = v123;
    ::label1::;
    l_updateVideoButton_0(v282);
    toggleIndicator(v96);
    l_updateVideoButton_0 = false;
    v282 = false;
    if (not v114 and v97 == Enum.TrackerMode.None) and v96 ~= Enum.TrackerMode.None then
        setCloneDirty(true);
    end;
    if not (v127 == v123) or v128 ~= v124 then
        debugPrint("Self View: cachedHasCameraPermissions ~= hasCameraPermissions or cachedHasMicPermissions ~= hasMicPermissions");
        if v127 ~= v123 then
            l_updateVideoButton_0 = true;
        end;
        debugPrint("Self View: permissions changed, triggering clone refresh in case we get a streamtrack");
        setCloneDirty(true);
    end;
    if v97 ~= v96 then
        v282 = true;
    end;
    if not (not v282 and not l_updateVideoButton_0) then
        local v283 = false;
        if v123 and (not (v96 ~= Enum.TrackerMode.Video) or v96 == Enum.TrackerMode.AudioVideo) then
            v283 = true;
        end;
        if not v123 or v96 ~= Enum.TrackerMode.Video and v96 ~= Enum.TrackerMode.AudioVideo then
            v283 = false;
        end;
        if v283 ~= v129 then
            v38:reportCamState(v283);
            v129 = v283;
        end;
    end;
    v127 = v123;
    v128 = v124;
    v97 = v96;
end;
local function v288(v285, v286)
    if v19 and (not v113 or v98 == nil) then
        return ;
    elseif v285 and v286.Animation then
        local v287 = nil;
        if not v286.Animation:IsA("Animation") then
            if not v286.Animation:IsA("TrackerStreamAnimation") then
                warn("No animation to clone in SelfView");
            else
                if not l_game_EngineFeature_1 then
                    v39:trace("animator:LoadStreamAnimation, not EngineFeatureHasFeatureLoadStreamAnimationForSelfieViewApiEnabled");
                    v287 = v285:LoadStreamAnimation(v286.Animation);
                else
                    v39:trace("using LoadStreamAnimationForClone");
                    v1 = Instance.new("TrackerStreamAnimation");
                    v2 = v285:LoadStreamAnimationForSelfieView_deprecated(v1, l_Players_0.LocalPlayer);
                    v287 = v2;
                end;
                v114 = true;
                debugPrint("foundStreamTrack = true");
            end;
        end;
        if v287 then
            v287:Play();
            v287.Priority = v286.Priority;
            v84[v286] = v286.Stopped:Connect(function()
                v287:Stop(0);
                if v84[v286] then
                    v84[v286]:Disconnect();
                end;
            end);
        end;
        return ;
    else
        return ;
    end;
end;
getFaceControls = function(v289)
    if v289 == nil then
        return ;
    else
        return v289:FindFirstChildWhichIsA("FaceControls", true);
    end;
end;
getNeck = function(v290, v291)
    if not (v290 ~= nil) or v291 == nil then
        return nil;
    else
        local l_v290_Descendants_0 = v290:GetDescendants();
        debugPrint("Self VIew: getNeck()");
        for __, v294 in l_v290_Descendants_0, nil, nil do
            if v294:IsA("Motor6D") and (not (v294.Part1 ~= v291) or v294.Name == "Neck") then
                return v294;
            end;
        end;
        if v16 then
            for __, v296 in l_v290_Descendants_0, nil, nil do
                if (v296:IsA("AnimationConstraint") and v296.Parent == v291) and (not (v296.Attachment0.Name ~= "NeckRigAttachment") or v296.Name == "Neck") then
                    return v296;
                end;
            end;
        end;
        return nil;
    end;
end;
findObjectOfNameAndTypeName = function(v297, v298, v299)
    if v299 == nil then
        return nil;
    else
        for __, v301 in (v299:GetDescendants()), nil, nil do
            if not v19 then
                if not (not (v301.Name == v297) or not v301:IsA(v298)) then
                    return v301;
                end;
            elseif v301:IsA(v298) and v301.Name == v297 then
                return v301;
            end;
        end;
        return ;
    end;
end;
getHead = function(v302)
    if v302 then
        local v303 = nil;
        local v304 = getFaceControls(v302);
        if v304 ~= nil then
            if not v15 then
                v303 = v304.Parent;
            elseif v304.Parent and (not (v304.Parent.ClassName ~= "MeshPart") or v304.Parent.ClassName == "Part") then
                v303 = v304.Parent;
            end;
        end;
        if not v303 then
            v303 = findObjectOfNameAndTypeName("Head", "MeshPart", v302) or findObjectOfNameAndTypeName("Head", "Part", v302);
        end;
        debugPrint("Self View: fn getHead(), head: " .. tostring(v303));
        return v303;
    else
        return nil;
    end;
end;
getAnimator = function(v305, v306)
    if v305 == nil then
        return nil;
    else
        local v307 = nil;
        local v308 = nil;
        if v306 > 0 then
            if not v12 then
                v308 = v305:WaitForChild("Humanoid", v306);
            elseif not v13 then
                local v309 = v305:WaitForChild("Humanoid", v306);
                v308 = if not v309:IsA("Humanoid") then v305:FindFirstChildWhichIsA("Humanoid") else v309;
            else
                local v310 = v305:WaitForChild("Humanoid", v306);
                v308 = if not v310 then v305:FindFirstChildWhichIsA("Humanoid") else if v310:IsA("Humanoid") then v310 else v305:FindFirstChildWhichIsA("Humanoid");
            end;
        else
            v308 = if not v12 then v305:FindFirstChild("Humanoid") else v305:FindFirstChildWhichIsA("Humanoid");
        end;
        if v308 ~= nil then
            v307 = if v306 > 0 then v308:WaitForChild("Animator", v306) else v308:FindFirstChild("Animator");
        end;
        if v307 == nil then
            v307 = v305:FindFirstChildWhichIsA("Animator", true);
        end;
        return v307;
    end;
end;
local function v311(v312)
    for __, v314 in v312:GetChildren() do
        if v314:IsA("Script") then
            v314.Disabled = true;
            v314.Parent = nil;
        end;
        v311(v314);
    end;
end;
local function v315(v316)
    for __, v318 in v316:GetChildren() do
        if not (not (((v318:IsA("GuiObject") or v318:IsA("ScreenGui")) or v318:IsA("BillboardGui")) or v318:IsA("AdGui")) and not v318:IsA("SurfaceGui")) then
            v318.Parent = nil;
        end;
        v315(v318);
    end;
end;
local function v319(v320)
    for __, v322 in v320:GetChildren() do
        if not v138[v322.ClassName] then
            v322.Parent = nil;
        end;
        v319(v322);
    end;
end;
local function __(v323)
    if v323 then
        v319(v323);
        return ;
    else
        return ;
    end;
end;
removeTagsFromSelfViewClone = function(v325)
    if v325 == nil then
        return ;
    else
        for __, v327 in ipairs((l_CollectionService_0:GetTags(v325))) do
            if not v17 then
                l_CollectionService_0:RemoveTag(v325, v327);
            elseif v327 ~= "NoFace" then
                l_CollectionService_0:RemoveTag(v325, v327);
            end;
        end;
        for __, v329 in ipairs(v325:GetDescendants()) do
            for __, v331 in ipairs((l_CollectionService_0:GetTags(v329))) do
                if not v17 then
                    l_CollectionService_0:RemoveTag(v329, v331);
                elseif v331 ~= "NoFace" then
                    l_CollectionService_0:RemoveTag(v329, v331);
                end;
            end;
        end;
        return ;
    end;
end;
local function v358(v332)
    debugPrint("Self View: updateClone()");
    clearClone();
    v115 = false;
    if v332 then
        startRenderStepped(v332);
        if v332 and v332.Character then
            local v333 = v332.Character or v332.CharacterAdded:Wait();
            if v333 then
                debugPrint("Self View: updateClone(): character:" .. tostring(v333));
                local v334 = getAnimator(v333, 10);
                clearCloneCharacter();
                local l_Archivable_0 = v333.Archivable;
                v333.Archivable = true;
                local v336 = getHead(v333);
                v103 = v333:Clone();
                if v14 and v103 == nil then
                    return ;
                else
                    if not v19 then
                        removeTagsFromSelfViewClone(v103);
                    end;
                    for __, v338 in ipairs(v103:GetDescendants()) do
                        if v338:IsA("Motor6D") then
                            v338.C0 = CFrame.new(v338.C0.Position);
                            v338.C1 = CFrame.new(v338.C1.Position);
                        end;
                    end;
                    for __, v340 in ipairs(v103:GetDescendants()) do
                        if not v340:IsA("Decal") then
                            if not v340:IsA("MeshPart") then
                                if v340:IsA("Part") then
                                    if not (not (v340.Parent and v340.Parent:IsA("Accessory")) and not table.find(v135, v340.Name)) then
                                        v340.Transparency = 0;
                                    end;
                                    if not (not v19 or not l_CollectionService_0:HasTag(v340, "__RBX__LOCKED_TRANSPARENT")) then
                                        v340.Transparency = 1;
                                    end;
                                end;
                            elseif not (not (v340.Parent and v340.Parent:IsA("Accessory")) and not table.find(v135, v340.Name)) then
                                if table.find(v136, v340.MeshId) then
                                    v340.Transparency = v136[v340.MeshId];
                                else
                                    v136[v340.MeshId] = v340.Transparency;
                                end;
                            end;
                        else
                            v340.Transparency = 0;
                        end;
                    end;
                    if v19 then
                        removeTagsFromSelfViewClone(v103);
                    end;
                    v103.Name = "SelfAvatar";
                    local l_Animate_0 = v103:FindFirstChild("Animate");
                    if l_Animate_0 then
                        l_Animate_0:Destroy();
                    end;
                    l_Animate_0 = v103:FindFirstChild("Health");
                    if l_Animate_0 then
                        l_Animate_0:Destroy();
                    end;
                    local l_v103_0 = v103;
                    if l_v103_0 then
                        v319(l_v103_0);
                    end;
                    for __, v344 in pairs(v103:GetDescendants()) do
                        if v344:IsA("BaseScript") then
                            v344:Destroy();
                        end;
                    end;
                    v333.Archivable = l_Archivable_0;
                    if v103 == nil then
                        debugPrint("Self View: updateClone: no clone could be created");
                        return ;
                    else
                        v103.Parent = v102;
                        v115 = true;
                        l_v103_0 = v103:FindFirstChild("HumanoidRootPart");
                        if l_v103_0 then
                            debugPrint("Self View: cloneRootPart: " .. l_v103_0.Name);
                            l_v103_0.CFrame = CFrame.new((Vector3.new(0, 0, 0)));
                            if not v336 then
                                v99.CFrame = CFrame.lookAt((l_v103_0.Position + l_v103_0.CFrame.LookVector * 2.5) + v74, l_v103_0.Position);
                                v99.CFrame = CFrame.new(v99.CFrame.Position) * CFrame.Angles(-6.981317007977319E-4, 3.141592653589793, 0);
                            else
                                l_Animate_0 = getHead(v103);
                                if not (v14 and not l_Animate_0) then
                                    local v345, v346 = l_CharacterUtility_0.CalculateHeadExtents(v103, (l_CFrameUtility_0.CalculateTargetCFrame(l_Animate_0.CFrame)));
                                    v101 = Vector3.new(v346.X, v346.Y, v346.Z) - Vector3.new(v345.X, v345.Y, v345.Z);
                                    v75 = l_Animate_0.Size.Y;
                                    local v347 = math.min(v101.X, v101.Y);
                                    v347 = math.min(v101.X, v101.Z);
                                    local l_Model_0 = Instance.new("Model");
                                    l_Model_0.Parent = v103;
                                    v333.Archivable = true;
                                    v105 = l_Animate_0:Clone();
                                    v105.CanCollide = false;
                                    v105.Parent = l_Model_0;
                                    v106 = getNeck(v103, v105);
                                    v107 = v105.CFrame;
                                    v105:Destroy();
                                    v99.CFrame = CFrame.lookAt((v107.Position + v107.LookVector * (v347 * 2)) + v73, v107.Position);
                                    v99.Focus = v107;
                                    v333.Archivable = l_Archivable_0;
                                    l_Model_0:Destroy();
                                end;
                            end;
                        end;
                        if v103 == nil then
                            debugPrint("Self View: updateClone: no clone could be created");
                            return ;
                        else
                            debugPrint("Self View: clone:" .. tostring(v103));
                            l_Animate_0 = nil;
                            l_Animate_0 = if not v12 then v103:FindFirstChild("Humanoid") else v103:FindFirstChildWhichIsA("Humanoid");
                            if l_Animate_0 then
                                l_Animate_0.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
                            end;
                            v91 = getAnimator(v103, 0);
                            if not v91 then
                                debugPrint("Self View: updateClone: cloneAnimator is NIL");
                                return ;
                            else
                                if not l_game_EngineFeature_2 then
                                    local l_v91_PlayingAnimationTracks_0 = v91:GetPlayingAnimationTracks();
                                    local l_v91_PlayingAnimationTracksCoreScript_0 = v91:GetPlayingAnimationTracksCoreScript();
                                    for __, v352 in ipairs(l_v91_PlayingAnimationTracks_0) do
                                        if v352 ~= nil then
                                            v352:Stop(0);
                                            v352:Destroy();
                                        end;
                                    end;
                                    for __, v354 in ipairs(l_v91_PlayingAnimationTracksCoreScript_0) do
                                        if v354 ~= nil then
                                            v354:Stop(0);
                                            v354:Destroy();
                                        end;
                                    end;
                                    if v1 then
                                        v1:Destroy();
                                        v1 = nil;
                                    end;
                                end;
                                if not v334 then
                                    debugPrint("Self View: updateClone: no animator (original)");
                                    return ;
                                else
                                    if not l_game_EngineFeature_2 then
                                        for __, v356 in ipairs(v334:GetPlayingAnimationTracksCoreScript()) do
                                            v288(v91, v356);
                                        end;
                                        v140[v141.AnimationPlayedCoreScript] = v334.AnimationPlayedCoreScript:Connect(function(v357)
                                            v288(v91, v357);
                                        end);
                                    else
                                        v91:SynchronizeWith(v334);
                                    end;
                                    v115 = true;
                                    setCloneDirty(false);
                                    return ;
                                end;
                            end;
                        end;
                    end;
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
local __ = function(v359, v360)
    local __ = v359[v360];
end;
updateCachedHeadColor = function(v363)
    if v363 == nil then
        return ;
    else
        if pcall(function()
            local __ = v363.Color;
        end) then
            v94 = v363.Color;
            if pcall(function()
                local __ = v363.Size;
            end) then
                v95 = v363.Size;
            end;
        end;
        return ;
    end;
end;
addHumanoidStateChangedObserver = function(v366)
    if v366 then
        if not v140[v141.HumanoidStateChanged] then
            v140[v141.HumanoidStateChanged] = v366.StateChanged:Connect(function(v367, v368)
                if v367 == Enum.HumanoidStateType.PlatformStanding and v368 == Enum.HumanoidStateType.Running then
                    setCloneDirty(true);
                end;
                if v368 == Enum.HumanoidStateType.GettingUp then
                    setCloneDirty(true);
                end;
            end);
        end;
        return ;
    else
        return ;
    end;
end;
local function v373(v369)
    if v19 and (not v113 or v98 == nil) then
        return ;
    else
        v104 = getHead(v369);
        updateCachedHeadColor(v104);
        clearObserver(v141.DescendantAdded);
        clearObserver(v141.DescendantRemoving);
        clearObserver(v141.HeadSize);
        clearObserver(v141.Color);
        local v370 = nil;
        v370 = if not v12 then v369:FindFirstChild("Humanoid") else v369:FindFirstChildWhichIsA("Humanoid");
        if v370 then
            addHumanoidStateChangedObserver(v370);
        end;
        v140[v141.DescendantAdded] = v369.DescendantAdded:Connect(function(v371)
            if v19 and (not v113 or v98 == nil) then
                return ;
            else
                if v371.Name == "Head" then
                    v104 = getHead(v369);
                    updateCachedHeadColor(v104);
                    if not (v131 or not v371:IsA("MeshPart")) then
                        if v371:WaitForChild("FaceControls", 0.5) == nil then
                            v132 = false;
                        else
                            v132 = true;
                        end;
                    end;
                end;
                if not v12 then
                    if not (v371.Name ~= "Humanoid" and not v371:IsA("Humanoid")) then
                        addHumanoidStateChangedObserver(v371);
                    end;
                elseif v371:IsA("Humanoid") then
                    addHumanoidStateChangedObserver(v371);
                end;
                if not (v371:IsA("MeshPart") or v371:IsA("Part")) and not v371:IsA("Decal") then
                    if v139[v371.ClassName] then
                        setCloneDirty(true);
                    end;
                elseif v371.Transparency < 1 then
                    setCloneDirty(true);
                    return ;
                end;
                return ;
            end;
        end);
        v140[v141.DescendantRemoving] = v369.DescendantRemoving:Connect(function(v372)
            if v19 and (not v113 or v98 == nil) then
                return ;
            else
                if not ((not v372 or not v372:IsA("MeshPart") and not v372:IsA("Accessory")) or not v372:IsA("MeshPart")) then
                    debugPrint("MeshId:" .. tostring(v372.MeshId));
                    if v372.MeshId == "" then
                        return ;
                    end;
                end;
                if not (v372:IsA("MeshPart") or v372:IsA("Part")) and not v372:IsA("Decal") then
                    if v139[v372.ClassName] then
                        setCloneDirty(true);
                    end;
                elseif v372.Transparency < 1 then
                    setCloneDirty(true);
                    return ;
                end;
                return ;
            end;
        end);
        setCloneDirty(true);
        return ;
    end;
end;
ReInit = function(v374)
    debugPrint("Self View: ReInit()");
    v115 = false;
    v104 = getHead(v374.Character);
    updateCachedHeadColor(v104);
    setCloneDirty(false);
    clearObserver(v141.CharacterAdded);
    clearObserver(v141.CharacterRemoving);
    clearClone();
    v276();
    playerAdded(v374);
    startRenderStepped(v374);
end;
local function v377(v375)
    v82:Disconnect();
    ReInit(l_Players_0.LocalPlayer);
    clearObserver(v141.HumanoidStateChanged);
    local v376 = nil;
    v376 = if not v12 then v375:FindFirstChild("Humanoid") else v375:FindFirstChildWhichIsA("Humanoid");
    if v376 then
        addHumanoidStateChangedObserver(v376);
    end;
end;
playerAdded = function(v378)
    if v378 ~= nil and v378 == l_Players_0.LocalPlayer then
        debugPrint("Self View: playerAdded()");
        if v82 ~= nil then
            v82:Disconnect();
            v82 = nil;
            clearObserver(v141.CharacterAdded);
        end;
        local v379 = v378.Character or v378.CharacterAdded:Wait();
        v82 = v378.CharacterAdded:Connect(v377);
        v373(v379);
        v140[v141.CharacterAdded] = v378.CharacterAdded:Connect(v373);
        v140[v141.CharacterRemoving] = v378.CharacterRemoving:Connect(function()
            clearObserver(v141.DescendantAdded);
            clearObserver(v141.DescendantRemoving);
            clearObserver(v141.HeadSize);
            clearObserver(v141.Color);
            v358(nil);
            clearObserver(v141.CharacterRemoving);
        end);
    end;
end;
stopRenderStepped = function()
    if v81 then
        v81:Disconnect();
        v81 = nil;
    end;
end;
updateClonePartsColor = function(v380)
    if pcall(function()
        local __ = v104.Color;
    end) and v104.Color ~= v94 then
        local l_Character_0 = l_Players_0.LocalPlayer.Character;
        if l_Character_0 then
            if v103 then
                for __, v384 in pairs(l_Character_0:GetChildren()) do
                    if v384:IsA("MeshPart") then
                        local l_v103_FirstChild_0 = v103:FindFirstChild(v384.Name);
                        if not (((not l_v103_FirstChild_0 or not l_v103_FirstChild_0:IsA("MeshPart")) or not l_v103_FirstChild_0.Color) or not v384.Color) then
                            l_v103_FirstChild_0.Color = v384.Color;
                        end;
                    end;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v94 = v380;
end;
prepMicAndCamPropertyChangedSignalHandler = function()
    debugPrint("Self View: prepMicAndCamPropertyChangedSignalHandler()");
    if not v85 then
        v85 = l_game_Service_0:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(function()
            v284();
        end);
    end;
    if not v86 then
        v86 = l_game_Service_0:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(function()
            v284();
        end);
    end;
    if not v87 then
        v87 = l_game_Service_1.Started:Connect(function()
            debugPrint("Self View: VideoCaptureService.Started event");
            getPermissions();
            v284();
        end);
    end;
    if not v88 then
        v88 = l_game_Service_1.Stopped:Connect(function()
            debugPrint("Self View: VideoCaptureService.Stopped event");
            getPermissions();
            v284();
        end);
    end;
    if not v89 then
        v89 = l_game_Service_1.DevicesChanged:Connect(function()
            getPermissions();
            v284();
        end);
    end;
end;
trackSelfViewSessionAsNeeded = function()
    if v108 then
        v119 = v108.Visible and v113;
        if v119 and v120 ~= v119 then
            startSelfViewSession();
        end;
        if not v119 and v120 ~= v119 then
            stopSelfViewSession();
        end;
        v120 = v119;
    end;
end;
frameShouldBeVisible = function(v386, v387)
    if v113 then
        if getShouldBeEnabledCoreGuiSetting() then
            if not v387 then
                if v116 == nil then
                    v116 = 0;
                end;
                v116 = v116 + v386;
                debugPrint("Self View: noUsableCloneOffset: " .. tostring(v116));
                if v116 > 5 then
                    v116 = nil;
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
startRenderStepped = function(v388)
    debugPrint("Self View: startRenderStepped()");
    stopRenderStepped();
    prepMicAndCamPropertyChangedSignalHandler();
    v284();
    if v113 then
        v81 = l_RunService_0.RenderStepped:Connect(function(v389)
            v115 = false;
            if l_Players_0.LocalPlayer then
                local l_Character_1 = l_Players_0.LocalPlayer.Character;
                if not l_Character_1 or l_Character_1.Parent == nil then
                    return ;
                else
                    if not (v104 ~= nil) or v104.Parent ~= l_Character_1 then
                        v104 = getHead(l_Character_1);
                    end;
                    if v104 then
                        local v391 = getAnimator(l_Character_1, 0);
                        if v91 ~= nil and v391 ~= nil then
                            v115 = true;
                            if not l_game_EngineFeature_2 then
                                for __, v393 in pairs((v91:GetPlayingAnimationTracks())) do
                                    if v393 ~= nil then
                                        v393:Stop(0);
                                    end;
                                end;
                                local l_v391_PlayingAnimationTracks_0 = v391:GetPlayingAnimationTracks();
                                local v395 = nil;
                                v93 = {};
                                for __, v397 in ipairs(l_v391_PlayingAnimationTracks_0) do
                                    v395 = v397.Animation;
                                    if not (not v395 or not v395:IsA("Animation")) and v395.AnimationId ~= "" then
                                        v93[v395.AnimationId] = v397;
                                        if not v92[v395.AnimationId] then
                                            v92[v395.AnimationId] = v91:LoadAnimation(v395);
                                        end;
                                        local v398 = v92[v395.AnimationId];
                                        v398:Play();
                                        v398.TimePosition = v397.TimePosition;
                                        v398.Priority = v397.Priority;
                                        v398:AdjustWeight(v397.WeightCurrent, 0.1);
                                    end;
                                end;
                                for v399 in v92, nil, nil do
                                    local v400 = v92[v399];
                                    if v400 then
                                        v395 = v400.Animation;
                                        if not (not v395 or v93[v395.AnimationId]) then
                                            if v92[v395.AnimationId] ~= nil then
                                                v92[v395.AnimationId]:Stop(0);
                                            end;
                                            v92[v395.AnimationId] = nil;
                                        end;
                                    end;
                                end;
                                for __, v402 in ipairs(v391:GetPlayingAnimationTracksCoreScript()) do
                                    for __, v404 in pairs((v91:GetPlayingAnimationTracksCoreScript())) do
                                        if v404.Animation:IsA("TrackerStreamAnimation") then
                                            v404.Priority = v402.Priority;
                                            v404:AdjustWeight(v402.WeightCurrent, 0);
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    local v405 = nil;
                    local v406 = nil;
                    if l_GetFFlagIrisGyroEnabled_0() then
                        v405 = 0.5;
                        v406 = nil;
                        local l_l_UserInputService_1_Platform_0 = l_UserInputService_1:GetPlatform();
                        if (not (l_l_UserInputService_1_Platform_0 ~= Enum.Platform.IOS) or l_l_UserInputService_1_Platform_0 == Enum.Platform.Android) and v91 ~= nil then
                            for __, v409 in pairs((v91:GetPlayingAnimationTracksCoreScript())) do
                                if v409.Animation:IsA("TrackerStreamAnimation") then
                                    local l_v409_TrackerData_0, v411, v412 = v409:GetTrackerData();
                                    _ = l_v409_TrackerData_0;
                                    _ = v412;
                                    v406 = v411;
                                end;
                            end;
                        end;
                    end;
                    v118 = v118 + 1;
                    if v118 == 1 then
                        v118 = 0;
                        if v103 then
                            if not v105 then
                                v105 = getHead(v103);
                                if v105 then
                                    v106 = getNeck(v103, v105);
                                end;
                            end;
                            if v105 then
                                v107 = v105.CFrame;
                            end;
                        end;
                        if not (not v99 or not v105) then
                            local l_Position_1 = v105.Position;
                            local l_Position_2 = v105.Position;
                            local l_CFrame_0 = v105.CFrame;
                            if not v106 then
                                debugPrint("Self View: no neck found");
                            else
                                local l_Part0_0 = v106.Part0;
                                local __ = v106.Part1;
                                local l_C0_0 = v106.C0;
                                local l_C1_0 = v106.C1;
                                local l_Transform_0 = v106.Transform;
                                if not (not l_Part0_0 or not l_C0_0) then
                                    l_CFrame_0 = ((l_Part0_0.CFrame * l_C0_0) * l_Transform_0) * l_C1_0:Inverse();
                                    l_Position_2 = Vector3.new(l_CFrame_0.Position.X * 0.25, ((v105.CFrame.Position.Y + l_CFrame_0.Position.Y) + l_CFrame_0.Position.Y * 0.75) * 0.33333, l_CFrame_0.Position.Z);
                                    l_Position_1 = Vector3.new(l_CFrame_0.Position.X * 0.6, ((v105.CFrame.Position.Y + l_CFrame_0.Position.Y) + l_CFrame_0.Position.Y * 0.75) * 0.33333, l_CFrame_0.Position.Z);
                                end;
                            end;
                            if not v16 then
                                if not l_GetFFlagIrisGyroEnabled_0() or v406 == nil and not l_game_EngineFeature_3 then
                                    v99.CFrame = CFrame.lookAt(l_Position_1 + Vector3.new(0, v75 * 0.25, -(v101.Z + 1)), l_Position_2);
                                    v99.Focus = v105.CFrame;
                                elseif not l_game_EngineFeature_3 then
                                    local v421 = Vector3.new(0, 0.105, -(v101.Z + 1));
                                    local v422, v423, v424 = v406:ToEulerAnglesXYZ();
                                    v99.CFrame = CFrame.lookAt(CFrame.Angles(-v422 * v405, -v423 * v405, -v424 * v405) * (l_Position_1 + v421), l_Position_2);
                                else
                                    local l_DeviceCameraCFrameForSelfView_0 = game:GetService("PlayerViewService"):GetDeviceCameraCFrameForSelfView();
                                    local l_Position_3 = l_DeviceCameraCFrameForSelfView_0.Position;
                                    local v427, v428, v429 = l_DeviceCameraCFrameForSelfView_0:ToEulerAnglesYXZ();
                                    local v430 = CFrame.fromEulerAnglesYXZ(v427, v428, v429);
                                    local v431 = 0;
                                    if l_Position_3.Z > 0 then
                                        v431 = math.clamp(0.5 - l_Position_3.Z * 3, -0.5, 0.5);
                                    end;
                                    local v432 = -(v101.Z + 1);
                                    v99.CFrame = v99.CFrame:lerp(CFrame.lookAt(v430 * (l_Position_1 + Vector3.new(0, 0.105, math.floor((v432 + v431 * v432) * 100) / 100)), l_Position_2), 0.5);
                                end;
                            elseif ((not l_game_Service_0 or not l_game_Service_0.VideoAnimationEnabled) or not l_GetFFlagIrisGyroEnabled_0()) or v406 == nil and not l_game_EngineFeature_3 then
                                local v433 = Vector3.new(0, v75 * 0.25 - 1.25, -(v101.Z + 1) + 0.125);
                                local l_Character_2 = l_Players_0.LocalPlayer.Character;
                                if l_Character_2 then
                                    local l_Head_0 = l_Character_2:FindFirstChild("Head");
                                    if l_Head_0 then
                                        local l_HumanoidRootPart_0 = l_Character_2:FindFirstChild("HumanoidRootPart");
                                        if l_HumanoidRootPart_0 then
                                            local v437 = l_HumanoidRootPart_0.CFrame:Inverse() * l_Head_0.CFrame;
                                            v99.CFrame = CFrame.lookAt((l_Position_1 + v433) + Vector3.new(v437.Position.x * 0.15 + 0.125, v437.Position.y, v437.Position.z * 0.05), l_Position_2);
                                            v99.Focus = v105.CFrame;
                                        end;
                                    end;
                                end;
                            elseif not l_game_EngineFeature_3 then
                                local v438 = Vector3.new(0, 0.105, -(v101.Z + 1));
                                local v439, v440, v441 = v406:ToEulerAnglesXYZ();
                                v99.CFrame = CFrame.lookAt(CFrame.Angles(-v439 * v405, -v440 * v405, -v441 * v405) * (l_Position_1 + v438), l_Position_2);
                            else
                                local l_DeviceCameraCFrameForSelfView_1 = game:GetService("PlayerViewService"):GetDeviceCameraCFrameForSelfView();
                                local l_Position_4 = l_DeviceCameraCFrameForSelfView_1.Position;
                                local v444, v445, v446 = l_DeviceCameraCFrameForSelfView_1:ToEulerAnglesYXZ();
                                local v447 = CFrame.fromEulerAnglesYXZ(v444, v445, v446);
                                local v448 = 0;
                                if l_Position_4.Z > 0 then
                                    v448 = math.clamp(0.5 - l_Position_4.Z * 3, -0.5, 0.5);
                                end;
                                local v449 = -(v101.Z + 1);
                                v99.CFrame = v99.CFrame:lerp(CFrame.lookAt(v447 * (l_Position_1 + Vector3.new(0, 0.105, math.floor((v449 + v448 * v449) * 100) / 100)), l_Position_2), 0.5);
                            end;
                        end;
                    end;
                    if v104 then
                        if v104.Size ~= v95 then
                            v95 = v104.Size;
                            setCloneDirty(true);
                        end;
                        if pcall(function()
                            local __ = v104.Color;
                        end) and v104.Color ~= v94 then
                            updateClonePartsColor(v104.Color);
                        end;
                    end;
                end;
            end;
            if not (v127 == v123) or v128 ~= v124 then
                v284();
            end;
            if v76 > 0 then
                v76 = v76 - v389;
                if v76 <= 0 then
                    debugPrint("Self View: updateCloneCurrentCoolDown <= 0");
                    v358(v388);
                    v76 = 0;
                end;
            end;
            if v108 then
                if v115 then
                    v116 = nil;
                end;
                local v451 = frameShouldBeVisible(v389, v115);
                if v108.Visible ~= v451 then
                    v108.Visible = v451;
                end;
                trackSelfViewSessionAsNeeded();
            end;
        end);
        return ;
    else
        return ;
    end;
end;
triggerAnalyticsReportExperienceSettings_deprecated = function(v452)
    v38:reportExperienceSettings(l_FacialAnimationStreamingServiceV2_0:IsPlaceEnabled(v452), l_FacialAnimationStreamingServiceV2_0:IsVideoEnabled(v452), (l_FacialAnimationStreamingServiceV2_0:IsAudioEnabled(v452)));
end;
triggerAnalyticsReportUserAccountSettings_deprecated = function(v453)
    return v23.new(function(__, __)
        local l_status_0, l_result_0 = pcall(l_FacialAnimationStreamingServiceV2_0.ResolveStateForUser, l_FacialAnimationStreamingServiceV2_0, v453);
        if l_status_0 then
            v38:reportUserAccountSettings(l_FacialAnimationStreamingServiceV2_0:IsVideoEnabled(l_result_0), (l_FacialAnimationStreamingServiceV2_0:IsAudioEnabled(l_result_0)));
        end;
    end);
end;
triggerAnalyticsReportExperienceSettings = function(v458)
    v38:reportExperienceSettings(true, v53:IsEnabled(v458, Enum.AvatarChatServiceFeature.UniverseVideo) and v53:IsEnabled(v458, Enum.AvatarChatServiceFeature.PlaceVideo), v53:IsEnabled(v458, Enum.AvatarChatServiceFeature.UniverseAudio) and v53:IsEnabled(v458, Enum.AvatarChatServiceFeature.PlaceAudio));
    v38:reportUserAccountSettings(v53:IsEnabled(v458, Enum.AvatarChatServiceFeature.UserVideo), v53:IsEnabled(v458, Enum.AvatarChatServiceFeature.UserAudio));
end;
Initialize = function(v459)
    v72 = Instance.new("ScreenGui");
    v72.Name = "InExperienceCoreGui";
    v72.Parent = l_CoreGui_0;
    v72.DisplayOrder = -2;
    v72.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    local v460 = getShouldBeEnabledCoreGuiSetting();
    v38:reportSelfViewEnabledInCoreGuiState(v460);
    if v460 then
        if not v50() then
            v83 = l_FacialAnimationStreamingServiceV2_0:GetPropertyChangedSignal("ServiceState"):Connect(function()
                triggerAnalyticsReportExperienceSettings_deprecated(l_FacialAnimationStreamingServiceV2_0.ServiceState);
            end);
            triggerAnalyticsReportExperienceSettings_deprecated(l_FacialAnimationStreamingServiceV2_0.ServiceState);
            triggerAnalyticsReportUserAccountSettings_deprecated(v459.UserId);
        elseif not v53.ClientFeaturesInitialized then
            local v461 = nil;
            do
                local l_v461_0 = v461;
                l_v461_0 = v53:GetPropertyChangedSignal("ClientFeatures"):Connect(function()
                    triggerAnalyticsReportExperienceSettings(v53.ClientFeatures);
                    l_v461_0:Disconnect();
                end);
            end;
        else
            triggerAnalyticsReportExperienceSettings(v53.ClientFeatures);
        end;
        if not v55() then
            getPermissions();
        else
            getMicPermission();
            getCameraPermissionWithoutRequest();
            updateSelfViewButtonVisibility();
        end;
        v276();
        playerAdded(v459);
        l_Players_0.PlayerAdded:Connect(playerAdded);
        l_Players_0.PlayerRemoving:Connect(function(v463)
            if v463 == l_Players_0.LocalPlayer then
                clearObserver(v141.HumanoidStateChanged);
                clearObserver(v141.CharacterAdded);
                clearObserver(v141.CharacterRemoving);
                clearClone();
                if v83 then
                    v83:Disconnect();
                end;
            end;
        end);
        startRenderStepped(v459);
        v117 = true;
        displaySelfieViewByDefault();
        return ;
    else
        return ;
    end;
end;
Initialize(l_Players_0.LocalPlayer);
