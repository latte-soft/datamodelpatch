local v0 = {
    Visible = nil, 
    IsCoreGuiEnabled = nil, 
    TopbarEnabled = nil, 
    VisibilityStateChanged = nil
};
local v1 = false;
local l_status_0, l_result_0 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserHandleChatHotKeyWithContextActionService");
end);
if l_status_0 then
    v1 = l_result_0;
end;
l_status_0 = false;
local v4;
l_result_0, v4 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserHandleFriendJoinNotifierOnClient");
end);
if l_result_0 then
    l_status_0 = v4;
end;
l_result_0 = false;
local v5;
v4, v5 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2");
end);
l_result_0 = v4 and v5;
v4 = nil;
local v6;
v5, v6 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserAddBetterConsoleCheckForLegacyChat");
end);
v4 = v5 and v6;
v5 = game:GetService("RunService");
v6 = game:GetService("ReplicatedStorage");
local l_Chat_0 = game:GetService("Chat");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_DefaultChatSystemChatEvents_0 = v6:WaitForChild("DefaultChatSystemChatEvents");
local l_DefaultChatSystemChatEvents_1 = v6:WaitForChild("DefaultChatSystemChatEvents");
local l_ClientChatModules_0 = l_Chat_0:WaitForChild("ClientChatModules");
local l_ChatConstants_0 = require(l_ClientChatModules_0:WaitForChild("ChatConstants"));
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local l_Util_0 = require(l_ClientChatModules_0:WaitForChild("MessageCreatorModules"):WaitForChild("Util"));
local v16 = nil;
pcall(function()
    v16 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
if v16 == nil then
    v16 = {
        Get = function(_, _, v19)
            return v19;
        end
    };
end;
local v20 = nil;
if l_result_0 then
    v20 = script:FindFirstChild("ChatTranslationEnabled");
    if v20 == nil then
        local v21 = nil;
        do
            local l_v21_0 = v21;
            l_v21_0 = script.ChildAdded:Connect(function(v23)
                if v23.Name == "ChatTranslationEnabled" then
                    v20 = v23;
                    l_v21_0:Disconnect();
                end;
            end);
        end;
    end;
end;
local v24 = 10;
local v25 = {
    OnNewMessage = "RemoteEvent", 
    OnMessageDoneFiltering = "RemoteEvent", 
    OnNewSystemMessage = "RemoteEvent", 
    OnChannelJoined = "RemoteEvent", 
    OnChannelLeft = "RemoteEvent", 
    OnMuted = "RemoteEvent", 
    OnUnmuted = "RemoteEvent", 
    OnMainChannelSet = "RemoteEvent", 
    SayMessageRequest = "RemoteEvent", 
    GetInitDataRequest = "RemoteFunction"
};
local v26 = {};
local l_BindableEvent_0 = Instance.new("BindableEvent");
TryRemoveChildWithVerifyingIsCorrectType = function(v28)
    if not (not v25[v28.Name] or not v28:IsA(v25[v28.Name])) then
        v25[v28.Name] = nil;
        v26[v28.Name] = v28;
        v24 = v24 - 1;
    end;
end;
for _, v30 in pairs(l_DefaultChatSystemChatEvents_1:GetChildren()) do
    TryRemoveChildWithVerifyingIsCorrectType(v30);
end;
if v24 > 0 then
    local v32 = l_DefaultChatSystemChatEvents_1.ChildAdded:connect(function(v31)
        TryRemoveChildWithVerifyingIsCorrectType(v31);
        if v24 < 1 then
            l_BindableEvent_0:Fire();
        end;
    end);
    l_BindableEvent_0.Event:wait();
    v32:disconnect();
    l_BindableEvent_0:Destroy();
end;
l_DefaultChatSystemChatEvents_1 = v26;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v37 = true;
local v38 = 6;
if l_ChatSettings_0.ScreenGuiDisplayOrder ~= nil then
    v38 = l_ChatSettings_0.ScreenGuiDisplayOrder;
end;
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local l_ScreenGui_0 = Instance.new("ScreenGui");
l_ScreenGui_0.Name = "Chat";
l_ScreenGui_0.ResetOnSpawn = false;
l_ScreenGui_0.DisplayOrder = v38;
l_ScreenGui_0.Parent = l_PlayerGui_0;
if not (not v4 or not game:GetService("GuiService"):IsTenFootInterface()) then
    l_ScreenGui_0.Enabled = false;
end;
local v41 = false;
local l_script_0 = script;
local l_ChatWindow_0 = require(l_script_0:WaitForChild("ChatWindow"));
local l_ChatBar_0 = require(l_script_0:WaitForChild("ChatBar"));
local l_ChannelsBar_0 = require(l_script_0:WaitForChild("ChannelsBar"));
local _ = require(l_script_0:WaitForChild("MessageLabelCreator"));
local l_MessageLogDisplay_0 = require(l_script_0:WaitForChild("MessageLogDisplay"));
local _ = require(l_script_0:WaitForChild("ChatChannel"));
local l_CommandProcessor_0 = require(l_script_0:WaitForChild("CommandProcessor"));
local v50 = l_ChatWindow_0.new();
local v51 = l_ChannelsBar_0.new();
local v52 = l_MessageLogDisplay_0.new();
local v53 = l_CommandProcessor_0.new();
local v54 = l_ChatBar_0.new(v53, v50);
v50:CreateGuiObjects(l_ScreenGui_0);
v50:RegisterChatBar(v54);
v50:RegisterChannelsBar(v51);
v50:RegisterMessageLogDisplay(v52);
l_Util_0:RegisterChatWindow(v50);
local l_MessageSender_0 = require(l_script_0:WaitForChild("MessageSender"));
l_MessageSender_0:RegisterSayMessageFunction(l_DefaultChatSystemChatEvents_1.SayMessageRequest);
if not l_UserInputService_0.TouchEnabled then
    v54:SetTextLabelText(v16:Get("GameChat_ChatMain_ChatBarText", "To chat click here or press \"/\" key"));
else
    v54:SetTextLabelText(v16:Get("GameChat_ChatMain_ChatBarTextTouch", "Tap here to chat"));
end;
spawn(function()
    local l_CurveUtil_0 = require(l_script_0:WaitForChild("CurveUtil"));
    local v57 = 1 / (l_ChatSettings_0.ChatAnimationFPS or 20);
    local v58 = tick();
    while true do
        local v59 = tick();
        local v60 = l_CurveUtil_0:DeltaTimeToTimescale(v59 - v58);
        if v60 ~= 0 then
            v50:Update(v60);
        end;
        v58 = v59;
        wait(v57);
    end;
end);
CheckIfPointIsInSquare = function(v61, v62, v63)
    local v64 = false;
    if v62.X <= v61.X then
        v64 = false;
        if v61.X <= v63.X then
            v64 = false;
            if v62.Y <= v61.Y then
                v64 = v61.Y <= v63.Y;
            end;
        end;
    end;
    return v64;
end;
local v65 = false;
local v66 = false;
local v67 = 0;
local v68 = 0;
local l_BindableEvent_1 = Instance.new("BindableEvent");
local l_BindableEvent_2 = Instance.new("BindableEvent");
local l_BindableEvent_3 = Instance.new("BindableEvent");
DoBackgroundFadeIn = function(v72)
    v68 = tick();
    v65 = false;
    l_BindableEvent_1:Fire();
    v50:FadeInBackground(v72 or l_ChatSettings_0.ChatDefaultFadeDuration);
    if v50:GetCurrentChannel() then
        local l_Scroller_0 = v52.Scroller;
        l_Scroller_0.ScrollingEnabled = true;
        l_Scroller_0.ScrollBarThickness = l_MessageLogDisplay_0.ScrollBarThickness;
    end;
end;
DoBackgroundFadeOut = function(v74)
    v68 = tick();
    v65 = true;
    l_BindableEvent_1:Fire();
    v50:FadeOutBackground(v74 or l_ChatSettings_0.ChatDefaultFadeDuration);
    if v50:GetCurrentChannel() then
        local l_Scroller_1 = v52.Scroller;
        l_Scroller_1.ScrollingEnabled = false;
        l_Scroller_1.ScrollBarThickness = 0;
    end;
end;
DoTextFadeIn = function(v76)
    v67 = tick();
    v66 = false;
    l_BindableEvent_1:Fire();
    v50:FadeInText((v76 or l_ChatSettings_0.ChatDefaultFadeDuration) * 0);
end;
DoTextFadeOut = function(v77)
    v67 = tick();
    v66 = true;
    l_BindableEvent_1:Fire();
    v50:FadeOutText(v77 or l_ChatSettings_0.ChatDefaultFadeDuration);
end;
DoFadeInFromNewInformation = function()
    DoTextFadeIn();
    if l_ChatSettings_0.ChatShouldFadeInFromNewInformation then
        DoBackgroundFadeIn();
    end;
end;
InstantFadeIn = function()
    DoBackgroundFadeIn(0);
    DoTextFadeIn(0);
end;
InstantFadeOut = function()
    DoBackgroundFadeOut(0);
    DoTextFadeOut(0);
end;
local v78 = nil;
UpdateFadingForMouseState = function(v79)
    v78 = v79;
    l_BindableEvent_2:Fire();
    if not v54:IsFocused() then
        if not v79 then
            DoBackgroundFadeIn();
            return ;
        else
            DoBackgroundFadeIn();
            DoTextFadeIn();
            return ;
        end;
    else
        return ;
    end;
end;
spawn(function()
    while true do
        l_RunService_0.RenderStepped:wait();
        while true do
            if not v78 and not v54:IsFocused() then
                if v65 then
                    if v66 then
                        l_BindableEvent_1.Event:wait();
                        break;
                    elseif l_ChatSettings_0.ChatWindowTextFadeOutTime < tick() - v67 then
                        DoTextFadeOut();
                        break;
                    else
                        break;
                    end;
                elseif l_ChatSettings_0.ChatWindowBackgroundFadeOutTime < tick() - v68 then
                    DoBackgroundFadeOut();
                    break;
                else
                    break;
                end;
            else
                if v78 then
                    l_BindableEvent_2.Event:wait();
                end;
                if v54:IsFocused() then
                    l_BindableEvent_3.Event:wait();
                end;
            end;
        end;
    end;
end);
getClassicChatEnabled = function()
    if l_ChatSettings_0.ClassicChatEnabled ~= nil then
        return l_ChatSettings_0.ClassicChatEnabled;
    else
        return l_Players_0.ClassicChat;
    end;
end;
getBubbleChatEnabled = function()
    if l_ChatSettings_0.BubbleChatEnabled ~= nil then
        return l_ChatSettings_0.BubbleChatEnabled;
    else
        return l_Players_0.BubbleChat;
    end;
end;
bubbleChatOnly = function()
    return not getClassicChatEnabled() and getBubbleChatEnabled();
end;
UpdateMousePosition = function(v80)
    if not (not v0.Visible or not v0.IsCoreGuiEnabled) and (v0.TopbarEnabled or l_ChatSettings_0.ChatOnWithTopBarOff) then
        if not bubbleChatOnly() then
            local l_AbsolutePosition_0 = v50.GuiObject.AbsolutePosition;
            local v82 = CheckIfPointIsInSquare(v80, l_AbsolutePosition_0, l_AbsolutePosition_0 + v50.GuiObject.AbsoluteSize);
            if v82 ~= v78 then
                UpdateFadingForMouseState(v82);
            end;
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
l_UserInputService_0.InputChanged:connect(function(v83, _)
    if v83.UserInputType == Enum.UserInputType.MouseMovement then
        UpdateMousePosition((Vector2.new(v83.Position.X, v83.Position.Y)));
    end;
end);
l_UserInputService_0.TouchTap:connect(function(v85, _)
    UpdateMousePosition(v85[1]);
end);
l_UserInputService_0.TouchMoved:connect(function(v87, _)
    UpdateMousePosition((Vector2.new(v87.Position.X, v87.Position.Y)));
end);
l_UserInputService_0.Changed:connect(function(v89)
    if v89 == "MouseBehavior" and l_UserInputService_0.MouseBehavior == Enum.MouseBehavior.LockCenter then
        local l_AbsolutePosition_1 = v50.GuiObject.AbsolutePosition;
        if CheckIfPointIsInSquare(l_ScreenGui_0.AbsoluteSize / 2, l_AbsolutePosition_1, l_AbsolutePosition_1 + v50.GuiObject.AbsoluteSize) then
            l_UserInputService_0.MouseBehavior = Enum.MouseBehavior.Default;
        end;
    end;
end);
UpdateFadingForMouseState(true);
UpdateFadingForMouseState(false);
local v99 = {
    Signal = function()
        local v91 = {};
        local l_BindableEvent_4 = Instance.new("BindableEvent");
        local v93 = nil;
        local v94 = nil;
        v91.fire = function(_, ...)
            v93 = {
                ...
            };
            v94 = select("#", ...);
            l_BindableEvent_4:Fire();
        end;
        v91.connect = function(_, v97)
            if not v97 then
                error("connect(nil)", 2);
            end;
            return l_BindableEvent_4.Event:connect(function()
                v97(unpack(v93, 1, v94));
            end);
        end;
        v91.wait = function(_)
            l_BindableEvent_4.Event:wait();
            assert(v93, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.");
            return unpack(v93, 1, v94);
        end;
        return v91;
    end
};
SetVisibility = function(v100)
    v50:SetVisible(v100);
    v0.VisibilityStateChanged:fire(v100);
    v0.Visible = v100;
    if v0.IsCoreGuiEnabled then
        if not v100 then
            InstantFadeOut();
        else
            InstantFadeIn();
            return ;
        end;
    end;
end;
local v101 = nil;
v0.TopbarEnabled = true;
v0.MessageCount = 0;
v0.Visible = true;
v0.IsCoreGuiEnabled = true;
v0.ToggleVisibility = function(_)
    SetVisibility(not v50:GetVisible());
end;
v0.SetVisible = function(_, v104)
    if v50:GetVisible() ~= v104 then
        SetVisibility(v104);
    end;
end;
v0.FocusChatBar = function(_)
    v54:CaptureFocus();
end;
v0.EnterWhisperState = function(_, v107)
    v54:EnterWhisperState(v107);
end;
v0.GetVisibility = function(_)
    return v50:GetVisible();
end;
v0.GetMessageCount = function(v109)
    return v109.MessageCount;
end;
v0.TopbarEnabledChanged = function(v110, v111)
    v110.TopbarEnabled = v111;
    v110.CoreGuiEnabled:fire(game:GetService("StarterGui"):GetCoreGuiEnabled(Enum.CoreGuiType.Chat));
end;
v0.IsFocused = function(_, _)
    return v54:IsFocused();
end;
v0.ChatBarFocusChanged = v99.Signal();
v0.VisibilityStateChanged = v99.Signal();
v0.MessagesChanged = v99.Signal();
v0.MessagePosted = v99.Signal();
v0.CoreGuiEnabled = v99.Signal();
v0.ChatMakeSystemMessageEvent = v99.Signal();
v0.ChatWindowPositionEvent = v99.Signal();
v0.ChatWindowSizeEvent = v99.Signal();
v0.ChatBarDisabledEvent = v99.Signal();
v0.fChatWindowPosition = function(_)
    return v50.GuiObject.Position;
end;
v0.fChatWindowSize = function(_)
    return v50.GuiObject.Size;
end;
v0.fChatBarDisabled = function(_)
    return not v54:GetEnabled();
end;
if not v1 then
    v0.SpecialKeyPressed = function(_, v118, _)
        if not (not (v118 == Enum.SpecialKey.ChatHotkey) or not v37) then
            v101();
        end;
    end;
else
    l_ContextActionService_0:BindAction("ToggleChat", function(v120, v121, v122)
        if not (not (v120 == "ToggleChat" and v121 == Enum.UserInputState.Begin) or not v37) and v122.UserInputType == Enum.UserInputType.Keyboard then
            v101();
        end;
    end, true, Enum.KeyCode.Slash);
end;
v0.CoreGuiEnabled:connect(function(v123)
    v0.IsCoreGuiEnabled = v123;
    v123 = v123 and (v0.TopbarEnabled or l_ChatSettings_0.ChatOnWithTopBarOff);
    v50:SetCoreGuiEnabled(v123);
    if v123 then
        InstantFadeIn();
        return ;
    else
        v54:ReleaseFocus();
        InstantFadeOut();
        return ;
    end;
end);
trimTrailingSpaces = function(v124)
    local v125 = #v124;
    while not (not (v125 > 0) or not v124:find("^%s", v125)) do
        v125 = v125 - 1;
    end;
    return v124:sub(1, v125);
end;
v0.ChatMakeSystemMessageEvent:connect(function(v126)
    if v126.Text and type(v126.Text) == "string" then
        while not v41 do
            wait();
        end;
        local l_GeneralChannelName_0 = l_ChatSettings_0.GeneralChannelName;
        local l_v50_Channel_0 = v50:GetChannel(l_GeneralChannelName_0);
        if l_v50_Channel_0 then
            l_v50_Channel_0:AddMessageToChannel({
                ID = -1, 
                FromSpeaker = nil, 
                SpeakerUserId = 0, 
                OriginalChannel = l_GeneralChannelName_0, 
                IsFiltered = true, 
                MessageLength = string.len(v126.Text), 
                MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(v126.Text)), 
                Message = trimTrailingSpaces(v126.Text), 
                MessageType = l_ChatConstants_0.MessageTypeSetCore, 
                Time = os.time(), 
                ExtraData = v126
            });
            v51:UpdateMessagePostedInChannel(l_GeneralChannelName_0);
            v0.MessageCount = v0.MessageCount + 1;
            v0.MessagesChanged:fire(v0.MessageCount);
        end;
    end;
end);
v0.ChatBarDisabledEvent:connect(function(v129)
    if v37 then
        v54:SetEnabled(not v129);
        if v129 then
            v54:ReleaseFocus();
        end;
    end;
end);
v0.ChatWindowSizeEvent:connect(function(v130)
    v50.GuiObject.Size = v130;
end);
v0.ChatWindowPositionEvent:connect(function(v131)
    v50.GuiObject.Position = v131;
end);
v101 = function()
    if v50:GetCoreGuiEnabled() then
        if v54:GetEnabled() then
            if not (v54:IsFocused() or not v54:GetVisible()) then
                v0:SetVisible(true);
                InstantFadeIn();
                v54:CaptureFocus();
                v0.ChatBarFocusChanged:fire(true);
            end;
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
l_BindableEvent_3.Event:connect(function(v132)
    v0.ChatBarFocusChanged:fire(v132);
end);
DoSwitchCurrentChannel = function(v133)
    if v50:GetChannel(v133) then
        v50:SwitchCurrentChannel(v133);
    end;
end;
SendMessageToSelfInTargetChannel = function(v134, v135, v136)
    local l_v50_Channel_1 = v50:GetChannel(v135);
    if l_v50_Channel_1 then
        l_v50_Channel_1:AddMessageToChannel({
            ID = -1, 
            FromSpeaker = nil, 
            SpeakerUserId = 0, 
            OriginalChannel = v135, 
            IsFiltered = true, 
            MessageLength = string.len(v134), 
            MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(v134)), 
            Message = trimTrailingSpaces(v134), 
            MessageType = l_ChatConstants_0.MessageTypeSystem, 
            Time = os.time(), 
            ExtraData = v136
        });
    end;
