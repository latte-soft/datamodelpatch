local l_CoreGui_0 = game:GetService("CoreGui");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Chat_0 = game:GetService("Chat");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local v6 = require(script.Parent.Parent.Service);
local v7 = require(script.Parent.Parent.Service.ChromeUtils);
local v8 = require(script.Parent.Parent.Service.ViewportUtil);
local l_MappedSignal_0 = v7.MappedSignal;
local v10 = require(script.Parent.CommonIcon);
local l_GameSettings_0 = UserSettings().GameSettings;
local l_GuiService_0 = game:GetService("GuiService");
local v13 = require(l_RobloxGui_0.Modules.ChatSelector);
local v14 = require(script.Parent.Parent.Flags.GetFFlagEnableChromePinnedChat)();
local v15 = require(script.Parent.Parent.Flags.GetFFlagNewUnibarIA);
local v16 = 0;
local l_v13_Visibility_0 = v13:GetVisibility();
local v18 = nil;
local v20 = l_MappedSignal_0.new(v13.VisibilityStateChanged, function()
    return l_v13_Visibility_0;
end, function(v19)
    if not l_GuiService_0.MenuIsOpen then
        l_GameSettings_0.ChatVisible = v19;
    end;
    l_v13_Visibility_0 = v19;
    if not ((not v19 or not v16) or not v18.notification) then
        v16 = 0;
        v18.notification:clear();
    end;
end);
v18 = v6:register({
    id = "chat", 
    label = "CoreScripts.TopBar.Chat", 
    activated = function(_)
        if not l_v13_Visibility_0 then
            v7.dismissRobloxMenuAndRun(function(v22)
                if not v22 then
                    v13:ToggleVisibility();
                elseif not l_v13_Visibility_0 then
                    v13:ToggleVisibility();
                    return ;
                end;
            end);
            return ;
        else
            v13:ToggleVisibility();
            return ;
        end;
    end, 
    components = {
        Icon = function(_)
            return v10("icons/menu/chat_off", "icons/menu/chat_on", v20);
        end
    }
});
v18.notification:fireCount(v16);
l_TextChatService_0.MessageReceived:Connect(function()
    if not l_v13_Visibility_0 then
        v16 = v16 + 1;
        v18.notification:fireCount(v16);
    end;
end);
local v24 = 0;
v13.MessagesChanged:connect(function(v25)
    if not l_v13_Visibility_0 then
        v16 = v16 + (v25 - v24);
        v18.notification:fireCount(v16);
    end;
    v24 = v25;
end);
local v26 = nil;
coroutine.wrap(function()
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    while not l_LocalPlayer_0 do
        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    end;
    local v28 = true;
    if not l_RunService_0:IsStudio() then
        local l_status_0, l_result_0 = pcall(function()
            return l_Chat_0:CanUserChatAsync(not not l_LocalPlayer_0 and l_LocalPlayer_0.UserId or 0);
        end);
        v28 = l_status_0 and l_result_0;
    end;
    if not (not v28 or not v18.availability) then
        v7.setCoreGuiAvailability(v18, Enum.CoreGuiType.Chat, function(v31)
            if not (not v26 or v15) then
                v26:disconnect();
                v26 = nil;
            end;
            if not v31 then
                v18.availability:unavailable();
                return ;
            elseif not v15 then
                v26 = v8.viewport:connect(function(v32)
                    if not v14 or v32.tinyPortrait then
                        v18.availability:available();
                        return ;
                    else
                        v18.availability:pinned();
                        return ;
                    end;
                end, true);
                return ;
            elseif not v14 then
                v18.availability:available();
                return ;
            else
                v18.availability:pinned();
                return ;
            end;
        end);
        local l_ChatVisible_0 = l_GameSettings_0.ChatVisible;
        if v8.isSmallTouchScreen() then
            l_ChatVisible_0 = false;
        end;
        l_v13_Visibility_0 = l_ChatVisible_0;
        v13:SetVisible(l_ChatVisible_0);
    end;
end)();
_simulateChat = function()
    while true do
        task.wait(math.random(1, 15));
        if not l_v13_Visibility_0 then
            v16 = v16 + 1;
            v18.notification:fireCount(v16);
        end;
    end;
end;
return v18;
