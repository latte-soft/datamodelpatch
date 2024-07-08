local v0 = false;
local l_status_0, l_result_0 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserHandleChatHotKeyWithContextActionService");
end);
if l_status_0 then
    v0 = l_result_0;
end;
l_result_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local v6 = false;
local l_ClassicChat_0 = l_Players_0.ClassicChat;
local l_BubbleChat_0 = l_Players_0.BubbleChat;
local v9 = require(l_result_0.Modules.ChatUtil);
local v10 = require(game:GetService("CorePackages").ExperienceChat);
local v11 = {};
local v12 = {
    Visible = true, 
    MessageCount = 0, 
    TopbarEnabled = true, 
    CoreGuiEnabled = true
};
local v13 = {
    ChatWindow = nil, 
    GetCore = nil, 
    SetCore = nil
};
local v14 = {};
local v15 = {};
local function _(v16, v17, v18)
    if (not v16 or not v16[v17]) or not v16[v17]:IsA(v18) then
        return nil;
    else
        return v16[v17];
    end;
end;
local function v23(v20, ...)
    local l_ChatWindow_0 = v13.ChatWindow;
    local v22 = if (not not l_ChatWindow_0 and l_ChatWindow_0[v20]) and l_ChatWindow_0[v20]:IsA("BindableEvent") then l_ChatWindow_0[v20] else nil;
    if not v22 then
        return false;
    else
        v22:Fire(...);
        return true;
    end;
end;
local function v27(v24, ...)
    local l_ChatWindow_1 = v13.ChatWindow;
    local v26 = if (not not l_ChatWindow_1 and l_ChatWindow_1[v24]) and l_ChatWindow_1[v24]:IsA("BindableFunction") then l_ChatWindow_1[v24] else nil;
    if not v26 then
        return false, nil;
    else
        return true, v26:Invoke();
    end;
end;
local function _(v28)
    l_StarterGui_0:RegisterGetCore(v28, function(v29)
        local l_GetCore_0 = v13.GetCore;
        local l_v28_0 = v28;
        local v32 = if (not not l_GetCore_0 and l_GetCore_0[l_v28_0]) and l_GetCore_0[l_v28_0]:IsA("BindableFunction") then l_GetCore_0[l_v28_0] else nil;
        l_GetCore_0 = nil;
        if v32 then
            l_GetCore_0 = v32:Invoke(v29);
        end;
        return l_GetCore_0;
    end);
end;
v11.ToggleVisibility = function(_)
    v12.Visible = not v12.Visible;
    if not v23("ToggleVisibility") then
        v11.VisibilityStateChanged:fire(v12.Visible);
    end;
    v10.Events.ChatTopBarButtonActivated(v12.Visible);
end;
v11.SetVisible = function(_, v36)
    v12.Visible = v36;
    v10.Events.ChatTopBarButtonActivated(v12.Visible);
    if not v23("SetVisible", v12.Visible) then
        v11.VisibilityStateChanged:fire(v12.Visible);
    end;
end;
v11.FocusChatBar = function(_)
    v23("FocusChatBar");
end;
v11.EnterWhisperState = function(_, v39)
    return v23("EnterWhisperState", v39);
end;
v11.GetVisibility = function(_)
    local v41, v42 = v27("GetVisibility");
    if not v41 then
        return v12.Visible;
    else
        return v42;
    end;
end;
v11.GetMessageCount = function(_)
    local v44, v45 = v27("GetMessageCount");
    if not v44 then
        return v12.MessageCount;
    else
        return v45;
    end;
end;
v11.TopbarEnabledChanged = function(_, v47)
    v12.TopbarEnabled = v47;
    v23("TopbarEnabledChanged", v12.TopbarEnabled);
end;
v11.IsFocused = function(_, v49)
    local v50, v51 = v27("IsFocused", v49);
    if not v50 then
        return false;
    else
        return v51;
    end;
end;
v11.ClassicChatEnabled = function(_)
    return l_ClassicChat_0;