end;
chatBarFocused = function()
    if not v78 then
        DoBackgroundFadeIn();
        if v66 then
            DoTextFadeIn();
        end;
    end;
    l_BindableEvent_3:Fire(true);
end;
chatBarFocusLost = function(v138, _)
    DoBackgroundFadeIn();
    l_BindableEvent_3:Fire(false);
    if v138 then
        local l_Text_0 = v54:GetTextBox().Text;
        if v54:IsInCustomState() then
            local l_v54_CustomMessage_0 = v54:GetCustomMessage();
            if l_v54_CustomMessage_0 then
                l_Text_0 = l_v54_CustomMessage_0;
            end;
            local v142 = v54:CustomStateProcessCompletedMessage(l_Text_0);
            v54:ResetCustomState();
            if v142 then
                return ;
            end;
        end;
        v54:GetTextBox().Text = "";
        if l_Text_0 ~= "" then
            v0.MessagePosted:fire(l_Text_0);
            if not v53:ProcessCompletedChatMessage(l_Text_0, v50) then
                if l_ChatSettings_0.DisallowedWhiteSpace then
                    for v143 = 1, #l_ChatSettings_0.DisallowedWhiteSpace do
                        if l_ChatSettings_0.DisallowedWhiteSpace[v143] == "\t" then
                            l_Text_0 = string.gsub(l_Text_0, l_ChatSettings_0.DisallowedWhiteSpace[v143], " ");
                        else
                            l_Text_0 = string.gsub(l_Text_0, l_ChatSettings_0.DisallowedWhiteSpace[v143], "");
                        end;
                    end;
                end;
                l_Text_0 = string.gsub(string.gsub(l_Text_0, "\n", ""), "[ ]+", " ");
                local l_v50_TargetMessageChannel_0 = v50:GetTargetMessageChannel();
                if not l_v50_TargetMessageChannel_0 then
                    l_MessageSender_0:SendMessage(l_Text_0, nil);
                else
                    l_MessageSender_0:SendMessage(l_Text_0, l_v50_TargetMessageChannel_0);
                    return ;
                end;
            end;
        end;
    end;
