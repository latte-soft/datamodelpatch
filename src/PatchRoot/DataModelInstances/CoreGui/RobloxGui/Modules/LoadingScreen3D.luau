local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local _ = game:GetService("UserInputService");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_GuiService_0 = game:GetService("GuiService");
local v7 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.Settings.Utility);
local l_SplashScreenManager_0 = require(l_CorePackages_0.Workspace.Packages.SplashScreenManager).SplashScreenManager;
local v9 = game:DefineFastFlag("LoadingRemoveRemoteCallErrorPrint", false);
local function v10(v11, v12, v13)
    v13 = v13 or 0.5;
    if v11 == nil then
        return ;
    else
        if not (not v11:IsA("ImageLabel") and not v11:IsA("ImageButton")) then
            v7:TweenProperty(v11, "ImageTransparency", v11.ImageTransparency, v12, v13, v7:GetEaseInOutQuad());
        end;
        if v11:IsA("GuiObject") then
            v7:TweenProperty(v11, "BackgroundTransparency", v11.BackgroundTransparency, v12, v13, v7:GetEaseInOutQuad());
        end;
        if not (not (v11:IsA("TextLabel") or v11:IsA("TextBox")) and not v11:IsA("TextButton")) then
            v7:TweenProperty(v11, "TextTransparency", v11.TextTransparency, v12, v13, v7:GetEaseInOutQuad());
        end;
        for _, v15 in pairs(v11:GetChildren()) do
            v10(v15, v12, v13);
        end;
        return ;
    end;
end;
local v16 = {};
local l_BindableEvent_0 = Instance.new("BindableEvent");
v16.Finished = false;
v16.GameAssetInfo = nil;
v16.LoadingFinishedEvent = l_BindableEvent_0.Event;
v16.GetGameName = function(v18)
    if v18.GameAssetInfo ~= nil then
        return v18.GameAssetInfo.Name;
    else
        return "";
    end;
end;
v16.GetCreatorName = function(v19)
    if v19.GameAssetInfo ~= nil then
        return v19.GameAssetInfo.Creator.Name;
    else
        return "";
    end;
end;
v16.IsReady = function(v20)
    return v20.Finished;
end;
local l_l_BindableEvent_0_0 = l_BindableEvent_0 --[[ copy: 13 -> 31 ]];
v16.LoadAssetsAsync = function(v22)
    spawn(function()
        while game.PlaceId <= 0 do
            wait();
        end;
        local l_status_0, l_result_0 = pcall(function()
            v22.GameAssetInfo = l_MarketplaceService_0:GetProductInfo(game.PlaceId);
        end);
        if not (v9 or l_status_0) then
            print("LoadingScript->GameInfoProvider:LoadAssets:", l_result_0);
        end;
        v22.Finished = true;
        l_l_BindableEvent_0_0:Fire();
    end);
end;
l_BindableEvent_0 = {};
local v25 = v7:Create("Frame")({
    Name = "VRLoadingScreenContainer", 
    Size = UDim2.new(1, 0, 1, 0), 
    BackgroundTransparency = 1, 
    BackgroundColor3 = Color3.new(0, 0, 0)
});
local v26 = v7:Create("ImageLabel")({
    Name = "LoadingBackground", 
    Position = UDim2.new(0.25, 0, 0.25, 0), 
    Size = UDim2.new(0.5, 0, 0.5, 0), 
    Image = "rbxasset://textures/ui/LoadingScreen/BackgroundLight.png", 
    ScaleType = Enum.ScaleType.Slice, 
    SliceCenter = Rect.new(70, 70, 110, 110), 
    BackgroundTransparency = 1, 
    Parent = v25, 
    ImageColor3 = Color3.new(0, 0, 0)
});
local v27 = 0;
local v28 = v7:Create("ImageLabel")({
    Name = "Spinner", 
    Size = UDim2.new(0.25, 0, 0.25, 0), 
    Position = UDim2.new(0.375, 0, 0.325, 0), 
    Image = "rbxasset://textures/ui/LoadingScreen/LoadingSpinner.png", 
    BackgroundTransparency = 1, 
    Parent = v26
});
local v29 = v7:Create("TextLabel")({
    Name = "LoadingText", 
    Text = "Loading...", 
    BackgroundTransparency = 1, 
    Font = Enum.Font.SourceSans, 
    FontSize = Enum.FontSize.Size60, 
    Position = UDim2.new(0.5, 0, 0.2, 0), 
    Parent = v26, 
    TextColor3 = Color3.new(0.30196078431372547, 0.6392156862745098, 0.8784313725490196)
});
local v30 = v7:Create("TextLabel")({
    Name = "GameNameText", 
    Text = "", 
    BackgroundTransparency = 1, 
    Font = Enum.Font.SourceSans, 
    FontSize = Enum.FontSize.Size60, 
    Size = UDim2.new(0.9, 0, 0.1, 0), 
    Position = UDim2.new(0.05, 0, 0.65, 0), 
    ClipsDescendants = true, 
    Parent = v26, 
    TextColor3 = Color3.new(0.058823529411764705, 0.9294117647058824, 1)
});
local v31 = v7:Create("Frame")({
    Name = "CreatorTextContainer", 
    Size = UDim2.new(0.9, 0, 0.1, 0), 
    Position = UDim2.new(0.05, 0, 0.77, 0), 
    BackgroundTransparency = 1, 
    ClipsDescendants = true, 
    Parent = v26
});
local v32 = 0;
local v33 = v7:Create("TextLabel")({
    Name = "CreatorText", 
    Text = "", 
    BackgroundTransparency = 1, 
    Font = Enum.Font.SourceSans, 
    FontSize = Enum.FontSize.Size42, 
    Size = UDim2.new(1, 0, 1, 0), 
    Parent = v31, 
    TextColor3 = Color3.new(0.058823529411764705, 0.9294117647058824, 1)
});
local function _(v34)
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if not l_CurrentCamera_0 then
        return Vector2.new(0, 0);
    else
        local v36 = l_CurrentCamera_0.ViewportSize.x / l_CurrentCamera_0.ViewportSize.y;
        local v37 = (2 * v34) * math.tan((math.rad(l_CurrentCamera_0.FieldOfView / 2)));
        return Vector2.new(v37 * v36, v37);
    end;