end;
v11.IsBubbleChatOnly = function(_)
    return l_BubbleChat_0 and not l_ClassicChat_0;
end;
v11.IsDisabled = function(_)
    return not (l_BubbleChat_0 or l_ClassicChat_0);
end;
SetInitialChatTypes = function(v55)
    if not v6 then
        v6 = true;
        local l_BubbleChatEnabled_0 = v55.BubbleChatEnabled;
        local l_ClassicChatEnabled_0 = v55.ClassicChatEnabled;
        if type(l_BubbleChatEnabled_0) == "boolean" then
            l_BubbleChat_0 = l_BubbleChatEnabled_0;
        end;
        if type(l_ClassicChatEnabled_0) == "boolean" then
            l_ClassicChat_0 = l_ClassicChatEnabled_0;
        end;
        if not (l_ClassicChat_0 or l_BubbleChat_0) then
            v11.ChatDisabled:fire();
        end;
        if not (not l_BubbleChat_0 or l_ClassicChat_0) then
            v11.BubbleChatOnlySet:fire();
        end;
        return ;
    else
        return ;
    end;
end;
v11.ChatBarFocusChanged = v9.Signal();
v11.VisibilityStateChanged = v9.Signal();
v11.MessagesChanged = v9.Signal();
v11.BubbleChatOnlySet = v9.Signal();
v11.ChatDisabled = v9.Signal();
l_StarterGui_0.CoreGuiChangedSignal:connect(function(v58, v59)
    if not (v58 ~= Enum.CoreGuiType.All) or v58 == Enum.CoreGuiType.Chat then
        v12.CoreGuiEnabled = v59;
        v23("CoreGuiEnabled", v12.CoreGuiEnabled);
    end;
end);
if not v0 then
    l_GuiService_0:AddSpecialKey(Enum.SpecialKey.ChatHotkey);
    l_GuiService_0.SpecialKeyPressed:connect(function(v60, v61)
        if not l_GuiService_0.MenuIsOpen then
            v23("SpecialKeyPressed", v60, v61);
            return ;
        else
            return ;
        end;
    end);
end;
DoConnectSetCore = function(v62)
    l_StarterGui_0:RegisterSetCore(v62, function(v63)
        local l_SetCore_0 = v13.SetCore;
        local l_v62_0 = v62;
        local v66 = if (not not l_SetCore_0 and l_SetCore_0[l_v62_0]) and l_SetCore_0[l_v62_0]:IsA("BindableEvent") then l_SetCore_0[l_v62_0] else nil;
        if not v66 then
            if v15[v62] == nil then
                v15[v62] = {};
            end;
            table.insert(v15[v62], v63);
            return ;
        else
            v66:Fire(v63);
            return ;
        end;
    end);