end;
local v145 = {};
setupChatBarConnections = function()
    for v146 = 1, #v145 do
        v145[v146]:Disconnect();
    end;
    v145 = {};
    table.insert(v145, (v54:GetTextBox().FocusLost:connect(chatBarFocusLost)));
    table.insert(v145, (v54:GetTextBox().Focused:connect(chatBarFocused)));
end;
setupChatBarConnections();
v54.GuiObjectsChanged:connect(setupChatBarConnections);
getEchoMessagesInGeneral = function()
    if l_ChatSettings_0.EchoMessagesInGeneralChannel == nil then
        return true;
    else
        return l_ChatSettings_0.EchoMessagesInGeneralChannel;
    end;
end;
l_DefaultChatSystemChatEvents_1.OnMessageDoneFiltering.OnClientEvent:connect(function(v147)
    if not l_ChatSettings_0.ShowUserOwnFilteredMessage and v147.FromSpeaker == l_LocalPlayer_0.Name then
        return ;
    else
        local l_OriginalChannel_0 = v147.OriginalChannel;
        local l_v50_Channel_2 = v50:GetChannel(l_OriginalChannel_0);
        if l_v50_Channel_2 then
            l_v50_Channel_2:UpdateMessageFiltered(v147);
        end;
        if not (not getEchoMessagesInGeneral() or not l_ChatSettings_0.GeneralChannelName) and l_OriginalChannel_0 ~= l_ChatSettings_0.GeneralChannelName then
            local l_v50_Channel_3 = v50:GetChannel(l_ChatSettings_0.GeneralChannelName);
            if l_v50_Channel_3 then
                l_v50_Channel_3:UpdateMessageFiltered(v147);
            end;
        end;
        return ;
    end;
end);
l_DefaultChatSystemChatEvents_1.OnNewMessage.OnClientEvent:connect(function(v151, v152)
    local l_v50_Channel_4 = v50:GetChannel(v152);
    if l_v50_Channel_4 then
        l_v50_Channel_4:AddMessageToChannel(v151);
        if v151.FromSpeaker ~= l_LocalPlayer_0.Name then
            v51:UpdateMessagePostedInChannel(v152);
        end;
        if not (not getEchoMessagesInGeneral() or not l_ChatSettings_0.GeneralChannelName) and v152 ~= l_ChatSettings_0.GeneralChannelName then
            local l_v50_Channel_5 = v50:GetChannel(l_ChatSettings_0.GeneralChannelName);
            if l_v50_Channel_5 then
                l_v50_Channel_5:AddMessageToChannel(v151);
            end;
        end;
        v0.MessageCount = v0.MessageCount + 1;
        v0.MessagesChanged:fire(v0.MessageCount);
        DoFadeInFromNewInformation();
    end;
end);
l_DefaultChatSystemChatEvents_1.OnNewSystemMessage.OnClientEvent:connect(function(v155, v156)
    v156 = v156 or "System";
    local l_v50_Channel_6 = v50:GetChannel(v156);
    if not l_v50_Channel_6 then
        warn(string.format("Just received system message for channel I'm not in [%s]", v156));
    else
        l_v50_Channel_6:AddMessageToChannel(v155);
        v51:UpdateMessagePostedInChannel(v156);
        v0.MessageCount = v0.MessageCount + 1;
        v0.MessagesChanged:fire(v0.MessageCount);
        DoFadeInFromNewInformation();
        if not (not getEchoMessagesInGeneral() or not l_ChatSettings_0.GeneralChannelName) and v156 ~= l_ChatSettings_0.GeneralChannelName then
            local l_v50_Channel_7 = v50:GetChannel(l_ChatSettings_0.GeneralChannelName);
            if l_v50_Channel_7 then
                l_v50_Channel_7:AddMessageToChannel(v155);
                return ;
            end;
        end;
    end;
end);
HandleChannelJoined = function(v159, v160, v161, v162, v163, v164)
    if v50:GetChannel(v159) then
        v50:RemoveChannel(v159);
    end;
    if v159 == l_ChatSettings_0.GeneralChannelName then
        v41 = true;
    end;
    if v162 then
        v54:SetChannelNameColor(v159, v162);
    end;
    local v165 = v50:AddChannel(v159);
    if v165 then
        if v159 == l_ChatSettings_0.GeneralChannelName then
            DoSwitchCurrentChannel(v159);
        end;
        if v161 then
            local v166 = 1;
            if l_ChatSettings_0.MessageHistoryLengthPerChannel < #v161 then
                v166 = #v161 - l_ChatSettings_0.MessageHistoryLengthPerChannel;
            end;
            for v167 = v166, #v161 do
                v165:AddMessageToChannel(v161[v167]);
            end;
            if not ((not getEchoMessagesInGeneral() or not v163) or not l_ChatSettings_0.GeneralChannelName) and v159 ~= l_ChatSettings_0.GeneralChannelName then
                local l_v50_Channel_8 = v50:GetChannel(l_ChatSettings_0.GeneralChannelName);
                if l_v50_Channel_8 then
                    l_v50_Channel_8:AddMessagesToChannelByTimeStamp(v161, v166);
                end;
            end;
        end;
        if v160 ~= "" then
            local v169 = {
                ID = -1, 
                FromSpeaker = nil, 
                SpeakerUserId = 0, 
                OriginalChannel = v159, 
                IsFiltered = true, 
                MessageLength = string.len(v160), 
                MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(v160)), 
                Message = trimTrailingSpaces(v160), 
                MessageType = l_ChatConstants_0.MessageTypeWelcome, 
                Time = os.time(), 
                ExtraData = nil
            };
            v165:AddMessageToChannel(v169);
            if not ((not getEchoMessagesInGeneral() or not v164) or l_ChatSettings_0.ShowChannelsBar) and v159 ~= l_ChatSettings_0.GeneralChannelName then
                local l_v50_Channel_9 = v50:GetChannel(l_ChatSettings_0.GeneralChannelName);
                if l_v50_Channel_9 then
                    l_v50_Channel_9:AddMessageToChannel(v169);
                end;
            end;
        end;
        local v171 = v16:Get("GameChat_ChatMain_ChatTranslationOnboarding", "Text chat will be translated into your language. Tap the symbol in front of the message to see the original. You can turn off translations in the Settings menu.");
        if not (not (((l_result_0 and v171 ~= "") and v159 == l_ChatSettings_0.GeneralChannelName) and v20 ~= nil) or not v20.Value) then
            v165:AddMessageToChannel({
                ID = -2, 
                FromSpeaker = nil, 
                SpeakerUserId = 0, 
                OriginalChannel = v159, 
                IsFiltered = true, 
                MessageLength = string.len(v171), 
                MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(v171)), 
                Message = trimTrailingSpaces(v171), 
                MessageType = l_ChatConstants_0.MessageTypeWelcome, 
                Time = os.time(), 
                ExtraData = nil
            });
        end;
        DoFadeInFromNewInformation();
    end;
