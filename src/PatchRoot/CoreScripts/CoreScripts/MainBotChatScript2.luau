local v0 = {
    [Enum.DialogPurpose.Quest] = {
        "rbxasset://textures/ui/dialog_purpose_quest.png", 
        Vector2.new(10, 34)
    }, 
    [Enum.DialogPurpose.Help] = {
        "rbxasset://textures/ui/dialog_purpose_help.png", 
        Vector2.new(20, 35)
    }, 
    [Enum.DialogPurpose.Shop] = {
        "rbxasset://textures/ui/dialog_purpose_shop.png", 
        Vector2.new(22, 43)
    }
};
local v1 = 24;
local l_Size24_0 = Enum.FontSize.Size24;
local v3 = Vector2.new(80, 90);
local v4 = 350;
local l_Players_0 = game:GetService("Players");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v10 = false;
local v11 = game:DefineFastFlag("FixDialogInstanceGamepadImages", false);
local v12 = false;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while l_LocalPlayer_0 == nil do
    l_Players_0.PlayerAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
setUsingGamepad = function(v14, _)
    if not ((v14.UserInputType ~= Enum.UserInputType.Gamepad1 and v14.UserInputType ~= Enum.UserInputType.Gamepad2) and v14.UserInputType ~= Enum.UserInputType.Gamepad3) or v14.UserInputType == Enum.UserInputType.Gamepad4 then
        v10 = true;
        return ;
    else
        v10 = false;
        return ;
    end;
end;
game:GetService("UserInputService").InputBegan:Connect(setUsingGamepad);
game:GetService("UserInputService").InputChanged:Connect(setUsingGamepad);
waitForProperty = function(v16, v17)
    while not v16[v17] do
        v16.Changed:wait();
    end;
end;
local l_status_0, l_result_0 = pcall(function()
    return settings():GetFFlag("GoodbyeChoiceActiveProperty");
end);
local v20 = l_status_0 and l_result_0;
local v21 = nil;
local v22 = {};
local v23 = nil;
local v24 = {};
local v25 = nil;
local v26 = nil;
local v27 = {};
local v28 = nil;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v31 = game:GetService("RobloxReplicatedStorage"):WaitForChild("SetDialogInUse", math.huge);
local v32 = nil;
local v33 = nil;
local v34 = {};
local v35 = {};
local v36 = nil;
local v37 = nil;
local v38 = require(l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface")):IsEnabled();
local v39 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v40 = require(l_RobloxGui_0.Modules.GameTranslator);
local v41 = v39:IsSmallTouchScreen();
if not v38 then
    if v41 then
        l_Size24_0 = Enum.FontSize.Size14;
        v1 = 14;
        v4 = 250;
    end;
else
    l_Size24_0 = Enum.FontSize.Size36;
    v1 = 36;
    v4 = 500;
end;
v37 = if not l_RobloxGui_0:FindFirstChild("ControlFrame") then l_RobloxGui_0 else l_RobloxGui_0.ControlFrame;
local l_TouchEnabled_0 = game:GetService("UserInputService").TouchEnabled;
local function _(v43)
    local l_status_1, l_result_1 = pcall(function()
        return v43.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
    end);
    return not not l_status_1 and (l_result_1 or false);
end;
currentTone = function()
    if not v25 then
        return Enum.DialogTone.Neutral;
    else
        return v25.Tone;
    end;
end;
createChatNotificationGui = function()
    v32 = Instance.new("BillboardGui");
    v32.Name = "ChatNotificationGui";
    v32.ExtentsOffset = Vector3.new(0, 1, 0);
    v32.Size = UDim2.new(v3.X / 31.5, 0, v3.Y / 31.5, 0);
    v32.SizeOffset = Vector2.new(0, 0);
    v32.StudsOffset = Vector3.new(0, 3.7, 0);
    v32.Enabled = true;
    v32.RobloxLocked = true;
    v32.Active = true;
    local l_ImageButton_0 = Instance.new("ImageButton");
    l_ImageButton_0.Name = "Background";
    l_ImageButton_0.Active = false;
    l_ImageButton_0.BackgroundTransparency = 1;
    l_ImageButton_0.Position = UDim2.new(0, 0, 0, 0);
    l_ImageButton_0.Size = UDim2.new(1, 0, 1, 0);
    l_ImageButton_0.Image = "";
    l_ImageButton_0.Parent = v32;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = "Icon";
    l_ImageLabel_0.Position = UDim2.new(0, 0, 0, 0);
    l_ImageLabel_0.Size = UDim2.new(1, 0, 1, 0);
    l_ImageLabel_0.Image = "";
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Parent = l_ImageButton_0;
    local l_ImageLabel_1 = Instance.new("ImageLabel");
    l_ImageLabel_1.Name = "ActivationButton";
    l_ImageLabel_1.Position = UDim2.new(-0.3, 0, -0.4, 0);
    l_ImageLabel_1.Size = UDim2.new(0.8, 0, 0.8 * (v3.X / v3.Y), 0);
    if not v11 or not game:GetEngineFeature("GetImageForKeyCode") then
        l_ImageLabel_1.Image = "rbxasset://textures/ui/Settings/Help/XButtonDark.png";
    else
        l_ImageLabel_1.Image = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonX);
    end;
    l_ImageLabel_1.BackgroundTransparency = 1;
    l_ImageLabel_1.Visible = false;
    l_ImageLabel_1.Parent = l_ImageButton_0;
