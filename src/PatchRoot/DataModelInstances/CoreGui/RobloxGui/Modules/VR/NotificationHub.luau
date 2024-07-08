local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v3 = require(l_RobloxGui_0.Modules.VR.Panel3D);
local v4 = require(l_RobloxGui_0.Modules.VR.VRHub);
local _ = (CFrame.Angles(-0.08726646259971647, 0, 0) * CFrame.new(0, 4, 0)) * CFrame.Angles(-0.2617993877991494, 0, 0);
local v6 = Color3.new(0.3058823529411765, 0.32941176470588235, 0.3764705882352941);
local v7 = Color3.new(0.3215686274509804, 0.396078431372549, 0.5529411764705883);
local v8 = Color3.new(0.0784313725490196, 0.0784313725490196, 0.0784313725490196);
local v9 = Color3.new(0.2, 0.2, 0.2);
local v10 = v2:Create("ImageLabel")({
    BackgroundTransparency = 1, 
    Image = ""
});
local v11 = Color3.new(1, 1, 1);
local v12 = {
    ModuleName = "Notifications", 
    KeepVRTopbarOpen = true, 
    VRIsExclusive = true, 
    VRClosesNonExclusive = true, 
    UnreadCountChanged = function(...)
    end, 
    SetVisible = nil
};
v4:RegisterModule(v12);
local v13 = v3.Get("Notifications");
local v14 = nil;
local v15 = v3.Get("NotificationDetails");
local v16 = nil;
local function _()
    return false;
end;
local v18 = {};
local v19 = {};
local v20 = {
    __index = v18
};
local l_v19_0 = v19 --[[ copy: 20 -> 33 ]];
local l_v20_0 = v20 --[[ copy: 21 -> 34 ]];
v18.new = function(v23, v24, v25)
    local v26 = {};
    table.insert(l_v19_0, v26);
    v26.zeroCF = v23.localCF;
    v26.zOffset = 0;
    v26.isPopping = false;
    v26.isAnimating = false;
    v26.tweener = nil;
    v26.panel = v23;
    v26.SetPopOut = nil;
    v26.panel.OnMouseEnter = function()
        for _, v28 in pairs(l_v19_0) do
            if v28 ~= v26 then
                v28:SetPopOut(false);
            end;
        end;
        v26:SetPopOut(true);
    end;
    v26.titlebar = v2:Create("ImageLabel")({
        Parent = v24, 
        Name = "TitlebarBackground", 
        Position = UDim2.new(0, -1, 0, -1), 
        Size = UDim2.new(1, 2, 0, 74), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png", 
        ImageColor3 = v6, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(10, 10, 10, 10)
    });
    v26.titleText = v2:Create("TextLabel")({
        Parent = v26.titlebar, 
        Name = "TitleText", 
        Position = UDim2.new(0, 1, 0, 1), 
        Size = UDim2.new(1, -2, 1, -2), 
        Text = v25, 
        TextColor3 = v11, 
        Font = Enum.Font.SourceSans, 
        FontSize = Enum.FontSize.Size36, 
        BackgroundTransparency = 1
    });
    v26.content = v2:Create("ImageLabel")({
        Parent = v24, 
        Name = "ContentFrame", 
        Position = UDim2.new(0, -1, 0, 74), 
        Size = UDim2.new(1, 2, 1, -76), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png", 
        ImageColor3 = v8, 
        ImageTransparency = 0.5, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(10, 10, 10, 10)
    });
    return (setmetatable(v26, l_v20_0));
end;
v18.SetTitle = function(v29, v30)
    v29.titleText.Text = v30;
end;
v18.AddCloseButton = function(v31, v32)
    v31.closeButton = v2:Create("ImageButton")({
        Parent = v31.titlebar, 
        Name = "CloseButton", 
        Position = UDim2.new(0, 22, 0, 22), 
        Size = UDim2.new(0, 32, 0, 32), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Keyboard/close_button_icon.png", 
        SelectionImageObject = v2:Create("ImageButton")({
            Name = "CloseButtonHover", 
            Position = UDim2.new(0, -11, 0, -11), 
            Size = UDim2.new(1, 22, 1, 22), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png"
        })
    });
    v31.closeButton.MouseButton1Click:connect(v32);
