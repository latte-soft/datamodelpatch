local v0 = {};
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("Chat");
local l_PlayerGui_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
local l_Chat_1 = game:GetService("Chat");
local l_ClientChatModules_0 = l_Chat_1:WaitForChild("ClientChatModules");
local l_Parent_0 = script.Parent;
local l_ChatChannel_0 = require(l_Parent_0:WaitForChild("ChatChannel"));
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local l_CurveUtil_0 = require(l_Parent_0:WaitForChild("CurveUtil"));
local v10 = {};
v10.__index = v10;
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
mergeProps = function(v11, v12)
    if v11 and v12 then
        for v13, v14 in pairs(v11) do
            if v12[v13] ~= nil then
                v12[v13] = v14;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v10.CreateGuiObjects = function(v15, v16)
    local v17 = nil;
    pcall(function()
        v17 = l_Chat_1:InvokeChatCallback(Enum.ChatCallbackType.OnCreatingChatWindow, nil);
    end);
    mergeProps(v17, l_ChatSettings_0);
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Active = l_ChatSettings_0.WindowDraggable;
    l_Frame_0.Parent = v16;
    l_Frame_0.AutoLocalize = false;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Selectable = false;
    l_Frame_1.Name = "ChatBarParentFrame";
    l_Frame_1.BackgroundTransparency = 1;
    l_Frame_1.Parent = l_Frame_0;
    local l_Frame_2 = Instance.new("Frame");
    l_Frame_2.Selectable = false;
    l_Frame_2.Name = "ChannelsBarParentFrame";
    l_Frame_2.BackgroundTransparency = 1;
    l_Frame_2.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_2.Parent = l_Frame_0;
    local l_Frame_3 = Instance.new("Frame");
    l_Frame_3.Selectable = false;
    l_Frame_3.Name = "ChatChannelParentFrame";
    l_Frame_3.BackgroundTransparency = 1;
    l_Frame_3.BackgroundColor3 = l_ChatSettings_0.BackGroundColor;
    l_Frame_3.BackgroundTransparency = 0.6;
    l_Frame_3.BorderSizePixel = 0;
    l_Frame_3.Parent = l_Frame_0;
    local l_ImageButton_0 = Instance.new("ImageButton");
    l_ImageButton_0.Selectable = false;
    l_ImageButton_0.Image = "";
    l_ImageButton_0.BackgroundTransparency = 0.6;
    l_ImageButton_0.BorderSizePixel = 0;
    l_ImageButton_0.Visible = false;
    l_ImageButton_0.BackgroundColor3 = l_ChatSettings_0.BackGroundColor;
    l_ImageButton_0.Active = true;
    if not bubbleChatOnly() then
        l_ImageButton_0.Position = UDim2.new(1, -l_ImageButton_0.AbsoluteSize.X, 1, -l_ImageButton_0.AbsoluteSize.Y);
    else
        l_ImageButton_0.Position = UDim2.new(1, -l_ImageButton_0.AbsoluteSize.X, 0, 0);
    end;
    l_ImageButton_0.Parent = l_Frame_0;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Selectable = false;
    l_ImageLabel_0.Size = UDim2.new(0.8, 0, 0.8, 0);
    l_ImageLabel_0.Position = UDim2.new(0.2, 0, 0.2, 0);
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Image = "rbxassetid://261880743";
    l_ImageLabel_0.Parent = l_ImageButton_0;
    local function _()
        local l_l_Frame_0_0 = l_Frame_0;
        while not (not l_l_Frame_0_0 or l_l_Frame_0_0:IsA("ScreenGui")) do
            l_l_Frame_0_0 = l_l_Frame_0_0.Parent;
        end;
        return l_l_Frame_0_0;
    end;
    local v26 = 3;
    local l_l_Frame_0_1 = l_Frame_0;
    while not (not l_l_Frame_0_1 or l_l_Frame_0_1:IsA("ScreenGui")) do
        l_l_Frame_0_1 = l_l_Frame_0_1.Parent;
    end;
    local l_l_l_Frame_0_1_0 = l_l_Frame_0_1;
    if l_l_l_Frame_0_1_0.AbsoluteSize.X <= 640 then
        v26 = 1;
    elseif l_l_l_Frame_0_1_0.AbsoluteSize.X <= 1024 then
        v26 = 2;
    end;
    l_l_Frame_0_1 = false;
    local function v39()
        if not l_l_Frame_0_1 then
            l_l_Frame_0_1 = true;
            if l_Frame_0:IsDescendantOf(l_PlayerGui_0) then
                local l_l_Frame_0_2 = l_Frame_0;
                while not (not l_l_Frame_0_2 or l_l_Frame_0_2:IsA("ScreenGui")) do
                    l_l_Frame_0_2 = l_l_Frame_0_2.Parent;
                end;
                local l_l_l_Frame_0_2_0 = l_l_Frame_0_2;
                l_l_Frame_0_2 = l_ChatSettings_0.MinimumWindowSize;
                local l_MaximumWindowSize_0 = l_ChatSettings_0.MaximumWindowSize;
                local v32 = l_Frame_2.AbsoluteSize.Y + l_Frame_1.AbsoluteSize.Y;
                local v33 = l_l_Frame_0_2.X.Scale * l_l_l_Frame_0_2_0.AbsoluteSize.X + l_l_Frame_0_2.X.Offset;
                local v34 = math.max(l_l_Frame_0_2.Y.Scale * l_l_l_Frame_0_2_0.AbsoluteSize.Y + l_l_Frame_0_2.Y.Offset, v32);
                local v35 = l_MaximumWindowSize_0.X.Scale * l_l_l_Frame_0_2_0.AbsoluteSize.X + l_MaximumWindowSize_0.X.Offset;
                local v36 = l_MaximumWindowSize_0.Y.Scale * l_l_l_Frame_0_2_0.AbsoluteSize.Y + l_MaximumWindowSize_0.Y.Offset;
                local l_X_0 = l_Frame_0.AbsoluteSize.X;
                local l_Y_0 = l_Frame_0.AbsoluteSize.Y;
                if l_X_0 < v33 then
                    l_Frame_0.Size = l_Frame_0.Size + UDim2.new(0, v33 - l_X_0, 0, 0);
                elseif v35 < l_X_0 then
                    l_Frame_0.Size = l_Frame_0.Size + UDim2.new(0, v35 - l_X_0, 0, 0);
                end;
                if l_Y_0 < v34 then
                    l_Frame_0.Size = l_Frame_0.Size + UDim2.new(0, 0, 0, v34 - l_Y_0);
                elseif v36 < l_Y_0 then
                    l_Frame_0.Size = l_Frame_0.Size + UDim2.new(0, 0, 0, v36 - l_Y_0);
                end;
                l_Frame_0.Size = UDim2.new(l_Frame_0.AbsoluteSize.X / l_l_l_Frame_0_2_0.AbsoluteSize.X, 0, l_Frame_0.AbsoluteSize.Y / l_l_l_Frame_0_2_0.AbsoluteSize.Y, 0);
                l_l_Frame_0_1 = false;
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    l_Frame_0.Changed:connect(function(v40)
        if v40 == "AbsoluteSize" then
            v39();
        end;
    end);
    l_ImageButton_0.DragBegin:connect(function(_)
        l_Frame_0.Draggable = false;
    end);
    local function v44(v42)
        if l_ChatSettings_0.WindowDraggable == false and l_ChatSettings_0.WindowResizable == false then
            return ;
        else
            local v43 = (v42 - l_Frame_0.AbsolutePosition) + l_ImageButton_0.AbsoluteSize;
            l_Frame_0.Size = UDim2.new(0, v43.X, 0, v43.Y);
            if not bubbleChatOnly() then
                l_ImageButton_0.Position = UDim2.new(1, -l_ImageButton_0.AbsoluteSize.X, 1, -l_ImageButton_0.AbsoluteSize.Y);
                return ;
            else
                l_ImageButton_0.Position = UDim2.new(1, -l_ImageButton_0.AbsoluteSize.X, 0, 0);
                return ;
            end;
        end;
    end;
    l_ImageButton_0.DragStopped:connect(function(_, _)
        l_Frame_0.Draggable = l_ChatSettings_0.WindowDraggable;
    end);
    local v47 = false;
    l_ImageButton_0.Changed:connect(function(v48)
        if not (not (v48 == "AbsolutePosition") or l_Frame_0.Draggable) then
            if not v47 then
                v47 = true;
                v44(l_ImageButton_0.AbsolutePosition);
                v47 = false;
            else
                return ;
            end;
        end;
    end);
    local function _(v49)
        return math.max(32, if v26 == 1 then v49 or l_ChatSettings_0.ChatChannelsTabTextSizePhone else v49 or l_ChatSettings_0.ChatChannelsTabTextSize + 8) + 2;
    end;
    local function _(v51)
        return (if v26 == 1 then v51 or l_ChatSettings_0.ChatBarTextSizePhone else v51 or l_ChatSettings_0.ChatBarTextSize + 14) + 10;
    end;
    if not bubbleChatOnly() then
        local l_l_Frame_0_3 = l_Frame_0;
        while not (not l_l_Frame_0_3 or l_l_Frame_0_3:IsA("ScreenGui")) do
            l_l_Frame_0_3 = l_l_Frame_0_3.Parent;
        end;
        local _ = l_l_Frame_0_3;
        if v26 == 1 then
            l_Frame_0.Size = l_ChatSettings_0.DefaultWindowSizePhone;
        elseif v26 == 2 then
            l_Frame_0.Size = l_ChatSettings_0.DefaultWindowSizeTablet;
        else
            l_Frame_0.Size = l_ChatSettings_0.DefaultWindowSizeDesktop;
        end;
        l_Frame_0.Position = l_ChatSettings_0.DefaultWindowPosition;
    else
        l_Frame_1.Position = UDim2.new(0, 0, 0, 0);
        l_Frame_2.Visible = false;
        l_Frame_2.Active = false;
        l_Frame_3.Visible = false;
        l_Frame_3.Active = false;
        local v55 = 0;
        local v56 = 0;
        local l_l_Frame_0_4 = l_Frame_0;
        while not (not l_l_Frame_0_4 or l_l_Frame_0_4:IsA("ScreenGui")) do
            l_l_Frame_0_4 = l_l_Frame_0_4.Parent;
        end;
        local _ = l_l_Frame_0_4;
        if v26 == 1 then
            v55 = l_ChatSettings_0.DefaultWindowSizePhone.X.Scale;
            v56 = l_ChatSettings_0.DefaultWindowSizePhone.X.Offset;
        elseif v26 == 2 then
            v55 = l_ChatSettings_0.DefaultWindowSizeTablet.X.Scale;
            v56 = l_ChatSettings_0.DefaultWindowSizeTablet.X.Offset;
        else
            v55 = l_ChatSettings_0.DefaultWindowSizeDesktop.X.Scale;
            v56 = l_ChatSettings_0.DefaultWindowSizeDesktop.X.Offset;
        end;
        local v59 = nil;
        l_Frame_0.Size = UDim2.new(v55, v56, 0, (if v26 == 1 then v59 or l_ChatSettings_0.ChatBarTextSizePhone else v59 or l_ChatSettings_0.ChatBarTextSize + 14) + 10);
        l_Frame_0.Position = l_ChatSettings_0.DefaultWindowPosition;
    end;
    if v26 == 1 then
        l_ChatSettings_0.ChatWindowTextSize = l_ChatSettings_0.ChatWindowTextSizePhone;
        l_ChatSettings_0.ChatChannelsTabTextSize = l_ChatSettings_0.ChatChannelsTabTextSizePhone;
        l_ChatSettings_0.ChatBarTextSize = l_ChatSettings_0.ChatBarTextSizePhone;
    end;
    local function _(v60)
        l_Frame_0.Active = v60;
        l_Frame_0.Draggable = v60;
    end;
    local function v64(v62)
        l_ImageButton_0.Visible = v62;
        l_ImageButton_0.Draggable = v62;
        local l_Offset_0 = l_Frame_1.Size.Y.Offset;
        if not v62 then
            l_Frame_1.Size = UDim2.new(1, 0, 0, l_Offset_0);
            if not bubbleChatOnly() then
                l_Frame_1.Position = UDim2.new(0, 0, 1, -l_Offset_0);
            end;
        else
            l_Frame_1.Size = UDim2.new(1, -l_Offset_0 - 2, 0, l_Offset_0);
            if not bubbleChatOnly() then
                l_Frame_1.Position = UDim2.new(0, 0, 1, -l_Offset_0);
                return ;
            end;
        end;
    end;
    local function v68()
        local v65 = nil;
        local v66 = math.max(32, if v26 == 1 then v65 or l_ChatSettings_0.ChatChannelsTabTextSizePhone else v65 or l_ChatSettings_0.ChatChannelsTabTextSize + 8) + 2;
        local v67 = nil;
        v65 = (if v26 == 1 then v67 or l_ChatSettings_0.ChatBarTextSizePhone else v67 or l_ChatSettings_0.ChatBarTextSize + 14) + 10;
        if not l_ChatSettings_0.ShowChannelsBar then
            l_Frame_3.Size = UDim2.new(1, 0, 1, -((v65 + 2) + 2));
            l_Frame_3.Position = UDim2.new(0, 0, 0, 2);
            return ;
        else
            l_Frame_3.Size = UDim2.new(1, 0, 1, -(((v66 + v65) + 2) + 2));
            l_Frame_3.Position = UDim2.new(0, 0, 0, v66 + 2);
            return ;
        end;
    end;
    local function _(v69)
        local l_v69_0 = v69;
        l_Frame_2.Size = UDim2.new(1, 0, 0, math.max(32, if v26 == 1 then l_v69_0 or l_ChatSettings_0.ChatChannelsTabTextSizePhone else l_v69_0 or l_ChatSettings_0.ChatChannelsTabTextSize + 8) + 2);
        v68();
    end;
    local function v75(v72)
        local l_v72_0 = v72;
        local v74 = (if v26 == 1 then l_v72_0 or l_ChatSettings_0.ChatBarTextSizePhone else l_v72_0 or l_ChatSettings_0.ChatBarTextSize + 14) + 10;
        l_Frame_1.Size = UDim2.new(1, 0, 0, v74);
        if not bubbleChatOnly() then
            l_Frame_1.Position = UDim2.new(0, 0, 1, -v74);
        end;
        l_ImageButton_0.Size = UDim2.new(0, v74, 0, v74);
        l_ImageButton_0.Position = UDim2.new(1, -v74, 1, -v74);
        v68();
        v64(l_ChatSettings_0.WindowResizable);
    end;
    local function _(v76)
        l_Frame_2.Visible = v76;
        v68();
    end;
    local l_ChatChannelsTabTextSize_0 = l_ChatSettings_0.ChatChannelsTabTextSize;
    l_Frame_2.Size = UDim2.new(1, 0, 0, math.max(32, if v26 == 1 then l_ChatChannelsTabTextSize_0 or l_ChatSettings_0.ChatChannelsTabTextSizePhone else l_ChatChannelsTabTextSize_0 or l_ChatSettings_0.ChatChannelsTabTextSize + 8) + 2);
    v68();
    v75(l_ChatSettings_0.ChatBarTextSize);
    local l_WindowDraggable_0 = l_ChatSettings_0.WindowDraggable;
    l_Frame_0.Active = l_WindowDraggable_0;
    l_Frame_0.Draggable = l_WindowDraggable_0;
    v64(l_ChatSettings_0.WindowResizable);
    l_Frame_2.Visible = l_ChatSettings_0.ShowChannelsBar;
    v68();
    l_ChatSettings_0.SettingsChanged:connect(function(v80, v81)
        if v80 == "WindowDraggable" then
            l_Frame_0.Active = v81;
            l_Frame_0.Draggable = v81;
            return ;
        elseif v80 == "WindowResizable" then
            v64(v81);
            return ;
        elseif v80 == "ChatChannelsTabTextSize" then
            local l_v81_0 = v81;
            l_Frame_2.Size = UDim2.new(1, 0, 0, math.max(32, if v26 == 1 then l_v81_0 or l_ChatSettings_0.ChatChannelsTabTextSizePhone else l_v81_0 or l_ChatSettings_0.ChatChannelsTabTextSize + 8) + 2);
            v68();
            return ;
        elseif v80 == "ChatBarTextSize" then
            v75(v81);
            return ;
        else
            if v80 == "ShowChannelsBar" then
                l_Frame_2.Visible = v81;
                v68();
            end;
            return ;
        end;
    end);
    v15.GuiObject = l_Frame_0;
    v15.GuiObjects.BaseFrame = l_Frame_0;
    v15.GuiObjects.ChatBarParentFrame = l_Frame_1;
    v15.GuiObjects.ChannelsBarParentFrame = l_Frame_2;
    v15.GuiObjects.ChatChannelParentFrame = l_Frame_3;
    v15.GuiObjects.ChatResizerFrame = l_ImageButton_0;
    v15.GuiObjects.ResizeIcon = l_ImageLabel_0;
    v15:AnimGuiObjects();
