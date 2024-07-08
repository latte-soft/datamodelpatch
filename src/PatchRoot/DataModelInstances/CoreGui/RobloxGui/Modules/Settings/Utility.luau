local v0 = require(script.Parent.Theme);
local l_Parent_0 = script.Parent;
local v2 = v0.color("SELECTED_COLOR", Color3.fromRGB(0, 162, 255));
local v3 = v0.color("NON_SELECTED_COLOR", Color3.fromRGB(78, 84, 96));
local v4 = v0.color("ARROW_COLOR", Color3.fromRGB(204, 204, 204));
local v5 = v0.color("ARROW_COLOR_HOVER", Color3.fromRGB(255, 255, 255));
local v6 = v0.color("ARROW_COLOR_INACTIVE", Color3.fromRGB(150, 150, 150));
local v7 = UDim.new(0, 14);
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:FindFirstChild("RobloxGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_VRService_0 = game:GetService("VRService");
local l_Workspace_0 = game:GetService("Workspace");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_status_0, l_result_0 = pcall(function()
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local v20 = l_status_0 and l_result_0;
local v21 = require(l_Parent_0.Flags.GetFFlagSettingsHubButtonCanBeDisabled);
local v22 = game:DefineFastFlag("SettingsMenuUseHardwareSafeArea", false);
local v23 = require(l_Parent_0.Flags.GetFFlagFix10ftMenuAddFriend);
local v24 = require(l_Parent_0.Flags.GetFFlagAddAnimatedFocusState);
local v25 = game:DefineFastFlag("UseNonDeferredSliderSignal", false);
local l_RobloxTranslator_0 = require(l_CoreGui_0.RobloxGui.Modules:WaitForChild("RobloxTranslator"));
local l_Signal_0 = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Signal;
local v28 = require(l_RobloxGui_0.Modules:WaitForChild("TenFootInterface")):IsEnabled();
local v35 = {
    Create = function(v29)
        return function(v30)
            local v31 = Instance.new(v29);
            local v32 = nil;
            for v33, v34 in pairs(v30) do
                if type(v33) == "number" then
                    v34.Parent = v31;
                elseif v33 == "Parent" then
                    v32 = v34;
                else
                    v31[v33] = v34;
                end;
            end;
            if v32 then
                v31.Parent = v32;
            end;
            return v31;
        end;
    end
};
local v36 = {};
setmetatable(v36, {
    __mode = "k"
});
local v37 = v35.Create("ImageLabel")({
    Image = "", 
    BackgroundTransparency = 1
});
clamp = function(v38, v39, v40)
    return (math.max(v38, (math.min(v39, v40))));
end;
local function v45(v41, v42, v43, v44)
    if v44 <= v41 then
        return v42 + v43;
    else
        return (v43 * v41) / v44 + v42;
    end;
end;
local function v50(v46, v47, v48, v49)
    if v49 <= v46 then
        return v47 + v48;
    else
        v46 = v46 / v49;
        return v47 - (v48 * v46) * (v46 - 2);
    end;
end;
local function v55(v51, v52, v53, v54)
    if v54 <= v51 then
        return v52 + v53;
    else
        v51 = v51 / v54;
        if v51 < 0.5 then
            return ((2 * v53) * v51) * v51 + v52;
        else
            return v52 + v53 * ((2 * (2 - v51)) * v51 - 1);
        end;
    end;
end;
PropertyTweener = function(v56, v57, v58, v59, v60, v61, v62)
    local v63 = {
        StartTime = tick()
    };
    v63.EndTime = v63.StartTime + v60;
    v63.Cancelled = false;
    local v64 = false;
    local v65 = 0;
    local function _()
        if v56 then
            v56[v57] = v61(1, v58, v59 - v58, 1);
        end;
        v64 = true;
        v65 = 1;
        if v62 then
            v62();
        end;
    end;
    v56[v57] = v61(0, v58, v59 - v58, v60);
    coroutine.wrap(function()
        local v67 = tick();
        while true do
            if not (v67 < v63.EndTime) or not v56 then
                if not (not (v63.Cancelled == false) or not v56) then
                    if v56 then
                        v56[v57] = v61(1, v58, v59 - v58, 1);
                    end;
                    v64 = true;
                    v65 = 1;
                    if v62 then
                        v62();
                    end;
                end;
                return ;
            elseif not v63.Cancelled then
                v56[v57] = v61(v67 - v63.StartTime, v58, v59 - v58, v60);
                v65 = clamp(0, 1, (v67 - v63.StartTime) / v60);
                l_RunService_0.RenderStepped:Wait();
                v67 = tick();
            else
                return ;
            end;
        end;
    end)();
    v63.GetFinal = function(_)
        return v59;
    end;
    v63.GetPercentComplete = function(_)
        return v65;
    end;
    v63.IsFinished = function(_)
        return v64;
    end;
    v63.Finish = function(v71)
        if not v64 then
            v71:Cancel();
            if v56 then
                v56[v57] = v61(1, v58, v59 - v58, 1);
            end;
            v64 = true;
            v65 = 1;
            if v62 then
                v62();
            end;
        end;
    end;
    v63.Cancel = function(_)
        v63.Cancelled = true;
    end;
    return v63;
end;
local function v81()
    local v73 = {};
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v75 = nil;
    local v76 = nil;
    v73.fire = function(_, ...)
        v75 = {
            ...
        };
        v76 = select("#", ...);
        l_BindableEvent_0:Fire();
    end;
    v73.connect = function(_, v79)
        if not v79 then
            error("connect(nil)", 2);
        end;
        return l_BindableEvent_0.Event:Connect(function()
            v79(unpack(v75, 1, v76));
        end);
    end;
    v73.wait = function(_)
        l_BindableEvent_0.Event:wait();
        if not v75 then
            error("Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.");
        end;
        return unpack(v75, 1, v76);
    end;
    return v73;
end;
local function v82()
    if not _G.__TESTEZ_RUNNING_TEST__ then
        if not v22 or not game:GetEngineFeature("GuiServiceHardwareSafeViewport") then
            while not workspace.CurrentCamera do
                workspace.Changed:Wait();
            end;
            assert(workspace.CurrentCamera, "");
            while not (workspace.CurrentCamera.ViewportSize ~= Vector2.new(0, 0)) or workspace.CurrentCamera.ViewportSize == Vector2.new(1, 1) do
                workspace.CurrentCamera.Changed:Wait();
            end;
            return workspace.CurrentCamera.ViewportSize;
        else
            return l_GuiService_0:GetHardwareSafeViewport();
        end;
    else
        return Vector2.new(1024, 1024);
    end;
end;
local function _()
    local v83 = v82();
    local l_TouchEnabled_0 = l_UserInputService_0.TouchEnabled;
    if l_TouchEnabled_0 then
        l_TouchEnabled_0 = true;
        if v83.Y >= 500 then
            l_TouchEnabled_0 = v83.X < 700;
        end;
    end;
    return l_TouchEnabled_0;
end;
local function _()
    local v86 = v82();
    return v86.X < v86.Y;
end;
local function _()
    return v28;
end;
local function _()
    if not l_VRService_0.VREnabled then
        if not l_UserInputService_0.TouchEnabled or l_UserInputService_0.GamepadEnabled then
            return true;
        else
            return false;
        end;
    else
        return false;
    end;
end;
local function v96(v90, v91, v92, v93)
    local function v94()
        if v90.Active then
            v92(v91);
        end;
    end;
    local function v95()
        if v90.Active then
            v93(v91);
        end;
    end;
    v90.MouseEnter:Connect(v95);
    v90.SelectionGained:Connect(v95);
    v90.MouseLeave:Connect(v94);
    v90.SelectionLost:Connect(v94);
    v92(v91);
end;
local function v102(v97, v98)
    v36[v97] = v98;
    local l_v98_0 = v98;
    local v100 = v82();
    local v101 = v82();
    l_v98_0(v100, v101.X < v101.Y);
end;
local v103 = {
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true, 
    [Enum.UserInputType.Gamepad5] = true, 
    [Enum.UserInputType.Gamepad6] = true, 
    [Enum.UserInputType.Gamepad7] = true, 
    [Enum.UserInputType.Gamepad8] = true
};
local function v132(v104, v105, v106, v107, v108, v109)
    local v110 = v35.Create("ImageLabel")({
        Image = "", 
        BackgroundTransparency = 1
    });
    local v111 = nil;
    local v112 = nil;
    local v113 = "DefaultButtonStroke";
    local v114 = "DefaultButton";
    if not v0.UIBloxThemeEnabled then
        v111 = v35.Create("ImageButton")({
            Name = v104 .. "Button", 
            Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png", 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 6, 46, 44), 
            AutoButtonColor = false, 
            BackgroundTransparency = 1, 
            Size = v105, 
            ZIndex = 2, 
            SelectionImageObject = v110
        });
    else
        if v104 == "DropDownFrame" then
            v113 = "ControlInputStroke";
            v114 = "ControlInputBackground";
        end;
        if v109 == "ImageButton" then
            v114 = "ImageButton";
        end;
        v111 = v35.Create("ImageButton")({
            Name = v104 .. "Button", 
            AutoButtonColor = false, 
            BackgroundColor3 = v0.color(v114), 
            BackgroundTransparency = v0.transparency(v114), 
            Size = v105, 
            ZIndex = 2, 
            SelectionImageObject = v110
        });
        v35.Create("UICorner")({
            CornerRadius = v0.DefaultCornerRadius, 
            Parent = v111
        });
        v112 = v35.Create("UIStroke")({
            Name = "Border", 
            Color = v0.color(v113), 
            Transparency = v0.transparency(v113), 
            Thickness = v0.DefaultStokeThickness, 
            Parent = v111
        });
    end;
    local _ = v35.Create("BoolValue")({
        Name = "Enabled", 
        Parent = v111, 
        Value = true
    });
    if not v106 then
        if v21() then
            if not v0.UIBloxThemeEnabled then
                v111.ImageTransparency = 1;
            elseif v112 then
                v112.Enabled = false;
            end;
            v111.Selectable = false;
        end;
    else
        v111.MouseButton1Click:Connect(function()
            v106(v103[l_UserInputService_0:GetLastInputType()] or false);
        end);
    end;
    local function _(v116)
        local v117 = true;
        if v116.UserInputType ~= Enum.UserInputType.MouseMovement then
            v117 = v116.UserInputType == Enum.UserInputType.Touch;
        end;
        return v117;
    end;
    local v119 = nil;
    local function v121(v120)
        v119 = v120;
    end;
    local function v124()
        local l_v108_0 = v108;
        if not (not (l_v108_0 == nil) or not v107) then
            l_v108_0 = v107.HubRef;
        end;
        if l_v108_0 and l_v108_0.Active or l_v108_0 == nil then
            if not v0.UIBloxThemeEnabled then
                v111.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png";
            else
                v111.BackgroundColor3 = v0.color("DefaultButtonHover");
                v111.BackgroundTransparency = v0.transparency("DefaultButtonHover");
            end;
            local l_v111_0 = v111;
            if v119 then
                l_v111_0 = v119;
            end;
            if l_v108_0 then
                l_v108_0:ScrollToFrame(l_v111_0);
            end;
        end;
    end;
    local function _()
        if not v0.UIBloxThemeEnabled then
            v111.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png";
            return ;
        else
            v111.BackgroundColor3 = v0.color(v114);
            v111.BackgroundTransparency = v0.transparency(v114);
            return ;
        end;
    end;
    v111.InputBegan:Connect(function(v126)
        if v111.Selectable then
            local v127 = true;
            if v126.UserInputType ~= Enum.UserInputType.MouseMovement then
                v127 = v126.UserInputType == Enum.UserInputType.Touch;
            end;
            if v127 then
                v124();
            end;
        end;
    end);
    v111.InputEnded:Connect(function(v128)
        if v111.Selectable and l_GuiService_0.SelectedCoreObject ~= v111 then
            local v129 = true;
            if v128.UserInputType ~= Enum.UserInputType.MouseMovement then
                v129 = v128.UserInputType == Enum.UserInputType.Touch;
            end;
            if v129 then
                if not v0.UIBloxThemeEnabled then
                    v111.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png";
                else
                    v111.BackgroundColor3 = v0.color(v114);
                    v111.BackgroundTransparency = v0.transparency(v114);
                    return ;
                end;
            end;
        end;
    end);
    v111.SelectionGained:Connect(function()
        v124();
    end);
    v111.SelectionLost:Connect(function()
        if not v0.UIBloxThemeEnabled then
            v111.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png";
            return ;
        else
            v111.BackgroundColor3 = v0.color(v114);
            v111.BackgroundTransparency = v0.transparency(v114);
            return ;
        end;
    end);
    local _ = l_GuiService_0.Changed:Connect(function(v130)
        if v130 ~= "SelectedCoreObject" then
            return ;
        elseif if not l_VRService_0.VREnabled then not l_UserInputService_0.TouchEnabled or (l_UserInputService_0.GamepadEnabled and true or false) else false then
            if not (l_GuiService_0.SelectedCoreObject ~= nil) or l_GuiService_0.SelectedCoreObject ~= v111 then
                if not v0.UIBloxThemeEnabled then
                    v111.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png";
                    return ;
                else
                    v111.BackgroundColor3 = v0.color(v114);
                    v111.BackgroundTransparency = v0.transparency(v114);
                    return ;
                end;
            else
                if v111.Selectable then
                    v124();
                end;
                return ;
            end;
        else
            return ;
        end;
    end);
    return v111, v121;
end;
local function v158(v133, v134, v135, v136, v137, v138, v139)
    local v140 = v35.Create("ImageLabel")({
        Image = "", 
        BackgroundTransparency = 1
    });
    local l_Medium_0 = v0.IconSize.Medium;
    local function v144(v142)
        if not v136 then
            local v143 = v142 + 4 * ({
                [v0.IconSize.Small] = 1, 
                [v0.IconSize.Medium] = 2, 
                [v0.IconSize.Large] = 3, 
                [v0.IconSize.XLarge] = 4, 
                [v0.IconSize.XXLarge] = 5
            })[l_Medium_0];
            return UDim2.fromOffset(v143, v143);
        else
            return v136;
        end;
    end;
    local v145 = v0.getIconSize(l_Medium_0);
    local v146 = v144(v145);
    local v147 = v35.Create("Frame")({
        Name = v133 .. "IconButton", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = v146 + UDim2.new(0, 0, 0, 18)
    });
    v35.Create("UIListLayout")({
        Name = "MenuListLayout", 
        Padding = UDim.new(0, 2), 
        FillDirection = Enum.FillDirection.Vertical, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        Parent = v147
    });
    v35.Create("TextLabel")({
        Name = v133 .. "TextLabel", 
        AutomaticSize = Enum.AutomaticSize.Y, 
        AnchorPoint = Vector2.new(0.5, 1), 
        Position = UDim2.new(0.5, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        TextColor3 = Color3.fromRGB(255, 255, 255), 
        TextYAlignment = Enum.TextYAlignment.Center, 
        TextWrapped = true, 
        Size = UDim2.new(1.5, 0, 0, 0), 
        Font = v0.font(Enum.Font.SourceSansBold, "Bold_Font"), 
        TextSize = v0.textSize(14), 
        LineHeight = 0.8, 
        Text = v135, 
        Parent = v147, 
        LayoutOrder = 2
    });
    local v148 = v35.Create("ImageButton")({
        Name = "Button", 
        Size = v146, 
        BackgroundTransparency = 1, 
        AutoButtonColor = false, 
        SelectionImageObject = v140, 
        Parent = v147
    });
    local v149 = v35.Create("ImageLabel")({
        Name = "Background", 
        BackgroundTransparency = v0.transparency("IconButton"), 
        BorderSizePixel = 0, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = v0.color("IconButton"), 
        Parent = v148
    });
    v35.Create("UICorner")({
        CornerRadius = UDim.new(0, 8), 
        Parent = v149
    });
    v134 = v134 or {
        Image = "", 
        ImageRectOffset = Vector2.new(), 
        ImageRectSize = Vector2.new()
    };
    local v150 = v35.Create("ImageLabel")({
        Name = v133 .. "Icon", 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.fromOffset(v145, v145), 
        Image = v134.Image, 
        ImageRectOffset = v134.ImageRectOffset, 
        ImageRectSize = v134.ImageRectSize, 
        ImageColor3 = Color3.new(1, 1, 1), 
        Parent = v148
    });
    local function v151()
        v149.BackgroundColor3 = v0.color("IconButton");
        v150.ImageColor3 = Color3.new(1, 1, 1);
    end;
    local function v153()
        local l_v139_0 = v139;
        if not (not (l_v139_0 == nil) or not v138) then
            l_v139_0 = v138.HubRef;
        end;
        if l_v139_0 and l_v139_0.Active or l_v139_0 == nil then
            v149.BackgroundColor3 = v0.color("IconButtonHover");
            v150.ImageColor3 = Color3.new(0, 0, 0);
        end;
    end;
    if not l_UserInputService_0.TouchEnabled then
        v96(v148, v149, v151, v153);
    end;
    v148.SelectionGained:Connect(function()
        local l_v139_1 = v139;
        if not (not (l_v139_1 == nil) or not v138) then
            l_v139_1 = v138.HubRef;
        end;
        if l_v139_1 and l_v139_1.Active or l_v139_1 == nil then
            v149.BackgroundColor3 = v0.color("IconButtonHover");
            v150.ImageColor3 = Color3.new(0, 0, 0);
        end;
    end);
    v148.SelectionLost:Connect(function()
        v149.BackgroundColor3 = v0.color("IconButton");
        v150.ImageColor3 = Color3.new(1, 1, 1);
    end);
    if v137 then
        v148.MouseButton1Click:Connect(function()
            v137(v103[l_UserInputService_0:GetLastInputType()] or false);
        end);
    end;
    local _ = l_GuiService_0.Changed:Connect(function(v155)
        if v155 ~= "SelectedCoreObject" then
            return ;
        elseif if not l_VRService_0.VREnabled then not l_UserInputService_0.TouchEnabled or (l_UserInputService_0.GamepadEnabled and true or false) else false then
            if not (l_GuiService_0.SelectedCoreObject ~= nil) or l_GuiService_0.SelectedCoreObject ~= v148 then
                v149.BackgroundColor3 = v0.color("IconButton");
                v150.ImageColor3 = Color3.new(1, 1, 1);
                return ;
            else
                if v148.Selectable then
                    local l_v139_2 = v139;
                    if not (not (l_v139_2 == nil) or not v138) then
                        l_v139_2 = v138.HubRef;
                    end;
                    if l_v139_2 and l_v139_2.Active or l_v139_2 == nil then
                        v149.BackgroundColor3 = v0.color("IconButtonHover");
                        v150.ImageColor3 = Color3.new(0, 0, 0);
                    end;
                end;
                return ;
            end;
        else
            return ;
        end;
    end);
    return v147;
end;
local function v171(v159, v160, v161, v162, v163, v164)
    local v165, v166 = v132(v159, v161, v162, v163, v164);
    local v167 = v35.Create("TextLabel")({
        Name = v159 .. "TextLabel", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = not not v0.UIBloxThemeEnabled and UDim2.new(1, 0, 1, 0) or UDim2.new(1, 0, 1, -8), 
        Position = UDim2.new(0, 0, 0, 0), 
        TextColor3 = v0.color("WhiteButtonText", Color3.fromRGB(255, 255, 255)), 
        TextTransparency = v0.transparency("WhiteButtonText", 0), 
        TextYAlignment = Enum.TextYAlignment.Center, 
        Font = v0.font(Enum.Font.SourceSansBold, "Button"), 
        TextSize = v0.textSize(24, "Button"), 
        Text = v160, 
        TextScaled = true, 
        TextWrapped = true, 
        ZIndex = 2, 
        Parent = v165
    });
    local v168 = Instance.new("UITextSizeConstraint", v167);
    local v169 = v82();
    local l_TouchEnabled_1 = l_UserInputService_0.TouchEnabled;
    if l_TouchEnabled_1 then
        l_TouchEnabled_1 = true;
        if v169.Y >= 500 then
            l_TouchEnabled_1 = v169.X < 700;
        end;
    end;
    if not l_TouchEnabled_1 then
        if v28 then
            l_TouchEnabled_1 = true;
            if v159 ~= "FriendStatus" then
                l_TouchEnabled_1 = v159 == "BlockButton";
            end;
            if not (not (not v23() or not v0.UIBloxThemeEnabled) and l_TouchEnabled_1) then
                v167.TextSize = v0.textSize(36);
            end;
        end;
    elseif not (not v0.UIBloxThemeEnabled or not v0.UseBiggerText) and (not (v159 ~= "ResumeButton" and v159 ~= "ResetButton") or v159 == "LeaveButton") then
        v167.TextSize = v0.textSize(20);
    else
        v167.TextSize = v0.textSize(18);
    end;
    v168.MaxTextSize = v167.TextSize;
    return v165, v167, v166;
end;
local function v185(v172, v173, v174, v175, v176, v177, v178, v179)
    if not v179 then
        v179 = "ImageButton";
    end;
    local v180, v181 = v132(v172, v174, v176, v177, v178, v179);
    local v182 = nil;
    local v183 = nil;
    if typeof(v173) == "table" then
        v182 = v173.ImageRectOffset;
        v183 = v173.ImageRectSize;
        v173 = v173.Image;
    end;
    local v184 = v35.Create("ImageLabel")({
        Name = v172 .. "ImageLabel", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = v175, 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Image = v173, 
        ImageRectOffset = v182, 
        ImageRectSize = v183, 
        ZIndex = 2, 
        Parent = v180
    });
    if v0.UIBloxThemeEnabled and v179 == "ImageButton" then
        v180.Border.Thickness = 0;
        v180.Border.Transparency = 1;
    end;
    return v180, v184, v181;
end;
local function v196(v186, v187, v188, v189, v190, v191)
    local v192, v193, v194 = v171(v187, v188, v189, v190, v186, v191);
    local v195 = v35.Create("Frame")({
        Name = v187 .. "Row", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, v189.Y.Scale, v189.Y.Offset), 
        Parent = v186.Page
    });
    v192.Parent = v195;
    v192.AnchorPoint = Vector2.new(1, 0);
    v192.Position = UDim2.new(1, -20, 0, 0);
    return v195, v192, v193, v194;
end;
local function v208(v197, v198)
    if v24() and v0.UIBloxThemeEnabled then
        local v199 = v35.Create("Frame")({
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 12, 1, 12), 
            Position = UDim2.fromOffset(-6, -6)
        });
        v35.Create("UICorner")({
            CornerRadius = v7, 
            Parent = v199
        });
        local v200 = v35.Create("UIGradient")({
            Rotation = 0, 
            Color = v0.selectionCursor.GradientColorSequence, 
            Transparency = v0.selectionCursor.GradientTransparencySequence, 
            Parent = v35.Create("UIStroke")({
                Color = v0.selectionCursor.AnimatedColor, 
                Transparency = 0, 
                Thickness = 3, 
                Parent = v199
            })
        });
        l_RunService_0:BindToRenderStep(v198, Enum.RenderPriority.Last.Value, function()
            local v201 = v200.Rotation + 2;
            local l_GradientColorSequence_0 = v0.selectionCursor.GradientColorSequence;
            local l_GradientTransparencySequence_0 = v0.selectionCursor.GradientTransparencySequence;
            if l_UserGameSettings_0.ReducedMotion then
                local v204 = (math.sin((math.rad(v201))) + 1) / 2;
                l_GradientColorSequence_0 = ColorSequence.new(l_GradientColorSequence_0.Keypoints[1].Value:lerp(l_GradientColorSequence_0.Keypoints[#l_GradientColorSequence_0.Keypoints].Value, v204));
                local l_Value_0 = l_GradientTransparencySequence_0.Keypoints[1].Value;
                l_GradientTransparencySequence_0 = NumberSequence.new(l_Value_0 + (l_GradientTransparencySequence_0.Keypoints[#l_GradientTransparencySequence_0.Keypoints].Value - l_Value_0) * v204);
            end;
            v200.Rotation = v201;
            v200.Color = l_GradientColorSequence_0;
            v200.Transparency = l_GradientTransparencySequence_0;
        end);
        v197.AncestryChanged:Connect(function(_, v207)
            if not v207 then
                l_RunService_0:UnbindFromRenderStep(v198);
            end;
        end);
        v197.SelectionImageObject = v199;
        return ;
    else
        return ;
    end;
end;
local function v286(v209, v210, v211)
    local v212 = v0.color("SELECTION_TEXT_COLOR_NORMAL", Color3.fromRGB(178, 178, 178));
    local v213 = Color3.fromRGB(229, 229, 229);
    local v214 = v0.color("SELECTION_TEXT_COLOR_HIGHLIGHTED", Color3.fromRGB(255, 255, 255));
    local v215 = nil;
    local v216 = {
        CurrentIndex = nil, 
        UpdateDropDownList = nil, 
        DropDownFrame = nil, 
        Selections = nil
    };
    Instance.new("BindableEvent").Name = "IndexChanged";
    if type(v209) ~= "table" then
        error("CreateDropDown dropDownStringTable (first arg) is not a table", 2);
        return v216;
    else
        local l_BindableEvent_1 = Instance.new("BindableEvent");
        l_BindableEvent_1.Name = "IndexChanged";
        local v218 = true;
        local v219 = l_HttpService_0:GenerateGUID(false);
        local v220 = nil;
        local l_v209_0 = v209;
        local v222 = v35.Create("ImageButton")({
            Name = "DropDownFullscreenFrame", 
            BackgroundTransparency = 0.2, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
            ZIndex = 10, 
            Active = true, 
            Visible = false, 
            Selectable = false, 
            AutoButtonColor = false, 
            Parent = l_CoreGui_0.RobloxGui
        });
        local function v224(v223)
            if v223 ~= "VREnabled" then
                return ;
            else
                if not l_VRService_0.VREnabled then
                    v222.Parent = l_CoreGui_0.RobloxGui;
                    v222.BackgroundTransparency = 0.2;
                else
                    v222.Parent = require(l_CoreGui_0.RobloxGui.Modules.VR.Panel3D).Get("SettingsMenu"):GetGUI();
                    v222.BackgroundTransparency = 1;
                end;
                if v216.UpdateDropDownList then
                    v216:UpdateDropDownList(l_v209_0);
                end;
                return ;
            end;
        end;
        l_VRService_0.Changed:Connect(v224);
        v224("VREnabled");
        local v225 = v35.Create("ImageLabel")({
            Name = "DropDownSelectionFrame", 
            Image = not v0.UIBloxThemeEnabled and "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png" or "", 
            ScaleType = if not v0.UIBloxThemeEnabled then Enum.ScaleType.Slice else Enum.ScaleType.Stretch, 
            SliceCenter = Rect.new(8, 6, 46, 44), 
            BackgroundTransparency = v0.transparency("DropdownListBg", 1), 
            BackgroundColor3 = v0.color("DropdownListBg"), 
            Size = UDim2.new(0.6, 0, 0.9, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            ZIndex = 10, 
            Parent = v222
        });
        if v0.UIBloxThemeEnabled then
            v35.Create("UICorner")({
                CornerRadius = v0.DefaultCornerRadius, 
                Parent = v225
            });
        end;
        local v226 = v35.Create("ScrollingFrame")({
            Name = "DropDownScrollingFrame", 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, -20, 1, -25), 
            Position = UDim2.new(0, 10, 0, 10), 
            ZIndex = 10, 
            ScrollBarThickness = v0.DefaultScrollBarThickness, 
            ScrollingDirection = if not v0.UIBloxThemeEnabled then Enum.ScrollingDirection.XY else Enum.ScrollingDirection.Y, 
            Parent = v225
        });
        local v227 = nil;
        local v228 = false;
        local function v231(v229, v230)
            if v229 ~= nil and v230 ~= Enum.UserInputState.Begin then
                return ;
            else
                v216.DropDownFrame.Selectable = v218;
                v211:SetActive(true);
                if not (not v222.Visible or not if not l_VRService_0.VREnabled then not l_UserInputService_0.TouchEnabled or (l_UserInputService_0.GamepadEnabled and true or false) else false) then
                    l_GuiService_0.SelectedCoreObject = v215;
                end;
                v222.Visible = false;
                if v227 then
                    v227:Disconnect();
                end;
                l_ContextActionService_0:UnbindCoreAction(v219 .. "Action");
                l_ContextActionService_0:UnbindCoreAction(v219 .. "FreezeAction");
                v220.Value = v218;
                v228 = false;
                if l_VRService_0.VREnabled then
                    require(l_CoreGui_0.RobloxGui.Modules.VR.Panel3D).Get("SettingsMenu"):SetSubpanelDepth(v222, 0);
                end;
                return ;
            end;
        end;
        local function v232()
        end;
        local function v234()
            if v218 then
                v216.DropDownFrame.Selectable = false;
                v228 = true;
                v222.Visible = true;
                if l_VRService_0.VREnabled then
                    require(l_CoreGui_0.RobloxGui.Modules.VR.Panel3D).Get("SettingsMenu"):SetSubpanelDepth(v222, 0.5);
                end;
                v215 = v216.DropDownFrame;
                if v216.CurrentIndex and v216.CurrentIndex > 0 then
                    l_GuiService_0.SelectedCoreObject = v216.Selections[v216.CurrentIndex];
                elseif #v216.Selections > 0 then
                    l_GuiService_0.SelectedCoreObject = v216.Selections[1];
                end;
                v227 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
                    for v233 = 1, #v216.Selections do
                        if l_GuiService_0.SelectedCoreObject == v216.Selections[v233] then
                            v216.Selections[v233].TextColor3 = v214;
                        else
                            v216.Selections[v233].TextColor3 = not not l_VRService_0.VREnabled and v213 or v212;
                        end;
                    end;
                end);
                l_ContextActionService_0:BindCoreAction(v219 .. "FreezeAction", v232, false, Enum.UserInputType.Keyboard, Enum.UserInputType.Gamepad1);
                l_ContextActionService_0:BindCoreAction(v219 .. "Action", v231, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape);
                v211:SetActive(false);
                v220.Value = false;
                return ;
            else
                return ;
            end;
        end;
        local v235 = l_RobloxTranslator_0:FormatByKey("Feature.SettingsHub.Label.ChooseOne");
        local v236 = UDim2.new(0.6, 0, 0, 50);
        if v0.UIBloxThemeEnabled then
            v236 = UDim2.new(0.6, 0, 0, 40);
        end;
        v216.DropDownFrame = v171("DropDownFrame", v235, v236, v234, nil, v211);
        v216.DropDownFrame.Position = UDim2.new(1, 0, 0.5, 0);
        v216.DropDownFrame.AnchorPoint = Vector2.new(1, 0.5);
        v220 = v216.DropDownFrame.Enabled;
        local l_DropDownFrameTextLabel_0 = v216.DropDownFrame.DropDownFrameTextLabel;
        l_DropDownFrameTextLabel_0.Position = UDim2.new(0, 15, 0, 0);
        if not v0.UIBloxThemeEnabled then
            l_DropDownFrameTextLabel_0.Size = UDim2.new(1, -50, 1, -8);
        else
            l_DropDownFrameTextLabel_0.Size = UDim2.new(1, -50, 1, 0);
        end;
        l_DropDownFrameTextLabel_0.ClipsDescendants = true;
        l_DropDownFrameTextLabel_0.TextXAlignment = Enum.TextXAlignment.Left;
        local v238 = v35.Create("ImageLabel")({
            Name = "DropDownImage", 
            Image = "rbxasset://textures/ui/Settings/DropDown/DropDown.png", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(1, 0.5), 
            Size = UDim2.new(0, 15, 0, 10), 
            Position = UDim2.new(1, -12, 0.5, 0), 
            ZIndex = 2, 
            Parent = v216.DropDownFrame
        });
        v216.DropDownImage = v238;
        local function v243(v239)
            local v240 = false;
            for v241, v242 in pairs(v216.Selections) do
                if v241 == v239 then
                    l_DropDownFrameTextLabel_0.Text = v242.Text;
                    v216.CurrentIndex = v241;
                    v240 = true;
                end;
            end;
            if v240 then
                l_BindableEvent_1:Fire(v239);
            end;
        end;
        local function v248(v244)
            local v245 = false;
            for v246, v247 in pairs(v216.Selections) do
                if v247.Text == v244 then
                    l_DropDownFrameTextLabel_0.Text = v247.Text;
                    v216.CurrentIndex = v246;
                    v245 = true;
                end;
            end;
            if v245 then
                l_BindableEvent_1:Fire(v216.CurrentIndex);
            end;
            return v245;
        end;
        local function _(v249)
            if not v249 then
                v216.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0;
                v216.DropDownFrame.ImageTransparency = 0;
                v216.DropDownImage.ImageTransparency = 0;
                return ;
            else
                v216.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0.5;
                v216.DropDownFrame.ImageTransparency = 0.5;
                v216.DropDownImage.ImageTransparency = 0.5;
                return ;
            end;
        end;
        v216.IndexChanged = l_BindableEvent_1.Event;
        v216.SetSelectionIndex = function(_, v252)
            v243(v252);
        end;
        v216.SetSelectionByValue = function(_, v254)
            return (v248(v254));
        end;
        v216.ResetSelectionIndex = function(_)
            v216.CurrentIndex = nil;
            l_DropDownFrameTextLabel_0.Text = v235;
            v231();
        end;
        v216.GetSelectedIndex = function(_)
            return v216.CurrentIndex;
        end;
        v216.SetZIndex = function(_, v258)
            v216.DropDownFrame.ZIndex = v258;
            v238.ZIndex = v258;
            l_DropDownFrameTextLabel_0.ZIndex = v258;
        end;
        v216.SetInteractable = function(_, v260)
            v218 = v260;
            v216.DropDownFrame.Selectable = v218;
            if v218 then
                v216.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0;
                v216.DropDownFrame.ImageTransparency = 0;
                v216.DropDownImage.ImageTransparency = 0;
                if not l_VRService_0.VREnabled then
                    v216:SetZIndex(2);
                end;
            else
                v231();
                if not l_VRService_0.VREnabled then
                    v216.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0;
                    v216.DropDownFrame.ImageTransparency = 0;
                    v216.DropDownImage.ImageTransparency = 0;
                else
                    v216.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0.5;
                    v216.DropDownFrame.ImageTransparency = 0.5;
                    v216.DropDownImage.ImageTransparency = 0.5;
                end;
                if not l_VRService_0.VREnabled then
                    v216:SetZIndex(1);
                end;
            end;
            v220.Value = v260 and not v228;
            v216.DropDownImage.Visible = v260;
            if not v260 then
                v216.DropDownFrame.ImageTransparency = 0.5;
                return ;
            else
                v216.DropDownFrame.ImageTransparency = 0;
                return ;
            end;
        end;
        v216.SetAutoLocalize = function(_, v262)
            v222.AutoLocalize = v262;
        end;
        v216.UpdateDropDownList = function(_, v264)
            l_v209_0 = v264;
            if v216.Selections then
                for v265 = 1, #v216.Selections do
                    v216.Selections[v265]:Destroy();
                end;
            end;
            v216.Selections = {};
            v216.SelectionInfo = {};
            local l_VREnabled_0 = l_VRService_0.VREnabled;
            local v267 = not not l_VREnabled_0 and v0.font(Enum.Font.SourceSansBold, "Bold") or v0.font(Enum.Font.SourceSans, "UtilityText");
            local v268 = not not l_VREnabled_0 and v0.textSize(36) or v0.textSize(24, "UtilityText");
            local v269 = not l_VREnabled_0 and 50 or 70;
            local v270 = v269 + 1;
            local v271 = not l_VREnabled_0 and 400 or 600;
            local v272 = 0;
            for v273, v274 in pairs(v264) do
                local v275 = v35.Create("Frame")({
                    BackgroundTransparency = 0.7, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 1, 0)
                });
                if v0.UIBloxThemeEnabled then
                    v35.Create("UICorner")({
                        CornerRadius = v0.DefaultCornerRadius, 
                        Parent = v275
                    });
                end;
                local l_v274_0 = v274;
                local v277 = "";
                local v278 = typeof(v274) == "table";
                if v278 then
                    l_v274_0 = v274.title;
                    v277 = v274.subtitle;
                    v272 = v272 + 10;
                end;
                local v279 = nil;
                if not v278 then
                    v279 = v35.Create("TextButton")({
                        Name = "Selection" .. tostring(v273), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        AutoButtonColor = false, 
                        Size = UDim2.new(1, -28, 0, v269), 
                        Position = UDim2.new(0, 14, 0, (v273 - 1) * v270), 
                        TextColor3 = not not l_VRService_0.VREnabled and v213 or v212, 
                        Font = v267, 
                        TextSize = v268, 
                        Text = v274, 
                        ZIndex = 10, 
                        SelectionImageObject = v275, 
                        Parent = v226
                    });
                else
                    v279 = v35.Create("TextButton")({
                        Name = "Selection" .. tostring(v273), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        AutoButtonColor = false, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        Size = UDim2.new(1, -28, 0, v269 + 10), 
                        Position = UDim2.new(0, 14, 0, (v273 - 1) * (v270 + 10)), 
                        TextColor3 = not not l_VRService_0.VREnabled and v213 or v212, 
                        Font = v267, 
                        TextSize = v268, 
                        Text = l_v274_0, 
                        ZIndex = 10, 
                        SelectionImageObject = v275, 
                        Parent = v226
                    });
                    local _ = v35.Create("TextLabel")({
                        Name = "Subtitle" .. tostring(v273), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Size = UDim2.new(1, -28, 0, v269 * 0.8), 
                        Position = UDim2.new(0, 14, 0, 15), 
                        TextColor3 = not not l_VRService_0.VREnabled and v213 or v212, 
                        Font = v267, 
                        TextSize = v268 * 0.8, 
                        Text = v277, 
                        ZIndex = 10, 
                        Parent = v279
                    });
                end;
                if v273 == v210 then
                    v216.CurrentIndex = v273;
                    l_DropDownFrameTextLabel_0.Text = l_v274_0;
                    v279.TextColor3 = v214;
                elseif not v210 and v273 == 1 then
                    v279.TextColor3 = v214;
                end;
                do
                    local l_v279_0 = v279;
                    local function v282()
                        l_DropDownFrameTextLabel_0.Text = l_v279_0.Text;
                        v231();
                        v216.CurrentIndex = v273;
                        l_BindableEvent_1:Fire(v273);
                    end;
                    l_v279_0.MouseButton1Click:Connect(v282);
                    l_v279_0.MouseEnter:Connect(function()
                        if if not l_VRService_0.VREnabled then not l_UserInputService_0.TouchEnabled or (l_UserInputService_0.GamepadEnabled and true or false) else false then
                            l_GuiService_0.SelectedCoreObject = l_v279_0;
                        end;
                    end);
                    v216.Selections[v273] = l_v279_0;
                    v216.SelectionInfo[l_v279_0] = {
                        Clicked = v282
                    };
                end;
            end;
            l_GuiService_0:RemoveSelectionGroup(v219);
            l_GuiService_0:AddSelectionTuple(v219, unpack(v216.Selections));
            v226.CanvasSize = UDim2.new(1, -20, 0, #v264 * v270 + v272);
            local function v283()
                if v226.CanvasSize.Y.Offset < v222.AbsoluteSize.Y - 10 then
                    v225.Size = UDim2.new(0, v271, 0, v226.CanvasSize.Y.Offset + 25);
                    return ;
                else
                    v225.Size = UDim2.new(0, v271, 0.9, 0);
                    return ;
                end;
            end;
            v222.Changed:Connect(function(v284)
                if v284 ~= "AbsoluteSize" then
                    return ;
                else
                    v283();
                    return ;
                end;
            end);
            v283();
        end;
        v216:UpdateDropDownList(v209);
        v222.MouseButton1Click:Connect(v231);
        v211.PoppedMenu:Connect(function(v285)
            if v285 == v222 then
                v231();
            end;
        end);
        return v216;
    end;
end;
local function v359(v287, v288)
    local v289 = 0;
    local v290 = {
        HubRef = nil, 
        SetSelectionIndex = nil
    };
    if type(v287) ~= "table" then
        error("CreateSelector selectionStringTable (first arg) is not a table", 2);
        return v290;
    else
        local l_BindableEvent_2 = Instance.new("BindableEvent");
        l_BindableEvent_2.Name = "IndexChanged";
        local v292 = true;
        v290.CurrentIndex = 0;
        v290.SelectorFrame = v35.Create("ImageButton")({
            Name = "Selector", 
            Image = "", 
            AutoButtonColor = false, 
            NextSelectionLeft = v290.SelectorFrame, 
            NextSelectionRight = v290.SelectorFrame, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0.6, 0, 0, 50), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5), 
            ZIndex = 2, 
            SelectionImageObject = v37
        });
        local v293 = v35.Create("ImageButton")({
            Name = "LeftButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            Size = UDim2.new(0, v0.SelectorArrowButtonWidth, 0, 50), 
            Image = "", 
            ZIndex = 3, 
            Selectable = false, 
            SelectionImageObject = v37, 
            Parent = v290.SelectorFrame
        });
        local v294 = v35.Create("ImageButton")({
            Name = "RightButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            Size = UDim2.new(0, v0.SelectorArrowButtonWidth, 0, 50), 
            Image = "", 
            ZIndex = 3, 
            Selectable = false, 
            SelectionImageObject = v37, 
            Parent = v290.SelectorFrame
        });
        local v295 = v35.Create("ImageLabel")({
            Name = "LeftButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, 18, 0, 30), 
            Image = "rbxasset://textures/ui/Settings/Slider/Left.png", 
            ImageColor3 = v4, 
            ZIndex = 4, 
            Parent = v293
        });
        local v296 = v35.Create("ImageLabel")({
            Name = "RightButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, 18, 0, 30), 
            Image = "rbxasset://textures/ui/Settings/Slider/Right.png", 
            ImageColor3 = v4, 
            ZIndex = 4, 
            Parent = v294
        });
        if not l_UserInputService_0.TouchEnabled then
            local function v298(v297)
                v297.ImageColor3 = v4;
            end;
            local function v300(v299)
                v299.ImageColor3 = v5;
            end;
            v96(v293, v295, v298, v300);
            v96(v294, v296, v298, v300);
        end;
        v290.Selections = {};
        local v301 = {};
        local v302 = {};
        local v303 = v35.Create("ImageButton")({
            Name = "AutoSelectButton", 
            BackgroundTransparency = 1, 
            Image = "", 
            Position = UDim2.new(0, v293.Size.X.Offset, 0, 0), 
            Size = UDim2.new(1, v293.Size.X.Offset * -2, 1, 0), 
            Parent = v290.SelectorFrame, 
            ZIndex = 2, 
            SelectionImageObject = v37
        });
        v303.MouseButton1Click:Connect(function()
            if v292 then
                if #v290.Selections <= 1 then
                    return ;
                else
                    local v304 = v290.CurrentIndex + 1;
                    if #v290.Selections < v304 then
                        v304 = 1;
                    end;
                    v290:SetSelectionIndex(v304);
                    if if not l_VRService_0.VREnabled then not l_UserInputService_0.TouchEnabled or (l_UserInputService_0.GamepadEnabled and true or false) else false then
                        l_GuiService_0.SelectedCoreObject = v290.SelectorFrame;
                    end;
                    return ;
                end;
            else
                return ;
            end;
        end);
        v302[v303] = true;
        local function v312(v305, v306)
            for v307, v308 in pairs(v290.Selections) do
                local v309 = v307 == v305;
                local v310 = UDim2.new(0, v293.Size.X.Offset, 0, 0);
                local v311 = UDim2.new(0, (v293.Size.X.Offset * v306) * 3, 0, 0);
                if v301[v308] then
                    v311 = UDim2.new(0, (v293.Size.X.Offset * -v306) * 3, 0, 0);
                end;
                if v311.X.Offset < 0 then
                    v311 = UDim2.new(0, v311.X.Offset + v308.AbsoluteSize.X / 4, 0, 0);
                end;
                if not v309 then
                    if v301[v308] then
                        v301[v308] = false;
                        PropertyTweener(v308, "TextTransparency", 0, 1, 0.165, v50);
                        if not v308:IsDescendantOf(game) then
                            v308.Position = v311;
                        else
                            v308:TweenPosition(v311, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.135, true);
                        end;
                    end;
                else
                    v301[v308] = true;
                    v308.Position = v311;
                    v308.Visible = true;
                    PropertyTweener(v308, "TextTransparency", 1, 0, 0.165, v50);
                    if not v308:IsDescendantOf(game) then
                        v308.Position = v310;
                    else
                        v308:TweenPosition(v310, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.15, true);
                    end;
                    v290.CurrentIndex = v307;
                    l_BindableEvent_2:Fire(v305);
                end;
            end;
        end;
        local function v317(v313, v314)
            if v292 then
                if (((((v313 ~= nil and v313.UserInputType ~= Enum.UserInputType.MouseButton1) and v313.UserInputType ~= Enum.UserInputType.Gamepad1) and v313.UserInputType ~= Enum.UserInputType.Gamepad2) and v313.UserInputType ~= Enum.UserInputType.Gamepad3) and v313.UserInputType ~= Enum.UserInputType.Gamepad4) and v313.UserInputType ~= Enum.UserInputType.Keyboard then
                    return ;
                else
                    if if not l_VRService_0.VREnabled then not l_UserInputService_0.TouchEnabled or (l_UserInputService_0.GamepadEnabled and true or false) else false then
                        l_GuiService_0.SelectedCoreObject = v290.SelectorFrame;
                    end;
                    local v315 = v314 + v290.CurrentIndex;
                    local v316 = 0;
                    v316 = v290.CurrentIndex < v315 and 1 or -1;
                    if #v290.Selections < v315 then
                        v315 = 1;
                    elseif v315 < 1 then
                        v315 = #v290.Selections;
                    end;
                    v312(v315, v316);
                    return ;
                end;
            else
                return ;
            end;
        end;
        local v318 = nil;
        local function _()
            v318 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
                if #v290.Selections <= 0 then
                    return ;
                elseif l_GuiService_0.SelectedCoreObject == v290.SelectorFrame then
                    v290.Selections[v290.CurrentIndex].TextTransparency = 0;
                    return ;
                elseif not (l_GuiService_0.SelectedCoreObject ~= nil) or not v302[l_GuiService_0.SelectedCoreObject] then
                    v290.Selections[v290.CurrentIndex].TextTransparency = 0.5;
                    return ;
                elseif not l_VRService_0.VREnabled then
                    l_GuiService_0.SelectedCoreObject = v290.SelectorFrame;
                    return ;
                else
                    v290.Selections[v290.CurrentIndex].TextTransparency = 0;
                    return ;
                end;
            end);
        end;
        v290.IndexChanged = l_BindableEvent_2.Event;
        v290.SetSelectionIndex = function(_, v321)
            v312(v321, 1);
        end;
        v290.GetSelectedIndex = function(_)
            return v290.CurrentIndex;
        end;
        v290.SetZIndex = function(_, v324)
            v293.ZIndex = v324;
            v294.ZIndex = v324;
            v295.ZIndex = v324;
            v296.ZIndex = v324;
            for v325 = 1, #v290.Selections do
                v290.Selections[v325].ZIndex = v324;
            end;
        end;
        v290.SetInteractable = function(_, v327)
            v292 = v327;
            v290.SelectorFrame.Selectable = v292;
            v293.Active = v292;
            v294.Active = v292;
            v293.Visible = v292;
            v294.Visible = v292;
            if v292 then
                for _, v329 in pairs(v290.Selections) do
                    v329.TextColor3 = Color3.fromRGB(255, 255, 255);
                end;
                v295.ImageColor3 = v4;
                v296.ImageColor3 = v4;
                return ;
            else
                for _, v331 in pairs(v290.Selections) do
                    v331.TextColor3 = v0.color("NotInteractableSelection", Color3.fromRGB(255, 255, 255));
                end;
                v295.ImageColor3 = v6;
                v296.ImageColor3 = v6;
                return ;
            end;
        end;
        v290.UpdateOptions = function(_, v333)
            for _, v335 in pairs(v290.Selections) do
                v335:Destroy();
            end;
            v301 = {};
            v290.Selections = {};
            for v336, v337 in pairs(v333) do
                local v338 = v35.Create("TextLabel")({
                    Name = "Selection" .. tostring(v336), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, v293.Size.X.Offset * -2, 1, 0), 
                    Position = UDim2.new(1, 0, 0, 0), 
                    TextColor3 = Color3.fromRGB(255, 255, 255), 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextTransparency = 0.5, 
                    Font = v0.font(Enum.Font.SourceSans, "UtilityText"), 
                    TextSize = v0.textSize(24, "UtilityText"), 
                    TextWrapped = v0.UIBloxThemeEnabled, 
                    Text = v337, 
                    ZIndex = 2, 
                    Visible = false, 
                    Parent = v290.SelectorFrame
                });
                if v28 then
                    v338.TextSize = v0.textSize(36);
                end;
                if v336 == v288 then
                    v290.CurrentIndex = v336;
                    v338.Position = UDim2.new(0, v293.Size.X.Offset, 0, 0);
                    v338.Visible = true;
                    v301[v338] = true;
                else
                    v301[v338] = false;
                end;
                v290.Selections[v336] = v338;
            end;
            local v339 = #v290.Selections > 1;
            v293.Visible = v339;
            v294.Visible = v339;
        end;
        l_VRService_0.Changed:Connect(function(v340)
            if v340 ~= "VREnabled" then
                return ;
            else
                local l_VREnabled_1 = l_VRService_0.VREnabled;
                v293.Selectable = l_VREnabled_1;
                v294.Selectable = l_VREnabled_1;
                v303.Selectable = l_VREnabled_1;
                return ;
            end;
        end);
        local l_VREnabled_2 = l_VRService_0.VREnabled;
        v293.Selectable = l_VREnabled_2;
        v294.Selectable = l_VREnabled_2;
        v303.Selectable = l_VREnabled_2;
        v293.InputBegan:Connect(function(v343)
            if v343.UserInputType == Enum.UserInputType.Touch then
                v317(nil, -1);
            end;
        end);
        v293.MouseButton1Click:Connect(function()
            if not l_UserInputService_0.TouchEnabled then
                v317(nil, -1);
            end;
        end);
        v294.InputBegan:Connect(function(v344)
            if v344.UserInputType == Enum.UserInputType.Touch then
                v317(nil, 1);
            end;
        end);
        v294.MouseButton1Click:Connect(function()
            if not l_UserInputService_0.TouchEnabled then
                v317(nil, 1);
            end;
        end);
        l_VREnabled_2 = true;
        v290:UpdateOptions(v287);
        l_UserInputService_0.InputBegan:Connect(function(v345)
            if v292 then
                if l_VREnabled_2 then
                    if v345.UserInputType ~= Enum.UserInputType.Gamepad1 and v345.UserInputType ~= Enum.UserInputType.Keyboard then
                        return ;
                    elseif l_GuiService_0.SelectedCoreObject ~= v290.SelectorFrame then
                        return ;
                    elseif not (v345.KeyCode ~= Enum.KeyCode.DPadLeft and v345.KeyCode ~= Enum.KeyCode.Left) or v345.KeyCode == Enum.KeyCode.A then
                        v317(v345, -1);
                        return ;
                    else
                        if not (v345.KeyCode ~= Enum.KeyCode.DPadRight and v345.KeyCode ~= Enum.KeyCode.Right) or v345.KeyCode == Enum.KeyCode.D then
                            v317(v345, 1);
                        end;
                        return ;
                    end;
                else
                    return ;
                end;
            else
                return ;
            end;
        end);
        l_UserInputService_0.InputChanged:Connect(function(v346)
            if v292 then
                if l_VREnabled_2 then
                    if v346.UserInputType ~= Enum.UserInputType.Gamepad1 then
                        return ;
                    else
                        local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
                        if l_SelectedCoreObject_0 and l_SelectedCoreObject_0:IsDescendantOf(v290.SelectorFrame.Parent) then
                            if v346.KeyCode ~= Enum.KeyCode.Thumbstick1 then
                                return ;
                            elseif (v346.Position.X > 0.8 and v346.Delta.X > 0) and v289 ~= 1 then
                                v289 = 1;
                                v317(v346, v289);
                                return ;
                            elseif (v346.Position.X < -0.8 and v346.Delta.X < 0) and v289 ~= -1 then
                                v289 = -1;
                                v317(v346, v289);
                                return ;
                            else
                                if math.abs(v346.Position.X) < 0.8 then
                                    v289 = 0;
                                end;
                                return ;
                            end;
                        else
                            return ;
                        end;
                    end;
                else
                    v289 = 0;
                    return ;
                end;
            else
                return ;
            end;
        end);
        v290.SelectorFrame.AncestryChanged:Connect(function(_, v349)
            l_VREnabled_2 = v349;
            if l_VREnabled_2 then
                v318 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
                    if #v290.Selections <= 0 then
                        return ;
                    elseif l_GuiService_0.SelectedCoreObject == v290.SelectorFrame then
                        v290.Selections[v290.CurrentIndex].TextTransparency = 0;
                        return ;
                    elseif not (l_GuiService_0.SelectedCoreObject ~= nil) or not v302[l_GuiService_0.SelectedCoreObject] then
                        v290.Selections[v290.CurrentIndex].TextTransparency = 0.5;
                        return ;
                    elseif not l_VRService_0.VREnabled then
                        l_GuiService_0.SelectedCoreObject = v290.SelectorFrame;
                        return ;
                    else
                        v290.Selections[v290.CurrentIndex].TextTransparency = 0;
                        return ;
                    end;
                end);
            elseif v318 then
                v318:Disconnect();
                return ;
            end;
        end);
        local function v355(_, v351)
            local v352 = 0;
            v352 = if not v351 then not not v28 and v0.textSize(36) or v0.textSize(24, "UtilityText") else v0.textSize(16);
            for _, v354 in pairs(v290.Selections) do
                v354.TextSize = v352;
            end;
        end;
        v36[v290.SelectorFrame] = v355;
        local l_v355_0 = v355;
        local v357 = v82();
        local v358 = v82();
        l_v355_0(v357, v358.X < v358.Y);
        v318 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
            if #v290.Selections <= 0 then
                return ;
            elseif l_GuiService_0.SelectedCoreObject == v290.SelectorFrame then
                v290.Selections[v290.CurrentIndex].TextTransparency = 0;
                return ;
            elseif not (l_GuiService_0.SelectedCoreObject ~= nil) or not v302[l_GuiService_0.SelectedCoreObject] then
                v290.Selections[v290.CurrentIndex].TextTransparency = 0.5;
                return ;
            elseif not l_VRService_0.VREnabled then
                l_GuiService_0.SelectedCoreObject = v290.SelectorFrame;
                return ;
            else
                v290.Selections[v290.CurrentIndex].TextTransparency = 0;
                return ;
            end;
        end);
        return v290;
    end;
