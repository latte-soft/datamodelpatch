local v0 = {};
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_TextService_0 = game:GetService("TextService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.PlayerAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local l_Chat_0 = game:GetService("Chat");
local l_ClientChatModules_0 = l_Chat_0:WaitForChild("ClientChatModules");
local l_Parent_0 = script.Parent;
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local l_CurveUtil_0 = require(l_Parent_0:WaitForChild("CurveUtil"));
local l_Whisper_0 = require(l_ClientChatModules_0:WaitForChild("CommandModules"):WaitForChild("Whisper"));
local _ = require(l_Parent_0:WaitForChild("MessageSender"));
local v13 = nil;
pcall(function()
    v13 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
if v13 == nil then
    v13 = {
        Get = function(_, _, v16)
            return v16;
        end
    };
end;
local v17 = {};
v17.__index = v17;
v17.CreateGuiObjects = function(v18, v19)
    v18.ChatBarParentFrame = v19;
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Selectable = false;
    l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_0.BackgroundTransparency = 0.6;
    l_Frame_0.BorderSizePixel = 0;
    l_Frame_0.BackgroundColor3 = l_ChatSettings_0.ChatBarBackGroundColor;
    l_Frame_0.Parent = v19;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Selectable = false;
    l_Frame_1.Name = "BoxFrame";
    l_Frame_1.BackgroundTransparency = 0.6;
    l_Frame_1.BorderSizePixel = 0;
    l_Frame_1.BackgroundColor3 = l_ChatSettings_0.ChatBarBoxColor;
    l_Frame_1.Size = UDim2.new(1, -14, 1, -14);
    l_Frame_1.Position = UDim2.new(0, 7, 0, 7);
    l_Frame_1.Parent = l_Frame_0;
    local l_Frame_2 = Instance.new("Frame");
    l_Frame_2.BackgroundTransparency = 1;
    l_Frame_2.Size = UDim2.new(1, -10, 1, -10);
    l_Frame_2.Position = UDim2.new(0, 5, 0, 5);
    l_Frame_2.Parent = l_Frame_1;
    local l_TextBox_0 = Instance.new("TextBox");
    l_TextBox_0.Selectable = l_ChatSettings_0.GamepadNavigationEnabled;
    l_TextBox_0.Name = "ChatBar";
    l_TextBox_0.BackgroundTransparency = 1;
    l_TextBox_0.Size = UDim2.new(1, 0, 1, 0);
    l_TextBox_0.Position = UDim2.new(0, 0, 0, 0);
    l_TextBox_0.TextSize = l_ChatSettings_0.ChatBarTextSize;
    l_TextBox_0.Font = l_ChatSettings_0.ChatBarFont;
    l_TextBox_0.TextColor3 = l_ChatSettings_0.ChatBarTextColor;
    l_TextBox_0.TextTransparency = 0.4;
    l_TextBox_0.TextStrokeTransparency = 1;
    l_TextBox_0.ClearTextOnFocus = false;
    l_TextBox_0.TextXAlignment = Enum.TextXAlignment.Left;
    l_TextBox_0.TextYAlignment = Enum.TextYAlignment.Top;
    l_TextBox_0.TextWrapped = true;
    l_TextBox_0.Text = "";
    l_TextBox_0.Parent = l_Frame_2;
    local l_TextButton_0 = Instance.new("TextButton");
    l_TextButton_0.Selectable = false;
    l_TextButton_0.Name = "MessageMode";
    l_TextButton_0.BackgroundTransparency = 1;
    l_TextButton_0.Position = UDim2.new(0, 0, 0, 0);
    l_TextButton_0.TextSize = l_ChatSettings_0.ChatBarTextSize;
    l_TextButton_0.Font = l_ChatSettings_0.ChatBarFont;
    l_TextButton_0.TextXAlignment = Enum.TextXAlignment.Left;
    l_TextButton_0.TextWrapped = true;
    l_TextButton_0.Text = "";
    l_TextButton_0.Size = UDim2.new(0, 0, 0, 0);
    l_TextButton_0.TextYAlignment = Enum.TextYAlignment.Center;
    l_TextButton_0.TextColor3 = v18:GetDefaultChannelNameColor();
    l_TextButton_0.Visible = true;
    l_TextButton_0.Parent = l_Frame_2;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Selectable = false;
    l_TextLabel_0.TextWrapped = true;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.Size = l_TextBox_0.Size;
    l_TextLabel_0.Position = l_TextBox_0.Position;
    l_TextLabel_0.TextSize = l_TextBox_0.TextSize;
    l_TextLabel_0.Font = l_TextBox_0.Font;
    l_TextLabel_0.TextColor3 = l_TextBox_0.TextColor3;
    l_TextLabel_0.TextTransparency = l_TextBox_0.TextTransparency;
    l_TextLabel_0.TextStrokeTransparency = l_TextBox_0.TextStrokeTransparency;
    l_TextLabel_0.TextXAlignment = l_TextBox_0.TextXAlignment;
    l_TextLabel_0.TextYAlignment = l_TextBox_0.TextYAlignment;
    l_TextLabel_0.Text = "...";
    l_TextLabel_0.Parent = l_Frame_2;
    v18.GuiObject = l_Frame_0;
    v18.TextBox = l_TextBox_0;
    v18.TextLabel = l_TextLabel_0;
    v18.GuiObjects.BaseFrame = l_Frame_0;
    v18.GuiObjects.TextBoxFrame = l_Frame_1;
    v18.GuiObjects.TextBox = l_TextBox_0;
    v18.GuiObjects.TextLabel = l_TextLabel_0;
    v18.GuiObjects.MessageModeTextButton = l_TextButton_0;
    v18:AnimGuiObjects();
    v18:SetUpTextBoxEvents(l_TextBox_0, l_TextLabel_0, l_TextButton_0);
    if v18.UserHasChatOff then
        v18:DoLockChatBar();
    end;
    v18.eGuiObjectsChanged:Fire();
end;
v17.DoLockChatBar = function(v26)
    if v26.TextLabel then
        if l_LocalPlayer_0.UserId > 0 then
            v26.TextLabel.Text = v13:Get("GameChat_ChatMessageValidator_SettingsError", "To chat in game, turn on chat in your Privacy Settings.");
        else
            v26.TextLabel.Text = v13:Get("GameChat_SwallowGuestChat_Message", "Sign up to chat in game.");
        end;
        v26:CalculateSize();
    end;
    if v26.TextBox then
        v26.TextBox.Active = false;
        v26.TextBox.Focused:connect(function()
            v26.TextBox:ReleaseFocus();
        end);
    end;
end;
v17.SetUpTextBoxEvents = function(v27, v28, v29, v30)
    for v31, v32 in pairs(v27.TextBoxConnections) do
        v32:disconnect();
        v27.TextBoxConnections[v31] = nil;
    end;
    v27.TextBoxConnections.UserInputBegan = l_UserInputService_0.InputBegan:connect(function(v33, _)
        if not (not (v33.KeyCode == Enum.KeyCode.Backspace) or not v27:IsFocused()) and v28.Text == "" then
            v27:SetChannelTarget(l_ChatSettings_0.GeneralChannelName);
        end;
    end);
    v27.TextBoxConnections.TextBoxChanged = v28.Changed:connect(function(v35)
        if v35 == "AbsoluteSize" then
            v27:CalculateSize();
            return ;
        elseif v35 ~= "Text" then
            return ;
        else
            v27:CalculateSize();
            if l_ChatSettings_0.MaximumMessageLength < utf8.len(utf8.nfcnormalize(v28.Text)) then
                v28.Text = v27.PreviousText;
            else
                v27.PreviousText = v28.Text;
            end;
            if v27.InCustomState then
                v27.CustomState:TextUpdated();
            else
                local v36 = v27.CommandProcessor:ProcessInProgressChatMessage(v28.Text, v27.ChatWindow, v27);
                if v36 then
                    v27.InCustomState = true;
                    v27.CustomState = v36;
                    return ;
                end;
            end;
            return ;
        end;
    end);
    local function _(v37)
        if v37 or v28.Text ~= "" then
            v29.Visible = false;
            return ;
        else
            v29.Visible = true;
            return ;
        end;
    end;
    v27.TextBoxConnections.MessageModeClick = v30.MouseButton1Click:connect(function()
        if v30.Text ~= "" then
            v27:SetChannelTarget(l_ChatSettings_0.GeneralChannelName);
        end;
    end);
    v27.TextBoxConnections.TextBoxFocused = v28.Focused:connect(function()
        if not v27.UserHasChatOff then
            v27:CalculateSize();
            v29.Visible = false;
        end;
    end);
    v27.TextBoxConnections.TextBoxFocusLost = v28.FocusLost:connect(function(_, v40)
        v27:CalculateSize();
        if v40 and v40.KeyCode == Enum.KeyCode.Escape then
            v28.Text = "";
        end;
        if v28.Text ~= "" then
            v29.Visible = false;
            return ;
        else
            v29.Visible = true;
            return ;
        end;
    end);
end;
v17.GetTextBox = function(v41)
    return v41.TextBox;
end;
v17.GetMessageModeTextButton = function(v42)
    return v42.GuiObjects.MessageModeTextButton;
end;
v17.GetMessageModeTextLabel = function(v43)
    return v43:GetMessageModeTextButton();
end;
v17.IsFocused = function(v44)
    if not v44.UserHasChatOff then
        return v44:GetTextBox():IsFocused();
    else
        return false;
    end;
end;
v17.GetVisible = function(v45)
    return v45.GuiObject.Visible;
end;
v17.CaptureFocus = function(v46)
    if not v46.UserHasChatOff then
        v46:GetTextBox():CaptureFocus();
    end;
end;
v17.ReleaseFocus = function(v47, v48)
    v47:GetTextBox():ReleaseFocus(v48);
end;
v17.ResetText = function(v49)
    v49:GetTextBox().Text = "";
end;
v17.SetText = function(v50, v51)
    v50:GetTextBox().Text = v51;
end;
v17.GetEnabled = function(v52)
    return v52.GuiObject.Visible;
end;
v17.SetEnabled = function(v53, v54)
    if not v53.UserHasChatOff then
        v53.GuiObject.Visible = v54;
        return ;
    else
        v53.GuiObject.Visible = true;
        return ;
    end;
end;
v17.SetTextLabelText = function(v55, v56)
    if not v55.UserHasChatOff then
        v55.TextLabel.Text = v56;
    end;
end;
v17.SetTextBoxText = function(v57, v58)
    v57.TextBox.Text = v58;
end;
v17.GetTextBoxText = function(v59)
    return v59.TextBox.Text;
end;
v17.ResetSize = function(v60)
    v60.TargetYSize = 0;
    v60:TweenToTargetYSize();
end;
local function _(v61)
    return l_TextService_0:GetTextSize(v61.Text, v61.TextSize, v61.Font, Vector2.new(v61.AbsoluteSize.X, 10000));
end;
v17.CalculateSize = function(v63)
    if not v63.CalculatingSizeLock then
        v63.CalculatingSizeLock = true;
        local v64 = nil;
        local v65 = nil;
        if v63:IsFocused() or v63.TextBox.Text ~= "" then
            v64 = v63.TextBox.TextSize;
            local l_TextBox_1 = v63.TextBox;
            v65 = l_TextService_0:GetTextSize(l_TextBox_1.Text, l_TextBox_1.TextSize, l_TextBox_1.Font, Vector2.new(l_TextBox_1.AbsoluteSize.X, 10000)).Y;
        else
            v64 = v63.TextLabel.TextSize;
            local l_TextLabel_1 = v63.TextLabel;
            v65 = l_TextService_0:GetTextSize(l_TextLabel_1.Text, l_TextLabel_1.TextSize, l_TextLabel_1.Font, Vector2.new(l_TextLabel_1.AbsoluteSize.X, 10000)).Y;
        end;
        local v68 = v65 - v64;
        if v63.TargetYSize ~= v68 then
            v63.TargetYSize = v68;
            v63:TweenToTargetYSize();
        end;
        v63.CalculatingSizeLock = false;
        return ;
    else
        return ;
    end;
end;
v17.TweenToTargetYSize = function(v69)
    local v70 = UDim2.new(1, 0, 1, v69.TargetYSize);
    local l_Size_0 = v69.GuiObject.Size;
    local l_Y_0 = v69.GuiObject.AbsoluteSize.Y;
    v69.GuiObject.Size = v70;
    local l_Y_1 = v69.GuiObject.AbsoluteSize.Y;
    v69.GuiObject.Size = l_Size_0;
    local v74 = math.min(1, math.abs(l_Y_1 - l_Y_0) * (1 / v69.TweenPixelsPerSecond));
    if not pcall(function()
        v69.GuiObject:TweenSize(v70, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, v74, true);
    end) then
        v69.GuiObject.Size = v70;
    end;
end;
v17.SetTextSize = function(v75, v76)
    if not v75:IsInCustomState() then
        if v75.TextBox then
            v75.TextBox.TextSize = v76;
        end;
        if v75.TextLabel then
            v75.TextLabel.TextSize = v76;
        end;
    end;
end;
v17.GetDefaultChannelNameColor = function(_)
    if not l_ChatSettings_0.DefaultChannelNameColor then
        return Color3.fromRGB(35, 76, 142);
    else
        return l_ChatSettings_0.DefaultChannelNameColor;
    end;
end;
v17.SetChannelTarget = function(v78, v79)
    local l_MessageModeTextButton_0 = v78.GuiObjects.MessageModeTextButton;
    local l_TextBox_2 = v78.TextBox;
    local l_TextLabel_2 = v78.TextLabel;
    v78.TargetChannel = v79;
    if not v78:IsInCustomState() then
        if v79 ~= l_ChatSettings_0.GeneralChannelName then
            l_MessageModeTextButton_0.Size = UDim2.new(0, 1000, 1, 0);
            local l_v79_0 = v79;
            if v13.tryLocalize then
                l_v79_0 = v13:tryLocalize(v79);
            end;
            l_MessageModeTextButton_0.Text = string.format("[%s] ", l_v79_0);
            local l_v78_ChannelNameColor_0 = v78:GetChannelNameColor(v79);
            if not l_v78_ChannelNameColor_0 then
                l_MessageModeTextButton_0.TextColor3 = v78:GetDefaultChannelNameColor();
            else
                l_MessageModeTextButton_0.TextColor3 = l_v78_ChannelNameColor_0;
            end;
            local l_X_0 = l_MessageModeTextButton_0.TextBounds.X;
            l_MessageModeTextButton_0.Size = UDim2.new(0, l_X_0, 1, 0);
            l_TextBox_2.Size = UDim2.new(1, -l_X_0, 1, 0);
            l_TextBox_2.Position = UDim2.new(0, l_X_0, 0, 0);
            l_TextLabel_2.Size = UDim2.new(1, -l_X_0, 1, 0);
            l_TextLabel_2.Position = UDim2.new(0, l_X_0, 0, 0);
            return ;
        else
            l_MessageModeTextButton_0.Text = "";
            l_MessageModeTextButton_0.Size = UDim2.new(0, 0, 0, 0);
            l_TextBox_2.Size = UDim2.new(1, 0, 1, 0);
            l_TextBox_2.Position = UDim2.new(0, 0, 0, 0);
            l_TextLabel_2.Size = UDim2.new(1, 0, 1, 0);
            l_TextLabel_2.Position = UDim2.new(0, 0, 0, 0);
        end;
    end;
end;
v17.IsInCustomState = function(v86)
    return v86.InCustomState;
end;
v17.ResetCustomState = function(v87)
    if v87.InCustomState then
        v87.CustomState:Destroy();
        v87.CustomState = nil;
        v87.InCustomState = false;
        v87.ChatBarParentFrame:ClearAllChildren();
        v87:CreateGuiObjects(v87.ChatBarParentFrame);
        v87:SetTextLabelText(v13:Get("GameChat_ChatMain_ChatBarText", "To chat click here or press \"/\" key"));
    end;
end;
v17.EnterWhisperState = function(v88, v89)
    v88:ResetCustomState();
    if not l_Whisper_0.CustomStateCreator then
        local _ = nil;
        v88:SetText("/w " .. if not l_ChatSettings_0.PlayerDisplayNamesEnabled then v89.Name else v89.DisplayName);
    else
        v88.CustomState = l_Whisper_0.CustomStateCreator(v89, v88.ChatWindow, v88, l_ChatSettings_0);
        v88.InCustomState = true;
    end;
    v88:CaptureFocus();
end;
v17.GetCustomMessage = function(v91)
    if not v91.InCustomState then
        return nil;
    else
        return v91.CustomState:GetMessage();
    end;
end;
v17.CustomStateProcessCompletedMessage = function(v92, _)
    if not v92.InCustomState then
        return false;
    else
        return v92.CustomState:ProcessCompletedMessage();
    end;
end;
v17.FadeOutBackground = function(v94, v95)
    v94.AnimParams.Background_TargetTransparency = 1;
    v94.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v95);
    v94:FadeOutText(v95);
end;
v17.FadeInBackground = function(v96, v97)
    v96.AnimParams.Background_TargetTransparency = 0.6;
    v96.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v97);
    v96:FadeInText(v97);
