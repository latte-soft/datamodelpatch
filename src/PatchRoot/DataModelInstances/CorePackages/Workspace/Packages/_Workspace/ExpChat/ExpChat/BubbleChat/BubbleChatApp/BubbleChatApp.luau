local l_Players_0 = game:GetService("Players");
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v3 = require(l_script_FirstAncestor_0.Logger):new("ExpChat/" .. script.Name);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_script_FirstAncestor_0.IXPServiceWrapper);
local v6 = require(l_Parent_0.Roact);
local v7 = require(l_Parent_0.RoactRodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_None_0 = require(l_Parent_0.llama).None;
local l_script_FirstAncestor_1 = script:FindFirstAncestor("BubbleChat");
local v11 = require(l_script_FirstAncestor_1.BillboardGui);
local v12 = require(l_script_FirstAncestor_1.BillboardGuiV2);
local l_Permissions_0 = require(l_script_FirstAncestor_0.Config).Permissions;
local v14 = require(l_script_FirstAncestor_0.GlobalFlags);
local v15 = v6.Component:extend("BubbleChatApp");
local v16 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableExperienceChatOptimizations);
local v17 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableExpChatVoiceUIImprovements);
local v18 = require(l_script_FirstAncestor_0.Flags.GetFStringVoiceUIImprovementsIXPLayerName);
local v19 = game:DefineFastString("BillboardRefactorIXPLayerValue", "BillboardRefactorEnabled");
v15.getDerivedStateFromProps = function(v20, v21)
    return {
        userMessages = l_Dictionary_0.join(v21.userMessages or {}, v20.userMessages)
    };
end;
v15.init = function(v22)
    v3:debug("Initializing");
    v22:setState({
        userMessages = {}, 
        isInBillboardRefactorTreatment = false, 
        localPlayerVoiceEnabled = false
    });
    v22.onBillboardFadeOut = function(v23)
        v22:setState({
            userMessages = l_Dictionary_0.join(v22.state.userMessages, {
                [v23] = l_None_0
            })
        });
    end;
    v22.setCameraPermissionStateFromControl = function(v24)
        if v14.DoNotPromptCameraPermissionsOnMount then
            v22:setState({
                hasCameraPermissions = v24
            });
        end;
    end;
    if v17() then
        local l_status_0, l_result_0 = pcall(function()
            return v5:GetLayerData(v18());
        end);
        if not ((not l_status_0 or not l_result_0) or not l_result_0[v19]) then
            v22:setState({
                isInBillboardRefactorTreatment = true
            });
        end;
    end;
end;
v15.getPermissions = function(v27)
    local function v30(v28, v29)
        v27:setState({
            hasCameraPermissions = v28, 
            hasMicPermissions = v29
        });
    end;
    if v27.props.getPermissions then
        v27.props.getPermissions(v30);
    end;
end;
v15.getMicPermission = function(v31)
    local function v34(_, v33)
        v31:setState({
            hasMicPermissions = v33
        });
    end;
    if v31.props.getPermissions then
        v31.props.getPermissions(v34, l_Permissions_0.MICROPHONE_ACCESS);
    end;
end;
v15.getCameraPermissionWithoutRequest = function(v35)
    local function v38(v36, _)
        v35:setState({
            hasCameraPermissions = v36
        });
    end;
    if v35.props.getPermissions then
        v35.props.getPermissions(v38, l_Permissions_0.CAMERA_ACCESS, true);
    end;
end;
v15.didMount = function(v39)
    if not (not v14.AvatarChatEnabled and not v14.ChromeEnabled) then
        if not v14.DoNotPromptCameraPermissionsOnMount then
            v39:getPermissions();
        else
            if not v39.props.isVoiceServiceInitialized or not v14.RenderVoiceBubbleAfterAsyncInit then
                v39:getMicPermission();
            else
                v39.props.isVoiceServiceInitialized():andThen(function()
                    v39:getMicPermission();
                end):catch(function()
                    v3:debug("VoiceChatServiceManager failed to initialize inside TextChatService bubblechat");
                end);
            end;
            v39:getCameraPermissionWithoutRequest();
        end;
    end;
    if v17() then
        task.spawn(function()
            local l_status_1, l_result_1 = pcall(function()
                if not l_Players_0.LocalPlayer then
                    return false;
                else
                    return l_VoiceChatService_0:IsVoiceEnabledForUserIdAsync(l_Players_0.LocalPlayer.UserId);
                end;
            end);
            if l_status_1 then
                if l_result_1 then
                    v39:setState({
                        localPlayerVoiceEnabled = true
                    });
                    v5:LogUserLayerExposure(v18());
                end;
                return ;
            else
                v3:debug("Unable to get voice enabled status: ", l_result_1);
                return ;
            end;
        end);
    end;
