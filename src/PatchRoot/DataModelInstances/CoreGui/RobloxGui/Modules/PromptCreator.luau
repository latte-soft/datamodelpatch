local v0 = {};
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_TextService_0 = game:GetService("TextService");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Modules_0 = l_RobloxGui_0:WaitForChild("Modules");
local l_TenFootInterface_0 = require(l_Modules_0:WaitForChild("TenFootInterface"));
local l_Dialog_0 = require(l_Modules_0:WaitForChild("VR"):WaitForChild("Dialog"));
local v10 = nil;
getViewportSize = function()
    while not game.Workspace.CurrentCamera do
        game.Workspace.Changed:Wait();
    end;
    assert(game.Workspace.CurrentCamera, "");
    while not (game.Workspace.CurrentCamera.ViewportSize ~= Vector2.new(0, 0)) or game.Workspace.CurrentCamera.ViewportSize == Vector2.new(1, 1) do
        game.Workspace.CurrentCamera.Changed:Wait();
    end;
    return game.Workspace.CurrentCamera.ViewportSize;
end;
local v11 = l_TenFootInterface_0:IsEnabled();
local v12 = false;
local v13 = false;
if l_UserInputService_0.TouchEnabled == true then
    v13 = l_UserInputService_0.MouseEnabled == false;
end;
local v14 = v13 and getViewportSize().Y <= 370;
local v15 = v13 and not v14;
local v16 = false;
local v17 = false;
local v18 = false;
local v19 = false;
local v20 = false;
local v21 = {
    WindowTitle = "Confirm", 
    MainText = "Is this okay?", 
    ConfirmationText = "Confirm", 
    CancelText = "Cancel", 
    CancelActive = true, 
    StripeColor = Color3.new(0.01, 0.72, 0.34), 
    Image = nil, 
    ImageConsoleVR = nil, 
    PromptCompletedCallback = nil
};
local v22 = nil;
local v23 = nil;
local v24 = UDim2.new(0, 438, 0, 300);
local v25 = UDim2.new(0.5, -219, 0, -300);
local v26 = UDim2.new(0.5, -219, 0.5, -150);
if not v11 and not v12 then
    if not v14 then
        if v15 then
            v24 = UDim2.new(0, 400, 0, 305);
            v25 = UDim2.new(0.5, -200, 0, -305);
            v26 = UDim2.new(0.5, -200, 0.5, -152);
        end;
    else
        v24 = UDim2.new(0.9, 0, 0.9, 0);
        v25 = UDim2.new(0.05, 0, -0.9, 0);
        v26 = UDim2.new(0.05, 0, 0.05, 0);
    end;
else
    v24 = UDim2.new(1, 0, 0, 690);
    v25 = UDim2.new(0, 0, 0, -690);
    v26 = UDim2.new(0, 0, 0.5, -345);
end;
local v27 = 52;
if v14 then
    v27 = 44;
end;
local v28 = 24;
if not (not v11 and not v12) then
    v28 = 42;
end;
local function v35(v29, v30, v31, v32, v33)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = v29;
    l_Frame_0.Size = v30;
    l_Frame_0.Position = v31 or UDim2.new(0, 0, 0, 0);
    l_Frame_0.BackgroundTransparency = v32;
    l_Frame_0.BackgroundColor3 = v33 or Color3.new();
    l_Frame_0.BorderSizePixel = 0;
    l_Frame_0.ZIndex = 8;
    return l_Frame_0;
end;
local function v43(v36, v37, v38, v39, v40, v41)
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = v36;
    l_TextLabel_0.Size = v37 or UDim2.new(0, 0, 0, 0);
    l_TextLabel_0.Position = v38;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.Font = v39;
    l_TextLabel_0.TextSize = v40;
    l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextLabel_0.Text = v41;
    l_TextLabel_0.ZIndex = 8;
    return l_TextLabel_0;
