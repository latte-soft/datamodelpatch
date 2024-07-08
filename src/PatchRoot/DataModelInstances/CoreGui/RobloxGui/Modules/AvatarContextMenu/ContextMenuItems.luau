local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_Chat_0 = game:GetService("Chat");
local l_RunService_0 = game:GetService("RunService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Modules_0 = l_RobloxGui_0:WaitForChild("Modules");
local v11 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v12 = require(l_RobloxGui_0.Modules.GameTranslator);
local l_AvatarContextMenu_0 = l_Modules_0:WaitForChild("AvatarContextMenu");
local l_ContextMenuUtil_0 = require(l_AvatarContextMenu_0:WaitForChild("ContextMenuUtil"));
local v15 = require(l_AvatarContextMenu_0.ThemeHandler);
local v16 = require(l_Modules_0.BlockingUtility);
local v17 = require(l_CorePackages_0.Packages.t);
local v18 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v19 = require(l_CorePackages_0.ExperienceChat);
local v20 = require(l_Modules_0.Flags.FFlagAvatarContextMenuItemsChatButtonRefactor);
local v21 = require(l_Modules_0.Common.Flags.FFlagWaveEmoteOnAvatarContextMenuWithExpChat);
local v22 = require(l_Modules_0.Common.Flags.FFlagWhisperEmoteOnAvatarContextMenuWithExpChat);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.PlayerAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v24 = {
    [Enum.AvatarContextMenuOption.Chat] = true, 
    [Enum.AvatarContextMenuOption.Friend] = true, 
    [Enum.AvatarContextMenuOption.Emote] = true, 
    [Enum.AvatarContextMenuOption.InspectMenu] = true
};
local v25 = {};
local v26 = 0;
local v27 = {};
v27.__index = v27;
v27.UpdateInspectMenuEnabled = function(_)
    local l_l_GuiService_0_InspectMenuEnabled_0 = l_GuiService_0:GetInspectMenuEnabled();
    if l_l_GuiService_0_InspectMenuEnabled_0 ~= v24[Enum.AvatarContextMenuOption.InspectMenu] then
        v24[Enum.AvatarContextMenuOption.InspectMenu] = l_l_GuiService_0_InspectMenuEnabled_0;
    end;
end;
v27.ClearMenuItems = function(v30)
    local l_Children_0 = v30.MenuItemFrame:GetChildren();
    for v32 = 1, #l_Children_0 do
        if l_Children_0[v32]:IsA("GuiObject") then
            l_Children_0[v32]:Destroy();
        end;
    end;
end;
v27.AddCustomAvatarMenuItem = function(_, v34, v35)
    v26 = v26 + 1;
    v25[v34] = {
        event = v35, 
        layoutOrder = v26
    };
end;
v27.RemoveCustomAvatarMenuItem = function(_, v37)
    v25[v37] = nil;
end;
v27.IsContextAvatarEnumItem = function(_, v39)
    local l_EnumItems_0 = Enum.AvatarContextMenuOption:GetEnumItems();
    for v41 = 1, #l_EnumItems_0 do
        if v39 == l_EnumItems_0[v41] then
            return true;
        end;
    end;
    return false;
end;
v27.EnableDefaultMenuItem = function(_, v43)
    v24[v43] = true;
end;
v27.RemoveDefaultMenuItem = function(_, v45)
    v24[v45] = false;
end;
v27.RegisterCoreMethods = function(v46)
    l_StarterGui_0:RegisterSetCore("AddAvatarContextMenuOption", function(v47)
        if type(v47) == "table" then
            local v48 = "";
            if v47[1] and type(v47[1]) == "string" then
                v48 = v47[1];
            else
                error("AddAvatarContextMenuOption first argument must be a table or Enum.AvatarContextMenuOption");
            end;
            if (v47[2] and typeof(v47[2]) == "Instance") and v47[2].ClassName == "BindableEvent" then
                v46:AddCustomAvatarMenuItem(v48, v47[2]);
                return ;
            else
                error("AddAvatarContextMenuOption second table entry must be a BindableEvent");
                return ;
            end;
        elseif typeof(v47) == "EnumItem" then
            if not v46:IsContextAvatarEnumItem(v47) then
                error("AddAvatarContextMenuOption given EnumItem is not valid");
                return ;
            else
                v46:EnableDefaultMenuItem(v47);
                return ;
            end;
        else
            error("AddAvatarContextMenuOption first argument must be a table or Enum.AvatarContextMenuOption");
            return ;
        end;
    end);
    l_StarterGui_0:RegisterSetCore("RemoveAvatarContextMenuOption", function(v49)
        if type(v49) == "string" then
            v46:RemoveCustomAvatarMenuItem(v49);
            return ;
        elseif typeof(v49) == "EnumItem" then
            if not v46:IsContextAvatarEnumItem(v49) then
                error("RemoveAvatarContextMenuOption given EnumItem is not valid");
                return ;
            else
                v46:RemoveDefaultMenuItem(v49);
                return ;
            end;
        else
            error("RemoveAvatarContextMenuOption first argument must be a string or Enum.AvatarContextMenuOption");
            return ;
        end;
    end);
end;
v27.CreateCustomMenuItems = function(v50)
    for v51, v52 in pairs(v25) do
        l_RbxAnalyticsService_0:TrackEvent("Game", "AvatarContextMenuCustomButton", "name: " .. tostring(v51));
        local v53 = l_ContextMenuUtil_0:MakeStyledButton("CustomButton", v12:TranslateGameText(v50.MenuItemFrame, v51), UDim2.new(0.96, 0, 0, 52), function()
            if v50.CloseMenuFunc then
                v50:CloseMenuFunc();
            end;
            v52.event:Fire(v50.SelectedPlayer);
        end, v15:GetTheme());
        v53.Name = "CustomButton";
        v53.LayoutOrder = v52.layoutOrder;
        v53.Parent = v50.MenuItemFrame;
    end;
end;
local v54 = "Add Friend";
local v55 = "Friends";
local v56 = "Friend Request Pending";
local v57 = "Accept Friend Request";
local v58 = "Player Blocked";
v27.CreateFriendButton = function(v59, v60, v61)
    v54 = v11:FormatByKey("Corescripts.AvatarContextMenu.AddFriend");
    v55 = v11:FormatByKey("Corescripts.AvatarContextMenu.Friends");
    v56 = v11:FormatByKey("Corescripts.AvatarContextMenu.FriendRequestPending");
    v57 = v11:FormatByKey("Corescripts.AvatarContextMenu.AcceptFriendRequest");
    v58 = v11:FormatByKey("Corescripts.AvatarContextMenu.PlayerBlocked");
    local l_FriendStatus_0 = v59.MenuItemFrame:FindFirstChild("FriendStatus");
    if l_FriendStatus_0 then
        l_FriendStatus_0:Destroy();
        l_FriendStatus_0 = nil;
    end;
    local v63 = nil;
    local v64, v65 = l_ContextMenuUtil_0:MakeStyledButton("FriendStatus", v54, UDim2.new(0.96, 0, 0, 52), function()
        if not (not v63 or not l_FriendStatus_0.Selectable) then
            l_FriendStatus_0.Selectable = false;
            v63.TextTransparency = 0.75;
            v63.Text = v56;
            l_RbxAnalyticsService_0:ReportCounter("AvatarContextMenu-RequestFriendship");
            l_RbxAnalyticsService_0:TrackEvent("Game", "RequestFriendship", "AvatarContextMenu");
            l_LocalPlayer_0:RequestFriendship(v59.SelectedPlayer);
        end;
    end, v15:GetTheme());
    l_FriendStatus_0 = v64;
    v63 = v65;
    if not v61 then
        if v60 == Enum.FriendStatus.Friend then
            l_FriendStatus_0.Selectable = false;
            v63.TextTransparency = 0.75;
            v63.Text = v55;
        elseif v60 == Enum.FriendStatus.FriendRequestSent then
            l_FriendStatus_0.Selectable = false;
            v63.TextTransparency = 0.75;
            v63.Text = v56;
        elseif v60 == Enum.FriendStatus.FriendRequestReceived then
            v63.Text = v57;
        else
            l_FriendStatus_0.Selectable = true;
            v63.TextTransparency = 0;
        end;
    else
        l_FriendStatus_0.Selectable = false;
        v63.TextTransparency = 0.75;
        v63.Text = v58;
    end;
    l_FriendStatus_0.LayoutOrder = 1 + v26;
    l_FriendStatus_0.Parent = v59.MenuItemFrame;
end;
v27.UpdateFriendButton = function(v66, v67, v68)
    if v66.MenuItemFrame:FindFirstChild("FriendStatus") then
        v66:CreateFriendButton(v67, v68);
    end;
end;
v27.CreateInspectAndBuyButton = function(v69)
    local v70 = l_ContextMenuUtil_0:MakeStyledButton("View", v11:FormatByKey("InGame.InspectMenu.Action.View"), UDim2.new(0.96, 0, 0, 52), function()
        if v69.CloseMenuFunc then
            v69:CloseMenuFunc();
        end;
        if v24[Enum.AvatarContextMenuOption.InspectMenu] then
            l_GuiService_0:InspectPlayerFromUserIdWithCtx(v69.SelectedPlayer.UserId, "avatarContextMenu");
            return ;
        else
            warn("The Inspect Menu is not currently available.");
            return ;
        end;
    end, v15:GetTheme());
    v70.LayoutOrder = 4 + v26;
    v70.Parent = v69.MenuItemFrame;
end;
local function v75()
    local l_l_TextChatService_0_FirstChild_0 = l_TextChatService_0:FindFirstChild("RBXGeneral", true);
    if not l_l_TextChatService_0_FirstChild_0 then
        for _, v73 in ipairs(l_TextChatService_0:GetDescendants()) do
            if (v73:IsA("TextSource") and v73.UserId == l_Players_0.LocalPlayer.UserId) and v73.CanSend == true then
                local l_Parent_0 = v73.Parent;
                if l_Parent_0:IsA("TextChannel") then
                    return l_Parent_0;
                end;
            end;
        end;
        return nil;
    else
        return l_l_TextChatService_0_FirstChild_0;
    end;
end;
local _ = function(v76)
    local l_status_0, _ = pcall(function()
        local _ = Enum.ChatVersion.LegacyChatService;
    end);
    if l_status_0 and v76.ChatVersion == Enum.ChatVersion.TextChatService then
        return true;
    else
        return false;
    end;
end;
v27.CreateEmoteButton = function(v81)
    local v87 = l_ContextMenuUtil_0:MakeStyledButton("Wave", v11:FormatByKey("Corescripts.AvatarContextMenu.Wave"), UDim2.new(0.96, 0, 0, 52), function()
        if v81.CloseMenuFunc then
            v81:CloseMenuFunc();
        end;
        l_RbxAnalyticsService_0:ReportCounter("AvatarContextMenu-Wave");
        l_RbxAnalyticsService_0:TrackEvent("Game", "AvatarContextMenuWave", "placeId: " .. tostring(game.PlaceId));
        l_Players_0:Chat("/e wave");
        local l_TextChatService_1 = v81.TextChatService;
        local l_status_1, _ = pcall(function()
            local _ = Enum.ChatVersion.LegacyChatService;
        end);
        if not (not (not not l_status_1 and l_TextChatService_1.ChatVersion == Enum.ChatVersion.TextChatService) or not v21) then
            local v86 = v75();
            if v86 then
                v86:SendAsync("/e wave");
            end;
        end;
    end, v15:GetTheme());
    v87.LayoutOrder = 5 + v26;
    v87.Parent = v81.MenuItemFrame;
end;
local v88 = v17.interface({
    localPlayerChatEnabled = v17.boolean, 
    localPlayerCanChatWithSelectedPlayer = v17.boolean
});
v27.CreateChatButton = function(v89, v90)
    local l_v22_0 = v22;
    if not l_v22_0 then
        local l_TextChatService_2 = v89.TextChatService;
        local l_status_2, _ = pcall(function()
            local _ = Enum.ChatVersion.LegacyChatService;
        end);
        if not not l_status_2 and l_TextChatService_2.ChatVersion == Enum.ChatVersion.TextChatService then
            return ;
        end;
    end;
    local v96 = false;
    local v105, v106 = l_ContextMenuUtil_0:MakeStyledButton("ChatStatus", v11:FormatByKey("Corescripts.AvatarContextMenu.Chat"), UDim2.new(0.96, 0, 0, 52), function()
        if not v96 then
            if v89.CloseMenuFunc then
                v89:CloseMenuFunc();
            end;
            l_RbxAnalyticsService_0:ReportCounter("AvatarContextMenu-Chat");
            l_RbxAnalyticsService_0:TrackEvent("Game", "AvatarContextMenuChat", "placeId: " .. tostring(game.PlaceId));
            if not l_v22_0 then
                goto block78;
            else
                local l_TextChatService_3 = v89.TextChatService;
                local l_status_3, _ = pcall(function()
                    local _ = Enum.ChatVersion.LegacyChatService;
                end);
                if not (not not l_status_3 and l_TextChatService_3.ChatVersion == Enum.ChatVersion.TextChatService) then
                    goto block78;
                else
                    local v101 = v75();
                    if v101 then
                        task.spawn(function()
                            v101:SendAsync("/w @" .. v89.SelectedPlayer.Name);
                        end);
                        if not (not v19.Events or not v19.Events.AvatarContextMenuWhisperSelected) then
                            v19.Events.AvatarContextMenuWhisperSelected();
                            return ;
                        end;
                    end;
                end;
            end;
            while true do
                do
                    return ;
                end;
                ::label0::;
                local v102 = require(l_RobloxGui_0.Modules.ChatSelector);
                v102:SetVisible(true);
                if not v102:EnterWhisperState(v89.SelectedPlayer) then
                    local v103 = nil;
                    do
                        local l_v103_0 = v103;
                        pcall(function()
                            l_v103_0 = l_LocalPlayer_0.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar;
                        end);
                        if l_v103_0 then
                            l_v103_0.Text = "/w " .. v89.SelectedPlayer.Name;
                        end;
                        v102:FocusChatBar();
                    end;
                end;
            end;
        else
            return ;
        end;
    end, v15:GetTheme());
    v105.LayoutOrder = 3 + v26;
    local v107 = nil;
    if not v20 then
        local l_status_4, l_result_4 = pcall(function()
            return l_Chat_0:CanUserChatAsync(l_LocalPlayer_0.UserId);
        end);
        v107 = l_status_4 and (l_RunService_0:IsStudio() or l_result_4);
    else
        v18.assert(v88(v90));
        v107 = v90.localPlayerChatEnabled;
    end;
    if not v107 then
        v105.Parent = nil;
    else
        v105.Parent = v89.MenuItemFrame;
        local _ = nil;
        if not if not v20 then l_ContextMenuUtil_0:GetCanChatWith(v89.SelectedPlayer) else v90.localPlayerCanChatWithSelectedPlayer then
            v96 = true;
            v105.Selectable = false;
            v106.TextTransparency = 0.75;
            v106.Text = v11:FormatByKey("Corescripts.AvatarContextMenu.ChatDisabled");
        end;
    end;
end;
v27.RemoveLastButtonUnderline = function(v111)
    local l_Children_1 = v111.MenuItemFrame:GetChildren();
    local v113 = nil;
    local v114 = -1;
    for _, v116 in pairs(l_Children_1) do
        if v116:IsA("GuiObject") and v114 < v116.LayoutOrder then
            v114 = v116.LayoutOrder;
            v113 = v116;
        end;
    end;
    if v113 then
        local l_Underline_0 = v113:FindFirstChild("Underline");
        if l_Underline_0 then
            l_Underline_0:Destroy();
        end;
    end;
end;
v27.BuildContextMenuItems = function(v118, v119, v120)
    if v119 then
        local l_l_ContextMenuUtil_0_FriendStatus_0 = l_ContextMenuUtil_0:GetFriendStatus(v119);
        local v122 = v16:IsPlayerBlockedByUserId(v119.UserId);
        v118:ClearMenuItems();
        v118:SetSelectedPlayer(v119);
        if v24[Enum.AvatarContextMenuOption.Friend] then
            v118:CreateFriendButton(l_l_ContextMenuUtil_0_FriendStatus_0, v122);
        end;
        if v24[Enum.AvatarContextMenuOption.Chat] then
            v118:CreateChatButton(v120);
        end;
        if v24[Enum.AvatarContextMenuOption.Emote] then
            v118:CreateEmoteButton();
        end;
        if v24[Enum.AvatarContextMenuOption.InspectMenu] then
            v118:CreateInspectAndBuyButton();
        end;
        v118:CreateCustomMenuItems();
        v118:RemoveLastButtonUnderline();
        return ;
    else
        return ;
    end;
end;
v27.SetSelectedPlayer = function(v123, v124)
    v123.SelectedPlayer = v124;
end;
v27.SetCloseMenuFunc = function(v125, v126)
    v125.CloseMenuFunc = v126;
end;
v27.new = function(v127, v128)
    local v129 = setmetatable({}, v27);
    v129.MenuItemFrame = v127;
    v129.SelectedPlayer = nil;
    v129.TextChatService = not not v128 and v128.TextChatService or l_TextChatService_0;
    v129:RegisterCoreMethods();
    v27:UpdateInspectMenuEnabled();
    return v129;
end;
l_GuiService_0.InspectMenuEnabledChangedSignal:Connect(function(v130)
    if v130 then
        v27:EnableDefaultMenuItem(Enum.AvatarContextMenuOption.InspectMenu);
        return ;
    else
        v27:RemoveDefaultMenuItem(Enum.AvatarContextMenuOption.InspectMenu);
        return ;
    end;
end);
return v27;
