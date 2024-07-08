local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_TouchEnabled_0 = l_UserInputService_0.TouchEnabled;
local v5 = {};
local v6 = {};
local v7 = nil;
local v8 = nil;
local _ = {};
local v10 = {
    [1] = UDim2.new(0, 123, 0, 70), 
    [2] = UDim2.new(0, 30, 0, 60), 
    [3] = UDim2.new(0, 180, 0, 160), 
    [4] = UDim2.new(0, 85, 0, -25), 
    [5] = UDim2.new(0, 185, 0, -25), 
    [6] = UDim2.new(0, 185, 0, 260), 
    [7] = UDim2.new(0, 216, 0, 65)
};
local v11 = #v10;
game:GetService("ContentProvider"):Preload("https://www.roblox.com/asset/?id=97166756");
game:GetService("ContentProvider"):Preload("https://www.roblox.com/asset/?id=97166444");
local v12 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.CoreUtility);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v14 = v12.waitForChildOfClass(l_LocalPlayer_0, "PlayerGui");
createContextActionGui = function()
    if not (v7 or not l_TouchEnabled_0) then
        v7 = Instance.new("ScreenGui");
        v7.Name = "ContextActionGui";
        v7.ResetOnSpawn = false;
        v8 = Instance.new("Frame");
        v8.BackgroundTransparency = 1;
        v8.Size = UDim2.new(0.3, 0, 0.5, 0);
        v8.Position = UDim2.new(0.7, 0, 0.5, 0);
        v8.Name = "ContextButtonFrame";
        v8.Parent = v7;
        v8.Visible = l_GuiService_0.TouchControlsEnabled;
        l_GuiService_0:GetPropertyChangedSignal("TouchControlsEnabled"):Connect(function()
            v8.Visible = l_GuiService_0.TouchControlsEnabled;
        end);
    end;
end;
setButtonSizeAndPosition = function(v15)
    local v16 = 55;
    local v17 = 10;
    if not (game:GetService("CoreGui").RobloxGui.AbsoluteSize.X < 600) then
        v16 = 85;
        v17 = 40;
    end;
    v15.Size = UDim2.new(0, v16, 0, v16);
end;
contextActionButtonDown = function(v18, v19, v20)
    v18.Image = "https://www.roblox.com/asset/?id=97166756";
    l_ContextActionService_0:CallFunction(v20, Enum.UserInputState.Begin, v19);
end;
contextActionButtonMoved = function(v21, v22, v23)
    v21.Image = "https://www.roblox.com/asset/?id=97166756";
    l_ContextActionService_0:CallFunction(v23, Enum.UserInputState.Change, v22);
end;
contextActionButtonUp = function(v24, v25, v26)
    v24.Image = "https://www.roblox.com/asset/?id=97166444";
    l_ContextActionService_0:CallFunction(v26, Enum.UserInputState.End, v25);
end;
contextActionButtonCancel = function(v27, v28, v29)
    v27.Image = "https://www.roblox.com/asset/?id=97166444";
    l_ContextActionService_0:CallFunction(v29, Enum.UserInputState.Cancel, v28);
end;
isSmallScreenDevice = function()
    return game:GetService("GuiService"):GetScreenResolution().Y <= 320;