end;
local function v56(v44, v45, v46, v47, v48, v49, v50)
    local v51 = v43(v44, v45, v46, v47, v48, v49);
    v51.TextXAlignment = Enum.TextXAlignment.Left;
    v51.TextYAlignment = Enum.TextYAlignment.Top;
    v51.TextWrapped = true;
    if v45.Y.Offset < l_TextService_0:GetTextSize(v49, v48, v47, Vector2.new(v45.X.Offset, 10000)).Y then
        local v52 = Vector2.new(v45.X.Offset - (v50 + 20), 10000);
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v49, v48, v47, v52);
        local l_Frame_1 = Instance.new("Frame");
        l_Frame_1.Name = "ScrollingTextParent";
        l_Frame_1.BackgroundTransparency = 1;
        l_Frame_1.BackgroundColor3 = Color3.new(1, 1, 1);
        l_Frame_1.BorderSizePixel = 0;
        l_Frame_1.Position = v46;
        l_Frame_1.Size = v45 - UDim2.new(0, v50 * 2, 0, 0);
        local l_ScrollingFrame_0 = Instance.new("ScrollingFrame");
        l_ScrollingFrame_0.Selectable = true;
        l_ScrollingFrame_0.Name = "ScrollingFrame";
        l_ScrollingFrame_0.BackgroundTransparency = 1;
        l_ScrollingFrame_0.BackgroundColor3 = Color3.new(1, 1, 1);
        l_ScrollingFrame_0.BorderSizePixel = 0;
        l_ScrollingFrame_0.Position = UDim2.new(0, 0, 0, 0);
        l_ScrollingFrame_0.Size = v45;
        l_ScrollingFrame_0.CanvasSize = UDim2.new(0, v52.X - v50 * 2, 0, l_l_TextService_0_TextSize_0.Y);
        l_ScrollingFrame_0.ScrollBarThickness = v50;
        l_ScrollingFrame_0.SelectionImageObject = Instance.new("ImageLabel");
        l_ScrollingFrame_0.SelectionImageObject.Name = "EmptySelectionImage";
        l_ScrollingFrame_0.SelectionImageObject.BackgroundTransparency = 1;
        l_ScrollingFrame_0.SelectionImageObject.Image = "";
        l_ScrollingFrame_0.Active = false;
        l_ScrollingFrame_0.SelectionGained:connect(function()
            l_Frame_1.BackgroundTransparency = 0.15;
        end);
        l_ScrollingFrame_0.SelectionLost:connect(function()
            l_Frame_1.BackgroundTransparency = 1;
        end);
        v51.Position = UDim2.new(0, 10, 0, 0);
        v51.Size = UDim2.new(0, v52.X, 0, l_l_TextService_0_TextSize_0.Y);
        v51.Parent = l_ScrollingFrame_0;
        l_ScrollingFrame_0.Parent = l_Frame_1;
        return l_Frame_1;
    else
        return v51;
    end;
end;
local function _(v57, v58, v59, v60, v61)
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = v57;
    l_ImageLabel_0.Size = v58;
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Position = v59;
    l_ImageLabel_0.Image = v60;
    if v61 then
        v61(l_ImageLabel_0);
    end;
    return l_ImageLabel_0;