end;
v10.GetChatBar = function(v83)
    return v83.ChatBar;
end;
v10.RegisterChatBar = function(v84, v85)
    v84.ChatBar = v85;
    v84.ChatBar:CreateGuiObjects(v84.GuiObjects.ChatBarParentFrame);
end;
v10.RegisterChannelsBar = function(v86, v87)
    v86.ChannelsBar = v87;
    v86.ChannelsBar:CreateGuiObjects(v86.GuiObjects.ChannelsBarParentFrame);
end;
v10.RegisterMessageLogDisplay = function(v88, v89)
    v88.MessageLogDisplay = v89;
    v88.MessageLogDisplay.GuiObject.Parent = v88.GuiObjects.ChatChannelParentFrame;
end;
v10.AddChannel = function(v90, v91)
    if not v90:GetChannel(v91) then
        local v92 = l_ChatChannel_0.new(v91, v90.MessageLogDisplay);
        v90.Channels[v91:lower()] = v92;
        v92:SetActive(false);
        local v93 = v90.ChannelsBar:AddChannelTab(v91);
        v93.NameTag.MouseButton1Click:connect(function()
            v90:SwitchCurrentChannel(v91);
        end);
        v92:RegisterChannelTab(v93);
        return v92;
    else
        error("Channel '" .. v91 .. "' already exists");
        return ;
    end;