end;
v17.FadeOutText = function(v98, v99)
    v98.AnimParams.Text_TargetTransparency = 1;
    v98.AnimParams.Text_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v99);
end;
v17.FadeInText = function(v100, v101)
    v100.AnimParams.Text_TargetTransparency = 0.4;
    v100.AnimParams.Text_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v101);
end;
v17.AnimGuiObjects = function(v102)
    v102.GuiObject.BackgroundTransparency = v102.AnimParams.Background_CurrentTransparency;
    v102.GuiObjects.TextBoxFrame.BackgroundTransparency = v102.AnimParams.Background_CurrentTransparency;
    v102.GuiObjects.TextLabel.TextTransparency = v102.AnimParams.Text_CurrentTransparency;
    v102.GuiObjects.TextBox.TextTransparency = v102.AnimParams.Text_CurrentTransparency;
    v102.GuiObjects.MessageModeTextButton.TextTransparency = v102.AnimParams.Text_CurrentTransparency;
end;
v17.InitializeAnimParams = function(v103)
    v103.AnimParams.Text_TargetTransparency = 0.4;
    v103.AnimParams.Text_CurrentTransparency = 0.4;
    v103.AnimParams.Text_NormalizedExptValue = 1;
    v103.AnimParams.Background_TargetTransparency = 0.6;
    v103.AnimParams.Background_CurrentTransparency = 0.6;
    v103.AnimParams.Background_NormalizedExptValue = 1;
