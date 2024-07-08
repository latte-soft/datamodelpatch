local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_Modules_0 = l_CoreGui_0:WaitForChild("RobloxGui"):WaitForChild("Modules");
local _ = require(l_Modules_0:WaitForChild("AvatarContextMenu").ThemeHandler);
local v8 = require(l_Modules_0.BlockingUtility);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.PlayerAdded:Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v10 = {};
v10.__index = v10;
v10.GetHeadshotForPlayer = function(_, v12)
    return "rbxthumb://type=AvatarHeadShot&id=" .. v12.UserId .. "&w=150&h=150";
end;
v10.HasOrGettingHeadShot = function(v13, v14)
    return v13.HeadShotUrlCache[v14] ~= nil;
end;
v10.FindPlayerFromPart = function(_, v16)
    if not (not v16 or not v16.Parent) then
        local l_v16_0 = v16;
        while not (not l_v16_0 or l_v16_0:IsA("Model")) do
            l_v16_0 = l_v16_0.Parent;
        end;
        if l_v16_0 then
            return l_Players_0:GetPlayerFromCharacter(l_v16_0);
        end;
    end;
    return nil;
end;
v10.GetPlayerPosition = function(_, v19)
    if v19.Character then
        local l_HumanoidRootPart_0 = v19.Character:FindFirstChild("HumanoidRootPart");
        if l_HumanoidRootPart_0 then
            return l_HumanoidRootPart_0.Position;
        end;
    end;
    return nil;
end;
local v21 = true;
v10.DisablePlayerMovement = function(_)
    if v21 then
        v21 = false;
        l_ContextActionService_0:BindCoreActionAtPriority("AvatarContextMenuStopInput", function(_, v24)
            if v24 == Enum.UserInputState.End then
                return Enum.ContextActionResult.Pass;
            else
                return Enum.ContextActionResult.Sink;
            end;
        end, false, Enum.ContextActionPriority.Low.Value, Enum.PlayerActions.CharacterForward, Enum.PlayerActions.CharacterBackward, Enum.PlayerActions.CharacterLeft, Enum.PlayerActions.CharacterRight, Enum.PlayerActions.CharacterJump, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4);
        return ;
    else
        return ;
    end;
end;
v10.EnablePlayerMovement = function(_)
    if not v21 then
        v21 = true;
        l_ContextActionService_0:UnbindCoreAction("AvatarContextMenuStopInput");
        return ;
    else
        return ;
    end;
end;
v10.GetFriendStatus = function(_, v27)
    local l_status_0, l_result_0 = pcall(function()
        return l_LocalPlayer_0:GetFriendStatus(v27);
    end);
    if not l_status_0 then
        return Enum.FriendStatus.NotFriend;
    else
        return l_result_0;
    end;
end;
local v30 = {};
coroutine.wrap(function()
    l_RobloxReplicatedStorage_0:WaitForChild("CanChatWith", math.huge).OnClientEvent:Connect(function(...)
        local v31 = {
            ...
        };
        if #v31 == 1 then
            for v32, v33 in pairs(v31[1]) do
                v30[v32] = v33;
            end;
            return ;
        else
            if #v31 == 2 then
                v30[v31[1]] = v31[2];
            end;
            return ;
        end;
    end);
end)();
v10.GetCanChatWith = function(_, v35)
    if not v8:IsPlayerBlockedByUserId(v35.UserId) then
        if v30[v35.UserId] ~= nil then
            return v30[v35.UserId];
        else
            return true;
        end;
    else
        return false;
    end;