end;
v18.TweenZOffsetTo = function(v33, v34, v35, v36, v37)
    if not (not v33.tweener or v33.tweener:IsFinished()) then
        v33.tweener:Cancel();
    end;
    v33.tweener = v2:TweenProperty(v33, "zOffset", v33.zOffset, v34, v35, v36, v37);
end;
v18.AnimateOut = function(v38, v39)
    v38.isAnimating = true;
    v38:TweenZOffsetTo(-100, 0.25, v2:GetEaseInOutQuad(), function()
        if v39 then
            v39();
        end;
        v38.isAnimating = false;
    end);
end;
v18.AnimateIn = function(v40, v41)
    v40.zOffset = -100;
    v40:OnUpdate(0);
    v40.isAnimating = true;
    v40:TweenZOffsetTo(0, 0.25, v2:GetEaseInOutQuad(), function()
        if v41 then
            v41();
        end;
        v40.isAnimating = false;
    end);
end;
v18.SetPopOut = function(v42, v43)
    if not v42.isAnimating then
        if not v43 then
            v42.isPopping = true;
            v42:TweenZOffsetTo(0, 0.25, v2:GetEaseInOutQuad(), function()
                v42.isPopping = false;
            end);
            return ;
        else
            v42.isPopping = true;
            v42:TweenZOffsetTo(0.25, 0.25, v2:GetEaseInOutQuad(), function()
                v42.isPopping = false;
            end);
            return ;
        end;
    else
        return ;
    end;
end;
v18.OnUpdate = function(v44, _)
    v44.panel.localCF = v44.zeroCF * CFrame.new(0, 0, v44.zOffset);
    v44.panel.needsLocalPositionUpdate = v44.isAnimating or v44.isPopping;
    if v44.isPopping then
        v44.titlebar.ImageColor3 = v6:lerp(v7, (math.max(0, (math.min(1, v44.zOffset / 0.25)))));
    end;
end;
v13:SetType(v3.Type.Standard);
v13:SetVisible(false);
v13:SetCanFade(false);
v13:ResizeStuds(2.277333324, 3.5, 150);
v14 = v18.new(v13, v2:Create("TextButton")({
    Parent = v13:GetGUI(), 
    Name = "NotificationsListFrame", 
    Position = UDim2.new(0, 0, 0, 0), 
    Size = UDim2.new(1, -4, 1, 0), 
    BackgroundTransparency = 1, 
    Text = "", 
    Selectable = true, 
    SelectionImageObject = v10
}), "Notifications");
v14:AddCloseButton(function()
    v12:SetVisible(false);
end);
v13.OnUpdate = function(_, v47)
    v14:OnUpdate(v47);
end;
v15:SetType(v3.Type.Standard);
v15:SetVisible(false);
v15:SetCanFade(false);
v15:ResizeStuds(3.4159999859999997, 3.5, 150);
v16 = v18.new(v15, v2:Create("TextButton")({
    Parent = v15:GetGUI(), 
    Name = "NotificationsDetailFrame", 
    Position = UDim2.new(0, 0, 0, 0), 
    Size = UDim2.new(1, 0, 1, 0), 
    BackgroundTransparency = 1, 
    Text = "", 
    Selectable = true, 
    SelectionImageObject = v10
}), "Friend Requests");
v15.OnUpdate = function(_, v49)
    v16:OnUpdate(v49);
end;
v19 = {};
v20 = {};
local function v52(v50, v51)
    return v50.order < v51.order;