end;
v10.GetFirstChannel = function(v94)
    for _, v96 in pairs(v94.Channels) do
        return v96;
    end;
    return nil;
end;
v10.RemoveChannel = function(v97, v98)
    if not v97:GetChannel(v98) then
        error("Channel '" .. v98 .. "' does not exist");
    end;
    local v99 = v98:lower();
    local v100 = false;
    if v97.Channels[v99] == v97:GetCurrentChannel() then
        v100 = true;
        v97:SwitchCurrentChannel(nil);
    end;
    v97.Channels[v99]:Destroy();
    v97.Channels[v99] = nil;
    v97.ChannelsBar:RemoveChannelTab(v98);
    if v100 then
        local v101 = v97:GetChannel(l_ChatSettings_0.GeneralChannelName) ~= nil;
        local v102 = v99 == l_ChatSettings_0.GeneralChannelName:lower();
        local v103 = nil;
        if not v101 or v102 then
            local l_v97_FirstChannel_0 = v97:GetFirstChannel();
            v103 = not not l_v97_FirstChannel_0 and l_v97_FirstChannel_0.Name or nil;
        else
            v103 = l_ChatSettings_0.GeneralChannelName;
        end;
        v97:SwitchCurrentChannel(v103);
    end;
    if not l_ChatSettings_0.ShowChannelsBar and v97.ChatBar.TargetChannel == v98 then
        v97.ChatBar:SetChannelTarget(l_ChatSettings_0.GeneralChannelName);
    end;