end;
l_DefaultChatSystemChatEvents_1.OnChannelJoined.OnClientEvent:connect(function(v172, v173, v174, v175)
    HandleChannelJoined(v172, v173, v174, v175, false, true);
end);
l_DefaultChatSystemChatEvents_1.OnChannelLeft.OnClientEvent:connect(function(v176)
    v50:RemoveChannel(v176);
    DoFadeInFromNewInformation();
end);
l_DefaultChatSystemChatEvents_1.OnMuted.OnClientEvent:connect(function(_)
end);
l_DefaultChatSystemChatEvents_1.OnUnmuted.OnClientEvent:connect(function(_)
end);
l_DefaultChatSystemChatEvents_1.OnMainChannelSet.OnClientEvent:connect(function(v179)
    DoSwitchCurrentChannel(v179);
end);
coroutine.wrap(function()
    local v180 = l_DefaultChatSystemChatEvents_0:WaitForChild("ChannelNameColorUpdated", 5);
    if v180 then
        v180.OnClientEvent:connect(function(v181, v182)
            v54:SetChannelNameColor(v181, v182);
        end);
    end;
end)();
local v183 = nil;
local v184 = nil;
local v185 = nil;
local v186 = nil;
pcall(function()
    v183 = l_StarterGui_0:GetCore("PlayerBlockedEvent");
    v184 = l_StarterGui_0:GetCore("PlayerMutedEvent");
    v185 = l_StarterGui_0:GetCore("PlayerUnblockedEvent");
    v186 = l_StarterGui_0:GetCore("PlayerUnmutedEvent");
end);
SendSystemMessageToSelf = function(v187)
    local l_v50_CurrentChannel_0 = v50:GetCurrentChannel();
    if l_v50_CurrentChannel_0 then
        l_v50_CurrentChannel_0:AddMessageToChannel({
            ID = -1, 
            FromSpeaker = nil, 
            SpeakerUserId = 0, 
            OriginalChannel = l_v50_CurrentChannel_0.Name, 
            IsFiltered = true, 
            MessageLength = string.len(v187), 
            MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(v187)), 
            Message = trimTrailingSpaces(v187), 
            MessageType = l_ChatConstants_0.MessageTypeSystem, 
            Time = os.time(), 
            ExtraData = nil
        });
    end;