end;
v15.render = function(v42)
    local v43 = {};
    if v42.props.characters then
        for v44, v45 in pairs(v42.props.characters) do
            if not v16() then
                v43[v44] = false;
            elseif not (not v45 or not v45:IsDescendantOf(workspace)) then
                v43[v44] = false;
            end;
        end;
    end;
    if v42.props.mockUserIdToPartOrModel then
        for v46, v47 in pairs(v42.props.mockUserIdToPartOrModel) do
            if not v16() then
                v43[v46] = false;
            elseif not (not v47 or not v47:IsDescendantOf(workspace)) then
                v43[v46] = false;
            end;
        end;
    end;
    if v42.props.voiceParticipants then
        for v48, v49 in pairs(v42.props.voiceParticipants) do
            if v49 ~= "Hidden" then
                v43[v48] = true;
            end;
        end;
    end;
    if not ((not v14.AvatarChatEnabled or not v42.state.hasCameraPermissions) or not l_Players_0.LocalPlayer) then
        v43[tostring(l_Players_0.LocalPlayer.UserId)] = true;
    end;
    return v6.createElement("ScreenGui", {
        ResetOnSpawn = false
    }, l_Dictionary_0.map(v43, function(v50, v51)
        if not v16() then
            v3:trace("Rendering billboard for ...{}", (string.sub(tostring(v51), -4)));
        end;
        return v6.createElement(not not ((v17() and v42.state.localPlayerVoiceEnabled) and v42.state.isInBillboardRefactorTreatment) and v12 or v11, {
            userId = v51, 
            onFadeOut = v42.onBillboardFadeOut, 
            voiceEnabled = v42.props.voiceEnabled and v50, 
            getIconVoiceIndicator = v42.props.getIconVoiceIndicator, 
            onClickedVoiceIndicator = v42.props.onClickedVoiceIndicator, 
            onClickedCameraIndicator = v42.props.onClickedCameraIndicator, 
            selfViewListenerChanged = v42.props.selfViewListenerChanged, 
            hasCameraPermissions = v42.state.hasCameraPermissions, 
            hasMicPermissions = v42.state.hasMicPermissions, 
            displayCameraDeniedToast = v42.props.displayCameraDeniedToast, 
            isCamEnabledForUserAndPlace = v42.props.isCamEnabledForUserAndPlace, 
            isCameraOnlyUser = v42.props.isCameraOnlyUser, 
            setCameraPermissionStateFromControl = v42.setCameraPermissionStateFromControl, 
            getPermissions = v42.props.getPermissions, 
            isBubbleChatEnabled = v42.props.isBubbleChatEnabled, 
            voiceState = v42.props.voiceParticipants[v51], 
            partOrModel = v42.props.mockUserIdToPartOrModel[v51], 
            isTextChatServiceOn = v42.props.isTextChatServiceOn
        }), "BubbleChat_" .. v51;
    end));
end;
return v7.connect(function(v52, v53)
    local _ = nil;
    return {
        isBubbleChatEnabled = if not v53.isTextChatServiceOn then v52.LegacyBubbleChatSettings.Enabled else v52.BubbleChatSettings.Enabled, 
        userMessages = v52.Messages.bubbleMessagesInOrderBySenderId, 
        voiceEnabled = v52.Voice.isEnabled, 
        characters = v52.Players.charactersByUserId, 
        voiceParticipants = v52.Voice.participants, 
        mockUserIdToPartOrModel = v52.Messages.mockUserIdToPartOrModel
    };
end)(v15);