end;
local function v382(v360, v361, v362, v363, v364)
    local l_RobloxGui_1 = l_CoreGui_0.RobloxGui;
    if not l_RobloxGui_1:FindFirstChild("AlertViewFullScreen") then
        local v366 = nil;
        local function v370(v367)
            if v367 ~= "VREnabled" then
                return ;
            else
                local _ = nil;
                local v369 = nil;
                if not l_VRService_0.VREnabled then
                    l_RobloxGui_1 = l_CoreGui_0.RobloxGui;
                else
                    v369 = require(l_CoreGui_0.RobloxGui.Modules.VR.Panel3D).Get("SettingsMenu");
                    l_RobloxGui_1 = v369:GetGUI();
                end;
                if v366 and v366.Parent ~= nil then
                    v366.Parent = l_RobloxGui_1;
                    if l_VRService_0.VREnabled then
                        v369:SetSubpanelDepth(v366, 0.5);
                    end;
                end;
                return ;
            end;
        end;
        local v371 = l_VRService_0.Changed:Connect(v370);
        v366 = v35.Create("ImageLabel")({
            Name = "AlertViewBacking", 
            Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png", 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 6, 46, 44), 
            BackgroundTransparency = 1, 
            ImageTransparency = 1, 
            Size = UDim2.new(0, 400, 0, 350), 
            Position = UDim2.new(0.5, -200, 0.5, -175), 
            ZIndex = 9, 
            Parent = l_RobloxGui_1
        });
        v370("VREnabled");
        if not v364 and not l_VRService_0.VREnabled then
            v366.Size = UDim2.new(0.8, 0, 0, 350);
            v366.Position = UDim2.new(0.1, 0, 0.1, 0);
        else
            v366.ImageTransparency = 0;
        end;
        if l_CoreGui_0.RobloxGui.AbsoluteSize.Y <= v366.Size.Y.Offset then
            v366.Size = UDim2.new(v366.Size.X.Scale, v366.Size.X.Offset, v366.Size.Y.Scale, l_CoreGui_0.RobloxGui.AbsoluteSize.Y);
            v366.Position = UDim2.new(v366.Position.X.Scale, -v366.Size.X.Offset / 2, 0.5, -v366.Size.Y.Offset / 2);
        end;
        if not (not v0.UIBloxThemeEnabled or v364) then
            v35.Create("UICorner")({
                CornerRadius = v0.DefaultCornerRadius, 
                Parent = v366
            });
            v366.BackgroundColor3 = v0.color("MenuContainer");
            v366.BackgroundTransparency = v0.transparency("MenuContainer");
        end;
        local _ = v35.Create("TextLabel")({
            Name = "AlertViewText", 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0.95, 0, 0.6, 0), 
            Position = UDim2.new(0.025, 0, 0.05, 0), 
            Font = v0.font(Enum.Font.SourceSansBold, "Bold"), 
            TextSize = v0.textSize(36), 
            Text = v360, 
            TextWrapped = true, 
            TextColor3 = Color3.fromRGB(255, 255, 255), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 10, 
            Parent = v366
        });
        local _ = v35.Create("ImageLabel")({
            Image = "", 
            BackgroundTransparency = 1
        });
        local v374 = l_HttpService_0:GenerateGUID(false);
        local function v377(_, v376)
            if l_VRService_0.VREnabled and (not (v376 ~= Enum.UserInputState.Begin) or v376 == Enum.UserInputState.Cancel) then
                return ;
            elseif v366 then
                if l_VRService_0.VREnabled then
                    require(l_CoreGui_0.RobloxGui.Modules.VR.Panel3D).Get("SettingsMenu"):SetSubpanelDepth(v366, 0);
                end;
                v366:Destroy();
                v366 = nil;
                if v363 then
                    v363();
                end;
                l_ContextActionService_0:UnbindCoreAction(v374);
                l_GuiService_0.SelectedCoreObject = nil;
                if v362 then
                    v362:ShowBar();
                end;
                if v371 then
                    v371:Disconnect();
                end;
                return ;
            else
                return ;
            end;
        end;
        local v378 = UDim2.new(1, -20, 0, 60);
        local v379 = UDim2.new(0, 10, 0.65, 0);
        if not v364 then
            v378 = UDim2.new(0, 200, 0, 50);
            v379 = UDim2.new(0.5, -100, 0.65, 0);
        end;
        local v380, v381 = v171("AlertViewButton", v361, v378, v377);
        v380.Position = v379;
        v380.NextSelectionLeft = v380;
        v380.NextSelectionRight = v380;
        v380.NextSelectionUp = v380;
        v380.NextSelectionDown = v380;
        v380.ZIndex = 9;
        v381.ZIndex = v380.ZIndex;
        v380.Parent = v366;
        if if not l_VRService_0.VREnabled then not l_UserInputService_0.TouchEnabled or (l_UserInputService_0.GamepadEnabled and true or false) else false then
            l_GuiService_0.SelectedCoreObject = v380;
        end;
        l_GuiService_0.SelectedCoreObject = v380;
        l_ContextActionService_0:BindCoreAction(v374, v377, false, Enum.KeyCode.Escape, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonA);
        if not (not v362 or l_VRService_0.VREnabled) then
            v362:HideBar();
            v362.Pages.CurrentPage:Hide(1, 1);
        end;
        return ;
    else
        return ;
    end;