end;
local function v73(v64, v65, v66, v67, v68, v69, v70)
    local l_ImageButton_0 = Instance.new("ImageButton");
    l_ImageButton_0.Name = v64;
    l_ImageButton_0.Size = v65;
    l_ImageButton_0.Position = v66;
    l_ImageButton_0.Image = v67;
    l_ImageButton_0.BackgroundTransparency = 1;
    l_ImageButton_0.AutoButtonColor = false;
    l_ImageButton_0.ZIndex = 8;
    l_ImageButton_0.Modal = true;
    l_ImageButton_0.Selectable = true;
    l_ImageButton_0.SelectionImageObject = Instance.new("ImageLabel");
    l_ImageButton_0.SelectionImageObject.Name = "EmptySelectionImage";
    l_ImageButton_0.SelectionImageObject.BackgroundTransparency = 1;
    l_ImageButton_0.SelectionImageObject.Image = "";
    local v72 = v43(v64 .. "Text", UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), v70, v28, v69);
    v72.ZIndex = 9;
    v72.Parent = l_ImageButton_0;
    l_ImageButton_0.MouseEnter:connect(function()
        l_ImageButton_0.Image = v68;
    end);
    l_ImageButton_0.MouseLeave:connect(function()
        l_ImageButton_0.Image = v67;
    end);
    l_ImageButton_0.MouseButton1Click:connect(function()
        l_ImageButton_0.Image = v67;
    end);
    l_ImageButton_0.SelectionGained:connect(function()
        l_ImageButton_0.Image = v68;
    end);
    l_ImageButton_0.SelectionLost:connect(function()
        l_ImageButton_0.Image = v67;
    end);
    return l_ImageButton_0;
end;
local v74 = v35("PromptDialog", v24, v25, 1, nil);
v74.Visible = false;
v74.Parent = l_RobloxGui_0;
v74.Active = true;
local v75 = v35("ContainerFrame", UDim2.new(1, 0, 1, 0), nil, 0.36, Color3.new(0, 0, 0));
v75.ZIndex = 8;
v75.Parent = v74;
AddDefaultsToPromptOptions = function(v76, v77)
    for v78, v79 in pairs(v77) do
        if v76[v78] == nil then
            v76[v78] = v79;
        end;
    end;
end;
CreatePromptVRorConsole = function(v80)
    local v81 = 90;
    if v80.ImageConsoleVR then
        local v82 = UDim2.new(0, 600, 0, 600);
        local v83 = UDim2.new(0, 100, 0, 45);
        local l_ImageConsoleVR_0 = v80.ImageConsoleVR;
        local l_FetchImageFunctionConsoleVR_0 = v80.FetchImageFunctionConsoleVR;
        local l_ImageLabel_1 = Instance.new("ImageLabel");
        l_ImageLabel_1.Name = "Image";
        l_ImageLabel_1.Size = v82;
        l_ImageLabel_1.BackgroundTransparency = 1;
        l_ImageLabel_1.Position = v83;
        l_ImageLabel_1.Image = l_ImageConsoleVR_0;
        if l_FetchImageFunctionConsoleVR_0 then
            l_FetchImageFunctionConsoleVR_0(l_ImageLabel_1);
        end;
        local l_l_ImageLabel_1_0 = l_ImageLabel_1;
        l_l_ImageLabel_1_0.ZIndex = 9;
        l_l_ImageLabel_1_0.Parent = v75;
        v81 = 800;
    end;
    local v88 = v43("WindowTitle", UDim2.new(0, 800, 0, 60), UDim2.new(0, v81, 0, 60), Enum.Font.SourceSansBold, 48, v80.WindowTitle);
    v88.TextXAlignment = Enum.TextXAlignment.Left;
    v88.TextYAlignment = Enum.TextYAlignment.Center;
    v88.Parent = v75;
    v88.ZIndex = 9;
    local v89 = v35("ColorStripe", UDim2.new(0, 832, 0, 4), UDim2.new(0, v81, 0, 120), 0, v80.StripeColor);
    v89.ZIndex = 9;
    v89.Parent = v75;
    v56("MainText", UDim2.new(0, 800, 0, 450), UDim2.new(0, v81, 0, 152), Enum.Font.SourceSansBold, 44, v80.MainText, 16).Parent = v75;
    local v90 = Rect.new(8, 8, 56, 56);
    local l_Slice_0 = Enum.ScaleType.Slice;
    local v92 = v73("ConfirmButton", UDim2.new(0, 320, 0, 80), UDim2.new(0, v81, 1, -125), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v80.ConfirmationText, Enum.Font.SourceSans);
    v92.Parent = v75;
    v92.ScaleType = l_Slice_0;
    v92.SliceCenter = v90;
    v92.MouseButton1Click:connect(function()
        OnPromptEnded(true);
    end);
    if v80.CancelActive then
        local v93 = v73("CancelButton", UDim2.new(0, 320, 0, 80), UDim2.new(0, v81 + 340, 1, -125), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v80.CancelText, Enum.Font.SourceSans);
        v93.Parent = v75;
        v93.ScaleType = l_Slice_0;
        v93.SliceCenter = v90;
        v93.MouseButton1Click:connect(function()
            OnPromptEnded(false);
        end);
    end;