end;
local v53 = nil;
local function v68()
    local v54 = 20;
    for _, v56 in ipairs(v20) do
        if #v56.notifications > 0 then
            local v57 = 80 + 20 * (math.min(3, #v56.notifications) - 1);
            v56.frame.Position = UDim2.new(0.07500000000000001, 0, 0, v54);
            v56.frame.Size = UDim2.new(0.85, -40, 0, v57);
            v54 = (v54 + v57) + 20;
            if v56.notificationsDirty then
                v56.notificationsDirty = false;
                local v58 = 0;
                local v59 = 0;
                local v60 = #v56.notifications;
                if v60 > 0 then
                    local v61 = math.max(1, (v60 - 3) + 1);
                    for v62 = 1, v60 do
                        local v63 = v56.notifications[v62];
                        if v61 <= v62 then
                            v63.frame.Visible = true;
                            v63.frame.Position = UDim2.new(0, v58, 0, v58);
                            v58 = v58 + 20;
                            local _ = v13:SetSubpanelDepth(v63.frame, v59);
                            v59 = v59 + 0.25;
                        else
                            v63.frame.Visible = false;
                        end;
                    end;
                    if v53 == v56 then
                        v61 = math.max(1, (v60 - 2) + 1);
                        local v65 = 0;
                        for v66 = 1, v60 do
                            local v67 = v56.notifications[v66];
                            if v61 <= v66 then
                                v67.detailsFrame.Visible = true;
                                v67.detailsFrame.Position = UDim2.new(0, 20, v65, 20);
                                v67.detailsFrame.Size = UDim2.new(1, -40, 0.5, -40);
                                v65 = v65 + 0.5;
                            else
                                v67.detailsFrame.Visible = false;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
local v69 = {};
local v70 = {
    __index = v69
};
local l_v70_0 = v70 --[[ copy: 26 -> 35 ]];
v69.new = function(v72, v73, v74)
    local v75 = setmetatable({}, l_v70_0);
    v75.key = v72;
    v75.title = v73;
    v75.order = v74;
    v75.notifications = {};
    v75.notificationsDirty = false;
    v75.frame = v2:Create("Frame")({
        Parent = v14.content, 
        Name = "NotificationGroup", 
        BackgroundTransparency = 1
    });
    v75.detailsFrame = v2:Create("Frame")({
        Parent = nil, 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0)
    });
    v19[v72] = v75;
    table.insert(v20, v75);
    return v75;
end;
v69.Deactivate = function(v76)
    v76.detailsFrame.Parent = nil;
    for _, v78 in pairs(v76.detailsFrame:GetChildren()) do
        v15:RemoveSubpanel(v78);
    end;
end;
v69.SwitchTo = function(v79)
    v16:SetTitle(v79.title);
    for _, v81 in pairs(v19) do
        if v81 ~= v79 then
            v81:Deactivate();
        end;
    end;
    v79.detailsFrame.Parent = v16.content;
    v53 = v79;
    v79.notificationsDirty = true;
end;
v69.BringNotificationToFront = function(v82, v83)
    if v53 ~= v82 then
        v82:SwitchTo();
    end;
    if #v82.notifications ~= 0 and v83 == v82.notifications[#v82.notifications] then
        v68();
        return ;
    else
        for v84, v85 in ipairs(v82.notifications) do
            if v85 == v83 then
                table.remove(v82.notifications, v84);
                break;
            end;
        end;
        table.insert(v82.notifications, v83);
        v82.notificationsDirty = true;
        v68();
        return ;
    end;
end;
v69.RemoveNotification = function(v86, v87)
    for v88, v89 in ipairs(v86.notifications) do
        if v89 == v87 then
            table.remove(v86.notifications, v88);
            v13:RemoveSubpanel(v87.frame);
            v15:RemoveSubpanel(v87.detailsFrame);
            v87.detailsFrame:Destroy();
            v87.frame:Destroy();
            v86.notificationsDirty = true;
            v68();
            return ;
        end;
    end;
end;
v69.GetTopNotification = function(v90)
    local v91 = #v90.notifications;
    if v91 <= 0 then
        return nil;
    else
        return v90.notifications[v91];
    end;
end;
v69.new("Friends", "Friends", 1);
v69.new("BadgeAwards", "Badges", 2);
v69.new("PlayerPoints", "Points", 3);
if false then
    v69.new("Developer", "Other", 4);
end;
table.sort(v20, v52);
v70 = function(v92, ...)
    if v92 then
        if type(v92) == "function" then
            v92(...);
            return ;
        elseif not v92:IsA("BindableEvent") then
            if not v92:IsA("BindableFunction") then
                return ;
            else
                v92:Invoke(...);
                return ;
            end;
        else
            v92:Fire(...);
            return ;
        end;
    else
        return ;
    end;
end;
local v93 = {};
local v94 = {
    __index = v93
};
local l_v94_0 = v94 --[[ copy: 28 -> 36 ]];
v93.new = function(v96, v97)
    local v98 = setmetatable({}, l_v94_0);
    v98.group = v96;
    v98.frame = v2:Create("ImageButton")({
        Parent = v96.frame, 
        Size = UDim2.new(1, 0, 0, 80), 
        SelectionImageObject = v10, 
        BackgroundTransparency = 1
    });
    v98.frame.MouseButton1Click:connect(function()
        v98:OnClicked();
    end);
    v98.background = v2:Create("ImageLabel")({
        Parent = v98.frame, 
        Position = UDim2.new(0, -1, 0, -1), 
        Size = UDim2.new(1, 2, 1, 2), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/vr/rectBackgroundWhite.png", 
        ImageColor3 = v9, 
        ImageTransparency = 0.1, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(10, 10, 10, 10)
    });
    v98.imageBackground = v2:Create("ImageLabel")({
        Parent = v98.frame, 
        Position = UDim2.new(0, 5, 0, 5), 
        Size = UDim2.new(0, 70, 0, 70), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/VR/circleWhite.png", 
        ImageColor3 = v97.imgBackgroundColor or Color3.new(1, 1, 1)
    });
    v98.image = v2:Create("ImageLabel")({
        Parent = v98.imageBackground, 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Image = v97.Image
    });
    local l_Text_0 = v97.Text;
    if not (not v97.Title or not v97.Text) then
        l_Text_0 = ("%s\n%s"):format(v97.Title, v97.Text);
    end;
    v98.text = v2:Create("TextLabel")({
        Parent = v98.frame, 
        Position = UDim2.new(0, 80, 0, 0), 
        Size = UDim2.new(1, -80, 1, 0), 
        BackgroundTransparency = 1, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Text = l_Text_0, 
        TextWrapped = true, 
        Font = Enum.Font.SourceSans, 
        FontSize = Enum.FontSize.Size18, 
        TextColor3 = v11
    });
    v98.detailsFrame = v2:Create("Frame")({
        Parent = v96.detailsFrame, 
        BackgroundTransparency = 1
    });
    v98.detailsFrame.MouseEnter:connect(function()
        v15:SetSubpanelDepth(v98.detailsFrame, 0.25);
    end);
    v98.detailsFrame.MouseLeave:connect(function()
        v15:SetSubpanelDepth(v98.detailsFrame, 0);
    end);
    v98.detailsBackground = v2:Create("ImageLabel")({
        Parent = v98.detailsFrame, 
        Position = UDim2.new(0, -1, 0, -1), 
        Size = UDim2.new(1, 2, 1, 2), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png", 
        ImageColor3 = Color3.new(0.2, 0.2, 0.2), 
        ImageTransparency = 0.1, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(10, 10, 10, 10)
    });
    v98.detailsIconBackground = v2:Create("ImageLabel")({
        Parent = v98.detailsFrame, 
        Position = UDim2.new(0, 20, 0, 10), 
        Size = UDim2.new(0, 80, 0, 80), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/VR/circleWhite.png", 
        ImageColor3 = v97.imgBackgroundColor or Color3.new(1, 1, 1)
    });
    v98.detailsIcon = v2:Create("ImageLabel")({
        Parent = v98.detailsIconBackground, 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Image = v97.Image
    });
    v98.detailsText = v2:Create("TextLabel")({
        Parent = v98.detailsFrame, 
        Position = UDim2.new(0, 110, 0, 10), 
        Size = UDim2.new(1, -120, 0, 90), 
        BackgroundTransparency = 1, 
        Text = v97.DetailText or v97.Title, 
        TextWrapped = true, 
        TextColor3 = v11, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Font = Enum.Font.SourceSansBold, 
        FontSize = Enum.FontSize.Size36
    });
    local function v105(v100, v101, v102)
        local v103 = v2:Create("ImageButton")({
            Parent = v98.detailsFrame, 
            Position = UDim2.new(v100, 0, 0.55, 0), 
            Size = UDim2.new(v101, 0, 0.29, 0), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png", 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 6, 46, 44), 
            SelectionImageObject = v10
        });
        local v104 = v2:Create("TextLabel")({
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, -6), 
            BackgroundTransparency = 1, 
            Text = v102, 
            TextColor3 = v11, 
            Font = Enum.Font.SourceSansBold, 
            FontSize = Enum.FontSize.Size24
        });
        v104.Parent = v103;
        v103.SelectionGained:connect(function()
            v103.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png";
        end);
        v103.SelectionLost:connect(function()
            v103.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png";
        end);
        return v103, v104;
    end;
    if not v97.Button1Text or not v97.Button2Text then
        if not v97.button2Text then
            local v106, v107 = v105(0.07, 0.86, v97.Button1Text or "Dismiss");
            v98.detailsButton1 = v106;
            v98.detailsButton1Text = v107;
            v98.detailsButton1.MouseButton1Click:connect(function()
                v70(v97.Callback, v97.Button1Text);
                v98:Dismiss();
            end);
        end;
    else
        local v108, v109 = v105(0.07, 0.415, v97.Button1Text);
        v98.detailsButton1 = v108;
        v98.detailsButton1Text = v109;
        v108, v109 = v105(0.511, 0.415, v97.Button2Text);
        v98.detailsButton2 = v108;
        v98.detailsButton2Text = v109;
        v98.detailsButton1.MouseButton1Click:connect(function()
            v70(v97.Callback, v97.Button1Text);
            v98:Dismiss();
        end);
        v98.detailsButton2.MouseButton1Click:connect(function()
            v70(v97.Callback, v97.Button2Text);
            v98:Dismiss();
        end);
    end;
    table.insert(v96.notifications, v98);
    v96.notificationsDirty = true;
    v68();
    return v98;