end;
getChatColor = function(v50)
    if v50 == Enum.DialogTone.Neutral then
        return Enum.ChatColor.Blue;
    elseif v50 == Enum.DialogTone.Friendly then
        return Enum.ChatColor.Green;
    elseif v50 == Enum.DialogTone.Enemy then
        return Enum.ChatColor.Red;
    else
        return ;
    end;
end;
styleChoices = function()
    for _, v52 in pairs(v22) do
        v52.BackgroundTransparency = 1;
    end;
    v23.BackgroundTransparency = 1;
end;
styleMainFrame = function(v53)
    if v53 == Enum.DialogTone.Neutral then
        v21.Style = Enum.FrameStyle.ChatBlue;
    elseif v53 == Enum.DialogTone.Friendly then
        v21.Style = Enum.FrameStyle.ChatGreen;
    elseif v53 == Enum.DialogTone.Enemy then
        v21.Style = Enum.FrameStyle.ChatRed;
    end;
    styleChoices();
end;
setChatNotificationTone = function(v54, v55, v56)
    if v56 == Enum.DialogTone.Neutral then
        v54.Background.Image = "rbxasset://textures/ui/chatBubble_blue_notify_bkg.png";
    elseif v56 == Enum.DialogTone.Friendly then
        v54.Background.Image = "rbxasset://textures/ui/chatBubble_green_notify_bkg.png";
    elseif v56 == Enum.DialogTone.Enemy then
        v54.Background.Image = "rbxasset://textures/ui/chatBubble_red_notify_bkg.png";
    end;
    local v57, v58 = unpack(v0[v55]);
    local v59 = v58 / v3;
    v54.Background.Icon.Size = UDim2.new(v59.X, 0, v59.Y, 0);
    v54.Background.Icon.Position = UDim2.new(0.5 - v59.X / 2, 0, 0.4 - v59.Y / 2, 0);
    v54.Background.Icon.Image = v57;
end;
createMessageDialog = function()
    v33 = Instance.new("Frame");
    v33.Name = "DialogScriptMessage";
    v33.Style = Enum.FrameStyle.Custom;
    v33.BackgroundTransparency = 0.5;
    v33.BackgroundColor3 = Color3.new(0.12156862745098039, 0.12156862745098039, 0.12156862745098039);
    v33.Visible = false;
    v33.RobloxLocked = true;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "Text";
    l_TextLabel_0.Position = UDim2.new(0, 0, 0, -1);
    l_TextLabel_0.Size = UDim2.new(1, 0, 1, 0);
    l_TextLabel_0.FontSize = Enum.FontSize.Size14;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextLabel_0.Parent = v33;
end;
showMessage = function(v61, v62)
    v33.Text.Text = v61;
    v33.Size = UDim2.new(0, v62, 0, 40);
    v33.Position = UDim2.new(0.5, -v62 / 2, 0.5, -40);
    v33.Visible = true;
    wait(2);
    v33.Visible = false;
end;
variableDelay = function(v63)
    wait(0.75 + (math.min(string.len(v63), 100) / 75) * 1.5);
end;
resetColor = function(v64)
    v64.BackgroundTransparency = 1;
end;
wanderDialog = function()
    v21.Visible = false;
    endDialog();
    showMessage("Chat ended because you walked away", 350);
end;
timeoutDialog = function()
    v21.Visible = false;
    endDialog();
    showMessage("Chat ended because you didn't reply", 350);