end;
local l_ImageLabel_0 = Instance.new("ImageLabel");
l_ImageLabel_0.Image = "";
l_ImageLabel_0.BackgroundTransparency = 1;
local function v54(v37, v38, v39, v40)
    local l_ImageButton_0 = Instance.new("ImageButton");
    l_ImageButton_0.Name = v37;
    l_ImageButton_0.Image = v40.ButtonImage;
    l_ImageButton_0.ScaleType = v40.ButtonImageScaleType;
    l_ImageButton_0.SliceCenter = v40.ButtonImageSliceCenter;
    l_ImageButton_0.BackgroundColor3 = v40.ButtonColor;
    l_ImageButton_0.BackgroundTransparency = v40.ButtonTransparency;
    l_ImageButton_0.AutoButtonColor = false;
    l_ImageButton_0.Size = v38;
    l_ImageButton_0.ZIndex = 2;
    l_ImageButton_0.SelectionImageObject = l_ImageLabel_0;
    l_ImageButton_0.BorderSizePixel = 0;
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "Underline";
    l_Frame_0.BackgroundColor3 = v40.ButtonUnderlineColor;
    l_Frame_0.AnchorPoint = Vector2.new(0.5, 1);
    l_Frame_0.BorderSizePixel = 0;
    l_Frame_0.Position = UDim2.new(0.5, 0, 1, 0);
    l_Frame_0.Size = UDim2.new(0.95, 0, 0, 1);
    l_Frame_0.Parent = l_ImageButton_0;
    if v39 then
        l_ImageButton_0.MouseButton1Click:Connect(function()
            v39(l_UserInputService_0:GetLastInputType());
        end);
    end;
    local function _(v43)
        local v44 = true;
        if v43.UserInputType ~= Enum.UserInputType.MouseMovement then
            v44 = v43.UserInputType == Enum.UserInputType.Touch;
        end;
        return v44;
    end;
    local function _()
        l_ImageButton_0.BackgroundColor3 = v40.ButtonHoverColor;
        l_ImageButton_0.BackgroundTransparency = v40.ButtonHoverTransparency;
    end;
    local function _()
        l_ImageButton_0.BackgroundColor3 = v40.ButtonColor;
        l_ImageButton_0.BackgroundTransparency = v40.ButtonTransparency;
    end;
    l_ImageButton_0.InputBegan:Connect(function(v48)
        if l_ImageButton_0.Selectable then
            local v49 = true;
            if v48.UserInputType ~= Enum.UserInputType.MouseMovement then
                v49 = v48.UserInputType == Enum.UserInputType.Touch;
            end;
            if v49 then
                l_ImageButton_0.BackgroundColor3 = v40.ButtonHoverColor;
                l_ImageButton_0.BackgroundTransparency = v40.ButtonHoverTransparency;
                v48:GetPropertyChangedSignal("UserInputState"):connect(function()
                    if v48.UserInputState == Enum.UserInputState.End then
                        l_ImageButton_0.BackgroundColor3 = v40.ButtonColor;
                        l_ImageButton_0.BackgroundTransparency = v40.ButtonTransparency;
                    end;
                end);
            end;
        end;
    end);
    l_ImageButton_0.InputEnded:Connect(function(v50)
        if l_ImageButton_0.Selectable and l_GuiService_0.SelectedCoreObject ~= l_ImageButton_0 then
            local v51 = true;
            if v50.UserInputType ~= Enum.UserInputType.MouseMovement then
                v51 = v50.UserInputType == Enum.UserInputType.Touch;
            end;
            if v51 then
                l_ImageButton_0.BackgroundColor3 = v40.ButtonColor;
                l_ImageButton_0.BackgroundTransparency = v40.ButtonTransparency;
            end;
        end;
    end);
    l_ImageButton_0.SelectionGained:Connect(function()
        l_ImageButton_0.BackgroundColor3 = v40.ButtonHoverColor;
        l_ImageButton_0.BackgroundTransparency = v40.ButtonHoverTransparency;
    end);
    l_ImageButton_0.SelectionLost:Connect(function()
        l_ImageButton_0.BackgroundColor3 = v40.ButtonColor;
        l_ImageButton_0.BackgroundTransparency = v40.ButtonTransparency;
    end);
    local _ = l_GuiService_0.Changed:Connect(function(v52)
        if v52 ~= "SelectedCoreObject" then
            return ;
        elseif not (l_GuiService_0.SelectedCoreObject ~= nil) or l_GuiService_0.SelectedCoreObject ~= l_ImageButton_0 then
            l_ImageButton_0.BackgroundColor3 = v40.ButtonColor;
            l_ImageButton_0.BackgroundTransparency = v40.ButtonTransparency;
            return ;
        else
            if l_ImageButton_0.Selectable then
                l_ImageButton_0.BackgroundColor3 = v40.ButtonHoverColor;
                l_ImageButton_0.BackgroundTransparency = v40.ButtonHoverTransparency;
            end;
            return ;
        end;
    end);
    return l_ImageButton_0;
end;
local function v55()
    while not workspace.CurrentCamera do
        workspace.Changed:Wait();
    end;
    assert(workspace.CurrentCamera, "");
    while not (workspace.CurrentCamera.ViewportSize ~= Vector2.new(0, 0)) or workspace.CurrentCamera.ViewportSize == Vector2.new(1, 1) do
        workspace.CurrentCamera.Changed:Wait();
    end;
    return workspace.CurrentCamera.ViewportSize;
end;
local function _()
    local v56 = v55();
    local l_TouchEnabled_0 = l_UserInputService_0.TouchEnabled;
    if l_TouchEnabled_0 then
        l_TouchEnabled_0 = true;
        if v56.Y >= 500 then
            l_TouchEnabled_0 = v56.X < 700;
        end;
    end;
    return l_TouchEnabled_0;
end;
v10.MakeStyledButton = function(_, v60, v61, v62, v63, v64)
    local v65 = v54(v60, v62, v63, v64);
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = v60 .. "TextLabel";
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.BorderSizePixel = 0;
    l_TextLabel_0.Size = UDim2.new(1, 0, 1, -8);
    l_TextLabel_0.Position = UDim2.new(0, 0, 0, 0);
    l_TextLabel_0.TextColor3 = Color3.fromRGB(255, 255, 255);
    l_TextLabel_0.TextYAlignment = Enum.TextYAlignment.Center;
    l_TextLabel_0.Font = v64.Font;
    l_TextLabel_0.TextSize = 24 * v64.TextScale;
    local v67 = v55();
    local l_TouchEnabled_1 = l_UserInputService_0.TouchEnabled;
    if l_TouchEnabled_1 then
        l_TouchEnabled_1 = true;
        if v67.Y >= 500 then
            l_TouchEnabled_1 = v67.X < 700;
        end;
    end;
    if not l_TouchEnabled_1 then
        if l_GuiService_0:IsTenFootInterface() then
            l_TextLabel_0.TextSize = 36 * v64.TextScale;
        end;
    else
        l_TextLabel_0.TextSize = 18 * v64.TextScale;
    end;
    l_TextLabel_0.Text = v61;
    l_TextLabel_0.TextScaled = true;
    l_TextLabel_0.TextWrapped = true;
    l_TextLabel_0.ZIndex = 2;
    l_TextLabel_0.Parent = v65;
    Instance.new("UITextSizeConstraint", l_TextLabel_0).MaxTextSize = l_TextLabel_0.TextSize;
    return v65, l_TextLabel_0;
end;
v10.new = function()
    return (setmetatable({}, v10));
end;
return v10.new();