end;
v10.GetChannel = function(v105, v106)
    return not not v106 and v105.Channels[v106:lower()] or nil;
end;
v10.GetTargetMessageChannel = function(v107)
    if l_ChatSettings_0.ShowChannelsBar then
        local l_v107_CurrentChannel_0 = v107:GetCurrentChannel();
        return l_v107_CurrentChannel_0 and l_v107_CurrentChannel_0.Name;
    else
        return v107.ChatBar.TargetChannel;
    end;
end;
v10.GetCurrentChannel = function(v109)
    return v109.CurrentChannel;
end;
v10.SwitchCurrentChannel = function(v110, v111)
    if not l_ChatSettings_0.ShowChannelsBar then
        local l_v110_Channel_0 = v110:GetChannel(v111);
        if l_v110_Channel_0 then
            v110.ChatBar:SetChannelTarget(l_v110_Channel_0.Name);
        end;
        v111 = l_ChatSettings_0.GeneralChannelName;
    end;
    local l_v110_CurrentChannel_0 = v110:GetCurrentChannel();
    local l_v110_Channel_1 = v110:GetChannel(v111);
    if l_v110_Channel_1 == nil then
        error(string.format("Channel '%s' does not exist.", v111));
    end;
    if l_v110_Channel_1 ~= l_v110_CurrentChannel_0 then
        if l_v110_CurrentChannel_0 then
            l_v110_CurrentChannel_0:SetActive(false);
            v110.ChannelsBar:GetChannelTab(l_v110_CurrentChannel_0.Name):SetActive(false);
        end;
        if l_v110_Channel_1 then
            l_v110_Channel_1:SetActive(true);
            v110.ChannelsBar:GetChannelTab(l_v110_Channel_1.Name):SetActive(true);
        end;
        v110.CurrentChannel = l_v110_Channel_1;
    end;