end;
v17.Update = function(v104, v105)
    v104.AnimParams.Text_CurrentTransparency = l_CurveUtil_0:Expt(v104.AnimParams.Text_CurrentTransparency, v104.AnimParams.Text_TargetTransparency, v104.AnimParams.Text_NormalizedExptValue, v105);
    v104.AnimParams.Background_CurrentTransparency = l_CurveUtil_0:Expt(v104.AnimParams.Background_CurrentTransparency, v104.AnimParams.Background_TargetTransparency, v104.AnimParams.Background_NormalizedExptValue, v105);
    v104:AnimGuiObjects();
end;
v17.SetChannelNameColor = function(v106, v107, v108)
    v106.ChannelNameColors[v107] = v108;
    if v106.GuiObjects.MessageModeTextButton.Text == v107 then
        v106.GuiObjects.MessageModeTextButton.TextColor3 = v108;
    end;
end;
v17.GetChannelNameColor = function(v109, v110)
    return v109.ChannelNameColors[v110];
end;
v0.new = function(v111, v112)
    local v113 = setmetatable({}, v17);
    v113.GuiObject = nil;
    v113.ChatBarParentFrame = nil;
    v113.TextBox = nil;
    v113.TextLabel = nil;
    v113.GuiObjects = {};
    v113.eGuiObjectsChanged = Instance.new("BindableEvent");
    v113.GuiObjectsChanged = v113.eGuiObjectsChanged.Event;
    v113.TextBoxConnections = {};
    v113.PreviousText = "";
    v113.InCustomState = false;
    v113.CustomState = nil;
    v113.TargetChannel = nil;
    v113.CommandProcessor = v111;
    v113.ChatWindow = v112;
    v113.TweenPixelsPerSecond = 500;
    v113.TargetYSize = 0;
    v113.AnimParams = {};
    v113.CalculatingSizeLock = false;
    v113.ChannelNameColors = {};
    v113.UserHasChatOff = false;
    v113:InitializeAnimParams();
    l_ChatSettings_0.SettingsChanged:connect(function(v114, v115)
        if v114 == "ChatBarTextSize" then
            v113:SetTextSize(v115);
        end;
    end);
    coroutine.wrap(function()
        local l_status_0, l_result_0 = pcall(function()
            return l_Chat_0:CanUserChatAsync(l_LocalPlayer_0.UserId);
        end);
        if (l_status_0 and (l_RunService_0:IsStudio() or l_result_0)) == false then
            v113.UserHasChatOff = true;
            v113:DoLockChatBar();
        end;
    end)();
    return v113;
end;
return v0;