end;
local function v485(v383, v384, v385, v386, v387)
    local v388 = {};
    local v389 = tonumber(v383);
    local l_v384_0 = v384;
    local v391 = 0;
    local v392 = nil;
    local v393 = true;
    local v394 = l_HttpService_0:GenerateGUID(false);
    v383 = "";
    v384 = "";
    if v389 <= 0 then
        error("CreateNewSlider failed because numOfSteps (first arg) is 0 or negative, please supply a positive integer", 2);
        return ;
    else
        local v395 = v386 or v387;
        local l_BindableEvent_3 = Instance.new("BindableEvent");
        l_BindableEvent_3.Name = "ValueChanged";
        local v397 = nil;
        if v25 then
            v397 = l_Signal_0.new();
        end;
        v388.SliderFrame = v35.Create("ImageButton")({
            Name = "Slider", 
            Image = "", 
            AutoButtonColor = false, 
            NextSelectionLeft = v388.SliderFrame, 
            NextSelectionRight = v388.SliderFrame, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0.6, 0, 0, 50), 
            AutomaticSize = if not v395 then nil else Enum.AutomaticSize.Y, 
            Position = UDim2.new(1, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5), 
            SelectionImageObject = v37, 
            ZIndex = 2
        });
        local v398 = nil;
        if v395 then
            v398 = v35.Create("Frame")({
                Name = "StepsAndButtonsContainer", 
                Size = UDim2.new(1, 0, 0, 50), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                Parent = v388.SliderFrame
            });
            v35.Create("UIListLayout")({
                Name = "UIListLayout", 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Parent = v388.SliderFrame
            });
            local v399 = v35.Create("Frame")({
                Name = "SliderLabels", 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Parent = v388.SliderFrame, 
                LayoutOrder = 2
            });
            v35.Create("UIPadding")({
                Name = "UIPadding", 
                PaddingRight = UDim.new(0, 50), 
                PaddingLeft = UDim.new(0, 50), 
                Parent = v399
            });
            local function _()
                return l_RobloxGui_0.AbsoluteSize.X > 460;
            end;
            if v386 then
                v388.LeftLabel = v35.Create("TextLabel")({
                    Name = "LeftLabel", 
                    Text = v386, 
                    Font = v0.font(Enum.Font.SourceSans, "UtilityRow"), 
                    TextSize = v0.textSize(18, "UtilityRow"), 
                    TextColor3 = Color3.fromRGB(255, 255, 255), 
                    TextTransparency = 0.25, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Parent = v399, 
                    Visible = l_RobloxGui_0.AbsoluteSize.X > 460
                });
            end;
            if v387 then
                v388.RightLabel = v35.Create("TextLabel")({
                    Name = "RightLabel", 
                    Text = v387, 
                    Font = v0.font(Enum.Font.SourceSans, "UtilityRow"), 
                    TextSize = v0.textSize(18, "UtilityRow"), 
                    TextColor3 = Color3.fromRGB(255, 255, 255), 
                    TextTransparency = 0.25, 
                    TextXAlignment = Enum.TextXAlignment.Right, 
                    TextWrapped = true, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Parent = v399, 
                    Visible = l_RobloxGui_0.AbsoluteSize.X > 460
                });
            end;
            l_RobloxGui_0:GetPropertyChangedSignal("AbsoluteSize"):connect(function()
                if v388.LeftLabel then
                    v388.LeftLabel.Visible = l_RobloxGui_0.AbsoluteSize.X > 460;
                end;
                if v388.RightLabel then
                    v388.RightLabel.Visible = l_RobloxGui_0.AbsoluteSize.X > 460;
                end;
            end);
        end;
        v388.StepsContainer = v35.Create("Frame")({
            Name = "StepsContainer", 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(1, -100, 1, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Parent = if not v395 then v388.SliderFrame else v398
        });
        local v401 = v35.Create("ImageButton")({
            Name = "LeftButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            Size = UDim2.new(0, v0.SelectorArrowButtonWidth, 0, 50), 
            Image = "", 
            ZIndex = 3, 
            Selectable = false, 
            SelectionImageObject = v37, 
            Active = true, 
            Parent = if not v395 then v388.SliderFrame else v398
        });
        local v402 = v35.Create("ImageButton")({
            Name = "RightButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            Size = UDim2.new(0, v0.SelectorArrowButtonWidth, 0, 50), 
            Image = "", 
            ZIndex = 3, 
            Selectable = false, 
            SelectionImageObject = v37, 
            Active = true, 
            Parent = if not v395 then v388.SliderFrame else v398
        });
        local v403 = v35.Create("ImageLabel")({
            Name = "LeftButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, 30, 0, 30), 
            Image = "rbxasset://textures/ui/Settings/Slider/Less.png", 
            ZIndex = 4, 
            Parent = v401, 
            ImageColor3 = not not l_UserInputService_0.TouchEnabled and v5 or v4
        });
        local v404 = v35.Create("ImageLabel")({
            Name = "RightButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, 30, 0, 30), 
            Image = "rbxasset://textures/ui/Settings/Slider/More.png", 
            ZIndex = 4, 
            Parent = v402, 
            ImageColor3 = not not l_UserInputService_0.TouchEnabled and v5 or v4
        });
        if not l_UserInputService_0.TouchEnabled then
            local function v406(v405)
                v405.ImageColor3 = v4;
            end;
            local function v408(v407)
                v407.ImageColor3 = v5;
            end;
            v96(v401, v403, v406, v408);
            v96(v402, v404, v406, v408);
        end;
        v388.Steps = {};
        local v409 = 1 / v389;
        for v410 = 1, v389 do
            local v411 = v35.Create("ImageButton")({
                Name = "Step" .. tostring(v410), 
                BackgroundColor3 = v2, 
                BackgroundTransparency = not v0.UIBloxThemeEnabled and 0.36 or 0, 
                BorderSizePixel = 0, 
                AutoButtonColor = false, 
                Active = false, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new((v410 - 1) * v409, 2, 0.5, 0), 
                Size = if not v0.UIBloxThemeEnabled then UDim2.new(v409, -4, 0.48, 0) else UDim2.new(v409, -4, 0, 24), 
                Image = "", 
                ZIndex = 3, 
                Selectable = false, 
                ImageTransparency = 0.36, 
                Parent = v388.StepsContainer, 
                SelectionImageObject = v37
            });
            if l_v384_0 < v410 then
                v411.BackgroundColor3 = v3;
            end;
            if not (v410 ~= 1) or v410 == v389 then
                if not v0.UIBloxThemeEnabled then
                    v411.BackgroundTransparency = 1;
                    v411.ScaleType = Enum.ScaleType.Slice;
                    v411.SliceCenter = Rect.new(3, 3, 32, 21);
                    if v410 <= l_v384_0 then
                        if v410 == 1 then
                            v411.Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarLeft.png";
                        else
                            v411.Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarRight.png";
                        end;
                    elseif v410 == 1 then
                        v411.Image = "rbxasset://textures/ui/Settings/Slider/BarLeft.png";
                    else
                        v411.Image = "rbxasset://textures/ui/Settings/Slider/BarRight.png";
                    end;
                else
                    v35.Create("UICorner")({
                        CornerRadius = v0.DefaultCornerRadius, 
                        Parent = v411
                    });
                    v35.Create("Frame")({
                        Name = "Filler", 
                        BackgroundColor3 = v411.BackgroundColor3, 
                        Parent = v411, 
                        Size = UDim2.new(0.25, 0, 1, 0), 
                        BorderSizePixel = 0, 
                        Position = if v410 == 1 then UDim2.new(0.75, 0, 0, 0) else UDim2.new(0, 0, 0, 0)
                    });
                end;
            end;
            v388.Steps[#v388.Steps + 1] = v411;
        end;
        local function v413()
            for v412 = 1, v389 do
                v388.Steps[v412].BackgroundColor3 = v3;
                if not v0.UIBloxThemeEnabled then
                    if v412 == 1 then
                        v388.Steps[v412].Image = "rbxasset://textures/ui/Settings/Slider/BarLeft.png";
                    elseif v412 == v389 then
                        v388.Steps[v412].Image = "rbxasset://textures/ui/Settings/Slider/BarRight.png";
                    end;
                elseif not (v412 ~= 1) or v412 == v389 then
                    v388.Steps[v412].Filler.BackgroundColor3 = v3;
                end;
            end;
        end;
        local function v415()
            for v414 = 1, v389 do
                if l_v384_0 >= v414 then
                    v388.Steps[v414].BackgroundColor3 = v2;
                    if not v0.UIBloxThemeEnabled then
                        if v414 == 1 then
                            v388.Steps[v414].Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarLeft.png";
                        elseif v414 == v389 then
                            v388.Steps[v414].Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarRight.png";
                        end;
                    elseif not (v414 ~= 1) or v414 == v389 then
                        v388.Steps[v414].Filler.BackgroundColor3 = v2;
                    end;
                else
                    break;
                end;
            end;
        end;
        local function v418(v416)
            if not v0.UIBloxThemeEnabled then
                for v417 = 1, v389 do
                    if not (v417 ~= 1) or v417 == v389 then
                        v388.Steps[v417].ImageTransparency = v416;
                    else
                        v388.Steps[v417].BackgroundTransparency = v416;
                    end;
                end;
            end;
        end;
        local function v420(v419)
            if not v385 then
                v385 = 0;
            end;
            v401.Visible = true;
            v402.Visible = true;
            if v419 <= v385 then
                v419 = v385;
                v401.Visible = false;
            end;
            if v389 <= v419 then
                v419 = v389;
                v402.Visible = false;
            end;
            if l_v384_0 == v419 then
                return ;
            else
                l_v384_0 = v419;
                v413();
                v415();
                v392 = tick();
                if not v397 then
                    l_BindableEvent_3:Fire(l_v384_0);
                    return ;
                else
                    v397:fire(l_v384_0);
                    return ;
                end;
            end;
        end;
        local function _(v421)
            if v421 then
                local v422 = true;
                if v421.UserInputType ~= Enum.UserInputType.MouseButton1 then
                    v422 = true;
                    if v421.UserInputType ~= Enum.UserInputType.Touch then
                        v422 = false;
                        if v421.UserInputType == Enum.UserInputType.Gamepad1 then
                            v422 = v421.KeyCode == Enum.KeyCode.ButtonA;
                        end;
                    end;
                end;
                return v422;
            else
                return false;
            end;
        end;
        local function v438(v424, v425, v426)
            if v393 then
                if v424 == nil then
                    return ;
                else
                    local v427;
                    if v424 then
                        v427 = true;
                        if v424.UserInputType ~= Enum.UserInputType.MouseButton1 then
                            v427 = true;
                            if v424.UserInputType ~= Enum.UserInputType.Touch then
                                v427 = false;
                                if v424.UserInputType == Enum.UserInputType.Gamepad1 then
                                    v427 = v424.KeyCode == Enum.KeyCode.ButtonA;
                                end;
                            end;
                        end;
                    else
                        v427 = false;
                    end;
                    if v427 then
                        if not (not if not l_VRService_0.VREnabled then not l_UserInputService_0.TouchEnabled or (l_UserInputService_0.GamepadEnabled and true or false) else false or l_VRService_0.VREnabled) then
                            l_GuiService_0.SelectedCoreObject = v388.SliderFrame;
                        end;
                        if l_VRService_0.VREnabled then
                            v391 = 0;
                        elseif not v426 then
                            v391 = 0;
                            v427 = nil;
                            local v428 = nil;
                            v427 = l_UserInputService_0.InputChanged:Connect(function(v429)
                                if v429.UserInputType ~= Enum.UserInputType.MouseMovement then
                                    return ;
                                else
                                    local l_X_0 = v429.Position.X;
                                    for v431 = 1, v389 do
                                        local l_X_1 = v388.Steps[v431].AbsolutePosition.X;
                                        local l_X_2 = v388.Steps[v431].AbsoluteSize.X;
                                        if l_X_1 <= l_X_0 and l_X_0 <= l_X_1 + l_X_2 then
                                            v420(v431);
                                            return ;
                                        elseif v431 == 1 and l_X_0 < l_X_1 then
                                            v420(0);
                                            return ;
                                        elseif v431 == v389 and l_X_1 <= l_X_0 then
                                            v420(v431);
                                            return ;
                                        end;
                                    end;
                                    return ;
                                end;
                            end);
                            do
                                local l_v427_0, l_v428_0 = v427, v428;
                                l_v428_0 = l_UserInputService_0.InputEnded:Connect(function(v436)
                                    local v437;
                                    if v436 then
                                        v437 = true;
                                        if v436.UserInputType ~= Enum.UserInputType.MouseButton1 then
                                            v437 = true;
                                            if v436.UserInputType ~= Enum.UserInputType.Touch then
                                                v437 = false;
                                                if v436.UserInputType == Enum.UserInputType.Gamepad1 then
                                                    v437 = v436.KeyCode == Enum.KeyCode.ButtonA;
                                                end;
                                            end;
                                        end;
                                    else
                                        v437 = false;
                                    end;
                                    if v437 then
                                        v391 = 0;
                                        l_v428_0:Disconnect();
                                        l_v427_0:Disconnect();
                                        return ;
                                    else
                                        return ;
                                    end;
                                end);
                            end;
                        else
                            v391 = v425 - l_v384_0;
                        end;
                        v420(v425);
                        return ;
                    else
                        return ;
                    end;
                end;
            else
                return ;
            end;
        end;
        local function _(v439)
            if v393 then
                local v440;
                if v439 then
                    v440 = true;
                    if v439.UserInputType ~= Enum.UserInputType.MouseButton1 then
                        v440 = true;
                        if v439.UserInputType ~= Enum.UserInputType.Touch then
                            v440 = false;
                            if v439.UserInputType == Enum.UserInputType.Gamepad1 then
                                v440 = v439.KeyCode == Enum.KeyCode.ButtonA;
                            end;
                        end;
                    end;
                else
                    v440 = false;
                end;
                if v440 then
                    v391 = 0;
                    return ;
                else
                    return ;
                end;
            else
                return ;
            end;
        end;
        v388.ValueChanged = l_BindableEvent_3.Event;
        if v397 then
            v388.ValueChanged = v397;
        end;
        v388.SetValue = function(_, v443)
            v420(v443);
        end;
        v388.GetValue = function(_)
            return l_v384_0;
        end;
        v388.SetInteractable = function(_, v446)
            v391 = 0;
            v393 = v446;
            v388.SliderFrame.Selectable = v446;
            if v393 then
                v415();
                return ;
            else
                v413();
                return ;
            end;
        end;
        v388.SetZIndex = function(_, v448)
            v401.ZIndex = v448;
            v402.ZIndex = v448;
            v403.ZIndex = v448;
            v404.ZIndex = v448;
            for v449 = 1, #v388.Steps do
                v388.Steps[v449].ZIndex = v448;
            end;
        end;
        v388.SetMinStep = function(_, v451)
            if v451 >= 0 and v451 <= v389 then
                v385 = v451;
            end;
            if l_v384_0 <= v385 then
                l_v384_0 = v385;
                v401.Visible = false;
            end;
            if v389 <= l_v384_0 then
                l_v384_0 = v389;
                v402.Visible = false;
            end;
        end;
        v401.InputBegan:Connect(function(v452)
            v438(v452, l_v384_0 - 1, true);
        end);
        v401.InputEnded:Connect(function(v453)
            if v393 then
                local v454;
                if v453 then
                    v454 = true;
                    if v453.UserInputType ~= Enum.UserInputType.MouseButton1 then
                        v454 = true;
                        if v453.UserInputType ~= Enum.UserInputType.Touch then
                            v454 = false;
                            if v453.UserInputType == Enum.UserInputType.Gamepad1 then
                                v454 = v453.KeyCode == Enum.KeyCode.ButtonA;
                            end;
                        end;
                    end;
                else
                    v454 = false;
                end;
                if v454 then
                    v391 = 0;
                    return ;
                else
                    return ;
                end;
            else
                return ;
            end;
        end);
        v402.InputBegan:Connect(function(v455)
            v438(v455, l_v384_0 + 1, true);
        end);
        v402.InputEnded:Connect(function(v456)
            if v393 then
                local v457;
                if v456 then
                    v457 = true;
                    if v456.UserInputType ~= Enum.UserInputType.MouseButton1 then
                        v457 = true;
                        if v456.UserInputType ~= Enum.UserInputType.Touch then
                            v457 = false;
                            if v456.UserInputType == Enum.UserInputType.Gamepad1 then
                                v457 = v456.KeyCode == Enum.KeyCode.ButtonA;
                            end;
                        end;
                    end;
                else
                    v457 = false;
                end;
                if v457 then
                    v391 = 0;
                    return ;
                else
                    return ;
                end;
            else
                return ;
            end;
        end);
        local function v461(v458)
            if v458 ~= "VREnabled" then
                return ;
            elseif not l_VRService_0.VREnabled then
                v401.Selectable = false;
                v402.Selectable = false;
                v388.SliderFrame.Selectable = v393;
                for v459 = 1, v389 do
                    v388.Steps[v459].Selectable = false;
                    v388.Steps[v459].Active = false;
                end;
                return ;
            else
                v401.Selectable = v393;
                v402.Selectable = v393;
                v388.SliderFrame.Selectable = v393;
                for v460 = 1, v389 do
                    v388.Steps[v460].Selectable = v393;
                    v388.Steps[v460].Active = v393;
                end;
                return ;
            end;
        end;
        l_VRService_0.Changed:Connect(v461);
        v461("VREnabled");
        for v462 = 1, v389 do
            v388.Steps[v462].InputBegan:Connect(function(v463)
                v438(v463, v462);
            end);
            v388.Steps[v462].InputEnded:Connect(function(v464)
                if v393 then
                    local v465;
                    if v464 then
                        v465 = true;
                        if v464.UserInputType ~= Enum.UserInputType.MouseButton1 then
                            v465 = true;
                            if v464.UserInputType ~= Enum.UserInputType.Touch then
                                v465 = false;
                                if v464.UserInputType == Enum.UserInputType.Gamepad1 then
                                    v465 = v464.KeyCode == Enum.KeyCode.ButtonA;
                                end;
                            end;
                        end;
                    else
                        v465 = false;
                    end;
                    if v465 then
                        v391 = 0;
                        return ;
                    else
                        return ;
                    end;
                else
                    return ;
                end;
            end);
        end;
        v388.SliderFrame.InputBegan:Connect(function(v466)
            if l_VRService_0.VREnabled then
                local l_SelectedCoreObject_1 = l_GuiService_0.SelectedCoreObject;
                if not (l_SelectedCoreObject_1 and l_SelectedCoreObject_1:IsDescendantOf(v388.SliderFrame.Parent)) then
                    return ;
                end;
            end;
            v438(v466, l_v384_0);
        end);
        v388.SliderFrame.InputEnded:Connect(function(v468)
            if l_VRService_0.VREnabled then
                local l_SelectedCoreObject_2 = l_GuiService_0.SelectedCoreObject;
                if not (l_SelectedCoreObject_2 and l_SelectedCoreObject_2:IsDescendantOf(v388.SliderFrame.Parent)) then
                    return ;
                end;
            end;
            if v393 then
                local v470;
                if v468 then
                    v470 = true;
                    if v468.UserInputType ~= Enum.UserInputType.MouseButton1 then
                        v470 = true;
                        if v468.UserInputType ~= Enum.UserInputType.Touch then
                            v470 = false;
                            if v468.UserInputType == Enum.UserInputType.Gamepad1 then
                                v470 = v468.KeyCode == Enum.KeyCode.ButtonA;
                            end;
                        end;
                    end;
                else
                    v470 = false;
                end;
                if v470 then
                    v391 = 0;
                    return ;
                else
                    return ;
                end;
            else
                return ;
            end;
        end);
        local function v471()
            if v392 == nil then
                return ;
            else
                if tick() - v392 >= 0.2 then
                    v420(l_v384_0 + v391);
                end;
                return ;
            end;
        end;
        local v472 = true;
        local v473 = {
            [Enum.KeyCode.Thumbstick1] = true, 
            [Enum.KeyCode.DPadLeft] = -1, 
            [Enum.KeyCode.DPadRight] = 1, 
            [Enum.KeyCode.Left] = -1, 
            [Enum.KeyCode.Right] = 1, 
            [Enum.KeyCode.A] = -1, 
            [Enum.KeyCode.D] = 1, 
            [Enum.KeyCode.ButtonA] = true
        };
        l_UserInputService_0.InputBegan:Connect(function(v474)
            if v393 then
                if v472 then
                    if v474.UserInputType ~= Enum.UserInputType.Gamepad1 and v474.UserInputType ~= Enum.UserInputType.Keyboard then
                        return ;
                    else
                        local l_SelectedCoreObject_3 = l_GuiService_0.SelectedCoreObject;
                        if l_SelectedCoreObject_3 and l_SelectedCoreObject_3:IsDescendantOf(v388.SliderFrame.Parent) then
                            if v473[v474.KeyCode] == -1 then
                                v391 = -1;
                                v420(l_v384_0 - 1);
                                return ;
                            else
                                if v473[v474.KeyCode] == 1 then
                                    v391 = 1;
                                    v420(l_v384_0 + 1);
                                end;
                                return ;
                            end;
                        else
                            return ;
                        end;
                    end;
                else
                    return ;
                end;
            else
                return ;
            end;
        end);
        l_UserInputService_0.InputEnded:Connect(function(v476)
            if v393 then
                if v476.UserInputType ~= Enum.UserInputType.Gamepad1 and v476.UserInputType ~= Enum.UserInputType.Keyboard then
                    return ;
                else
                    local l_SelectedCoreObject_4 = l_GuiService_0.SelectedCoreObject;
                    if l_SelectedCoreObject_4 and l_SelectedCoreObject_4:IsDescendantOf(v388.SliderFrame.Parent) then
                        if v473[v476.KeyCode] then
                            v391 = 0;
                        end;
                        return ;
                    else
                        return ;
                    end;
                end;
            else
                return ;
            end;
        end);
        l_UserInputService_0.InputChanged:Connect(function(v478)
            if v393 then
                if v472 then
                    if v478.UserInputType ~= Enum.UserInputType.Gamepad1 then
                        return ;
                    else
                        local l_SelectedCoreObject_5 = l_GuiService_0.SelectedCoreObject;
                        if l_SelectedCoreObject_5 and l_SelectedCoreObject_5:IsDescendantOf(v388.SliderFrame.Parent) then
                            if v478.KeyCode ~= Enum.KeyCode.Thumbstick1 then
                                return ;
                            elseif (v478.Position.X > 0.8 and v478.Delta.X > 0) and v391 ~= 1 then
                                v391 = 1;
                                v420(l_v384_0 + 1);
                                return ;
                            elseif (v478.Position.X < -0.8 and v478.Delta.X < 0) and v391 ~= -1 then
                                v391 = -1;
                                v420(l_v384_0 - 1);
                                return ;
                            else
                                if math.abs(v478.Position.X) < 0.8 then
                                    v391 = 0;
                                end;
                                return ;
                            end;
                        else
                            return ;
                        end;
                    end;
                else
                    v391 = 0;
                    return ;
                end;
            else
                v391 = 0;
                return ;
            end;
        end);
        local v480 = false;
        l_GuiService_0.Changed:Connect(function(v481)
            if v481 ~= "SelectedCoreObject" then
                return ;
            else
                local l_SelectedCoreObject_6 = l_GuiService_0.SelectedCoreObject;
                if not (l_SelectedCoreObject_6 and l_SelectedCoreObject_6:IsDescendantOf(v388.SliderFrame.Parent)) then
                    v418(0.36);
                    if v480 then
                        v480 = false;
                        l_RunService_0:UnbindFromRenderStep(v394);
                    end;
                else
                    v418(0);
                    if not v480 then
                        v480 = true;
                        v392 = tick();
                        l_RunService_0:BindToRenderStep(v394, Enum.RenderPriority.Input.Value + 1, v471);
                        return ;
                    end;
                end;
                return ;
            end;
        end);
        v388.SliderFrame.AncestryChanged:Connect(function(_, v484)
            v472 = v484;
        end);
        v420(l_v384_0);
        return v388;
    end;
end;
local v486 = 50;
if v28 then
    v486 = 90;
end;
local v487 = {};
local function v535(v488, v489, v490, v491, v492, v493, v494, v495, v496)
    local v497 = 0;
    local v498 = v490 ~= "TextBox";
    if v487[v488] then
        v497 = v487[v488];
    end;
    local v499 = nil;
    v499 = v35.Create("ImageButton")({
        Name = v489 .. "Frame", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png", 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(2, 2, 18, 18), 
        ImageTransparency = 1, 
        Active = false, 
        AutoButtonColor = false, 
        Size = UDim2.new(1, 0, 0, v486), 
        AutomaticSize = if (v494 or v495) or v496 then Enum.AutomaticSize.Y else nil, 
        Position = UDim2.new(0, 0, 0, v497), 
        ZIndex = 2, 
        Selectable = false, 
        SelectionImageObject = v37, 
        Parent = v488.Page
    });
    if v0.UIBloxThemeEnabled then
        v499.BackgroundColor3 = v0.color("RowFrameBackground");
        v35.Create("UICorner")({
            CornerRadius = v0.DefaultCornerRadius, 
            Parent = v499
        });
    end;
    v499.ImageColor3 = v499.BackgroundColor3;
    if not (not v499 or not v493) then
        v499.Position = UDim2.new(v499.Position.X.Scale, v499.Position.X.Offset, v499.Position.Y.Scale, v499.Position.Y.Offset + v493);
    end;
    local v500 = nil;
    local v501 = nil;
    if not v494 then
        v501 = v35.Create("TextLabel")({
            Name = v489 .. "Label", 
            Text = v489, 
            Font = v0.font(Enum.Font.SourceSansBold, "UtilityRow"), 
            TextSize = v0.textSize(16, "UtilityRow"), 
            TextColor3 = Color3.fromRGB(255, 255, 255), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 200, 1, 0), 
            Position = UDim2.new(0, 10, 0, 0), 
            ZIndex = 2, 
            Parent = v499
        });
    else
        v500 = v35.Create("Frame")({
            Name = v489 .. "RowLabelAndDescriptionFrame", 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 10, 0, 0), 
            Size = UDim2.new(0.4, -20, 0, 50), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Parent = v499
        });
        v501 = v35.Create("TextLabel")({
            Name = v489 .. "Label", 
            Text = v489, 
            Font = v0.font(Enum.Font.SourceSansBold, "UtilityRow"), 
            TextSize = v0.textSize(16, "UtilityRow"), 
            TextColor3 = Color3.fromRGB(255, 255, 255), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            ZIndex = 2, 
            Parent = v500, 
            LayoutOrder = 1
        });
        v35.Create("TextLabel")({
            Name = v489 .. "Description", 
            Text = v494, 
            Font = v0.font(Enum.Font.SourceSans, "UtilityRow"), 
            TextSize = v0.textSize(18, "UtilityRow"), 
            TextColor3 = Color3.fromRGB(255, 255, 255), 
            TextTransparency = 0.25, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            ZIndex = 2, 
            Parent = v500, 
            LayoutOrder = 2
        });
        v35.Create("UIListLayout")({
            Name = v489 .. "UIListLayout", 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 8), 
            Parent = v500
        });
        v35.Create("UIPadding")({
            Name = v489 .. "UIListLayout", 
            PaddingBottom = UDim.new(0, 10), 
            PaddingTop = UDim.new(0, 10), 
            Parent = v500
        });
    end;
    local l_UITextSizeConstraint_0 = Instance.new("UITextSizeConstraint");
    if not (not (v20 or v0.UIBloxThemeEnabled) and not v494) then
        if not v494 then
            v501.Size = UDim2.new(0.35, 0, 1, 0);
        end;
        v501.TextScaled = true;
        v501.TextWrapped = true;
        l_UITextSizeConstraint_0.Parent = v501;
        l_UITextSizeConstraint_0.MaxTextSize = v0.textSize(16, "UtilityRow");
    end;
    if not v498 then
        v501.Text = "";
    end;
    local function v505(_, v504)
        if not v504 then
            v501.TextSize = not not v28 and v0.textSize(36) or v0.textSize(24, "UtilityText");
        else
            v501.TextSize = v0.textSize(16, "UtilityRow");
        end;
        l_UITextSizeConstraint_0.MaxTextSize = v501.TextSize;
    end;
    local l_v505_0 = v505;
    local v507 = v82();
    local v508 = v82();
    l_v505_0(v507, v508.X < v508.Y);
    v36[v499] = v505;
    v507 = v505;
    local v509 = v82();
    local v510 = v82();
    v507(v509, v510.X < v510.Y);
    l_v505_0 = nil;
    v507 = nil;
    if v490 == "Slider" then
        v507 = v485(v491, v492, nil, v495, v496);
        v507.SliderFrame.Parent = v499;
        l_v505_0 = v507.SliderFrame;
    elseif v490 == "Selector" then
        v507 = v359(v491, v492);
        v507.SelectorFrame.Parent = v499;
        l_v505_0 = v507.SelectorFrame;
    elseif v490 == "DropDown" then
        v507 = v286(v491, v492, v488.HubRef);
        v507.DropDownFrame.Parent = v499;
        l_v505_0 = v507.DropDownFrame;
    elseif v490 == "TextBox" then
        v509 = v35.Create("ImageLabel")({
            Image = "", 
            BackgroundTransparency = 1
        });
        v507 = {
            HubRef = nil
        };
        v508 = v35.Create("TextBox")({
            AnchorPoint = Vector2.new(1, 0.5), 
            Size = UDim2.new(0.6, 0, 1, 0), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            Text = v489, 
            TextColor3 = Color3.fromRGB(49, 49, 49), 
            BackgroundTransparency = v0.transparency("ControlInputBackground", 0.5), 
            BorderSizePixel = 0, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            Font = v0.font(Enum.Font.SourceSans, "UtilityText"), 
            TextSize = v0.textSize(24, "UtilityText"), 
            ZIndex = 2, 
            SelectionImageObject = v509, 
            ClearTextOnFocus = false, 
            Parent = v499
        });
        l_v505_0 = v508;
        v508.Focused:Connect(function()
            if if not l_VRService_0.VREnabled then not l_UserInputService_0.TouchEnabled or (l_UserInputService_0.GamepadEnabled and true or false) else false then
                l_GuiService_0.SelectedCoreObject = v508;
            end;
            if v508.Text == v489 then
                v508.Text = "";
            end;
        end);
        if v493 then
            v508.Position = UDim2.new(v508.Position.X.Scale, v508.Position.X.Offset, v508.Position.Y.Scale, v508.Position.Y.Offset + v493);
        end;
        l_v505_0.SelectionGained:Connect(function()
            if if not l_VRService_0.VREnabled then not l_UserInputService_0.TouchEnabled or (l_UserInputService_0.GamepadEnabled and true or false) else false then
                v508.BackgroundTransparency = v0.transparency("ControlInputBackground", 0.1);
                if v507.HubRef then
                    v507.HubRef:ScrollToFrame(l_v505_0);
                end;
            end;
        end);
        l_v505_0.SelectionLost:Connect(function()
            if if not l_VRService_0.VREnabled then not l_UserInputService_0.TouchEnabled or (l_UserInputService_0.GamepadEnabled and true or false) else false then
                v508.BackgroundTransparency = v0.transparency("ControlInputBackground", 0.5);
            end;
        end);
        v510 = function()
            local l_DropDownFullscreenFrame_0 = l_CoreGui_0.RobloxGui:FindFirstChild("DropDownFullscreenFrame");
            if not l_DropDownFullscreenFrame_0 or not l_DropDownFullscreenFrame_0.Visible then
                local l_l_v505_0_0 = l_v505_0;
                if not ((not (not (not l_l_v505_0_0 or not l_l_v505_0_0.Visible) and l_l_v505_0_0.ZIndex > 1) or not if not l_VRService_0.VREnabled then not l_UserInputService_0.TouchEnabled or (l_UserInputService_0.GamepadEnabled and true or false) else false) or not v488.Active) then
                    l_GuiService_0.SelectedCoreObject = l_l_v505_0_0;
                end;
                return ;
            else
                return ;
            end;
        end;
        local function v514(v513)
            if (v513.UserInputState == Enum.UserInputState.Begin and v513.KeyCode == Enum.KeyCode.Return) and l_GuiService_0.SelectedCoreObject == l_v505_0 then
                v508:CaptureFocus();
            end;
        end;
        v508.MouseEnter:Connect(v510);
        l_UserInputService_0.InputBegan:Connect(v514);
    elseif v490 == "TextEntry" then
        v509 = v35.Create("ImageLabel")({
            Image = "", 
            BackgroundTransparency = 1
        });
        v507 = {
            HubRef = nil
        };
        v508 = v35.Create("TextBox")({
            AnchorPoint = Vector2.new(1, 0.5), 
            Size = UDim2.new(0.4, -10, 0, 40), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            Text = v489, 
            TextColor3 = Color3.fromRGB(178, 178, 178), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextWrapped = false, 
            Font = v0.font(Enum.Font.SourceSans, "UtilityText"), 
            TextSize = v0.textSize(24, "UtilityText"), 
            ZIndex = 2, 
            SelectionImageObject = v509, 
            ClearTextOnFocus = false, 
            Parent = v499
        });
        l_v505_0 = v508;
        v508.Focused:Connect(function()
            if if not l_VRService_0.VREnabled then not l_UserInputService_0.TouchEnabled or (l_UserInputService_0.GamepadEnabled and true or false) else false then
                l_GuiService_0.SelectedCoreObject = v508;
            end;
            if v508.Text == v489 then
                v508.Text = "";
            end;
        end);
        if v493 then
            v508.Position = UDim2.new(v508.Position.X.Scale, v508.Position.X.Offset, v508.Position.Y.Scale, v508.Position.Y.Offset + v493);
        end;
        l_v505_0.SelectionGained:Connect(function()
            if if not l_VRService_0.VREnabled then not l_UserInputService_0.TouchEnabled or (l_UserInputService_0.GamepadEnabled and true or false) else false then
                v508.BackgroundTransparency = 0.8;
                if v507.HubRef then
                    v507.HubRef:ScrollToFrame(l_v505_0);
                end;
            end;
        end);
        l_v505_0.SelectionLost:Connect(function()
            if if not l_VRService_0.VREnabled then not l_UserInputService_0.TouchEnabled or (l_UserInputService_0.GamepadEnabled and true or false) else false then
                v508.BackgroundTransparency = 1;
            end;
        end);
        v510 = function()
            local l_DropDownFullscreenFrame_1 = l_CoreGui_0.RobloxGui:FindFirstChild("DropDownFullscreenFrame");
            if not l_DropDownFullscreenFrame_1 or not l_DropDownFullscreenFrame_1.Visible then
                local l_l_v505_0_1 = l_v505_0;
                if not ((not (not (not l_l_v505_0_1 or not l_l_v505_0_1.Visible) and l_l_v505_0_1.ZIndex > 1) or not if not l_VRService_0.VREnabled then not l_UserInputService_0.TouchEnabled or (l_UserInputService_0.GamepadEnabled and true or false) else false) or not v488.Active) then
                    l_GuiService_0.SelectedCoreObject = l_l_v505_0_1;
                end;
                return ;
            else
                return ;
            end;
        end;
        local function v518(v517)
            if (v517.UserInputState == Enum.UserInputState.Begin and v517.KeyCode == Enum.KeyCode.Return) and l_GuiService_0.SelectedCoreObject == l_v505_0 then
                v508:CaptureFocus();
            end;
        end;
        v499.MouseEnter:Connect(v510);
        v507.SetZIndex = function(_, v520)
            v508.ZIndex = v520;
        end;
        v507.SetInteractable = function(_, v522)
            v508.Selectable = v522;
            if v522 then
                v508.TextColor3 = Color3.fromRGB(178, 178, 178);
                v508.ZIndex = 2;
                return ;
            else
                v508.TextColor3 = Color3.fromRGB(49, 49, 49);
                v508.ZIndex = 1;
                return ;
            end;
        end;
        v507.SetValue = function(_, v524)
            v508.Text = v524;
        end;
        local l_BindableEvent_4 = Instance.new("BindableEvent");
        l_BindableEvent_4.Name = "ValueChanged";
        v508.FocusLost:Connect(function()
            l_BindableEvent_4:Fire(v508.Text);
        end);
        v507.ValueChanged = l_BindableEvent_4.Event;
        l_UserInputService_0.InputBegan:Connect(v518);
    end;
    v507.Name = v489 .. "ValueChanger";
    v509 = v507.SetAutoLocalize;
    v507.SetAutoLocalize = function(v526, v527)
        v499.AutoLocalize = v527;
        if v509 then
            v509(v526, v527);
        end;
    end;
    v497 = v497 + v486;
    if v493 then
        v497 = v497 + v493;
    end;
    v487[v488] = v497;
    if v498 then
        v499.MouseEnter:Connect(function()
            local l_DropDownFullscreenFrame_2 = l_CoreGui_0.RobloxGui:FindFirstChild("DropDownFullscreenFrame");
            if not l_DropDownFullscreenFrame_2 or not l_DropDownFullscreenFrame_2.Visible then
                local v529 = ((v507.SliderFrame or v507.SliderFrame) or v507.DropDownFrame) or v507.SelectorFrame;
                if not ((not (not (not v529 or not v529.Visible) and v529.ZIndex > 1) or not if not l_VRService_0.VREnabled then not l_UserInputService_0.TouchEnabled or (l_UserInputService_0.GamepadEnabled and true or false) else false) or not v488.Active) then
                    l_GuiService_0.SelectedCoreObject = v529;
                end;
                return ;
            else
                return ;
            end;
        end);
        l_VRService_0.Changed:Connect(function(v530)
            if v530 == "VREnabled" then
                if not l_VRService_0.VREnabled then
                    v499.Selectable = false;
                    v499.Active = false;
                else
                    v499.Selectable = true;
                    v499.Active = true;
                    l_v505_0.Active = true;
                    l_GuiService_0.Changed:Connect(function(v531)
                        if v531 == "SelectedCoreObject" then
                            local l_SelectedCoreObject_7 = l_GuiService_0.SelectedCoreObject;
                            if not l_SelectedCoreObject_7 or l_SelectedCoreObject_7 ~= v499 and not l_SelectedCoreObject_7:IsDescendantOf(v499) then
                                v499.ImageTransparency = 1;
                                v499.BackgroundTransparency = 1;
                            else
                                v499.ImageTransparency = v0.transparency("RowFrameBackground", 0.5);
                                v499.BackgroundTransparency = 1;
                                return ;
                            end;
                        end;
                    end);
                    return ;
                end;
            end;
        end);
        if not l_VRService_0.VREnabled then
            v499.Selectable = false;
            v499.Active = false;
        else
            v499.Selectable = true;
            v499.Active = true;
            l_v505_0.Active = true;
            l_GuiService_0.Changed:Connect(function(v533)
                if v533 == "SelectedCoreObject" then
                    local l_SelectedCoreObject_8 = l_GuiService_0.SelectedCoreObject;
                    if not l_SelectedCoreObject_8 or l_SelectedCoreObject_8 ~= v499 and not l_SelectedCoreObject_8:IsDescendantOf(v499) then
                        v499.ImageTransparency = 1;
                        v499.BackgroundTransparency = 1;
                    else
                        v499.ImageTransparency = v0.transparency("RowFrameBackground", 0.5);
                        v499.BackgroundTransparency = 1;
                        return ;
                    end;
                end;
            end);
        end;
        l_v505_0.SelectionGained:Connect(function()
            if if not l_VRService_0.VREnabled then not l_UserInputService_0.TouchEnabled or (l_UserInputService_0.GamepadEnabled and true or false) else false then
                if not l_VRService_0.VREnabled then
                    v499.ImageTransparency = 1;
                    v499.BackgroundTransparency = v0.transparency("RowFrameBackground", 0.5);
                else
                    v499.ImageTransparency = 0.5;
                    v499.BackgroundTransparency = 1;
                end;
                if v507.HubRef then
                    v507.HubRef:ScrollToFrame(v499);
                end;
            end;
        end);
        l_v505_0.SelectionLost:Connect(function()
            if if not l_VRService_0.VREnabled then not l_UserInputService_0.TouchEnabled or (l_UserInputService_0.GamepadEnabled and true or false) else false then
                v499.ImageTransparency = 1;
                v499.BackgroundTransparency = 1;
            end;
        end);
    end;
    v488:AddRow(v499, v501, v507, v493, false);
    v507.Selection = l_v505_0;
    return v499, v501, v507;