end;
MutePlayer = function(v189)
    local l_MutePlayerRequest_0 = l_DefaultChatSystemChatEvents_0:FindFirstChild("MutePlayerRequest");
    if not l_MutePlayerRequest_0 then
        return false;
    else
        return l_MutePlayerRequest_0:InvokeServer(v189.Name);
    end;
end;
if v183 then
    v183.Event:connect(function(v191)
        if MutePlayer(v191) then
            local v192 = nil;
            v192 = if not l_ChatSettings_0.PlayerDisplayNamesEnabled then v191.Name else v191.DisplayName;
            SendSystemMessageToSelf(v16:Get("GameChat_ChatMain_SpeakerHasBeenBlocked", string.format("Speaker '%s' has been blocked.", v192), {
                RBX_NAME = v192
            }));
        end;
    end);
end;
if l_status_0 then
    local function _()
        if l_ChatSettings_0.ShowFriendJoinNotification ~= nil then
            return l_ChatSettings_0.ShowFriendJoinNotification;
        else
            return false;
        end;
    end;
    if if l_ChatSettings_0.ShowFriendJoinNotification ~= nil then l_ChatSettings_0.ShowFriendJoinNotification else false then
        l_Players_0.PlayerAdded:Connect(function(v194)
            local l_status_1, l_result_1 = pcall(function()
                return v194:IsFriendsWith(l_LocalPlayer_0.UserId);
            end);
            if not (not l_status_1 or not l_result_1) then
                local l_Name_0 = v194.Name;
                if l_ChatSettings_0.PlayerDisplayNamesEnabled then
                    l_Name_0 = v194.DisplayName;
                end;
                SendSystemMessageToSelf((v16:FormatMessageToSend("GameChat_FriendChatNotifier_JoinMessage", string.format("Your friend %s has joined the game.", l_Name_0), "RBX_NAME", l_Name_0)));
            end;
        end);
    end;