end;
createNewButton = function(v30, v31)
    local l_ImageButton_0 = Instance.new("ImageButton");
    l_ImageButton_0.Name = "ContextActionButton";
    l_ImageButton_0.BackgroundTransparency = 1;
    l_ImageButton_0.Size = UDim2.new(0, 45, 0, 45);
    l_ImageButton_0.Active = true;
    if isSmallScreenDevice() then
        l_ImageButton_0.Size = UDim2.new(0, 35, 0, 35);
    end;
    l_ImageButton_0.Image = "https://www.roblox.com/asset/?id=97166444";
    l_ImageButton_0.Parent = v8;
    local v33 = nil;
    local v34 = false;
    l_UserInputService_0.InputEnded:connect(function(v35)
        if v35.UserInputType ~= Enum.UserInputType.Touch then
            return ;
        elseif v33 ~= v35 then
            return ;
        else
            if not (not (v35.UserInputState == Enum.UserInputState.End) or not v34) then
                contextActionButtonCancel(l_ImageButton_0, v35, v30);
            end;
            v33 = nil;
            v34 = false;
            return ;
        end;
    end);
    l_ImageButton_0.InputBegan:connect(function(v36)
        if v36.UserInputType ~= Enum.UserInputType.Touch then
            return ;
        elseif v36.UserInputState == Enum.UserInputState.Begin then
            v33 = v36;
            v34 = false;
            contextActionButtonDown(l_ImageButton_0, v36, v30);
            return ;
        else
            if v36.UserInputState == Enum.UserInputState.Change then
                if v33 ~= v36 then
                    return ;
                else
                    v34 = false;
                end;
            end;
            return ;
        end;
    end);
    l_ImageButton_0.InputEnded:connect(function(v37)
        if v37.UserInputType ~= Enum.UserInputType.Touch then
            return ;
        elseif v33 ~= v37 then
            return ;
        elseif v37.UserInputState == Enum.UserInputState.End then
            v33 = nil;
            v34 = false;
            contextActionButtonUp(l_ImageButton_0, v37, v30);
            return ;
        else
            if v37.UserInputState == Enum.UserInputState.Change then
                v34 = true;
            end;
            return ;
        end;
    end);
    l_ImageButton_0.InputChanged:connect(function(v38)
        if v38.UserInputType ~= Enum.UserInputType.Touch then
            return ;
        elseif v33 ~= v38 then
            return ;
        else
            contextActionButtonMoved(l_ImageButton_0, v38, v30);
            return ;
        end;
    end);
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = "ActionIcon";
    l_ImageLabel_0.Position = UDim2.new(0.175, 0, 0.175, 0);
    l_ImageLabel_0.Size = UDim2.new(0.65, 0, 0.65, 0);
    l_ImageLabel_0.BackgroundTransparency = 1;
    if v31.image and type(v31.image) == "string" then
        l_ImageLabel_0.Image = v31.image;
    end;
    l_ImageLabel_0.Parent = l_ImageButton_0;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "ActionTitle";
    l_TextLabel_0.Size = UDim2.new(1, 0, 1, 0);
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.Font = Enum.Font.SourceSansBold;
    l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextLabel_0.TextStrokeTransparency = 0;
    l_TextLabel_0.FontSize = Enum.FontSize.Size18;
    l_TextLabel_0.TextWrapped = true;
    l_TextLabel_0.Text = "";
    if v31.title and type(v31.title) == "string" then
        l_TextLabel_0.Text = v31.title;
    end;
    l_TextLabel_0.Parent = l_ImageButton_0;
    return l_ImageButton_0;
end;
createButton = function(v41, v42)
    local v43 = createNewButton(v41, v42);
    local v44 = nil;
    for v45 = 1, #v6 do
        if v6[v45] == "empty" then
            v44 = v45;
            break;
        end;
    end;
    if not v44 then
        v44 = #v6 + 1;
    end;
    if v11 < v44 then
        return ;
    else
        v6[v44] = v43;
        v5[v41].button = v43;
        v43.Position = v10[v44];
        v43.Parent = v8;
        if v7 and v7.Parent == nil then
            v7.Parent = v14;
            if not v8.Parent then
                v8.Parent = v7;
            end;
        end;
        return ;
    end;
end;
removeAction = function(v46)
    if v5[v46] then
        local l_button_0 = v5[v46].button;
        if l_button_0 then
            l_button_0.Parent = nil;
            for v48 = 1, #v6 do
                if v6[v48] == l_button_0 then
                    v6[v48] = "empty";
                    break;
                end;
            end;
            l_button_0:Destroy();
        end;
        v5[v46] = nil;
        return ;
    else
        return ;
    end;
end;
addAction = function(v49, v50, v51)
    if v5[v49] then
        removeAction(v49);
    end;
    v5[v49] = {
        v51
    };
    if not (not v50 or not l_TouchEnabled_0) then
        createContextActionGui();
        createButton(v49, v51);
    end;
end;
l_ContextActionService_0.BoundActionChanged:connect(function(v52, v53, v54)
    if not (not v5[v52] or not v54) then
        local l_button_1 = v5[v52].button;
        local v56 = v54[v53] or (not (v53 ~= "image" and v53 ~= "title") or v53 == "description") and "";
        if l_button_1 then
            if v53 == "image" then
                l_button_1.ActionIcon.Image = v56;
                return ;
            elseif v53 == "title" then
                l_button_1.ActionTitle.Text = v56;
                return ;
            elseif v53 == "description" then
                return ;
            elseif v53 == "position" then
                l_button_1.Position = v56;
            end;
        end;
    end;
end);
l_ContextActionService_0.BoundActionAdded:connect(function(v57, v58, v59)
    addAction(v57, v58, v59);
end);
l_ContextActionService_0.BoundActionRemoved:connect(function(v60, _)
    removeAction(v60);
end);
l_ContextActionService_0.GetActionButtonEvent:connect(function(v62)
    if v5[v62] then
        l_ContextActionService_0:FireActionButtonFoundSignal(v62, v5[v62].button);
    end;
end);
for v63, v64 in pairs((l_ContextActionService_0:GetAllBoundActionInfo())) do
    addAction(v63, v64.createTouchButton, v64);
end;