end;
local function v550(v536, v537, v538, v539, v540)
    local v541 = 0;
    if v487[v536] then
        v541 = v487[v536];
    end;
    local v542 = v35.Create("ImageButton")({
        Name = v537 .. "Frame", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png", 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(10, 10, 10, 10), 
        ImageTransparency = 1, 
        Active = false, 
        AutoButtonColor = false, 
        Size = UDim2.new(1, 0, 0, v486), 
        Position = UDim2.new(0, 0, 0, v541), 
        ZIndex = 2, 
        Selectable = false, 
        SelectionImageObject = v37, 
        Parent = v536.Page
    });
    if v0.UIBloxThemeEnabled then
        v542.BackgroundColor3 = v0.color("RowFrameBackground");
        v35.Create("UICorner")({
            CornerRadius = v0.DefaultCornerRadius, 
            Parent = v542
        });
    end;
    v542.ImageColor3 = v542.BackgroundColor3;
    v542.SelectionGained:Connect(function()
        v542.BackgroundTransparency = v0.transparency("RowFrameBackground", 0.5);
    end);
    v542.SelectionLost:Connect(function()
        v542.BackgroundTransparency = 1;
    end);
    local v543 = v35.Create("TextLabel")({
        Name = v537 .. "Label", 
        Text = v537, 
        Font = v0.font(Enum.Font.SourceSansBold, "UtilityRow"), 
        TextSize = v0.textSize(16, "UtilityRow"), 
        TextColor3 = Color3.fromRGB(255, 255, 255), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextWrapped = v540, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 200, 1, 0), 
        Position = UDim2.new(0, 10, 0, 0), 
        ZIndex = 2, 
        Parent = v542
    });
    local function v546(_, v545)
        if v540 then
            v543.Size = UDim2.new(1 - v538.Size.X.Scale, -v538.Size.X.Offset, 1, 0);
        end;
        if not v545 then
            v543.TextSize = not not v28 and v0.textSize(36) or v0.textSize(24, "UtilityText");
            return ;
        else
            v543.TextSize = v0.textSize(16, "UtilityRow");
            return ;
        end;
    end;
    v36[v542] = v546;
    local l_v546_0 = v546;
    local v548 = v82();
    local v549 = v82();
    l_v546_0(v548, v549.X < v549.Y);
    if v539 then
        v542.Position = UDim2.new(v542.Position.X.Scale, v542.Position.X.Offset, v542.Position.Y.Scale, v542.Position.Y.Offset + v539);
    end;
    v541 = v541 + v486;
    if v539 then
        v541 = v541 + v539;
    end;
    v487[v536] = v541;
    v542.MouseEnter:Connect(function()
        if v542.Visible then
            l_GuiService_0.SelectedCoreObject = v542;
        end;
    end);
    v538.SelectionImageObject = v37;
    v538.SelectionGained:Connect(function()
        if not l_VRService_0.VREnabled then
            v542.ImageTransparency = 1;
            v542.BackgroundTransparency = v0.transparency("RowFrameBackground", 0.5);
            return ;
        else
            v542.ImageTransparency = v0.transparency("RowFrameBackground", 0.5);
            v542.BackgroundTransparency = 1;
            return ;
        end;
    end);
    v538.SelectionLost:Connect(function()
        v542.ImageTransparency = 1;
        v542.BackgroundTransparency = 1;
    end);
    v538.Parent = v542;
    v536:AddRow(v542, v543, v538, v539, true);
    return v542;