end;
if v184 then
    v184.Event:connect(function(v198)
        if MutePlayer(v198) then
            local v199 = nil;
            v199 = if not l_ChatSettings_0.PlayerDisplayNamesEnabled then v198.Name else v198.DisplayName;
            SendSystemMessageToSelf(v16:Get("GameChat_ChatMain_SpeakerHasBeenMuted", string.format("Speaker '%s' has been muted.", v199), {
                RBX_NAME = v199
            }));
        end;
    end);
end;
UnmutePlayer = function(v200)
    local l_UnMutePlayerRequest_0 = l_DefaultChatSystemChatEvents_0:FindFirstChild("UnMutePlayerRequest");
    if not l_UnMutePlayerRequest_0 then
        return false;
    else
        return l_UnMutePlayerRequest_0:InvokeServer(v200.Name);
    end;
end;
if v185 then
    v185.Event:connect(function(v202)
        if UnmutePlayer(v202) then
            local v203 = nil;
            v203 = if not l_ChatSettings_0.PlayerDisplayNamesEnabled then v202.Name else v202.DisplayName;
            SendSystemMessageToSelf(v16:Get("GameChat_ChatMain_SpeakerHasBeenUnBlocked", string.format("Speaker '%s' has been unblocked.", v203), {
                RBX_NAME = v203
            }));
        end;
    end);
