local v0 = {};
local l_ClientChatModules_0 = game:GetService("Chat"):WaitForChild("ClientChatModules");
local l_Parent_0 = script.Parent;
local l_ChannelsTab_0 = require(l_Parent_0:WaitForChild("ChannelsTab"));
local l_MessageSender_0 = require(l_Parent_0:WaitForChild("MessageSender"));
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local l_CurveUtil_0 = require(l_Parent_0:WaitForChild("CurveUtil"));
local v7 = {};
v7.__index = v7;
v7.CreateGuiObjects = function(v8, v9)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Selectable = false;
    l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Parent = v9;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Selectable = false;
    l_Frame_1.Name = "ScrollingBase";
    l_Frame_1.BackgroundTransparency = 1;
    l_Frame_1.ClipsDescendants = true;
    l_Frame_1.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_1.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_1.Parent = l_Frame_0;
    local l_Frame_2 = Instance.new("Frame");
    l_Frame_2.Selectable = false;
    l_Frame_2.Name = "ScrollerSizer";
    l_Frame_2.BackgroundTransparency = 1;
    l_Frame_2.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_2.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_2.Parent = l_Frame_1;
    local l_Frame_3 = Instance.new("Frame");
    l_Frame_3.Selectable = false;
    l_Frame_3.Name = "ScrollerFrame";
    l_Frame_3.BackgroundTransparency = 1;
    l_Frame_3.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_3.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_3.Parent = l_Frame_2;
    local l_Frame_4 = Instance.new("Frame");
    l_Frame_4.Selectable = false;
    l_Frame_4.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_4.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_4.ClipsDescendants = true;
    l_Frame_4.BackgroundTransparency = 1;
    l_Frame_4.Parent = l_Frame_0;
    local l_Frame_5 = Instance.new("Frame");
    l_Frame_5.Selectable = false;
    l_Frame_5.Name = "LeaveConfirmationFrame";
    l_Frame_5.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_5.Position = UDim2.new(0, 0, 1, 0);
    l_Frame_5.BackgroundTransparency = 0.6;
    l_Frame_5.BorderSizePixel = 0;
    l_Frame_5.BackgroundColor3 = Color3.new(0, 0, 0);
    l_Frame_5.Parent = l_Frame_4;
    local l_TextButton_0 = Instance.new("TextButton");
    l_TextButton_0.Selectable = false;
    l_TextButton_0.Size = UDim2.new(1, 0, 1, 0);
    l_TextButton_0.BackgroundTransparency = 1;
    l_TextButton_0.Text = "";
    l_TextButton_0.Parent = l_Frame_5;
    local l_TextButton_1 = Instance.new("TextButton");
    l_TextButton_1.Selectable = false;
    l_TextButton_1.Size = UDim2.new(0.25, 0, 1, 0);
    l_TextButton_1.BackgroundTransparency = 1;
    l_TextButton_1.Font = l_ChatSettings_0.DefaultFont;
    l_TextButton_1.TextSize = 18;
    l_TextButton_1.TextStrokeTransparency = 0.75;
    l_TextButton_1.Position = UDim2.new(0, 0, 0, 0);
    l_TextButton_1.TextColor3 = Color3.new(0, 1, 0);
    l_TextButton_1.Text = "Confirm";
    l_TextButton_1.Parent = l_Frame_5;
    local v18 = l_TextButton_1:Clone();
    v18.Parent = l_Frame_5;
    v18.Position = UDim2.new(0.75, 0, 0, 0);
    v18.TextColor3 = Color3.new(1, 0, 0);
    v18.Text = "Cancel";
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Selectable = false;
    l_TextLabel_0.Size = UDim2.new(0.5, 0, 1, 0);
    l_TextLabel_0.Position = UDim2.new(0.25, 0, 0, 0);
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextLabel_0.TextStrokeTransparency = 0.75;
    l_TextLabel_0.Text = "Leave channel <XX>?";
    l_TextLabel_0.Font = l_ChatSettings_0.DefaultFont;
    l_TextLabel_0.TextSize = 18;
    l_TextLabel_0.Parent = l_Frame_5;
    local l_StringValue_0 = Instance.new("StringValue");
    l_StringValue_0.Name = "LeaveTarget";
    l_StringValue_0.Parent = l_Frame_5;
    local l_Position_0 = l_Frame_5.Position;
    l_TextButton_1.MouseButton1Click:connect(function()
        l_MessageSender_0:SendMessage(string.format("/leave %s", l_StringValue_0.Value), nil);
        l_Frame_5:TweenPosition(l_Position_0, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
    end);
    v18.MouseButton1Click:connect(function()
        l_Frame_5:TweenPosition(l_Position_0, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
    end);
    local v22 = "rbxasset://textures/ui/Chat/TabArrowBackground.png";
    local v23 = "rbxasset://textures/ui/Chat/TabArrow.png";
    v22 = "rbxassetid://471630199";
    v23 = "rbxassetid://471630112";
    local v24 = Instance.new("ImageButton", l_Frame_0);
    v24.Selectable = l_ChatSettings_0.GamepadNavigationEnabled;
    v24.Name = "PageLeftButton";
    v24.SizeConstraint = Enum.SizeConstraint.RelativeYY;
    v24.Size = UDim2.new(0.7, 0, 0.7, 0);
    v24.BackgroundTransparency = 1;
    v24.Position = UDim2.new(0, 4, 0.15000000000000002, 0);
    v24.Visible = false;
    v24.Image = v22;
    local v25 = Instance.new("ImageLabel", v24);
    v25.Name = "ArrowLabel";
    v25.BackgroundTransparency = 1;
    v25.Size = UDim2.new(0.4, 0, 0.4, 0);
    v25.Image = v23;
    local v26 = Instance.new("Frame", l_Frame_0);
    v26.Selectable = false;
    v26.BackgroundTransparency = 1;
    v26.Name = "PositionalHelper";
    v26.Size = v24.Size;
    v26.SizeConstraint = v24.SizeConstraint;
    v26.Position = UDim2.new(1, 0, 0.15000000000000002, 0);
    local v27 = v24:Clone();
    v27.Parent = v26;
    v27.Name = "PageRightButton";
    v27.Size = UDim2.new(1, 0, 1, 0);
    v27.SizeConstraint = Enum.SizeConstraint.RelativeXY;
    v27.Position = UDim2.new(-1, -4, 0, 0);
    local v28 = UDim2.new(0.05, 0, 0, 0);
    v27.ArrowLabel.Position = UDim2.new(0.3, 0, 0.3, 0) + v28;
    v24.ArrowLabel.Position = UDim2.new(0.3, 0, 0.3, 0) - v28;
    v24.ArrowLabel.Rotation = 180;
    v8.GuiObject = l_Frame_0;
    v8.GuiObjects.BaseFrame = l_Frame_0;
    v8.GuiObjects.ScrollerSizer = l_Frame_2;
    v8.GuiObjects.ScrollerFrame = l_Frame_3;
    v8.GuiObjects.PageLeftButton = v24;
    v8.GuiObjects.PageRightButton = v27;
    v8.GuiObjects.LeaveConfirmationFrame = l_Frame_5;
    v8.GuiObjects.LeaveConfirmationNotice = l_TextLabel_0;
    v8.GuiObjects.PageLeftButtonArrow = v24.ArrowLabel;
    v8.GuiObjects.PageRightButtonArrow = v27.ArrowLabel;
    v8:AnimGuiObjects();
    v24.MouseButton1Click:connect(function()
        v8:ScrollChannelsFrame(-1);
    end);
    v27.MouseButton1Click:connect(function()
        v8:ScrollChannelsFrame(1);
    end);
    v8:ScrollChannelsFrame(0);
end;
v7.UpdateMessagePostedInChannel = function(v29, v30)
    local l_v29_ChannelTab_0 = v29:GetChannelTab(v30);
    if not l_v29_ChannelTab_0 then
        warn("ChannelsTab '" .. v30 .. "' does not exist");
        return ;
    else
        l_v29_ChannelTab_0:UpdateMessagePostedInChannel();
        return ;
    end;
end;
v7.AddChannelTab = function(v32, v33)
    if v32:GetChannelTab(v33) then
        error("Channel tab '" .. v33 .. "'already exists");
    end;
    local v34 = l_ChannelsTab_0.new(v33);
    v34.GuiObject.Parent = v32.GuiObjects.ScrollerFrame;
    v32.ChannelTabs[v33:lower()] = v34;
    v32.NumTabs = v32.NumTabs + 1;
    v32:OrganizeChannelTabs();
    if l_ChatSettings_0.RightClickToLeaveChannelEnabled then
        v34.NameTag.MouseButton2Click:connect(function()
            v32.LeaveConfirmationNotice.Text = string.format("Leave channel %s?", v34.ChannelName);
            v32.LeaveConfirmationFrame.LeaveTarget.Value = v34.ChannelName;
            v32.LeaveConfirmationFrame:TweenPosition(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.2, true);
        end);
    end;
    return v34;
end;
v7.RemoveChannelTab = function(v35, v36)
    if not v35:GetChannelTab(v36) then
        error("Channel tab '" .. v36 .. "'does not exist");
    end;
    local v37 = v36:lower();
    v35.ChannelTabs[v37]:Destroy();
    v35.ChannelTabs[v37] = nil;
    v35.NumTabs = v35.NumTabs - 1;
    v35:OrganizeChannelTabs();
end;
v7.GetChannelTab = function(v38, v39)
    return v38.ChannelTabs[v39:lower()];
end;
v7.OrganizeChannelTabs = function(v40)
    local v41 = {};
    table.insert(v41, v40:GetChannelTab(l_ChatSettings_0.GeneralChannelName));
    table.insert(v41, v40:GetChannelTab("System"));
    for _, v43 in pairs(v40.ChannelTabs) do
        if v43.ChannelName ~= l_ChatSettings_0.GeneralChannelName and v43.ChannelName ~= "System" then
            table.insert(v41, v43);
        end;
    end;
    for v44, v45 in pairs(v41) do
        v45.GuiObject.Position = UDim2.new(v44 - 1, 0, 0, 0);
    end;
    v40.GuiObjects.ScrollerSizer.Size = UDim2.new(1 / math.max(1, (math.min(l_ChatSettings_0.ChannelsBarFullTabSize, v40.NumTabs))), 0, 1, 0);
    v40:ScrollChannelsFrame(0);
end;
v7.ResizeChannelTabText = function(v46, v47)
    for _, v49 in pairs(v46.ChannelTabs) do
        v49:SetTextSize(v47);
    end;
end;
v7.ScrollChannelsFrame = function(v50, v51)
    if not v50.ScrollChannelsFrameLock then
        v50.ScrollChannelsFrameLock = true;
        local l_ChannelsBarFullTabSize_0 = l_ChatSettings_0.ChannelsBarFullTabSize;
        local v53 = v50.CurPageNum + v51;
        if v53 < 0 then
            v53 = 0;
        elseif v53 > 0 and v50.NumTabs < v53 + l_ChannelsBarFullTabSize_0 then
            v53 = v50.NumTabs - l_ChannelsBarFullTabSize_0;
        end;
        v50.CurPageNum = v53;
        local v54 = UDim2.new(-v50.CurPageNum, 0, 0, 0);
        v50.GuiObjects.PageLeftButton.Visible = v50.CurPageNum > 0;
        v50.GuiObjects.PageRightButton.Visible = v50.CurPageNum + l_ChannelsBarFullTabSize_0 < v50.NumTabs;
        if v51 == 0 then
            v50.ScrollChannelsFrameLock = false;
            return ;
        else
            local function v55()
                v50.ScrollChannelsFrameLock = false;
            end;
            v50:WaitUntilParentedCorrectly();
            v50.GuiObjects.ScrollerFrame:TweenPosition(v54, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15, true, v55);
            return ;
        end;
    else
        return ;
    end;
end;
v7.FadeOutBackground = function(v56, v57)
    for _, v59 in pairs(v56.ChannelTabs) do
        v59:FadeOutBackground(v57);
    end;
    v56.AnimParams.Background_TargetTransparency = 1;
    v56.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v57);
end;
v7.FadeInBackground = function(v60, v61)
    for _, v63 in pairs(v60.ChannelTabs) do
        v63:FadeInBackground(v61);
    end;
    v60.AnimParams.Background_TargetTransparency = 0.6;
    v60.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v61);
