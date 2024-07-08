local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.RoactRodux);
local v4 = require(l_script_FirstAncestor_0.ClientSettings);
local v5 = require(script.Parent.mapStateToProps);
local v6 = require(script.Parent.mapDispatchToProps);
local v7 = require(script.Parent.Parent.BubbleChat);
local v8 = require(script.Parent.Parent.AppLayout);
local l_TextChatService_0 = game:GetService("TextChatService");
local v10 = require(l_script_FirstAncestor_0.GlobalFlags);
local v11 = require(l_script_FirstAncestor_0.Flags.getFFlagChatTranslationUIEnabled);
local v12 = require(l_script_FirstAncestor_0.Flags.getFFlagChatTranslationShowFTUX);
getChatWindowEnabled = function()
    local l_status_0, l_result_0 = pcall(function()
        local l_ChatWindowConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
        if l_ChatWindowConfiguration_0 ~= nil then
            return l_ChatWindowConfiguration_0.Enabled;
        else
            return false;
        end;
    end);
    return l_status_0 and l_result_0;
end;
getChatTranslationEnabled = function()
    local l_status_1, l_result_1 = pcall(function()
        return l_TextChatService_0.ChatTranslationEnabled;
    end);
    return l_status_1 and l_result_1;
end;
getChatTranslationToggleEnabled = function()
    local l_status_2, l_result_2 = pcall(function()
        return l_TextChatService_0.ChatTranslationToggleEnabled;
    end);
    return l_status_2 and l_result_2;
end;
shouldShowChatTranslationFTUX = function()
    if not game:GetEngineFeature("TextChatServiceSettingsSaved") then
        return true;
    else
        local l_status_3, l_result_3 = pcall(function()
            return l_TextChatService_0.ChatTranslationFTUXShown;
        end);
        return not (l_status_3 and l_result_3);
    end;
end;
local v22 = shouldShowChatTranslationFTUX();
local v23 = require(script.Parent.Parent.ChatTranslationFTUX);
local v24 = v2.Component:extend("AppContainer");
v24.defaultProps = {
    isChatInputBarVisible = true, 
    isChatWindowVisible = true, 
    onSendChat = nil, 
    messages = {}, 
    mutedUserIds = nil, 
    textTimer = nil, 
    timer = nil, 
    textChatService = l_TextChatService_0
};
local v25 = nil;
v24.init = function(v26)
    v26:setState({
        showTranslationButton = false
    });
    local _ = nil;
    v26.isTextChatServiceOn = not v10.ConsolidateBubbleChat and true or v26.props.textChatService.ChatVersion == Enum.ChatVersion.TextChatService;
end;
v24.willUnmount = function(_)
    if v11() then
        v25:Disconnect();
    end;
end;
v24.didMount = function(v29)
    if v11() then
        local function v37(v30)
            if v30 == "ChatTranslationEnabled" then
                local l_status_4, l_result_4 = pcall(function()
                    return l_TextChatService_0.ChatTranslationEnabled;
                end);
                if l_status_4 then
                    v29.props.onToggleTranslation(l_result_4);
                    v29:setState({
                        showTranslationButton = getChatTranslationEnabled() and getChatTranslationToggleEnabled()
                    });
                    return ;
                end;
            elseif v30 == "ChatTranslationToggleEnabled" then
                local l_status_5, _ = pcall(function()
                    return l_TextChatService_0.ChatTranslationToggleEnabled;
                end);
                local l_status_6, l_result_6 = pcall(function()
                    return l_TextChatService_0.ChatTranslationEnabled;
                end);
                if l_status_5 then
                    if l_status_6 then
                        v29.props.onToggleTranslation(l_result_6);
                    end;
                    v29:setState({
                        showTranslationButton = getChatTranslationEnabled() and getChatTranslationToggleEnabled()
                    });
                end;
            end;
        end;
        if not v25 then
            v25 = l_TextChatService_0.Changed:Connect(v37);
        end;
        v29:setState({
            showTranslationButton = getChatTranslationEnabled() and getChatTranslationToggleEnabled()
        });
    end;
end;
v24.render = function(v38)
    local v39 = v2.createElement(v7, {
        getIconVoiceIndicator = v38.props.getIconVoiceIndicator, 
        onClickedVoiceIndicator = v38.props.onClickedVoiceIndicator, 
        onClickedCameraIndicator = v38.props.onClickedCameraIndicator, 
        selfViewListenerChanged = v38.props.selfViewListenerChanged, 
        getPermissions = v38.props.getPermissions, 
        displayCameraDeniedToast = v38.props.displayCameraDeniedToast, 
        isCamEnabledForUserAndPlace = v38.props.isCamEnabledForUserAndPlace, 
        isCameraOnlyUser = v38.props.isCameraOnlyUser, 
        isTextChatServiceOn = v38.isTextChatServiceOn, 
        isVoiceServiceInitialized = v38.props.isVoiceServiceInitialized
    });
    if not v38.isTextChatServiceOn then
        if not v10.ConsolidateBubbleChat then
            return nil;
        else
            return v2.createElement(v4.Provider, {
                value = v38.props.clientSettings
            }, {
                bubbleChat = v39
            });
        end;
    else
        return v2.createElement(v4.Provider, {
            value = v38.props.clientSettings
        }, {
            app = v2.createFragment({
                appLayout = v2.createElement(v8, {
                    canLocalUserChat = v38.props.canLocalUserChat, 
                    isChatInputBarVisible = v38.props.isChatInputBarVisible, 
                    isChatWindowVisible = v38.props.isChatWindowVisible, 
                    chatTopBarVisibility = v38.props.chatTopBarVisibility, 
                    messages = v38.props.messages, 
                    mutedUserIds = v38.props.mutedUserIds, 
                    onSendChat = v38.props.onSendChat, 
                    timer = v38.props.timer, 
                    textTimer = v38.props.textTimer, 
                    activateWhisperMode = v38.props.activateWhisperMode, 
                    resetTargetChannel = v38.props.resetTargetChannel, 
                    lastGeneralActivityTimestamp = v38.props.lastGeneralActivityTimestamp, 
                    lastMessageActivityTimestamp = v38.props.lastMessageActivityTimestamp, 
                    isTextBoxFocused = v38.props.isTextBoxFocused, 
                    onHovered = v38.props.onHovered, 
                    onUnhovered = v38.props.onUnhovered, 
                    chatLayoutAlignment = v38.props.chatLayoutAlignment, 
                    chatWindowSettings = v38.props.chatWindowSettings, 
                    clientSettings = v38.props.clientSettings, 
                    showTranslationButton = if not v11() then nil else v38.state.showTranslationButton
                }), 
                bubbleChat = v39, 
                ChatTranslationFTUX = if (((not not v11() and v12()) and v22) and getChatTranslationEnabled()) and getChatWindowEnabled() then v2.createElement(v23, {}) else nil
            })
        });
    end;
end;
return v3.connect(v5, v6)(v24);