end;
v10.UpdateFrameVisibility = function(v115)
    v115.GuiObject.Visible = v115.Visible and v115.CoreGuiEnabled;
end;
v10.GetVisible = function(v116)
    return v116.Visible;
end;
v10.SetVisible = function(v117, v118)
    v117.Visible = v118;
    v117:UpdateFrameVisibility();
end;
v10.GetCoreGuiEnabled = function(v119)
    return v119.CoreGuiEnabled;
end;
v10.SetCoreGuiEnabled = function(v120, v121)
    v120.CoreGuiEnabled = v121;
    v120:UpdateFrameVisibility();
end;
v10.EnableResizable = function(v122)
    v122.GuiObjects.ChatResizerFrame.Active = true;
end;
v10.DisableResizable = function(v123)
    v123.GuiObjects.ChatResizerFrame.Active = false;
end;
v10.FadeOutBackground = function(v124, v125)
    v124.ChannelsBar:FadeOutBackground(v125);
    v124.MessageLogDisplay:FadeOutBackground(v125);
    v124.ChatBar:FadeOutBackground(v125);
    v124.AnimParams.Background_TargetTransparency = 1;
    v124.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v125);
end;
v10.FadeInBackground = function(v126, v127)
    v126.ChannelsBar:FadeInBackground(v127);
    v126.MessageLogDisplay:FadeInBackground(v127);
    v126.ChatBar:FadeInBackground(v127);
    v126.AnimParams.Background_TargetTransparency = 0.6;
    v126.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v127);