end;
v7.FadeOutText = function(v64, v65)
    for _, v67 in pairs(v64.ChannelTabs) do
        v67:FadeOutText(v65);
    end;
end;
v7.FadeInText = function(v68, v69)
    for _, v71 in pairs(v68.ChannelTabs) do
        v71:FadeInText(v69);
    end;
end;
v7.AnimGuiObjects = function(v72)
    v72.GuiObjects.PageLeftButton.ImageTransparency = v72.AnimParams.Background_CurrentTransparency;
    v72.GuiObjects.PageRightButton.ImageTransparency = v72.AnimParams.Background_CurrentTransparency;
    v72.GuiObjects.PageLeftButtonArrow.ImageTransparency = v72.AnimParams.Background_CurrentTransparency;
    v72.GuiObjects.PageRightButtonArrow.ImageTransparency = v72.AnimParams.Background_CurrentTransparency;
end;
v7.InitializeAnimParams = function(v73)
    v73.AnimParams.Background_TargetTransparency = 0.6;
    v73.AnimParams.Background_CurrentTransparency = 0.6;
    v73.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(0);
end;
v7.Update = function(v74, v75)
    for _, v77 in pairs(v74.ChannelTabs) do
        v77:Update(v75);
    end;
    v74.AnimParams.Background_CurrentTransparency = l_CurveUtil_0:Expt(v74.AnimParams.Background_CurrentTransparency, v74.AnimParams.Background_TargetTransparency, v74.AnimParams.Background_NormalizedExptValue, v75);
    v74:AnimGuiObjects();
end;
v7.WaitUntilParentedCorrectly = function(v78)
    while not v78.GuiObject:IsDescendantOf(game:GetService("Players").LocalPlayer) do
        v78.GuiObject.AncestryChanged:wait();
    end;
end;
v0.new = function()
    local v79 = setmetatable({}, v7);
    v79.GuiObject = nil;
    v79.GuiObjects = {};
    v79.ChannelTabs = {};
    v79.NumTabs = 0;
    v79.CurPageNum = 0;
    v79.ScrollChannelsFrameLock = false;
    v79.AnimParams = {};
    v79:InitializeAnimParams();
    l_ChatSettings_0.SettingsChanged:connect(function(v80, v81)
        if v80 == "ChatChannelsTabTextSize" then
            v79:ResizeChannelTabText(v81);
        end;
    end);
    return v79;
end;
return v0;