end;
normalEndDialog = function()
    endDialog();
end;
endDialog = function()
    if v28 then
        v27[v28] = false;
        v28 = nil;
    end;
    local l_v25_0 = v25;
    v25 = nil;
    if not (not l_v25_0 or not l_v25_0.InUse) then
        delay(5, function()
            v31:FireServer(l_v25_0, false);
            l_v25_0.InUse = false;
        end);
    end;
    for v66, v67 in pairs(v34) do
        if not (not v66 or not v67) then
            v67.Enabled = not v66.InUse;
        end;
    end;
    l_ContextActionService_0:UnbindCoreAction("Nothing");
    v26 = nil;
    if v36 then
        v36.Visible = true;
    end;
    if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject.Parent == v21 then
        l_GuiService_0.SelectedCoreObject = nil;
    end;
end;
sanitizeMessage = function(v68)
    if string.len(v68) == 0 then
        return "...";
    else
        return v68;
    end;
end;
local function v72(v69, ...)
    local l_status_2, l_result_2 = pcall(function()
        return v69.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
    end);
    if not (not not l_status_2 and (l_result_2 or false)) then
        game:GetService("Chat"):Chat(...);
        return ;
    else
        game:GetService("Chat"):ChatLocal(...);
        return ;
    end;
end;
selectChoice = function(v73)
    if v25 then
        renewKillswitch(v25);
        v21.Visible = false;
        if v73 == v23 then
            v72(v25, l_LocalPlayer_0.Character, v23.UserPrompt.Text, getChatColor(currentTone()));
            normalEndDialog();
            return ;
        else
            local v74 = v24[v73];
            v72(v25, l_LocalPlayer_0.Character, sanitizeMessage(v74.UserDialog), getChatColor(currentTone()));
            wait(1);
            if v25 then
                v25:SignalDialogChoiceSelected(l_LocalPlayer_0, v74);
                v72(v25, v26, sanitizeMessage(v74.ResponseDialog), getChatColor(currentTone()));
                variableDelay(v74.ResponseDialog);
                presentDialogChoices(v26, v74:GetChildren(), v74);
                return ;
            else
                return ;
            end;
        end;
    else
        return ;
    end;
end;
newChoice = function()
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Visible = false;
    local l_TextButton_0 = Instance.new("TextButton");
    l_TextButton_0.BackgroundColor3 = Color3.new(0.8901960784313725, 0.8901960784313725, 0.8901960784313725);
    l_TextButton_0.BackgroundTransparency = 1;
    l_TextButton_0.AutoButtonColor = false;
    l_TextButton_0.BorderSizePixel = 0;
    l_TextButton_0.Text = "";
    l_TextButton_0.MouseEnter:connect(function()
        l_TextButton_0.BackgroundTransparency = 0;
    end);
    l_TextButton_0.MouseLeave:connect(function()
        l_TextButton_0.BackgroundTransparency = 1;
    end);
    l_TextButton_0.SelectionImageObject = l_Frame_0;
    l_TextButton_0.MouseButton1Click:connect(function()
        selectChoice(l_TextButton_0);
    end);
    l_TextButton_0.RobloxLocked = true;
    local l_TextLabel_1 = Instance.new("TextLabel");
    l_TextLabel_1.AutoLocalize = false;
    l_TextLabel_1.Name = "UserPrompt";
    l_TextLabel_1.BackgroundTransparency = 1;
    l_TextLabel_1.Font = Enum.Font.SourceSans;
    l_TextLabel_1.FontSize = l_Size24_0;
    l_TextLabel_1.Position = UDim2.new(0, 40, 0, 0);
    l_TextLabel_1.Size = UDim2.new(1, -72, 1, 0);
    l_TextLabel_1.TextXAlignment = Enum.TextXAlignment.Left;
    l_TextLabel_1.TextYAlignment = Enum.TextYAlignment.Center;
    l_TextLabel_1.TextWrap = true;
    l_TextLabel_1.Parent = l_TextButton_0;
    local l_ImageLabel_2 = Instance.new("ImageLabel");
    l_ImageLabel_2.Name = "RBXchatDialogSelectionButton";
    l_ImageLabel_2.Position = UDim2.new(0, 0, 0.5, -16.5);
    l_ImageLabel_2.Size = UDim2.new(0, 33, 0, 33);
    if not v11 or not game:GetEngineFeature("GetImageForKeyCode") then
        l_ImageLabel_2.Image = "rbxasset://textures/ui/Settings/Help/AButtonLightSmall.png";
    else
        l_ImageLabel_2.Image = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonA);
    end;
    l_ImageLabel_2.BackgroundTransparency = 1;
    l_ImageLabel_2.Visible = false;
    l_ImageLabel_2.Parent = l_TextButton_0;
    return l_TextButton_0;