end;
if v186 then
    v186.Event:connect(function(v204)
        if UnmutePlayer(v204) then
            local v205 = nil;
            v205 = if not l_ChatSettings_0.PlayerDisplayNamesEnabled then v204.Name else v204.DisplayName;
            SendSystemMessageToSelf(v16:Get("GameChat_ChatMain_SpeakerHasBeenUnMuted", string.format("Speaker '%s' has been unmuted.", v205), {
                RBX_NAME = v205
            }));
        end;
    end);
end;
spawn(function()
    if l_LocalPlayer_0.UserId > 0 then
        pcall(function()
            local l_l_StarterGui_0_Core_0 = l_StarterGui_0:GetCore("GetBlockedUserIds");
            if #l_l_StarterGui_0_Core_0 > 0 then
                local l_SetBlockedUserIdsRequest_0 = l_DefaultChatSystemChatEvents_0:FindFirstChild("SetBlockedUserIdsRequest");
                if l_SetBlockedUserIdsRequest_0 then
                    l_SetBlockedUserIdsRequest_0:FireServer(l_l_StarterGui_0_Core_0);
                end;
            end;
        end);
    end;
end);
spawn(function()
    local l_status_2, l_result_2 = pcall(function()
        return l_Chat_0:CanUserChatAsync(l_LocalPlayer_0.UserId);
    end);
    if l_status_2 then
        v37 = l_RunService_0:IsStudio() or l_result_2;
    end;
end);
local v210 = l_DefaultChatSystemChatEvents_1.GetInitDataRequest:InvokeServer();
for _, v212 in pairs(v210.Channels) do
    if v212[1] == l_ChatSettings_0.GeneralChannelName then
        HandleChannelJoined(v212[1], v212[2], v212[3], v212[4], true, false);
    end;
end;
for _, v214 in pairs(v210.Channels) do
    if v214[1] ~= l_ChatSettings_0.GeneralChannelName then
        HandleChannelJoined(v214[1], v214[2], v214[3], v214[4], true, false);
    end;
end;
return v0;