end;
local v653 = {
    Create = function(_, v552)
        return function(v553)
            local v554 = Instance.new(v552);
            local v555 = nil;
            for v556, v557 in pairs(v553) do
                if type(v556) == "number" then
                    v557.Parent = v554;
                elseif v556 == "Parent" then
                    v555 = v557;
                else
                    v554[v556] = v557;
                end;
            end;
            if v555 then
                v554.Parent = v555;
            end;
            return v554;
        end;
    end, 
    RayPlaneIntersection = function(_, v559, v560, v561)
        v560 = v560.unit;
        v559 = v559.Unit;
        local v562 = v560:Dot(v559.Direction);
        if v562 == 0 then
            return nil;
        else
            local v563 = v560:Dot(v561 - v559.Origin) / v562;
            if v563 < 0 then
                return nil;
            else
                return v559.Origin + v559.Direction * v563;
            end;
        end;
    end, 
    GetEaseLinear = function(_)
        return v45;
    end, 
    GetEaseOutQuad = function(_)
        return v50;
    end, 
    GetEaseInOutQuad = function(_)
        return v55;
    end, 
    CreateNewSlider = function(_, v568, v569, v570, v571, v572)
        return v485(v568, v569, v570, v571, v572);
    end, 
    CreateNewSelector = function(_, v574, v575)
        return (v359(v574, v575));
    end, 
    CreateNewDropDown = function(_, v577, v578)
        return (v286(v577, v578, nil));
    end, 
    AddNewRow = function(_, v580, v581, v582, v583, v584, v585, v586, v587, v588)
        return v535(v580, v581, v582, v583, v584, v585, v586, v587, v588);
    end, 
    AddNewRowObject = function(_, v590, v591, v592, v593, v594)
        return (v550(v590, v591, v592, v593, v594));
    end, 
    ShowAlert = function(_, v596, v597, v598, v599, v600)
        v382(v596, v597, v598, v599, v600);
    end, 
    IsSmallTouchScreen = function(_)
        local v602 = v82();
        local l_TouchEnabled_2 = l_UserInputService_0.TouchEnabled;
        if l_TouchEnabled_2 then
            l_TouchEnabled_2 = true;
            if v602.Y >= 500 then
                l_TouchEnabled_2 = v602.X < 700;
            end;
        end;
        return l_TouchEnabled_2;
    end, 
    IsPortrait = function(_)
        local v605 = v82();
        return v605.X < v605.Y;
    end, 
    MakeIconButton = function(_, v607, v608, v609, v610, v611, v612, v613)
        return (v158(v607, v608, v609, v610, v611, v612, v613));
    end, 
    MakeStyledButton = function(_, v615, v616, v617, v618, v619, v620)
        return v171(v615, v616, v617, v618, v619, v620);
    end, 
    MakeStyledImageButton = function(_, v622, v623, v624, v625, v626, v627, v628, v629)
        return v185(v622, v623, v624, v625, v626, v627, v628, v629);
    end, 
    AddButtonRow = function(_, v631, v632, v633, v634, v635, v636)
        return v196(v631, v632, v633, v634, v635, v636);
    end, 
    MakeFocusState = function(_, v638, v639)
        return v208(v638, v639);
    end, 
    CreateSignal = function(_)
        return (v81());
    end, 
    UsesSelectedObject = function(_)
        if not l_VRService_0.VREnabled then
            if not l_UserInputService_0.TouchEnabled or l_UserInputService_0.GamepadEnabled then
                return true;
            else
                return false;
            end;
        else
            return false;
        end;
    end, 
    TweenProperty = function(_, v643, v644, v645, v646, v647, v648, v649)
        return PropertyTweener(v643, v644, v645, v646, v647, v648, v649);
    end, 
    OnResized = function(_, v651, v652)
        return v102(v651, v652);
    end
};
v653.FireOnResized = function(_)
    local v655 = v82();
    local v656 = v653:IsPortrait();
    for _, v658 in pairs(v36) do
        v658(v655, v656);
    end;
end;
v653.Lerp = function(_, v660, v661, v662)
    return (1 - v660) * v661 + v660 * v662;
end;
v653.Round = function(_, v664)
    return v664 % 1 >= 0.5 and math.ceil(v664) or math.floor(v664);
end;
v653.IsExperienceOlderThanOneWeek = function(_, v666)
    if (v666 ~= nil and v666.Created ~= nil) and l_Workspace_0:GetServerTimeNow() * 1000 - DateTime.fromIsoDate(v666.Created).UnixTimestampMillis > 604800000 then
        return true;
    else
        return false;
    end;
end;
return v653;