end;
initialize = function(v79)
    v22[1] = newChoice();
    v22[2] = newChoice();
    v22[3] = newChoice();
    v22[4] = newChoice();
    v23 = newChoice();
    v23.UserPrompt.Text = "Goodbye";
    v23.Size = UDim2.new(1, 28, 0, v1 + 12);
    v21 = Instance.new("Frame");
    v21.Name = "UserDialogArea";
    v21.Size = UDim2.new(0, v4, 0, 200);
    v21.Style = Enum.FrameStyle.ChatBlue;
    v21.Visible = false;
    for _, v81 in pairs(v22) do
        v81.RobloxLocked = true;
        v81.Parent = v21;
    end;
    v23.RobloxLocked = true;
    v23.Parent = v21;
    v21.RobloxLocked = true;
    v21.Parent = v79;
end;
presentDialogChoices = function(v82, v83, v84)
    if v25 then
        v26 = v82;
        local v85 = {};
        for _, v87 in pairs(v83) do
            if v87:IsA("DialogChoice") then
                table.insert(v85, v87);
            end;
        end;
        table.sort(v85, function(v88, v89)
            return v88.Name < v89.Name;
        end);
        if #v85 == 0 then
            normalEndDialog();
            return ;
        else
            local v90 = 1;
            local v91 = 0;
            v24 = {};
            for _, v93 in pairs(v22) do
                v93.Visible = false;
            end;
            for _, v95 in pairs(v85) do
                if v90 <= #v22 then
                    v22[v90].Size = UDim2.new(1, 28, 0, v1 * 3);
                    v40:TranslateAndRegister(v22[v90].UserPrompt, v95, v95.UserDialog);
                    local v96 = math.ceil(v22[v90].UserPrompt.TextBounds.Y / v1) * v1 + 12;
                    v22[v90].Position = UDim2.new(0, -11, 0, -8 + v91);
                    v22[v90].Size = UDim2.new(1, 28, 0, v96);
                    v22[v90].Visible = true;
                    v24[v22[v90]] = v95;
                    v91 = (v91 + v96) + 1;
                    v90 = v90 + 1;
                end;
            end;
            v23.Size = UDim2.new(1, 28, 0, v1 * 3);
            v23.UserPrompt.Text = v84.GoodbyeDialog == "" and "Goodbye" or v84.GoodbyeDialog;
            v23.Size = UDim2.new(1, 28, 0, math.ceil(v23.UserPrompt.TextBounds.Y / v1) * v1 + 12);
            v23.Position = UDim2.new(0, -11, 0, -8 + v91);
            v23.Visible = true;
            if not v20 or v84.GoodbyeChoiceActive then
                v21.Size = UDim2.new(0, v4, 0, ((v91 + v23.AbsoluteSize.Y) + 34) + -16);
            else
                v23.Visible = false;
                v21.Size = UDim2.new(0, v4, 0, (v91 + 34) + -16);
            end;
            v21.Position = UDim2.new(0, 20, 1, -v21.Size.Y.Offset - 20);
            if v41 then
                local l_TouchGui_0 = l_LocalPlayer_0.PlayerGui:FindFirstChild("TouchGui");
                if l_TouchGui_0 then
                    v36 = l_TouchGui_0:FindFirstChild("TouchControlFrame");
                    if v36 then
                        v36.Visible = false;
                    end;
                end;
                v21.Position = UDim2.new(0, 10, 1, -v21.Size.Y.Offset);
            end;
            styleMainFrame(currentTone());
            v21.Visible = true;
            if v10 then
                game:GetService("GuiService").SelectedCoreObject = v22[1];
            end;
            return ;
        end;
    else
        return ;
    end;
end;
doDialog = function(v98)
    if v98.InitialPrompt == "" then
        warn("Can't start a dialog with an empty InitialPrompt");
        return ;
    else
        local l_status_3, l_result_3 = pcall(function()
            return v98.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
        end);
        local v101 = not not l_status_3 and (l_result_3 or false);
        if not v98.InUse or v101 then
            v25 = v98;
            v98.InUse = true;
            l_ContextActionService_0:BindCoreAction("Nothing", function()
            end, false, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4);
            v31:FireServer(v98, true);
            v72(v98, v98.Parent, v98.InitialPrompt, getChatColor(v98.Tone));
            variableDelay(v98.InitialPrompt);
            presentDialogChoices(v98.Parent, v98:GetChildren(), v98);
            return ;
        else
            return ;
        end;
    end;