end;
CreatePromptPCorTablet = function(v94)
    local v95 = v43("WindowTitle", UDim2.new(1, 0, 0, v27), UDim2.new(0, 0, 0, 0), Enum.Font.SourceSansBold, 24, v94.WindowTitle);
    v95.Parent = v75;
    v95.ZIndex = 9;
    local v96 = v35("ColorStripe", UDim2.new(1, 0, 0, 2), nil, 0, v94.StripeColor);
    v96.Position = UDim2.new(0, 0, 0, v27);
    v96.ZIndex = 9;
    v96.Parent = v75;
    local v97 = nil;
    local v98 = nil;
    if not v94.Image then
        v97 = if not v15 then v56("MainText", UDim2.new(0, 398, 0, 150), UDim2.new(0, 20, 0, v27 + 17), Enum.Font.SourceSansBold, 22, v94.MainText, 8) else v56("MainText", UDim2.new(0, 360, 0, 150), UDim2.new(0, 20, 0, v27 + 17), Enum.Font.SourceSansBold, 22, v94.MainText, 8);
    else
        local v99 = UDim2.new(0, 150, 0, 150);
        local v100 = UDim2.new(0, 15, 0, v27 + 17);
        local l_Image_0 = v94.Image;
        local l_FetchImageFunction_0 = v94.FetchImageFunction;
        local l_ImageLabel_2 = Instance.new("ImageLabel");
        l_ImageLabel_2.Name = "Image";
        l_ImageLabel_2.Size = v99;
        l_ImageLabel_2.BackgroundTransparency = 1;
        l_ImageLabel_2.Position = v100;
        l_ImageLabel_2.Image = l_Image_0;
        if l_FetchImageFunction_0 then
            l_FetchImageFunction_0(l_ImageLabel_2);
        end;
        v98 = l_ImageLabel_2;
        v98.ZIndex = 9;
        v98.Parent = v75;
        v97 = if not v15 then v56("MainText", UDim2.new(0, 233, 0, 150), UDim2.new(0, 185, 0, v27 + 17), Enum.Font.SourceSansBold, 22, v94.MainText, 8) else v56("MainText", UDim2.new(0, 195, 0, 150), UDim2.new(0, 185, 0, v27 + 17), Enum.Font.SourceSansBold, 22, v94.MainText, 8);
    end;
    v97.Parent = v75;
    local v104 = Rect.new(8, 8, 56, 56);
    local l_Slice_1 = Enum.ScaleType.Slice;
    local v106 = nil;
    v106 = if not v15 then if v94.CancelActive then v73("ConfirmButton", UDim2.new(0, 128, 0, 38), UDim2.new(0.5, -138, 1, -53), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v94.ConfirmationText, Enum.Font.SourceSansBold) else v73("ConfirmButton", UDim2.new(0, 128, 0, 38), UDim2.new(0.5, -64, 1, -53), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v94.ConfirmationText, Enum.Font.SourceSans) else if v94.CancelActive then v73("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -138, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v94.ConfirmationText, Enum.Font.SourceSansBold) else v73("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -64, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v94.ConfirmationText, Enum.Font.SourceSans);
    v106.Parent = v75;
    v106.ScaleType = l_Slice_1;
    v106.SliceCenter = v104;
    v106.MouseButton1Click:connect(function()
        OnPromptEnded(true);
    end);
    if v94.CancelActive then
        local v107 = nil;
        v107 = if not v15 then v73("CancelButton", UDim2.new(0, 128, 0, 38), UDim2.new(0.5, 10, 1, -53), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v94.CancelText, Enum.Font.SourceSans) else v73("CancelButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, 10, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v94.CancelText, Enum.Font.SourceSans);
        v107.Parent = v75;
        v107.ScaleType = l_Slice_1;
        v107.SliceCenter = v104;
        v107.MouseButton1Click:connect(function()
            OnPromptEnded(false);
        end);
        v107.NextSelectionLeft = v106;
        v106.NextSelectionRight = v107;
    end;
end;
CreatePromptPhone = function(v108)
    local v109 = v43("WindowTitle", UDim2.new(1, 0, 0, v27), UDim2.new(0, 0, 0, 0), Enum.Font.SourceSansBold, 24, v108.WindowTitle);
    v109.Parent = v75;
    v109.ZIndex = 9;
    local v110 = v35("ColorStripe", UDim2.new(1, 0, 0, 2), nil, 0, v108.StripeColor);
    v110.Position = UDim2.new(0, 0, 0, v27);
    v110.ZIndex = 9;
    v110.Parent = v75;
    local v111 = nil;
    local v112 = nil;
    if not v108.Image then
        v111 = v56("MainText", UDim2.new(1, v75.AbsoluteSize.X - 40, 0, 120), UDim2.new(0, 20, 0, v27 + 17), Enum.Font.SourceSansBold, 20, v108.MainText, 8);
    else
        local v113 = UDim2.new(0, 120, 0, 120);
        local v114 = UDim2.new(0, 15, 0, v27 + 17);
        local l_Image_1 = v108.Image;
        local l_FetchImageFunction_1 = v108.FetchImageFunction;
        local l_ImageLabel_3 = Instance.new("ImageLabel");
        l_ImageLabel_3.Name = "Image";
        l_ImageLabel_3.Size = v113;
        l_ImageLabel_3.BackgroundTransparency = 1;
        l_ImageLabel_3.Position = v114;
        l_ImageLabel_3.Image = l_Image_1;
        if l_FetchImageFunction_1 then
            l_FetchImageFunction_1(l_ImageLabel_3);
        end;
        v112 = l_ImageLabel_3;
        v112.ZIndex = 9;
        v112.Parent = v75;
        v111 = v56("MainText", UDim2.new(0, v75.AbsoluteSize.X - 175, 0, 120), UDim2.new(0, 155, 0, v27 + 17), Enum.Font.SourceSansBold, 20, v108.MainText, 8);
    end;
    v111.Parent = v75;
    local v118 = Rect.new(8, 8, 56, 56);
    local l_Slice_2 = Enum.ScaleType.Slice;
    local v120 = nil;
    v120 = if not v108.CancelActive then v73("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -64, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v108.ConfirmationText, Enum.Font.SourceSans) else v73("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -138, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v108.ConfirmationText, Enum.Font.SourceSansBold);
    v120.Parent = v75;
    v120.ScaleType = l_Slice_2;
    v120.SliceCenter = v118;
    v120.MouseButton1Click:connect(function()
        OnPromptEnded(true);
    end);
    if v108.CancelActive then
        local v121 = v73("CancelButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, 10, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v108.CancelText, Enum.Font.SourceSans);
        v121.Parent = v75;
        v121.ScaleType = l_Slice_2;
        v121.SliceCenter = v118;
        v121.MouseButton1Click:connect(function()
            OnPromptEnded(false);
        end);
    end;
end;
CreatePromptFromOptions = function(v122)
    v75:ClearAllChildren();
    if not v12 and not v11 then
        if not v14 then
            CreatePromptPCorTablet(v122);
            return ;
        else
            CreatePromptPhone(v122);
            return ;
        end;
    else
        CreatePromptVRorConsole(v122);
        return ;
    end;
end;
SetSelectedObject = function()
    local l_CancelButton_0 = v75:FindFirstChild("CancelButton");
    if not l_CancelButton_0 then
        local l_ConfirmButton_0 = v75:FindFirstChild("ConfirmButton");
        if l_ConfirmButton_0 then
            l_GuiService_0.SelectedCoreObject = l_ConfirmButton_0;
        end;
        return ;
    else
        l_GuiService_0.SelectedCoreObject = l_CancelButton_0;
        return ;
    end;
end;
OnTweenInFinished = function()
    if not (not v17 and not v11) then
        SetSelectedObject();
    end;
end;
ShowPrompt = function()
    v74.Visible = true;
    if v11 then
        l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
    end;
    if not v12 then
        v74:TweenPosition(v26, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.3, true, OnTweenInFinished);
        DisableControllerMovement();
        EnableControllerInput();
        return ;
    else
        v74.Position = v26;
        v10:SetContent(v74);
        v10:Show(true);
        DisableControllerMovement();
        return ;
    end;
end;
HidePrompt = function()
    local function v125()
        v74.Visible = false;
        v16 = false;
        l_GuiService_0.CoreGuiNavigationEnabled = v18;
        l_GuiService_0.GuiNavigationEnabled = v19;
        l_GuiService_0.AutoSelectGuiEnabled = v20;
        l_GuiService_0.SelectedCoreObject = nil;
        if v11 then
            l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None;
        end;
    end;
    if not v12 then
        v74:TweenPosition(v25, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.3, true, v125);
    else
        v74.Position = v25;
        v10:Close();
        v74.Visible = false;
        v16 = false;
        l_GuiService_0.CoreGuiNavigationEnabled = v18;
        l_GuiService_0.GuiNavigationEnabled = v19;
        l_GuiService_0.AutoSelectGuiEnabled = v20;
        l_GuiService_0.SelectedCoreObject = nil;
        if v11 then
            l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None;
            return ;
        end;
    end;
end;
DoCreatePrompt = function(v126)
    v22 = v126.PromptCompletedCallback;
    AddDefaultsToPromptOptions(v126, v21);
    v23 = v126;
    CreatePromptFromOptions(v126);
    ShowPrompt();
end;
OnPromptEnded = function(v127)
    if v22 then
        if not v23.CancelActive then
            spawn(function()
                v22(true);
            end);
        else
            spawn(function()
                v22(v127);
            end);
        end;
    end;
    HidePrompt();
    EnableControllerMovement();
    DisableControllerInput();
end;
NoOpFunc = function()
end;
EnableControllerMovement = function()
    l_ContextActionService_0:UnbindCoreAction("doNothingThumbstick2PromptCreator");
    l_ContextActionService_0:UnbindCoreAction("doNothingAButtonPromptCreator");
end;
DisableControllerMovement = function()
    l_ContextActionService_0:BindCoreAction("doNothingThumbstick2PromptCreator", NoOpFunc, false, Enum.KeyCode.Thumbstick2);
    l_ContextActionService_0:BindCoreAction("doNothingAButtonPromptCreator", NoOpFunc, false, Enum.KeyCode.ButtonA);
end;
EnableControllerInput = function()
    l_ContextActionService_0:BindCoreAction("CoreScriptPromptCreatorCancel", function(_, v129, _)
        if v129 ~= Enum.UserInputState.Begin then
            return ;
        else
            if v23.CancelActive then
                OnPromptEnded(false);
            end;
            return ;
        end;
    end, false, Enum.KeyCode.ButtonB);
    l_ContextActionService_0:BindCoreAction("CoreScriptPromptCreatorSelect", function(_, v132, _)
        if v132 ~= Enum.UserInputState.Begin then
            return ;
        else
            if l_GuiService_0.SelectedCoreObject == nil then
                SetSelectedObject();
            end;
            return ;
        end;
    end, false, Enum.KeyCode.ButtonSelect);
end;
DisableControllerInput = function()
    l_ContextActionService_0:UnbindCoreAction("CoreScriptPromptCreatorCancel");
    l_ContextActionService_0:UnbindCoreAction("CoreScriptPromptCreatorSelect");
end;
valueInTable = function(v134, v135)
    for _, v137 in pairs(v135) do
        if v137 == v134 then
            return true;
        end;
    end;
    return false;
end;
OnInputChanged = function(v138)
    local l_UserInputType_0 = v138.UserInputType;
    local l_UserInputType_1 = Enum.UserInputType;
    if v12 or not valueInTable(l_UserInputType_0, {
        l_UserInputType_1.Gamepad1, 
        l_UserInputType_1.Gamepad2, 
        l_UserInputType_1.Gamepad3, 
        l_UserInputType_1.Gamepad4
    }) then
        v17 = false;
    elseif not (v138.KeyCode ~= Enum.KeyCode.Thumbstick1) or v138.KeyCode == Enum.KeyCode.Thumbstick2 then
        if not (math.abs(v138.Position.X) <= 0.1 and math.abs(v138.Position.Z) <= 0.1) or math.abs(v138.Position.Y) > 0.1 then
            v17 = true;
            return ;
        end;
    else
        v17 = true;
        return ;
    end;
end;
l_UserInputService_0.InputChanged:connect(OnInputChanged);
l_UserInputService_0.InputBegan:connect(OnInputChanged);
OnVREnabled = function(v141)
    if not v141 then
        v12 = false;
        if v10 then
            v10:SetContent(nil);
        end;
        v74.Parent = l_RobloxGui_0;
        return ;
    else
        if not v10 then
            v10 = l_Dialog_0.new();
        end;
        v10:SetContent(v74);
        v12 = true;
        return ;
    end;
end;
spawn(function()
    OnVREnabled(l_UserInputService_0.VREnabled);
end);
l_UserInputService_0.Changed:connect(function(v142)
    if v142 == "VREnabled" then
        OnVREnabled(l_UserInputService_0.VREnabled);
    end;
end);
l_GuiService_0.Changed:connect(function(v143)
    if v16 then
        if v143 == "CoreGuiNavigationEnabled" then
            if l_GuiService_0.CoreGuiNavigationEnabled ~= true then
                v18 = l_GuiService_0.CoreGuiNavigationEnabled;
                l_GuiService_0.CoreGuiNavigationEnabled = true;
                return ;
            end;
        elseif v143 == "GuiNavigationEnabled" then
            if l_GuiService_0.GuiNavigationEnabled ~= false then
                v19 = l_GuiService_0.GuiNavigationEnabled;
                l_GuiService_0.GuiNavigationEnabled = false;
                return ;
            end;
        elseif v143 == "AutoSelectGuiEnabled" and l_GuiService_0.AutoSelectGuiEnabled ~= false then
            v20 = l_GuiService_0.AutoSelectGuiEnabled;
            l_GuiService_0.AutoSelectGuiEnabled = false;
        end;
    end;
end);
SetupGamepadSelection = function()
    v18 = l_GuiService_0.CoreGuiNavigationEnabled;
    v19 = l_GuiService_0.GuiNavigationEnabled;
    v20 = l_GuiService_0.AutoSelectGuiEnabled;
    l_GuiService_0.SelectedCoreObject = nil;
    l_GuiService_0.CoreGuiNavigationEnabled = true;
    l_GuiService_0.GuiNavigationEnabled = false;
    l_GuiService_0.AutoSelectGuiEnabled = false;
end;
v0.CreatePrompt = function(_, v145)
    if not v16 then
        v16 = true;
        SetupGamepadSelection();
        DoCreatePrompt(v145);
        return true;
    else
        return false;
    end;
end;
v0.IsCurrentlyPrompting = function(_)
    return v16;
end;
return v0;