end;
DoConnectSetCore("ChatMakeSystemMessage");
DoConnectSetCore("ChatWindowPosition");
DoConnectSetCore("ChatWindowSize");
DoConnectSetCore("ChatBarDisabled");
local v67 = "ChatWindowPosition";
local v68 = "ChatWindowPosition";
local l_v68_0 = v68 --[[ copy: 25 -> 26 ]];
l_StarterGui_0:RegisterGetCore(v67, function(v70)
    local l_GetCore_1 = v13.GetCore;
    local l_l_v68_0_0 = l_v68_0;
    local v73 = if (not not l_GetCore_1 and l_GetCore_1[l_l_v68_0_0]) and l_GetCore_1[l_l_v68_0_0]:IsA("BindableFunction") then l_GetCore_1[l_l_v68_0_0] else nil;
    l_GetCore_1 = nil;
    if v73 then
        l_GetCore_1 = v73:Invoke(v70);
    end;
    return l_GetCore_1;
end);
v67 = "ChatWindowSize";
v68 = "ChatWindowSize";
local l_v68_1 = v68 --[[ copy: 25 -> 27 ]];
l_StarterGui_0:RegisterGetCore(v67, function(v75)
    local l_GetCore_2 = v13.GetCore;
    local l_l_v68_1_0 = l_v68_1;
    local v78 = if (not not l_GetCore_2 and l_GetCore_2[l_l_v68_1_0]) and l_GetCore_2[l_l_v68_1_0]:IsA("BindableFunction") then l_GetCore_2[l_l_v68_1_0] else nil;
    l_GetCore_2 = nil;
    if v78 then
        l_GetCore_2 = v78:Invoke(v75);
    end;
    return l_GetCore_2;
end);
v67 = "ChatBarDisabled";
v68 = "ChatBarDisabled";
l_StarterGui_0:RegisterGetCore(v67, function(v79)
    local l_GetCore_3 = v13.GetCore;
    local l_v68_2 = v68;
    local v82 = if (not not l_GetCore_3 and l_GetCore_3[l_v68_2]) and l_GetCore_3[l_v68_2]:IsA("BindableFunction") then l_GetCore_3[l_v68_2] else nil;
    l_GetCore_3 = nil;
    if v82 then
        l_GetCore_3 = v82:Invoke(v79);
    end;
    return l_GetCore_3;
end);
do
    local l_v14_0 = v14;
    local function v102(v84)
        if type(v84) == "table" then
            local l_ChatWindow_2 = v84.ChatWindow;
            local l_SetCore_1 = v84.SetCore;
            local l_GetCore_4 = v84.GetCore;
            if type(l_ChatWindow_2) == "table" then
                for _, v89 in pairs(l_v14_0) do
                    v89:disconnect();
                end;
                if type(l_ChatWindow_2.ChatTypes) == "table" then
                    SetInitialChatTypes(l_ChatWindow_2.ChatTypes);
                end;
                l_v14_0 = {};
                v13.ChatWindow = {};
                v13.ChatWindow.ToggleVisibility = if (not not l_ChatWindow_2 and l_ChatWindow_2.ToggleVisibility) and l_ChatWindow_2.ToggleVisibility:IsA("BindableEvent") then l_ChatWindow_2.ToggleVisibility else nil;
                v13.ChatWindow.SetVisible = if (not not l_ChatWindow_2 and l_ChatWindow_2.SetVisible) and l_ChatWindow_2.SetVisible:IsA("BindableEvent") then l_ChatWindow_2.SetVisible else nil;
                v13.ChatWindow.FocusChatBar = if (not not l_ChatWindow_2 and l_ChatWindow_2.FocusChatBar) and l_ChatWindow_2.FocusChatBar:IsA("BindableEvent") then l_ChatWindow_2.FocusChatBar else nil;
                v13.ChatWindow.EnterWhisperState = if (not not l_ChatWindow_2 and l_ChatWindow_2.EnterWhisperState) and l_ChatWindow_2.EnterWhisperState:IsA("BindableEvent") then l_ChatWindow_2.EnterWhisperState else nil;
                v13.ChatWindow.TopbarEnabledChanged = if (not not l_ChatWindow_2 and l_ChatWindow_2.TopbarEnabledChanged) and l_ChatWindow_2.TopbarEnabledChanged:IsA("BindableEvent") then l_ChatWindow_2.TopbarEnabledChanged else nil;
                v13.ChatWindow.IsFocused = if (not not l_ChatWindow_2 and l_ChatWindow_2.IsFocused) and l_ChatWindow_2.IsFocused:IsA("BindableFunction") then l_ChatWindow_2.IsFocused else nil;
                if not v0 then
                    v13.ChatWindow.SpecialKeyPressed = if (not not l_ChatWindow_2 and l_ChatWindow_2.SpecialKeyPressed) and l_ChatWindow_2.SpecialKeyPressed:IsA("BindableEvent") then l_ChatWindow_2.SpecialKeyPressed else nil;
                end;
                local function v93(v90)
                    local l_ChatWindow_3 = v13.ChatWindow;
                    local l_l_ChatWindow_2_0 = l_ChatWindow_2;
                    l_ChatWindow_3[v90] = if (not not l_l_ChatWindow_2_0 and l_l_ChatWindow_2_0[v90]) and l_l_ChatWindow_2_0[v90]:IsA("BindableEvent") then l_l_ChatWindow_2_0[v90] else nil;
                    if v13.ChatWindow[v90] then
                        table.insert(l_v14_0, (v13.ChatWindow[v90].Event:connect(function(...)
                            v11[v90]:fire(...);
                        end)));
                    end;
                end;
                v93("ChatBarFocusChanged");
                v93("VisibilityStateChanged");
                v93("MessagesChanged");
                v13.ChatWindow.MessagePosted = if (not not l_ChatWindow_2 and l_ChatWindow_2.MessagePosted) and l_ChatWindow_2.MessagePosted:IsA("BindableEvent") then l_ChatWindow_2.MessagePosted else nil;
                if v13.ChatWindow.MessagePosted then
                    table.insert(l_v14_0, (v13.ChatWindow.MessagePosted.Event:connect(function(v94)
                        game:GetService("Players"):Chat(v94);
                    end)));
                end;
                v11:SetVisible(v12.Visible);
                v11:TopbarEnabledChanged(v12.TopbarEnabled);
                local v95 = if (not not l_ChatWindow_2 and l_ChatWindow_2.CoreGuiEnabled) and l_ChatWindow_2.CoreGuiEnabled:IsA("BindableEvent") then l_ChatWindow_2.CoreGuiEnabled else nil;
                if v95 then
                    v13.ChatWindow.CoreGuiEnabled = v95;
                    v95:Fire(v12.CoreGuiEnabled);
                end;
            else
                error("Table 'ChatWindow' must be provided");
            end;
            if type(l_SetCore_1) == "table" and type(l_GetCore_4) == "table" then
                v13.SetCore = {};
                v13.GetCore = {};
                local function v101(v96)
                    local l_l_SetCore_1_0 = l_SetCore_1;
                    local v98 = if (not not l_l_SetCore_1_0 and l_l_SetCore_1_0[v96]) and l_l_SetCore_1_0[v96]:IsA("BindableEvent") then l_l_SetCore_1_0[v96] else nil;
                    if v98 then
                        v13.SetCore[v96] = v98;
                        if v15[v96] then
                            for _, v100 in pairs(v15[v96]) do
                                v98:Fire(v100);
                            end;
                            v15[v96] = nil;
                        end;
                    end;
                end;
                v101("ChatMakeSystemMessage");
                v101("ChatWindowPosition");
                v101("ChatWindowSize");
                v101("ChatBarDisabled");
                v13.GetCore.ChatWindowPosition = if (not not l_GetCore_4 and l_GetCore_4.ChatWindowPosition) and l_GetCore_4.ChatWindowPosition:IsA("BindableFunction") then l_GetCore_4.ChatWindowPosition else nil;
                v13.GetCore.ChatWindowSize = if (not not l_GetCore_4 and l_GetCore_4.ChatWindowSize) and l_GetCore_4.ChatWindowSize:IsA("BindableFunction") then l_GetCore_4.ChatWindowSize else nil;
                v13.GetCore.ChatBarDisabled = if (not not l_GetCore_4 and l_GetCore_4.ChatBarDisabled) and l_GetCore_4.ChatBarDisabled:IsA("BindableFunction") then l_GetCore_4.ChatBarDisabled else nil;
                return ;
            elseif not (type(l_SetCore_1) == "nil") or type(l_GetCore_4) ~= "nil" then
                error("Both 'SetCore' and 'GetCore' must be tables if provided");
            end;
        end;
    end;
    v10.listenToDispatch(function(v103)
        if v103.type == "FocusChatHotKeyActivated" then
            v11:SetVisible(true);
        end;
    end);
    l_StarterGui_0:RegisterSetCore("CoreGuiChatConnections", v102);
end;
return v11;