end;
renewKillswitch = function(v102)
    if v28 then
        v27[v28] = false;
        v28 = nil;
    end;
    v28 = coroutine.create(function(v103)
        wait(15);
        if v103 ~= nil then
            if v27[v103] == nil then
                v31:FireServer(v102, false);
                v102.InUse = false;
            end;
            v27[v103] = nil;
        end;
    end);
    coroutine.resume(v28, v28);
end;
checkForLeaveArea = function()
    while v25 do
        if v25.Parent and v25.ConversationDistance <= l_LocalPlayer_0:DistanceFromCharacter(v25.Parent.Position) then
            wanderDialog();
        end;
        wait(1);
    end;
end;
startDialog = function(v104)
    if not (not v104.Parent or not v104.Parent:IsA("BasePart")) then
        l_RbxAnalyticsService_0:TrackEvent("Dialogue", "Old Dialogue", "Conversation Initiated");
        if v104.ConversationDistance <= l_LocalPlayer_0:DistanceFromCharacter(v104.Parent.Position) then
            showMessage("You are too far away to chat", 300);
            return ;
        else
            for v105, v106 in pairs(v34) do
                if not (not v105 or not v106) then
                    v106.Enabled = false;
                end;
            end;
            renewKillswitch(v104);
            delay(1, checkForLeaveArea);
            doDialog(v104);
        end;
    end;
end;
removeDialog = function(v107)
    if v34[v107] then
        v34[v107]:Destroy();
        v34[v107] = nil;
    end;
    if v35[v107] then
        v35[v107]:disconnect();
        v35[v107] = nil;
    end;
end;
addDialog = function(v108)
    if v108.Parent then
        if not v108.Parent:IsA("BasePart") or not v108:IsDescendantOf(game.Workspace) then
            v35[v108] = v108.Changed:connect(function(v109)
                if not (not (v109 == "Parent") or not v108.Parent) then
                    removeDialog(v108);
                    addDialog(v108);
                end;
            end);
        else
            v12 = true;
            l_RbxAnalyticsService_0:TrackEvent("Dialogue", "Old Dialogue", "Used In Place", nil, game.PlaceId);
            local v110 = v32:clone();
            v110.Adornee = v108.Parent;
            v110.RobloxLocked = true;
            local v111 = not v108.InUse;
            if not v111 then
                local l_status_4, l_result_4 = pcall(function()
                    return v108.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
                end);
                v111 = not not l_status_4 and (l_result_4 or false);
            end;
            v110.Enabled = v111;
            v110.Parent = l_CoreGui_0;
            v110.Background.MouseButton1Click:connect(function()
                startDialog(v108);
            end);
            setChatNotificationTone(v110, v108.Purpose, v108.Tone);
            v34[v108] = v110;
            v35[v108] = v108.Changed:connect(function(v114)
                if not (v114 == "Parent") or not v108.Parent then
                    if v114 == "InUse" then
                        local l_v108_0 = v108;
                        local l_l_v108_0_0 = l_v108_0 --[[ copy: 2 -> 5 ]];
                        local l_status_5, l_result_5 = pcall(function()
                            return l_l_v108_0_0.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
                        end);
                        if not not l_status_5 and (l_result_5 or false) then
                            v110.Enabled = v25 ~= v108;
                        else
                            local l_v110_0 = v110;
                            l_v108_0 = false;
                            if v25 == nil then
                                l_v108_0 = not v108.InUse;
                            end;
                            l_v110_0.Enabled = l_v108_0;
                        end;
                        if not v108.InUse then
                            l_v108_0 = v108;
                            l_status_5, l_result_5 = pcall(function()
                                return l_v108_0.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
                            end);
                            if not (not not l_status_5 and (l_result_5 or false)) and v108 == v25 then
                                timeoutDialog();
                                return ;
                            end;
                        end;
                    elseif not (v114 ~= "Tone") or v114 == "Purpose" then
                        setChatNotificationTone(v110, v108.Purpose, v108.Tone);
                    end;
                    return ;
                else
                    removeDialog(v108);
                    addDialog(v108);
                    return ;
                end;
            end);
            return ;
        end;
    end;