end;
v10.FadeOutText = function(v128, v129)
    v128.MessageLogDisplay:FadeOutText(v129);
    v128.ChannelsBar:FadeOutText(v129);
end;
v10.FadeInText = function(v130, v131)
    v130.MessageLogDisplay:FadeInText(v131);
    v130.ChannelsBar:FadeInText(v131);
end;
v10.AnimGuiObjects = function(v132)
    v132.GuiObjects.ChatChannelParentFrame.BackgroundTransparency = v132.AnimParams.Background_CurrentTransparency;
    v132.GuiObjects.ChatResizerFrame.BackgroundTransparency = v132.AnimParams.Background_CurrentTransparency;
    v132.GuiObjects.ResizeIcon.ImageTransparency = v132.AnimParams.Background_CurrentTransparency;
end;
v10.InitializeAnimParams = function(v133)
    v133.AnimParams.Background_TargetTransparency = 0.6;
    v133.AnimParams.Background_CurrentTransparency = 0.6;
    v133.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(0);
end;
v10.Update = function(v134, v135)
    v134.ChatBar:Update(v135);
    v134.ChannelsBar:Update(v135);
    v134.MessageLogDisplay:Update(v135);
    v134.AnimParams.Background_CurrentTransparency = l_CurveUtil_0:Expt(v134.AnimParams.Background_CurrentTransparency, v134.AnimParams.Background_TargetTransparency, v134.AnimParams.Background_NormalizedExptValue, v135);
    v134:AnimGuiObjects();
end;
v0.new = function()
    local v136 = setmetatable({}, v10);
    v136.GuiObject = nil;
    v136.GuiObjects = {};
    v136.ChatBar = nil;
    v136.ChannelsBar = nil;
    v136.MessageLogDisplay = nil;
    v136.Channels = {};
    v136.CurrentChannel = nil;
    v136.Visible = true;
    v136.CoreGuiEnabled = true;
    v136.AnimParams = {};
    v136:InitializeAnimParams();
    return v136;
end;
return v0;