end;
local v39 = false;
local v40 = true;
delay(2.5, function()
    v40 = false;
end);
local function v43(v41)
    if v33.TextBounds.X < v31.AbsoluteSize.X then
        v33.Position = UDim2.new(0, 0, 0, 0);
        v33.Size = UDim2.new(1, 0, 1, 0);
    elseif v41 ~= nil then
        v33.Size = UDim2.new(0, v33.TextBounds.X, 1, 0);
        if not v40 then
            local v42 = v32 - v41 * 25;
            if v42 + v33.AbsoluteSize.X < v31.AbsoluteSize.X then
                v40 = true;
                spawn(function()
                    v7:TweenProperty(v33, "TextTransparency", v33.TextTransparency, 1, 1, v7:GetEaseInOutQuad());
                    wait(1.5);
                    if not v39 then
                        v32 = 0;
                        v7:TweenProperty(v33, "TextTransparency", v33.TextTransparency, 0, 1, v7:GetEaseInOutQuad());
                        wait(1.5);
                        v40 = false;
                        return ;
                    else
                        return ;
                    end;
                end);
            else
                v32 = v42;
            end;
        end;
        v33.Position = UDim2.new(0, v32, 0, 0);
    end;
    if not v30.TextFits then
        v30.Size = UDim2.new(0.9, 0, 0.3, 0);
        v30.Position = UDim2.new(0.05, 0, 0.5, 0);
        v30.TextScaled = true;
        v30.TextWrapped = true;
        v28.Position = UDim2.new(0.375, 0, 0.225, 0);
        v29.Position = UDim2.new(0.5, 0, 0.15, 0);
    end;
end;
local function _()
    if not v39 then
        v39 = true;
        v10(v25, 1, 2.5);
        wait(2.5);
        l_RunService_0:UnbindFromRenderStep("LoadingGui3D");
        v25.Parent = nil;
        return ;
    else
        return ;
    end;
end;
local function v46()
    local v45;
    v45 = v16:GetCreatorName() and (v45 ~= "" and string.format("By %s", (tostring(v45))));
    v30.Text = v16:GetGameName();
    v33.Text = v45;
end;
local function v47()
    if not v39 then
        v39 = true;
        v10(v25, 1, 2.5);
        wait(2.5);
        l_RunService_0:UnbindFromRenderStep("LoadingGui3D");
        v25.Parent = nil;
        return ;
    else
        return ;
    end;
end;
local v48 = tick();
do
    local l_v48_0 = v48;
    l_RunService_0:BindToRenderStep("LoadingGui3D", Enum.RenderPriority.Last.Value, function()
        local v50 = tick();
        local v51 = v50 - l_v48_0;
        v43(v51);
        v27 = v27 + (v51 * 0.5) * 360;
        v28.Rotation = v27;
        l_v48_0 = v50;
    end);
    v43();
end;
v16:LoadAssetsAsync();
if v16:IsReady() then
    v48 = v16:GetCreatorName() and (v48 ~= "" and string.format("By %s", (tostring(v48))));
    v30.Text = v16:GetGameName();
    v33.Text = v48;
end;
v16.LoadingFinishedEvent:Connect(v46);
if not l_ReplicatedFirst_0:IsDefaultLoadingGuiRemoved() then
    l_ReplicatedFirst_0.RemoveDefaultLoadingGuiSignal:connect(v47);
elseif not v39 then
    v39 = true;
    v10(v25, 1, 2.5);
    wait(2.5);
    l_RunService_0:UnbindFromRenderStep("LoadingGui3D");
    v25.Parent = nil;
end;
l_GuiService_0.ErrorMessageChanged:connect(function()
end);
l_GuiService_0.UiMessageChanged:connect(function(_, _)
end);
l_SplashScreenManager_0.addStatusChangeListener(function(v54)
    if v54 then
        if not v39 then
            v39 = true;
            v10(v25, 1, 2.5);
            wait(2.5);
            l_RunService_0:UnbindFromRenderStep("LoadingGui3D");
            v25.Parent = nil;
        else
            return ;
        end;
    end;
end);
return v25;