end;
onLoad = function()
    waitForProperty(l_LocalPlayer_0, "Character");
    createChatNotificationGui();
    createMessageDialog();
    v33.RobloxLocked = true;
    v33.Parent = v37;
    v37:WaitForChild("BottomLeftControl");
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = "DialogFrame";
    l_Frame_1.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_1.Size = UDim2.new(0, 0, 0, 0);
    l_Frame_1.BackgroundTransparency = 1;
    l_Frame_1.RobloxLocked = true;
    game:GetService("GuiService"):AddSelectionParent("RBXDialogGroup", l_Frame_1);
    if not l_TouchEnabled_0 or v41 then
        if not v41 then
            l_Frame_1.Parent = v37.BottomLeftControl;
        else
            l_Frame_1.Position = UDim2.new(0, 0, 0.9, -10);
            l_Frame_1.Size = UDim2.new(0.25, 0, 0.1, 0);
            l_Frame_1.Parent = v37;
        end;
    else
        l_Frame_1.Position = UDim2.new(0, 20, 0.5, 0);
        l_Frame_1.Size = UDim2.new(0.25, 0, 0.1, 0);
        l_Frame_1.Parent = v37;
    end;
    initialize(l_Frame_1);
    game:GetService("CollectionService").ItemAdded:Connect(function(v121)
        if v121:IsA("Dialog") then
            addDialog(v121);
        end;
    end);
    game:GetService("CollectionService").ItemRemoved:Connect(function(v122)
        if v122:IsA("Dialog") then
            removeDialog(v122);
        end;
    end);
    for _, v124 in pairs(game:GetService("CollectionService"):GetCollection("Dialog")) do
        if v124:IsA("Dialog") then
            addDialog(v124);
        end;
    end;
end;
getLocalHumanoidRootPart = function()
    if not l_LocalPlayer_0.Character then
        return ;
    else
        return l_LocalPlayer_0.Character:FindFirstChild("HumanoidRootPart");
    end;
end;
dialogIsValid = function(v125)
    return (v125 and v125.Parent) and v125.Parent:IsA("BasePart");
end;
local v126 = nil;
local l_GetClosestDialogToPosition_0 = l_GuiService_0.GetClosestDialogToPosition;
game:GetService("RunService").Heartbeat:Connect(function()
    local v128 = nil;
    local v129 = getLocalHumanoidRootPart();
    if v129 then
        v128 = l_GetClosestDialogToPosition_0(l_GuiService_0, v129.Position);
    end;
    if not (not getLocalHumanoidRootPart() or not dialogIsValid(v128)) and v25 == nil then
        local l_TriggerDistance_0 = v128.TriggerDistance;
        local v131 = l_LocalPlayer_0:DistanceFromCharacter(v128.Parent.Position + v128.TriggerOffset);
        if (l_TriggerDistance_0 ~= 0 and v131 < v128.ConversationDistance) and v131 < l_TriggerDistance_0 then
            startDialog(v128);
        end;
    end;
    if v10 == true and v128 ~= v126 then
        if v34[v126] then
            v34[v126].Background.ActivationButton.Visible = false;
        end;
        v126 = v128;
        l_ContextActionService_0:UnbindCoreAction("StartDialogAction");
        if v128 ~= nil then
            l_ContextActionService_0:BindCoreAction("StartDialogAction", function(_, v133, _)
                if not ((not (v133 == Enum.UserInputState.Begin) or not v128) or not v128.Parent) then
                    startDialog(v128);
                end;
            end, false, Enum.KeyCode.ButtonX);
            if v34[v128] then
                v34[v128].Background.ActivationButton.Visible = true;
            end;
        end;
    end;
end);
local v135 = nil;
l_GuiService_0.Changed:connect(function(v136)
    if v136 == "SelectedCoreObject" then
        if not (not v135 or not v135:FindFirstChild("RBXchatDialogSelectionButton")) then
            v135:FindFirstChild("RBXchatDialogSelectionButton").Visible = false;
            v135.BackgroundTransparency = 1;
        end;
        v135 = l_GuiService_0.SelectedCoreObject;
        if not (not v135 or not v135:FindFirstChild("RBXchatDialogSelectionButton")) then
            v135:FindFirstChild("RBXchatDialogSelectionButton").Visible = true;
            v135.BackgroundTransparency = 0;
        end;
    end;
end);
onLoad();