end;
v93.OnClicked = function(v110)
    v110.group:SwitchTo();
    v68();
end;
v93.Dismiss = function(v111)
    v111.group:RemoveNotification(v111);
end;
v94 = {};
local v112 = false;
local v113 = 0;
do
    local l_v112_0, l_v113_0 = v112, v113;
    l_RobloxGui_0:WaitForChild("SendNotificationInfo").Event:connect(function(v116)
        local v117 = v116.GroupName and v19[v116.GroupName];
        if not v117 then
            if not false then
                return ;
            else
                v117 = v19.Developer;
            end;
        end;
        v93.new(v117, v116);
        if not l_v112_0 then
            l_v113_0 = l_v113_0 + 1;
            v12.UnreadCountChanged(l_v113_0);
        end;
    end);
    local function v121(_, v119, _)
        if v119 == Enum.UserInputState.Begin then
            v12:SetVisible(false);
        end;
    end;
    v12.VisibilityStateChanged = v2:Create("BindableEvent")({
        Name = "VisibilityStateChanged"
    });
    v12.GetNumberOfPendingNotifications = function(_)
        return #v94;
    end;
    v12.IsVisible = function(_)
        return l_v112_0;
    end;
    v12.SetVisible = function(_, v125)
        if l_v112_0 == v125 then
            return ;
        else
            l_v112_0 = v125;
            v3.Get("Topbar3D"):SetCanFade(not v125);
            if not v125 then
                spawn(function()
                    v14:AnimateOut(function()
                        v13:SetVisible(false);
                    end);
                    v16:AnimateOut(function()
                        v15:SetVisible(false);
                    end);
                end);
                l_ContextActionService_0:UnbindCoreAction("NotificationsMenuCloseShortcut");
                v4:FireModuleClosed(v12.ModuleName);
            else
                l_v113_0 = 0;
                v12.UnreadCountChanged(l_v113_0);
                v13.localCF = CFrame.new(-1.7079999929999998, 0, 0);
                v14.zeroCF = v13.localCF;
                v14:AnimateIn(nil);
                v15.localCF = CFrame.new(1.138666662, 0, 0);
                v16.zeroCF = v15.localCF;
                v16:AnimateIn(nil);
                v13:SetVisible(true);
                v15:SetVisible(true);
                l_ContextActionService_0:BindCoreAction("NotificationsMenuCloseShortcut", v121, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart);
                v4:FireModuleOpened(v12.ModuleName);
            end;
            v12.VisibilityStateChanged:Fire(v125);
            return ;
        end;
    end;
    v4.ModuleOpened.Event:connect(function(v126, _, _, _)
        if v126 ~= v12.ModuleName then
            v12:SetVisible(false);
        end;
    end);
end;
return v12;
