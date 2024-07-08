local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local _ = l_RobloxGui_0:WaitForChild("Modules");
local l_StarterGui_0 = game:GetService("StarterGui");
local _ = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local v6 = require(l_RobloxGui_0.Modules.ChatUtil);
local l_ClassicChat_0 = l_Players_0.ClassicChat;
local l_BubbleChat_0 = l_Players_0.BubbleChat;
local l_VRService_0 = game:GetService("VRService");
local v10 = nil;
local v11 = {
    Visible = not l_VRService_0.VREnabled
};
local v26 = {
    ToggleVisibility = function(_)
        if not v10 then
            v11.Visible = not v11.Visible;
            return ;
        else
            v10:ToggleVisibility();
            return ;
        end;
    end, 
    SetVisible = function(_, v14)
        if not v10 then
            v11.Visible = v14;
            return ;
        else
            v10:SetVisible(v14);
            return ;
        end;
    end, 
    FocusChatBar = function(_)
        if v10 then
            v10:FocusChatBar();
        end;
    end, 
    EnterWhisperState = function(_, v17)
        if not v10 then
            return ;
        else
            return v10:EnterWhisperState(v17);
        end;
    end, 
    GetVisibility = function(_)
        if not v10 then
            return v11.Visible;
        else
            return v10:GetVisibility();
        end;
    end, 
    GetMessageCount = function(_)
        if not v10 then
            return 0;
        else
            return v10:GetMessageCount();
        end;
    end, 
    TopbarEnabledChanged = function(_, ...)
        if not v10 then
            return ;
        else
            return v10:TopbarEnabledChanged(...);
        end;
    end, 
    IsFocused = function(_, v22)
        if not v10 then
            return false;
        else
            return v10:IsFocused(v22);
        end;
    end, 
    ClassicChatEnabled = function(_)
        if not v10 then
            return l_ClassicChat_0;
        else
            return v10:ClassicChatEnabled();
        end;
    end, 
    IsBubbleChatOnly = function(_)
        if not v10 then
            return l_BubbleChat_0 and not l_ClassicChat_0;
        else
            return v10:IsBubbleChatOnly();
        end;
    end, 
    IsDisabled = function(_)
        if not v10 then
            return not (l_BubbleChat_0 or l_ClassicChat_0);
        else
            return v10:IsDisabled();
        end;
    end, 
    ChatBarFocusChanged = v6.Signal(), 
    VisibilityStateChanged = v6.Signal(), 
    MessagesChanged = v6.Signal(), 
    BubbleChatOnlySet = v6.Signal(), 
    ChatDisabled = v6.Signal()
};
local v27 = false;
local v28 = {};
local function v30(v29)
    if not v27 then
        table.insert(v28, v29);
        return ;
    else
        return ;
    end;
end;
local function v31()
end;
l_StarterGui_0:RegisterSetCore("ChatMakeSystemMessage", v30);
l_StarterGui_0:RegisterSetCore("ChatWindowPosition", v31);
l_StarterGui_0:RegisterGetCore("ChatWindowPosition", v31);
l_StarterGui_0:RegisterSetCore("ChatWindowSize", v31);
l_StarterGui_0:RegisterGetCore("ChatWindowSize", v31);
l_StarterGui_0:RegisterSetCore("ChatBarDisabled", v31);
l_StarterGui_0:RegisterGetCore("ChatBarDisabled", v31);
l_StarterGui_0:RegisterGetCore("ChatActive", function()
    return v26:GetVisibility();
end);
l_StarterGui_0:RegisterSetCore("ChatActive", function(v32)
    return v26:SetVisible(v32);
end);
local function _(v33, v34, v35)
    if v33[v35] then
        v33[v35]:connect(function(...)
            v34[v35]:fire(...);
        end);
    end;
end;
if not (l_GuiService_0:IsTenFootInterface() or false) then
    coroutine.wrap(function()
        v10 = require(l_RobloxGui_0.Modules.NewChat);
        local l_v10_0 = v10;
        local l_v26_0 = v26;
        if l_v10_0.ChatBarFocusChanged then
            local l_ChatBarFocusChanged_0 = l_v10_0.ChatBarFocusChanged;
            local v40 = "ChatBarFocusChanged";
            local l_l_v26_0_0 = l_v26_0 --[[ copy: 1 -> 7 ]];
            local l_v40_0 = v40 --[[ copy: 5 -> 8 ]];
            l_ChatBarFocusChanged_0:connect(function(...)
                l_l_v26_0_0[l_v40_0]:fire(...);
            end);
        end;
        l_v10_0 = v10;
        l_v26_0 = v26;
        if l_v10_0.VisibilityStateChanged then
            local l_VisibilityStateChanged_0 = l_v10_0.VisibilityStateChanged;
            local v44 = "VisibilityStateChanged";
            local l_l_v26_0_1 = l_v26_0 --[[ copy: 1 -> 9 ]];
            local l_v44_0 = v44 --[[ copy: 5 -> 10 ]];
            l_VisibilityStateChanged_0:connect(function(...)
                l_l_v26_0_1[l_v44_0]:fire(...);
            end);
        end;
        l_v10_0 = v10;
        l_v26_0 = v26;
        if l_v10_0.BubbleChatOnlySet then
            local l_BubbleChatOnlySet_0 = l_v10_0.BubbleChatOnlySet;
            local v48 = "BubbleChatOnlySet";
            local l_l_v26_0_2 = l_v26_0 --[[ copy: 1 -> 11 ]];
            local l_v48_0 = v48 --[[ copy: 5 -> 12 ]];
            l_BubbleChatOnlySet_0:connect(function(...)
                l_l_v26_0_2[l_v48_0]:fire(...);
            end);
        end;
        l_v10_0 = v10;
        l_v26_0 = v26;
        if l_v10_0.ChatDisabled then
            local l_ChatDisabled_0 = l_v10_0.ChatDisabled;
            local v52 = "ChatDisabled";
            local l_l_v26_0_3 = l_v26_0 --[[ copy: 1 -> 13 ]];
            local l_v52_0 = v52 --[[ copy: 5 -> 14 ]];
            l_ChatDisabled_0:connect(function(...)
                l_l_v26_0_3[l_v52_0]:fire(...);
            end);
        end;
        while l_Players_0.LocalPlayer == nil do
            l_Players_0.ChildAdded:wait();
        end;
        l_v10_0 = l_Players_0.LocalPlayer;
        l_v26_0 = v10;
        local l_v26_1 = v26;
        if l_v26_0.MessagesChanged then
            local l_MessagesChanged_0 = l_v26_0.MessagesChanged;
            local v57 = "MessagesChanged";
            l_MessagesChanged_0:connect(function(...)
                l_v26_1[v57]:fire(...);
            end);
        end;
        l_StarterGui_0:RegisterGetCore("UseNewLuaChat", function()
            return true;
        end);
        v10:SetVisible(v11.Visible);
        l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Chat));
        v27 = true;
        for _, v59 in pairs(v28) do
            pcall(function()
                l_StarterGui_0:SetCore("ChatMakeSystemMessage", v59);
            end);
        end;
    end)();
end;
return v26;
