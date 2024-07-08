local l_BadgeService_0 = game:GetService("BadgeService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_PointsService_0 = game:GetService("PointsService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_TextService_0 = game:GetService("TextService");
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = game:GetService("ContextActionService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_VRService_0 = game:GetService("VRService");
local l_GroupService_0 = game:GetService("GroupService");
local l_TeleportService_0 = game:GetService("TeleportService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GameSettings_0 = UserSettings().GameSettings;
local v17 = require(l_RobloxGui_0.Modules.Flags.FFlagCoreScriptShowTeleportPrompt);
local l_status_0, l_result_0 = pcall(function()
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local _ = l_status_0 and l_result_0;
local v21 = game:DefineFastFlag("LogAcceptFriendshipEvent", false);
local v22 = require(l_RobloxGui_0.Modules.Flags.GetFixGraphicsQuality);
local v23 = require(l_RobloxGui_0.Modules.shouldSaveScreenshotToAlbum);
local l_RobloxTranslator_0 = require(l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("RobloxTranslator"));
local v25 = game:DefineFastFlag("NotificationsNoLongerRequireControllerState", false);
local function _(v26, v27)
    pcall(function()
        v27 = l_RobloxTranslator_0:FormatByKey(v26);
    end);
    return v27;
end;
local v29 = nil;
while not l_Players_0.LocalPlayer do
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
end;
v29 = l_Players_0.LocalPlayer;
local l_Parent_0 = script.Parent;
local v31 = {};
local v32 = {};
local v33 = {};
local v34 = {};
local l_Value_0 = l_GameSettings_0.SavedQualityLevel.Value;
local l_BindableEvent_0 = Instance.new("BindableEvent");
l_BindableEvent_0.Name = "SendNotificationInfo";
l_BindableEvent_0.Parent = l_RobloxGui_0;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local v37 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local v38 = true;
local v39 = true;
local l_SocialUtil_0 = require(l_RobloxGui_0.Modules:WaitForChild("SocialUtil"));
local v41 = require(l_RobloxGui_0.Modules.GameTranslator);
local v42 = require(l_RobloxGui_0.Modules.Common.PolicyService);
local v43 = 0.6 * l_GameSettings_0.PreferredTransparency;
local v44 = not v37 and 48 or 72;
local v45 = not v37 and 64 or 145;
local v46 = not v37 and 200 or 450;
local v47 = v44 / 6;
local v48 = not v37 and 18 or 42;
local v49 = not v37 and 36 or 84;
local v50 = -v48;
local v51 = not not v37 and Enum.FontSize.Size42 or Enum.FontSize.Size18;
local v52 = not v37 and 28 or 72;
local v53 = not v37 and 56 or 144;
local v54 = not not v37 and Enum.FontSize.Size36 or Enum.FontSize.Size14;
local v55 = v45 / 2;
local v56 = v47 / 2;
local v57 = not not v37 and Enum.FontSize.Size42 or Enum.FontSize.Size18;
local v58 = not v37 and 18 or 42;
local v59 = not v37 and 14 or 30;
local l_InOut_0 = Enum.EasingDirection.InOut;
local l_Sine_0 = Enum.EasingStyle.Sine;
local v62 = 5;
local l_status_1, l_result_1 = pcall(function()
    return (tonumber(settings():GetFVariable("FriendRequestNotificationThrottle")));
end);
if l_status_1 and l_result_1 ~= nil then
    v62 = l_result_1;
end;
l_StarterGui_0:RegisterSetCore("PointsNotificationsActive", function(v65)
    if type(v65) == "boolean" then
        v38 = v65;
    end;
end);
l_StarterGui_0:RegisterSetCore("BadgesNotificationsActive", function(v66)
    if type(v66) == "boolean" then
        v39 = v66;
    end;
end);
l_StarterGui_0:RegisterGetCore("PointsNotificationsActive", function()
    return v38;
end);
l_StarterGui_0:RegisterGetCore("BadgesNotificationsActive", function()
    return v39;
end);
local function _(v67, v68, v69, v70)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = v67;
    l_Frame_0.Size = v68;
    l_Frame_0.Position = v69;
    l_Frame_0.BackgroundTransparency = v70;
    return l_Frame_0;
end;
local function v78(v73, v74)
    local l_TextButton_0 = Instance.new("TextButton");
    l_TextButton_0.Name = v73;
    l_TextButton_0.Size = UDim2.new(0.5, -1, 0, v55);
    l_TextButton_0.Position = v74;
    l_TextButton_0.BackgroundTransparency = v43;
    l_TextButton_0.BackgroundColor3 = Color3.new(0, 0, 0);
    l_TextButton_0.BorderSizePixel = 0;
    l_TextButton_0.Font = Enum.Font.SourceSansBold;
    l_TextButton_0.FontSize = v57;
    l_TextButton_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextButton_0.TextTruncate = Enum.TextTruncate.AtEnd;
    l_TextButton_0.TextScaled = true;
    local l_UIPadding_0 = Instance.new("UIPadding");
    l_UIPadding_0.PaddingTop = UDim.new(0, v56 / 2);
    l_UIPadding_0.PaddingBottom = UDim.new(0, v56 / 2);
    l_UIPadding_0.PaddingLeft = UDim.new(0, v56);
    l_UIPadding_0.PaddingRight = UDim.new(0, v56);
    l_UIPadding_0.Parent = l_TextButton_0;
    local l_UITextSizeConstraint_0 = Instance.new("UITextSizeConstraint");
    l_UITextSizeConstraint_0.MaxTextSize = v58;
    l_UITextSizeConstraint_0.MinTextSize = v59;
    l_UITextSizeConstraint_0.Parent = l_TextButton_0;
    return l_TextButton_0;
end;
local v79 = UDim2.new(0, v46, 0.42, 0);
local v80 = UDim2.new(1, -v46 - 4, 0.5, 0);
local l_Frame_1 = Instance.new("Frame");
l_Frame_1.Name = "NotificationFrame";
l_Frame_1.Size = v79;
l_Frame_1.Position = v80;
l_Frame_1.BackgroundTransparency = 1;
local l_l_Frame_1_0 = l_Frame_1;
if not v17 then
    l_l_Frame_1_0.ZIndex = 2;
else
    l_l_Frame_1_0.ZIndex = 3;
end;
l_l_Frame_1_0.Parent = l_Parent_0;
v80 = (function()
    local v83 = UDim2.new(1, 0, 0, v45);
    local v84 = UDim2.new(0, 0, 0, 0);
    local l_v43_0 = v43;
    local l_Frame_2 = Instance.new("Frame");
    l_Frame_2.Name = "Notification";
    l_Frame_2.Size = v83;
    l_Frame_2.Position = v84;
    l_Frame_2.BackgroundTransparency = l_v43_0;
    local l_l_Frame_2_0 = l_Frame_2;
    l_l_Frame_2_0.BackgroundColor3 = Color3.new(0, 0, 0);
    l_l_Frame_2_0.BorderSizePixel = 0;
    return l_l_Frame_2_0;
end)();
l_Frame_1 = Instance.new("TextLabel");
l_Frame_1.Name = "NotificationTitle";
l_Frame_1.Size = UDim2.new(1, -v47 * 2, 0, v48);
l_Frame_1.Position = UDim2.new(0, v47, 0.5, v50);
l_Frame_1.BackgroundTransparency = 1;
l_Frame_1.Font = Enum.Font.SourceSansBold;
l_Frame_1.FontSize = v51;
l_Frame_1.TextColor3 = Color3.new(0.97, 0.97, 0.97);
local l_TextLabel_0 = Instance.new("TextLabel");
l_TextLabel_0.Name = "NotificationText";
l_TextLabel_0.Size = UDim2.new(1, -v47 * 2, 0, v52);
l_TextLabel_0.Position = UDim2.new(0, v47, 0.5, 1);
l_TextLabel_0.BackgroundTransparency = 1;
l_TextLabel_0.Font = Enum.Font.SourceSans;
l_TextLabel_0.FontSize = v54;
l_TextLabel_0.TextColor3 = Color3.new(0.92, 0.92, 0.92);
l_TextLabel_0.TextWrap = true;
l_TextLabel_0.TextYAlignment = Enum.TextYAlignment.Top;
local l_ImageLabel_0 = Instance.new("ImageLabel");
l_ImageLabel_0.Name = "NotificationImage";
l_ImageLabel_0.Size = UDim2.new(0, v44, 0, v44);
l_ImageLabel_0.Position = UDim2.new(0, v47, 0, 0.5 * (v45 - v44));
l_ImageLabel_0.BackgroundTransparency = 1;
l_ImageLabel_0.Image = "";
local v90 = UDim2.new(0, 360, 0, 160);
local v91 = UDim2.new(0.5, -180, 0.5, -50);
local l_Frame_3 = Instance.new("Frame");
l_Frame_3.Name = "PopupFrame";
l_Frame_3.Size = v90;
l_Frame_3.Position = v91;
l_Frame_3.BackgroundTransparency = 0;
local l_l_Frame_3_0 = l_Frame_3;
l_l_Frame_3_0.Style = Enum.FrameStyle.DropShadow;
l_l_Frame_3_0.ZIndex = 4;
l_l_Frame_3_0.Visible = false;
l_l_Frame_3_0.Parent = l_Parent_0;
v90 = Instance.new("TextButton");
v90.Name = "PopupAcceptButton";
v90.Size = UDim2.new(0, 100, 0, 50);
v90.Position = UDim2.new(0.5, -102, 1, -58);
v90.Style = Enum.ButtonStyle.RobloxRoundButton;
v90.Font = Enum.Font.SourceSansBold;
v90.FontSize = Enum.FontSize.Size24;
v90.TextColor3 = Color3.new(1, 1, 1);
v90.Text = "Accept";
v90.ZIndex = 5;
v90.Parent = l_l_Frame_3_0;
v91 = v90:Clone();
v91.Name = "PopupDeclineButton";
v91.Position = UDim2.new(0.5, 2, 1, -58);
v91.Text = "Decline";
v91.Parent = l_l_Frame_3_0;
l_Frame_3 = v90:Clone();
l_Frame_3.Name = "PopupOKButton";
l_Frame_3.Position = UDim2.new(0.5, -50, 1, -58);
l_Frame_3.Text = "OK";
l_Frame_3.Visible = false;
l_Frame_3.Parent = l_l_Frame_3_0;
local l_TextLabel_1 = Instance.new("TextLabel");
l_TextLabel_1.Name = "PopupText";
l_TextLabel_1.Size = UDim2.new(1, -16, 0.8, 0);
l_TextLabel_1.Position = UDim2.new(0, 8, 0, 8);
l_TextLabel_1.BackgroundTransparency = 1;
l_TextLabel_1.Font = Enum.Font.SourceSansBold;
l_TextLabel_1.FontSize = Enum.FontSize.Size36;
l_TextLabel_1.TextColor3 = Color3.new(0.97, 0.97, 0.97);
l_TextLabel_1.TextWrap = true;
l_TextLabel_1.ZIndex = 5;
l_TextLabel_1.TextYAlignment = Enum.TextYAlignment.Top;
l_TextLabel_1.Text = "This is a popup";
l_TextLabel_1.Parent = l_l_Frame_3_0;
local v95 = nil;
local v96 = nil;
local function _(v97)
    return l_SocialUtil_0.GetPlayerImage(v97, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5);
end;
local function v120(v99, v100, v101)
    local v102 = v80:Clone();
    v102.Position = UDim2.new(1, 4, 1, -v45 - 4);
    local v103 = l_Frame_1:Clone();
    v103.Text = v99;
    v103.Parent = v102;
    local v104 = l_TextLabel_0:Clone();
    v104.Text = v100;
    v104.Parent = v102;
    local v105 = false;
    local function v107()
        v105 = true;
        v103.TextWrapped = true;
        v103.TextTruncate = Enum.TextTruncate.AtEnd;
        local v106 = math.min(l_TextService_0:GetTextSize(v103.Text, v103.TextSize, v103.Font, Vector2.new(v103.AbsoluteSize.X, 1000)).Y - v103.Size.Y.Offset, v49 - v103.Size.Y.Offset);
        v103.Size = v103.Size + UDim2.new(0, 0, 0, v106);
        v103.Position = v103.Position - UDim2.new(0, 0, 0, v106 / 2);
        v104.Position = v104.Position + UDim2.new(0, 0, 0, v106 / 2);
        v102.Size = v102.Size + UDim2.new(0, 0, 0, v106);
    end;
    v102.Parent = l_l_Frame_1_0;
    if not (v101 ~= nil) or v101 == "" then
        if not v103.TextFits then
            v105 = true;
            v107();
        end;
        if not v104.TextFits then
            local v108 = math.min(l_TextService_0:GetTextSize(v104.Text, v104.TextSize, v104.Font, Vector2.new(v104.AbsoluteSize.X, 1000)).Y - v104.Size.Y.Offset, v53 - v104.Size.Y.Offset);
            v104.Size = v104.Size + UDim2.new(0, 0, 0, v108);
            v103.Position = v103.Position - UDim2.new(0, 0, 0, v108 / 2);
            v104.Position = v104.Position - UDim2.new(0, 0, 0, v108 / 2);
            v102.Size = v102.Size + UDim2.new(0, 0, 0, v108);
        end;
    else
        local v109 = v44 + v47 * 2;
        local l_v47_0 = v47;
        local v111 = l_ImageLabel_0:Clone();
        v111.Image = v101;
        v111.Parent = v102;
        v103.Size = UDim2.new(1, -v109 - l_v47_0, 0, v103.Size.Y.Offset);
        v103.Position = UDim2.new(0, v109, v103.Position.Y.Scale, v103.Position.Y.Offset);
        v103.TextXAlignment = Enum.TextXAlignment.Left;
        v104.Size = UDim2.new(1, -v109 - l_v47_0, 0, v104.Size.Y.Offset);
        v104.Position = UDim2.new(0, v109, v104.Position.Y.Scale, v104.Position.Y.Offset);
        v104.TextXAlignment = Enum.TextXAlignment.Left;
        if not v103.TextFits then
            v107();
            local l_TextSize_0 = v104.TextSize;
            v104.Size = v104.Size - UDim2.new(0, 0, 0, l_TextSize_0);
            v103.Position = v103.Position + UDim2.new(0, 0, 0, l_TextSize_0 / 2 - 2);
            v104.Position = v104.Position + UDim2.new(0, 0, 0, l_TextSize_0 / 2 - 2);
            v102.Size = v102.Size - UDim2.new(0, 0, 0, l_TextSize_0 + 4);
        end;
        if not v104.TextFits then
            local v113 = nil;
            local l_Text_0 = v104.Text;
            for v115 = string.len(l_Text_0) - 1, 2, -1 do
                if string.sub(l_Text_0, v115, v115) == " " then
                    v104.Text = string.sub(l_Text_0, 1, v115 - 1);
                    if v104.TextFits then
                        v113 = string.sub(l_Text_0, v115 + 1);
                        break;
                    end;
                end;
            end;
            if not v113 then
                v104.Text = l_Text_0;
            else
                local v116 = l_TextLabel_0:Clone();
                v116.TextXAlignment = Enum.TextXAlignment.Left;
                v116.Text = v113;
                v116.Name = "ExtraText";
                v116.TextTruncate = Enum.TextTruncate.AtEnd;
                v116.Parent = v102;
                local v117 = math.min(l_TextService_0:GetTextSize(v113, v116.TextSize, v116.Font, Vector2.new(v116.AbsoluteSize.X, 1000)).Y, v53 - v104.Size.Y.Offset);
                v116.Size = UDim2.new(v116.Size.X.Scale, v116.Size.X.Offset, 0, v117);
                v103.Position = v103.Position - UDim2.new(0, 0, 0, v117 / 2);
                v104.Position = v104.Position - UDim2.new(0, 0, 0, v117 / 2);
                v102.Size = v102.Size + UDim2.new(0, 0, 0, v117);
                v116.AnchorPoint = Vector2.new(0.5, 0);
                v116.Position = UDim2.new(0.5, 0, v104.Position.Y.Scale, v104.Position.Y.Offset + v104.AbsoluteSize.Y);
            end;
        end;
    end;
    if not (not v105 or not v104.TextFits) then
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v104.Text, v104.TextSize, v104.Font, Vector2.new(v104.AbsoluteSize.X, 1000));
        if l_l_TextService_0_TextSize_0.Y < v104.Size.Y.Offset then
            local v119 = v104.Size.Y.Offset - l_l_TextService_0_TextSize_0.Y;
            v104.Size = v104.Size - UDim2.new(0, 0, 0, v119);
            v103.Position = v103.Position + UDim2.new(0, 0, 0, v119 / 2);
            v104.Position = v104.Position + UDim2.new(0, 0, 0, v119 / 2);
            v102.Size = v102.Size - UDim2.new(0, 0, 0, v119);
        end;
    end;
    v102.Parent = nil;
    l_GuiService_0:AddSelectionParent(l_HttpService_0:GenerateGUID(false), v102);
    return v102;
end;
local function _(v121)
    for v122 = 1, #v31 do
        if v31[v122] == v121 then
            return v122;
        end;
    end;
end;
local function v130()
    local v124 = 1;
    local v125 = 0;
    for v126 = #v31, 1, -1 do
        local v127 = v31[v126];
        if v127 then
            local l_Frame_4 = v127.Frame;
            if not (not l_Frame_4 or not l_Frame_4.Parent) then
                if not (v127.IsFriend and (v45 + 2) * 1.5) then
                    local _ = v45;
                end;
                v125 = v125 + (not not v127.IsFriend and l_Frame_4.Size.Y.Offset + (v45 + 2) * 0.5 or l_Frame_4.Size.Y.Offset);
                l_Frame_4:TweenPosition(UDim2.new(0, 0, 1, -v125 - v124 * 4), l_InOut_0, l_Sine_0, 0.35, true, function()
                    if v127.TweenOutCallback then
                        v127.TweenOutCallback();
                    end;
                end);
                v124 = v124 + 1;
            end;
        end;
    end;
end;
local v131 = 0;
v95 = function(v132)
    spawn(function()
        v132.IsActive = true;
        local v133 = #v31;
        if v133 == 3 then
            v31[1].Duration = 0;
            v32[#v32 + 1] = v132;
            return ;
        else
            v31[v133 + 1] = v132;
            v132.Frame.Parent = l_l_Frame_1_0;
            spawn(function()
                wait(0.7);
                while v132.Duration > 0 do
                    wait(0.2);
                    v132.Duration = v132.Duration - 0.2;
                end;
                v96(v132);
            end);
            while tick() - v131 < 0.35 do
                wait();
            end;
            v131 = tick();
            v130();
            return ;
        end;
    end);
end;
v96 = function(v134)
    if v134 then
        local l_v134_0 = v134;
        local v136;
        for v137 = 1, #v31 do
            if v31[v137] == l_v134_0 then
                v136 = v137;
                goto label0 --[[  true, false  ]];
            end;
        end;
        v136 = nil;
        ::label0::;
        table.remove(v31, v136);
        l_v134_0 = v134.Frame;
        if not (not l_v134_0 or not l_v134_0.Parent) then
            v134.IsActive = false;
            spawn(function()
                local function v138()
                    if not l_v134_0:IsDescendantOf(game) then
                        return false;
                    else
                        return l_v134_0:TweenPosition(UDim2.new(1, 0, 1, l_v134_0.Position.Y.Offset), l_InOut_0, l_Sine_0, 0.35, false, function()
                            l_v134_0:Destroy();
                            v134 = nil;
                        end);
                    end;
                end;
                if not v138() then
                    v134.TweenOutCallback = v138;
                end;
            end);
        end;
        if #v32 > 0 then
            local v139 = v32[1];
            table.remove(v32, 1);
            v95(v139);
            if not (not (#v32 > 0) or not v31[1]) then
                v31[1].Duration = 0;
            end;
        else
            v130();
        end;
        return ;
    else
        return ;
    end;
end;
local function _(v140)
    v140.Duration = v140.Duration or 5;
    l_BindableEvent_0:Fire(v140);
end;
l_BindableEvent_0.Event:connect(function(v142)
    if not l_VRService_0.VREnabled then
        local l_Callback_0 = v142.Callback;
        local l_Button1Text_0 = v142.Button1Text;
        local l_Button2Text_0 = v142.Button2Text;
        local v146 = {};
        local v147 = nil;
        v147 = if not v142.AutoLocalize then v120(v142.Title, v142.Text, v142.Image) else v120(v41:TranslateGameText(l_CoreGui_0, v142.Title), v41:TranslateGameText(l_CoreGui_0, v142.Text), v142.Image);
        local v148 = nil;
        if l_Button1Text_0 and l_Button1Text_0 ~= "" then
            v146.IsFriend = true;
            v148 = v78("Button1", UDim2.new(0, 0, 1, 2));
            if not v142.AutoLocalize then
                v148.Text = l_Button1Text_0;
            else
                v41:TranslateAndRegister(v148, l_CoreGui_0, l_Button1Text_0);
            end;
            v148.Parent = v147;
            local v149 = nil;
            do
                local l_v149_0 = v149;
                l_v149_0 = v148.MouseButton1Click:connect(function()
                    if l_v149_0 then
                        l_v149_0:disconnect();
                        l_v149_0 = nil;
                        v96(v146);
                        if l_Callback_0 and type(l_Callback_0) ~= "function" then
                            pcall(function()
                                l_Callback_0:Invoke(l_Button1Text_0);
                            end);
                            return ;
                        elseif type(l_Callback_0) == "function" then
                            l_Callback_0(l_Button1Text_0);
                        end;
                    end;
                end);
            end;
        end;
        local v151 = nil;
        if l_Button2Text_0 and l_Button2Text_0 ~= "" then
            v146.IsFriend = true;
            v151 = v78("Button2", UDim2.new(0.5, 1, 1, 2));
            if not v142.AutoLocalize then
                v151.Text = l_Button2Text_0;
            else
                v41:TranslateAndRegister(v151, l_CoreGui_0, l_Button2Text_0);
            end;
            v151.Parent = v147;
            local v152 = nil;
            do
                local l_v152_0 = v152;
                l_v152_0 = v151.MouseButton1Click:connect(function()
                    if l_v152_0 then
                        l_v152_0:disconnect();
                        l_v152_0 = nil;
                        v96(v146);
                        if l_Callback_0 and type(l_Callback_0) ~= "function" then
                            pcall(function()
                                l_Callback_0:Invoke(l_Button2Text_0);
                            end);
                            return ;
                        elseif type(l_Callback_0) == "function" then
                            l_Callback_0(v142.Button2Text);
                        end;
                    end;
                end);
            end;
        elseif v148 then
            v148.Size = UDim2.new(1, 0, 0, v55);
        end;
        v146.Frame = v147;
        v146.Duration = v142.Duration;
        v95(v146);
        return ;
    else
        return ;
    end;
end);
l_StarterGui_0:RegisterSetCore("SendNotification", function(v154)
    if (type(v154) == "table" and type(v154.Title) == "string") and type(v154.Text) == "string" then
        local v155 = type(v154.Icon) == "string" and v154.Icon or "";
        local v156 = type(v154.Duration) == "number" and v154.Duration or 5;
        local v157 = (typeof(v154.Callback) == "Instance" and v154.Callback:IsA("BindableFunction")) and v154.Callback or nil;
        local v158 = type(v154.Button1) == "string" and v154.Button1 or "";
        local v159 = type(v154.Button2) == "string" and v154.Button2 or "";
        local v160 = true;
        if v154.AutoLocalize ~= nil then
            v160 = v154.AutoLocalize == true;
        end;
        local v161 = {
            GroupName = "Developer", 
            Title = v154.Title, 
            Text = v154.Text, 
            Image = v155, 
            Duration = v156, 
            Callback = v157, 
            Button1Text = v158, 
            Button2Text = v159, 
            AutoLocalize = v160
        };
        v161.Duration = v161.Duration or 5;
        l_BindableEvent_0:Fire(v161);
    end;
end);
local v162 = nil;
local v163 = {};
local l_v163_0 = v163 --[[ copy: 88 -> 100 ]];
v162 = function(v165)
    local v166 = l_v163_0[v165];
    if v166 and tick() < v166 then
        return true;
    else
        l_v163_0[v165] = tick() + v62;
        return false;
    end;
end;
v163 = function(v167)
    if not v162(v167) then
        local v169 = {
            GroupName = "Friends", 
            Title = v167.Name, 
            Text = "Sent you a friend request", 
            DetailText = v167.Name, 
            Image = l_SocialUtil_0.GetPlayerImage(v167.UserId, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5), 
            Duration = 8, 
            Callback = function(v168)
                if v168 == "Accept" then
                    l_RbxAnalyticsService_0:ReportCounter("NotificationScript-RequestFriendship");
                    l_RbxAnalyticsService_0:TrackEvent("Game", "RequestFriendship", "NotificationScript");
                    if v21 then
                        l_RbxAnalyticsService_0:ReportCounter("NotificationScript-AcceptFriendship");
                        l_RbxAnalyticsService_0:TrackEvent("Game", "AcceptFriendship", "NotificationScript");
                    end;
                    v29:RequestFriendship(v167);
                    return ;
                else
                    l_RbxAnalyticsService_0:ReportCounter("NotificationScript-RevokeFriendship");
                    l_RbxAnalyticsService_0:TrackEvent("Game", "RevokeFriendship", "NotificationScript");
                    v29:RevokeFriendship(v167);
                    v33[v167] = true;
                    return ;
                end;
            end, 
            Button1Text = "Accept", 
            Button2Text = "Decline"
        };
        v169.Duration = v169.Duration or 5;
        l_BindableEvent_0:Fire(v169);
        return ;
    else
        return ;
    end;
end;
local function v175(v170, v171, v172)
    if v170 ~= v29 and v171 ~= v29 then
        return ;
    else
        if v170 == v29 then
            if v172 == Enum.FriendRequestEvent.Accept then
                local v173 = {
                    GroupName = "Friends", 
                    Title = "New Friend", 
                    Text = v171.Name, 
                    DetailText = l_RobloxTranslator_0:FormatByKey("NotificationScript2.FriendRequestEvent.Accept", {
                        RBX_NAME = v171.Name
                    }), 
                    Image = l_SocialUtil_0.GetPlayerImage(v171.UserId, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5), 
                    Duration = 5
                };
                v173.Duration = v173.Duration or 5;
                l_BindableEvent_0:Fire(v173);
                return ;
            end;
        elseif v171 == v29 then
            if v172 == Enum.FriendRequestEvent.Issue then
                if not v33[v170] then
                    v163(v170);
                    return ;
                else
                    return ;
                end;
            elseif v172 == Enum.FriendRequestEvent.Accept then
                local v174 = {
                    GroupName = "Friends", 
                    Title = "New Friend", 
                    Text = v170.Name, 
                    DetailText = l_RobloxTranslator_0:FormatByKey("NotificationScript2.FriendRequestEvent.Accept", {
                        RBX_NAME = v170.Name
                    }), 
                    Image = l_SocialUtil_0.GetPlayerImage(v170.UserId, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5), 
                    Duration = 5
                };
                v174.Duration = v174.Duration or 5;
                l_BindableEvent_0:Fire(v174);
            end;
        end;
        return ;
    end;
end;
local function v184(v176, v177, _, _)
    if v38 and v176 == v29.UserId then
        local v180 = nil;
        local v181 = nil;
        local _ = nil;
        if v177 == 1 then
            v180 = "Point Awarded";
            v181 = l_RobloxTranslator_0:FormatByKey("NotificationScript2.onPointsAwarded.single", {
                RBX_NUMBER = tostring(v177)
            });
        elseif v177 > 0 then
            v180 = "Points Awarded";
            v181 = l_RobloxTranslator_0:FormatByKey("NotificationScript2.onPointsAwarded.multiple", {
                RBX_NUMBER = tostring(v177)
            });
        elseif v177 < 0 then
            v180 = "Points Lost";
            v181 = l_RobloxTranslator_0:FormatByKey("NotificationScript2.onPointsAwarded.negative", {
                RBX_NUMBER = tostring(v177)
            });
        else
            return ;
        end;
        local v183 = {
            GroupName = "PlayerPoints", 
            Title = v180, 
            Text = v181, 
            DetailText = v181, 
            Image = "https://www.roblox.com/asset?id=206410433", 
            Duration = 5
        };
        v183.Duration = v183.Duration or 5;
        l_BindableEvent_0:Fire(v183);
    end;
end;
local function v202(v185, v186, v187)
    if not (v34[v187] or not v39) and v185 == v29.UserId then
        v34[v187] = true;
        local v188 = "";
        if game.CreatorType == Enum.CreatorType.Group then
            local l_status_2, l_result_2 = pcall(function()
                return l_GroupService_0:GetGroupInfoAsync(v186);
            end);
            if not l_status_2 then
                v188 = "";
            end;
            if l_result_2 then
                v188 = l_result_2.Name;
            end;
        elseif game.CreatorType == Enum.CreatorType.User then
            local v191 = nil;
            local l_status_3, l_result_3 = pcall(function()
                return l_Players_0:GetNameFromUserIdAsync(v186);
            end);
            v191 = l_status_3;
            v188 = l_result_3;
            if not v191 then
                v188 = "";
            end;
        end;
        local l_status_4, l_result_4 = pcall(function()
            return l_BadgeService_0:GetBadgeInfoAsync(v187);
        end);
        if l_status_4 then
            local v196 = l_RobloxTranslator_0:FormatByKey("NotificationScript2.onBadgeAwardedDetail", {
                RBX_NAME = v29.Name, 
                CREATOR_NAME = v188, 
                BADGE_NAME = l_result_4.DisplayName
            });
            local v197 = nil;
            local l_pcall_0 = pcall;
            local v199 = "NotificationScript2.onBadgeAwardedTitle";
            local v200;
            do
                local l_v197_0 = v197;
                l_pcall_0(function()
                    l_v197_0 = l_RobloxTranslator_0:FormatByKey(v199);
                end);
                v200 = l_v197_0;
            end;
            v197 = {
                GroupName = "BadgeAwards", 
                Title = v200, 
                Text = v196, 
                DetailText = v196, 
                Image = "https://www.roblox.com/asset?id=206410289", 
                Duration = 5
            };
            v197.Duration = v197.Duration or 5;
            l_BindableEvent_0:Fire(v197);
        else
            return ;
        end;
    end;
end;
onGameSettingsChanged = function(v203, v204)
    if v203 == "SavedQualityLevel" then
        local v205 = l_GameSettings_0.SavedQualityLevel.Value + v204;
        if v205 > 10 then
            v205 = 10;
        elseif v205 < 1 then
            v205 = 1;
        end;
        if (v205 > 0 and v205 ~= l_Value_0) and l_GameSettings_0.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then
            local v206 = ("%s to (%d)"):format(l_Value_0 < v205 and "Increased" or "Decreased", v205);
            v206 = if l_Value_0 < v205 then l_RobloxTranslator_0:FormatByKey("NotificationScrip2.onCurrentGraphicsQualityLevelChanged.Increased", {
                RBX_NUMBER = tostring(v205)
            }) else l_RobloxTranslator_0:FormatByKey("NotificationScrip2.onCurrentGraphicsQualityLevelChanged.Decreased", {
                RBX_NUMBER = tostring(v205)
            });
            local v207 = {
                GroupName = "Graphics", 
                Title = "Graphics Quality", 
                Text = v206, 
                DetailText = v206, 
                Image = "", 
                Duration = 2
            };
            v207.Duration = v207.Duration or 5;
            l_BindableEvent_0:Fire(v207);
            l_Value_0 = v205;
        end;
    end;
end;
if not v42:IsSubjectToChinaPolicies() then
    l_BadgeService_0.OnBadgeAwarded:connect(v202);
end;
if not v37 then
    l_Players_0.FriendRequestEvent:connect(v175);
    l_PointsService_0.PointsAwarded:connect(v184);
    if not v22() then
        game.GraphicsQualityChangeRequest:Connect(function(v208)
            onGameSettingsChanged("SavedQualityLevel", v208 == true and 1 or -1);
        end);
    end;
end;
if not v42:IsSubjectToChinaPolicies() then
    if not v23() then
        game.ScreenshotReady:Connect(function(_)
            local v210 = l_RobloxTranslator_0:FormatByKey("NotificationScript2.Screenshot.Title");
            local v211 = l_RobloxTranslator_0:FormatByKey("NotificationScript2.Screenshot.Description");
            local v212 = l_RobloxTranslator_0:FormatByKey("NotificationScript2.Screenshot.ButtonText");
            local v214 = {
                Title = v210, 
                Text = v211, 
                Duration = 3, 
                Button1Text = v212, 
                Callback = function(v213)
                    if v213 == v212 then
                        game:OpenScreenshotsFolder();
                    end;
                end
            };
            v214.Duration = v214.Duration or 5;
            l_BindableEvent_0:Fire(v214);
        end);
    end;
    settings():GetService("GameSettings").VideoRecordingChangeRequest:Connect(function(v215)
        if not v215 then
            local v216 = l_RobloxTranslator_0:FormatByKey("NotificationScript2.Video.Title");
            local v217 = l_RobloxTranslator_0:FormatByKey("NotificationScript2.Video.Description");
            local v218 = l_RobloxTranslator_0:FormatByKey("NotificationScript2.Video.ButtonText");
            local v220 = {
                Title = v216, 
                Text = v217, 
                Duration = 3, 
                Button1Text = v218, 
                Callback = function(v219)
                    if v219 == v218 then
                        game:OpenVideosFolder();
                    end;
                end
            };
            v220.Duration = v220.Duration or 5;
            l_BindableEvent_0:Fire(v220);
        end;
    end);
end;
l_GuiService_0.SendCoreUiNotification = function(v221, v222)
    local v223 = v120(v221, v222, "");
    v223.BackgroundTransparency = 0.5;
    v223.Size = UDim2.new(0.5, 0, 0.1, 0);
    v223.Position = UDim2.new(0.25, 0, -0.1, 0);
    v223.NotificationTitle.FontSize = Enum.FontSize.Size36;
    v223.NotificationText.FontSize = Enum.FontSize.Size24;
    v223.Parent = l_Parent_0;
    v223:TweenPosition(UDim2.new(0.25, 0, 0, 0), l_InOut_0, l_Sine_0, 0.35, true);
    wait(5);
    if v223 then
        v223:Destroy();
    end;
end;
l_MarketplaceService_0.ClientLuaDialogRequested:connect(function(v224, v225, v226)
    l_TextLabel_1.Text = v224;
    local v227 = nil;
    local v228 = nil;
    local function _()
        if v227 then
            v227:disconnect();
        end;
        if v228 then
            v228:disconnect();
        end;
        l_GuiService_0:RemoveCenterDialog(l_l_Frame_3_0);
        l_l_Frame_3_0.Visible = false;
    end;
    v227 = v90.MouseButton1Click:connect(function()
        if v227 then
            v227:disconnect();
        end;
        if v228 then
            v228:disconnect();
        end;
        l_GuiService_0:RemoveCenterDialog(l_l_Frame_3_0);
        l_l_Frame_3_0.Visible = false;
        l_MarketplaceService_0:SignalServerLuaDialogClosed(true);
    end);
    v228 = v91.MouseButton1Click:connect(function()
        if v227 then
            v227:disconnect();
        end;
        if v228 then
            v228:disconnect();
        end;
        l_GuiService_0:RemoveCenterDialog(l_l_Frame_3_0);
        l_l_Frame_3_0.Visible = false;
        l_MarketplaceService_0:SignalServerLuaDialogClosed(false);
    end);
    if not pcall(function()
        l_GuiService_0:AddCenterDialog(l_l_Frame_3_0, Enum.CenterDialogType.QuitDialog, function()
            l_Frame_3.Visible = false;
            v90.Visible = true;
            v91.Visible = true;
            v90.Text = v225;
            v91.Text = v226;
            l_l_Frame_3_0.Visible = true;
        end, function()
            l_l_Frame_3_0.Visible = false;
        end);
    end) then
        l_l_Frame_3_0.Visible = true;
        v90.Text = v225;
        v91.Text = v226;
    end;
    return true;
end);
l_GameSettings_0:GetPropertyChangedSignal("PreferredTransparency"):connect(function()
    v43 = 0.6 * l_GameSettings_0.PreferredTransparency;
    v80.BackgroundTransparency = v43;
    for v230 = 1, #v31 do
        v31[v230].Frame.BackgroundTransparency = v43;
    end;
end);
if not v25 then
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    local l_Modules_0 = l_RobloxGui_0:FindFirstChild("Modules");
    local l_ControllerStateManager_0 = l_Modules_0:FindFirstChild("ControllerStateManager");
    if not (not l_Modules_0 or l_ControllerStateManager_0) then
        local l_Shell_0 = l_Modules_0:FindFirstChild("Shell");
        if l_Shell_0 then
            l_ControllerStateManager_0 = l_Shell_0:FindFirstChild("ControllerStateManager");
        end;
    end;
    if l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne then
        local v235 = nil;
        do
            local l_v235_0 = v235;
            pcall(function()
                l_v235_0 = game:GetService("PlatformService");
            end);
            if not (not l_v235_0 or not l_ControllerStateManager_0) then
                local v237 = require(l_ControllerStateManager_0);
                if v237 then
                    v237:Initialize();
                    if not game:IsLoaded() then
                        game.Loaded:Wait();
                    end;
                    v237:CheckUserConnected();
                end;
            end;
        end;
    end;
end;
if v17 then
    local function v246()
        local v238 = "Teleporting Paused";
        local l_pcall_1 = pcall;
        local v240 = "Feature.SettingsHub.Prompt.TeleportBlock.Title";
        local v241;
        do
            local l_v238_0 = v238;
            l_pcall_1(function()
                l_v238_0 = l_RobloxTranslator_0:FormatByKey(v240);
            end);
            v241 = l_v238_0;
        end;
        l_pcall_1 = "Teleporting will resume upon menu close.";
        local l_pcall_2 = pcall;
        local v244 = "Feature.SettingsHub.Prompt.TeleportBlock.Subtitle";
        do
            local l_l_pcall_1_0 = l_pcall_1;
            l_pcall_2(function()
                l_l_pcall_1_0 = l_RobloxTranslator_0:FormatByKey(v244);
            end);
            v238 = l_l_pcall_1_0;
        end;
        l_pcall_1 = {
            GroupName = "Teleport", 
            Title = v241, 
            Text = v238, 
            Image = "http://www.roblox.com/asset/?id=10961494062", 
            Duration = 5, 
            BottomPadding = v50
        };
        l_pcall_1.Duration = l_pcall_1.Duration or 5;
        l_BindableEvent_0:Fire(l_pcall_1);
    end;
    local function _()
        l_TeleportService_0.MenuTeleportAttempt:Connect(function()
            v246();
        end);
    end;
    l_TeleportService_0.MenuTeleportAttempt:Connect(function()
        v246();
    end);
end;
