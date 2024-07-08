local l_Modules_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules");
local l_Shell_0 = l_Modules_0:FindFirstChild("Shell");
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_UserData_0 = require(l_Shell_0:FindFirstChild("UserData"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_AssetManager_0 = require(l_Shell_0:FindFirstChild("AssetManager"));
local l_ConfirmPrompt_0 = require(l_Shell_0:FindFirstChild("ConfirmPrompt"));
local l_LoadingWidget_0 = require(l_Shell_0:FindFirstChild("LoadingWidget"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_PlatformCatalogData_0 = require(l_Shell_0:FindFirstChild("PlatformCatalogData"));
local l_CurrencyWidget_0 = require(l_Shell_0:FindFirstChild("CurrencyWidget"));
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local l_RobuxBalanceOverlay_0 = require(l_Shell_0:FindFirstChild("RobuxBalanceOverlay"));
local l_ErrorOverlay_0 = require(l_Shell_0:FindFirstChild("ErrorOverlay"));
local l_Errors_0 = require(l_Shell_0:FindFirstChild("Errors"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_TextService_0 = game:GetService("TextService");
local l_GuiService_0 = game:GetService("GuiService");
local v20 = nil;
pcall(function()
    v20 = game:GetService("PlatformService");
end);
local v21 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagUpdateAppShellBalance);
local v22 = require(l_Shell_0.Flags.GetFIntXboxPrimaryNavABLogging);
local v23 = require(l_Shell_0.Flags.GetFFlagXboxFixPrimaryNavABEvents);
local v24 = require(l_Shell_0.Experiment.XboxPrimaryNavIXPTest);
local v25 = UDim2.new(0, 1620, 0, 610);
local v26 = UDim2.new(0, 40, 0, 65);
local v27 = UDim2.new(0, 20, 0, 20);
local v28 = UDim2.new(0, 520, 0, 285);
local v29 = UDim2.new(1, 0, 0, 50);
local v30 = Vector2.new(-15, -12);
local v31 = UDim2.new(0.1, 0, 0, 275);
local v32 = UDim2.new(0.8, 0, 0, 150);
local v33 = {
    {
        Wide = "FINAL 400 Xbox Console.png", 
        Square = "RobuxSquare01.png"
    }, 
    {
        Wide = "FINAL 800 Xbox Console.png", 
        Square = "RobuxSquare02.png"
    }, 
    {
        Wide = "FINAL 1,700 Xbox Console.png", 
        Square = "RobuxSquare03.png"
    }, 
    {
        Wide = "FINAL 4,500 Xbox Console.png", 
        Square = "RobuxSquare04.png"
    }, 
    {
        Wide = "FINAL 10,000 Xbox Console.png", 
        Square = "RobuxSquare05.png"
    }, 
    {
        Wide = "FINAL 22,500 Xbox Console.png", 
        Square = "RobuxSquare06.png"
    }
};
local function v52(_)
    local v35 = {};
    local v36 = l_Utility_0.Create("ImageButton")({
        Name = "StoreItemContainer", 
        BackgroundTransparency = 1, 
        AutoButtonColor = false, 
        BorderSizePixel = 0, 
        ZIndex = 2; 
        l_AssetManager_0.CreateShadow(1), 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    l_Utility_0.Create("ImageLabel")({
        Name = "BackgroundImage", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ZIndex = 2, 
        Parent = v36, 
        Size = UDim2.new(1, 0, 1, 0)
    });
    local v37 = l_Utility_0.Create("TextLabel")({
        Name = "PriceText", 
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(1, -15, 1, -12), 
        BackgroundTransparency = 1, 
        TextXAlignment = Enum.TextXAlignment.Right, 
        TextYAlignment = "Bottom", 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = Enum.Font.GothamMedium, 
        TextSize = 50, 
        Text = "", 
        ZIndex = 3, 
        Parent = v36
    });
    local v38 = l_Utility_0.Create("ImageLabel")({
        Name = "RobuxIcon", 
        Position = UDim2.new(0, 20, 0, 20), 
        Size = UDim2.new(0, 72, 0, 72), 
        Image = "", 
        BackgroundTransparency = 1, 
        ZIndex = 3, 
        Parent = v36
    });
    local v39 = l_Utility_0.Create("TextLabel")({
        Name = "RobuxAmount", 
        Text = "", 
        Size = UDim2.new(0, 1, 1, 0), 
        Position = UDim2.new(1, 90, 0, 0), 
        TextXAlignment = "Left", 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = Enum.Font.GothamBold, 
        TextSize = 72, 
        BackgroundTransparency = 1, 
        ZIndex = 2, 
        Parent = v38
    });
    l_Utility_0.Create("UIGradient")({
        Name = "RobuxAmountGradient", 
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(239, 223, 163)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(161, 139, 81))
        }), 
        Rotation = 90, 
        Parent = v39
    });
    l_Utility_0.Create("UIGradient")({
        Name = "RobuxTextGradient", 
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(184, 161, 103)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(253, 226, 164))
        }), 
        Rotation = 90, 
        Parent = l_Utility_0.Create("TextLabel")({
            Name = "RobuxText", 
            Text = "Robux", 
            Size = UDim2.new(0, 1, 1, 0), 
            Position = UDim2.new(1, 90, 1, 0), 
            TextXAlignment = "Left", 
            TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
            Font = Enum.Font.GothamBold, 
            TextSize = 72, 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            Parent = v38
        })
    });
    local v40 = l_Utility_0.Create("TextLabel")({
        Name = "PercentMoreText", 
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(1, 0, 0, -15), 
        BackgroundTransparency = 1, 
        TextXAlignment = Enum.TextXAlignment.Right, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = Enum.Font.GothamMedium, 
        TextSize = 28, 
        Text = "", 
        ZIndex = 2, 
        Parent = v37
    });
    local function v42()
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v37.Text, l_Utility_0.ConvertFontSizeEnumToInt(v37.FontSize), v37.Font, Vector2.new());
        v37.Size = UDim2.new(0, l_l_TextService_0_TextSize_0.x, 0, l_l_TextService_0_TextSize_0.y);
        v37.Position = UDim2.new(1, v30.x - l_l_TextService_0_TextSize_0.x, 1, v30.y - l_l_TextService_0_TextSize_0.y);
    end;
    v42();
    v35.GetContainer = function(_)
        return v36;
    end;
    v35.SetPrice = function(_, v45)
        v37.Text = v45;
        v42();
    end;
    v35.SetRobuxValue = function(_, v47)
        v39.Text = l_Utility_0.FormatNumberString((tostring(v47)));
    end;
    v35.SetPercentMore = function(_, v49)
        v40.Visible = v49 > 0;
        v40.Text = string.format(l_LocalizedStrings_0:LocalizedString("PercentMoreRobuxPhrase"), (tostring(v49)));
    end;
    v35.SetImage = function(_, v51)
        v36.BackgroundImage.Image = v51;
    end;
    return v35;
end;
return function(v53)
    local v54 = {};
    local v55 = {};
    local v56 = {};
    local v57 = {};
    local v58 = nil;
    local v59 = nil;
    local v60 = false;
    local v61 = nil;
    local v62 = not v24.isUserEnrolled() and -100 or -300;
    local v63 = l_Utility_0.Create("Frame")({
        Name = "StorePane", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Visible = false, 
        Parent = v53
    });
    local v64 = l_Utility_0.Create("TextLabel")({
        Name = "StoreDescriptionText", 
        Size = v29, 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = l_GlobalSettings_0.LightFont, 
        FontSize = l_GlobalSettings_0.TitleSize, 
        TextWrapped = true, 
        Visible = false, 
        Text = l_LocalizedStrings_0:LocalizedString("RobuxStoreDescription"), 
        Parent = v63
    });
    local v65 = l_Utility_0.Create("TextLabel")({
        Name = "StoreNoItemsText", 
        Size = v32, 
        Position = v31, 
        BackgroundTransparency = 1, 
        TextXAlignment = Enum.TextXAlignment.Center, 
        FontSize = l_GlobalSettings_0.TitleSize, 
        TextWrapped = true, 
        TextColor3 = l_GlobalSettings_0.GreyTextColor, 
        TextTransparency = l_GlobalSettings_0.FriendStatusTextTransparency, 
        Font = l_GlobalSettings_0.BoldFont, 
        Text = l_LocalizedStrings_0:LocalizedString("RobuxStoreNoItemsPhrase"), 
        Visible = false, 
        Parent = v63
    });
    local v66 = l_Utility_0.Create("ImageButton")({
        Name = "RobuxBalanceButton", 
        Size = UDim2.new(0, 436, 0, 75), 
        Position = UDim2.new(0, 0, 1, v62), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_GlobalSettings_0.GreySelectionColor, 
        Selectable = false, 
        Parent = v63; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    v66.SelectionGained:connect(function()
        v66.BackgroundTransparency = 0;
    end);
    v66.SelectionLost:connect(function()
        v66.BackgroundTransparency = 1;
    end);
    local v67 = l_Utility_0.Create("ImageLabel")({
        Name = "RobuxHelpIcon", 
        Size = UDim2.new(0, 42, 0, 42), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/HelpIconSmall.png", 
        Visible = false, 
        Parent = v66, 
        AnchorPoint = Vector2.new(0, 0.5), 
        Position = UDim2.new(0, 10, 0.5, 4)
    });
    local function _(v68)
        v66.Size = UDim2.new(0, ((56 + v67.Size.X.Offset) + (not not v68 and v68.X or 0)) + 10, 0, 75);
    end;
    local v70 = true;
    local v71 = false;
    v66.MouseButton1Click:connect(function()
        if not v71 then
            v71 = true;
            if v70 then
                l_ScreenManager_0:OpenScreen(l_RobuxBalanceOverlay_0(v58, v59), false);
            end;
            v71 = false;
            return ;
        else
            return ;
        end;
    end);
    local function _(v72)
        local v73 = l_UserData_0.GetTotalUserBalanceAsync();
        if v73 then
            v59 = v73;
            v70 = v72 ~= v73;
            v67.Visible = v70;
            v66.Selectable = v70;
        end;
    end;
    local function _()
        spawn(function()
            local v75 = v61 and v61:GetRobuxAmountAsync();
            if not v75 then
                l_Utility_0.DebugLog("Unable to update user's balance because web call failed.");
            else
                v58 = v75;
                local v76 = l_UserData_0.GetTotalUserBalanceAsync();
                if v76 then
                    v59 = v76;
                    v70 = v75 ~= v76;
                    v67.Visible = v70;
                    v66.Selectable = v70;
                end;
                if v61 then
                    v76 = v61:GetAbsoluteSize();
                    v66.Size = UDim2.new(0, ((56 + v67.Size.X.Offset) + (not not v76 and v76.X or 0)) + 10, 0, 75);
                    return ;
                end;
            end;
        end);
    end;
    local v78 = l_Utility_0.Create("Frame")({
        Size = v25, 
        Name = "StoreContainer", 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        Position = v26, 
        Parent = v63
    });
    local _ = l_Utility_0.Create("UIGridLayout")({
        Name = "StoreUIGridLayout", 
        CellPadding = v27, 
        CellSize = v28, 
        FillDirectionMaxCells = 3, 
        Parent = v78
    });
    local function _(v80)
        return v56[v80] ~= nil;
    end;
    local function _(v82)
        if not (v56[v82] ~= nil) then
            table.insert(v55, v82);
            v56[v82] = true;
            v82.Parent = v78;
            if l_GuiService_0.SelectedCoreObject == v78 then
                l_Utility_0.SetSelectedCoreObject(v82);
            end;
        end;
    end;
    v54.Focus = function(v84)
        v60 = true;
        if not v84.SavedSelection or not v84.SavedSelection:IsDescendantOf(v63) then
            if v55[1] then
                l_Utility_0.SetSelectedCoreObject(v55[1]);
            end;
        else
            l_Utility_0.SetSelectedCoreObject(v84.SavedSelection);
        end;
        v84.SavedSelection = nil;
    end;
    local v85 = false;
    local v86 = false;
    local function v126()
        if not v86 and not v85 then
            v86 = true;
            if v20 then
                local v87 = nil;
                local v88 = nil;
                local v89 = nil;
                v64.Visible = false;
                v65.Visible = false;
                do
                    local l_v87_0, l_v88_0, l_v89_0 = v87, v88, v89;
                    local v96 = l_LoadingWidget_0({
                        Parent = v63
                    }, {
                        function()
                            local l_l_PlatformCatalogData_0_CatalogInfoAsync_0, v94, v95 = l_PlatformCatalogData_0:GetCatalogInfoAsync();
                            l_v87_0 = l_l_PlatformCatalogData_0_CatalogInfoAsync_0;
                            l_v88_0 = v94;
                            l_v89_0 = v95;
                        end
                    });
                    v96:AwaitFinished();
                    v96:Cleanup();
                    v96 = nil;
                    l_ScreenManager_0:DefaultFadeIn(v78);
                    if not (not (v60 and l_GuiService_0.SelectedCoreObject == nil) or not v55[1]) then
                        l_Utility_0.SetSelectedCoreObject(v55[1]);
                    end;
                    if not l_v88_0 or not l_v87_0 then
                        v65.Visible = true;
                        l_Utility_0.DebugLog("StorePane - BeginGetCatalogInfo failed because:", l_v89_0);
                    else
                        while #v57 > 0 do
                            l_Utility_0.DisconnectEvent(table.remove(v57, 1));
                        end;
                        table.sort(l_v87_0, function(v97, v98)
                            local v99 = l_PlatformCatalogData_0:ParseRobuxValue(v97);
                            local v100 = l_PlatformCatalogData_0:ParseRobuxValue(v98);
                            if not v99 or not v100 then
                                return v97 < v98;
                            else
                                return v99 < v100;
                            end;
                        end);
                        local v101 = nil;
                        for _, v103 in pairs(l_v87_0) do
                            local v104 = l_PlatformCatalogData_0:CalculateRobuxRatio(v103);
                            if (l_Utility_0.IsFinite(v104) and v104 ~= 0) and (not (v101 ~= nil) or v104 < v101) then
                                v101 = v104;
                            end;
                        end;
                        if #l_v87_0 == 0 then
                            v64.Visible = false;
                            v65.Visible = true;
                        elseif not v85 then
                            v85 = true;
                            v64.Visible = true;
                            v65.Visible = false;
                            local v105 = 1;
                            for _, v107 in pairs(l_v87_0) do
                                local v108 = v33[math.min(v105, #v33)];
                                local v109 = "rbxasset://textures/ui/Shell/Images/Robux/" .. v108.Wide;
                                local v110 = "rbxasset://textures/ui/Shell/Images/Robux/" .. v108.Square;
                                local v111 = false;
                                do
                                    local l_v111_0 = v111;
                                    local function v121()
                                        if not l_v111_0 then
                                            l_v111_0 = true;
                                            local v113 = l_ConfirmPrompt_0({
                                                ProductId = not not v107 and v107.ProductId or "Unknown", 
                                                ProductName = not not v107 and v107.Name or "Unknown", 
                                                Balance = v58, 
                                                Cost = not not v107 and v107.DisplayPrice or "Unknown", 
                                                ProductImage = v110, 
                                                ProductImageSize = Vector2.new(484, 540), 
                                                CurrencySymbol = ""
                                            }, {
                                                ShowRemainingBalance = false, 
                                                ShowRobuxIcon = false, 
                                                ConfirmWithPrice = true
                                            });
                                            local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
                                            if not (not l_SelectedCoreObject_0 or not l_SelectedCoreObject_0:IsDescendantOf(v63)) then
                                                v54.SavedSelection = l_SelectedCoreObject_0;
                                            end;
                                            l_ScreenManager_0:OpenScreen(v113);
                                            v113:FadeInBackground();
                                            (function(v115)
                                                if v115 == true then
                                                    l_Utility_0.DebugLog("Do buy");
                                                    local v116 = nil;
                                                    if not UserSettings().GameSettings:InStudioMode() or game:GetService("UserInputService"):GetPlatform() == Enum.Platform.Windows then
                                                        local l_status_0, l_result_0 = pcall(function()
                                                            v116 = v20:BeginPlatformStorePurchase(v107.ProductId);
                                                        end);
                                                        if not l_status_0 then
                                                            l_Utility_0.DebugLog("Purchase Robux failed with pcall status:", l_status_0, "and purchaseResult:", v116, "because of:", l_result_0);
                                                        elseif v116 == 0 then
                                                            if not v21() then
                                                                l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.RobuxCatalogPurchaseInitiated, v116);
                                                            else
                                                                l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.RobuxCatalogPurchaseInitiated, v116, v107.ProductId);
                                                            end;
                                                        end;
                                                    else
                                                        spawn(function()
                                                            l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Errors_0.RobuxPurchase[1]), false);
                                                        end);
                                                    end;
                                                    spawn(function()
                                                        local v119 = v61 and v61:GetRobuxAmountAsync();
                                                        if not v119 then
                                                            l_Utility_0.DebugLog("Unable to update user's balance because web call failed.");
                                                        else
                                                            v58 = v119;
                                                            local v120 = l_UserData_0.GetTotalUserBalanceAsync();
                                                            if v120 then
                                                                v59 = v120;
                                                                v70 = v119 ~= v120;
                                                                v67.Visible = v70;
                                                                v66.Selectable = v70;
                                                            end;
                                                            if v61 then
                                                                v120 = v61:GetAbsoluteSize();
                                                                v66.Size = UDim2.new(0, ((56 + v67.Size.X.Offset) + (not not v120 and v120.X or 0)) + 10, 0, 75);
                                                                return ;
                                                            end;
                                                        end;
                                                    end);
                                                    l_Utility_0.DebugLog("Done with purchase; result was:", v116);
                                                    return ;
                                                else
                                                    l_Utility_0.DebugLog("Declined to buy");
                                                    return ;
                                                end;
                                            end)((v113:ResultAsync()));
                                            l_v111_0 = false;
                                            return ;
                                        else
                                            return ;
                                        end;
                                    end;
                                    local v122 = not not v107 and v107.DisplayPrice or "";
                                    local v123 = l_PlatformCatalogData_0:CalculateRobuxRatio(v107);
                                    local v124 = v52();
                                    v124:SetPrice(v122);
                                    v124:SetRobuxValue(l_PlatformCatalogData_0:ParseRobuxValue(v107));
                                    if not v123 or not v101 then
                                        v124:SetPercentMore(0);
                                    else
                                        v124:SetPercentMore((math.floor((v123 / v101 - 1) * 100)));
                                    end;
                                    v124:SetImage(v109);
                                    local l_v124_Container_0 = v124:GetContainer();
                                    if not (v56[l_v124_Container_0] ~= nil) then
                                        table.insert(v55, l_v124_Container_0);
                                        v56[l_v124_Container_0] = true;
                                        l_v124_Container_0.Parent = v78;
                                        if l_GuiService_0.SelectedCoreObject == v78 then
                                            l_Utility_0.SetSelectedCoreObject(l_v124_Container_0);
                                        end;
                                    end;
                                    table.insert(v57, v124:GetContainer().MouseButton1Click:connect(v121));
                                    v105 = math.min(#v33, v105 + 1);
                                end;
                            end;
                        end;
                        if v24.isUserEnrolled() then
                            v54:Focus();
                        end;
                    end;
                end;
            end;
            v86 = false;
            return ;
        else
            return ;
        end;
    end;
    if not v85 then
        spawn(v126);
    end;
    v54.GetName = function(_)
        return l_LocalizedStrings_0:LocalizedString("CatalogWord");
    end;
    v54.GetId = function(_)
        return l_Analytics_0.TabNames("StoreId");
    end;
    v54.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("StorePaneId")
        };
    end;
    v54.IsFocused = function(_)
        return v60;
    end;
    local v131 = nil;
    v54.Show = function(v132)
        v63.Visible = true;
        if v61 then
            spawn(function()
                v61:RefreshRobuxAmountAsync();
            end);
        else
            v61 = l_CurrencyWidget_0({
                Parent = v66, 
                Position = UDim2.new(0, (v67.Position.X.Offset + v67.Size.X.Offset) + 10, 0.5, -30)
            });
        end;
        local l_v61_AbsoluteSize_0 = v61:GetAbsoluteSize();
        v66.Size = UDim2.new(0, ((56 + v67.Size.X.Offset) + (not not l_v61_AbsoluteSize_0 and l_v61_AbsoluteSize_0.X or 0)) + 10, 0, 75);
        l_Utility_0.DisconnectEvent(v131);
        v131 = v61.RobuxChanged:connect(function()
            spawn(function()
                local v134 = v61 and v61:GetRobuxAmountAsync();
                if not v134 then
                    l_Utility_0.DebugLog("Unable to update user's balance because web call failed.");
                else
                    v58 = v134;
                    local v135 = l_UserData_0.GetTotalUserBalanceAsync();
                    if v135 then
                        v59 = v135;
                        v70 = v134 ~= v135;
                        v67.Visible = v70;
                        v66.Selectable = v70;
                    end;
                    if v61 then
                        v135 = v61:GetAbsoluteSize();
                        v66.Size = UDim2.new(0, ((56 + v67.Size.X.Offset) + (not not v135 and v135.X or 0)) + 10, 0, 75);
                        return ;
                    end;
                end;
            end);
            v61:GetRobuxAmountAsync();
            local l_v61_AbsoluteSize_1 = v61:GetAbsoluteSize();
            v66.Size = UDim2.new(0, ((56 + v67.Size.X.Offset) + (not not l_v61_AbsoluteSize_1 and l_v61_AbsoluteSize_1.X or 0)) + 10, 0, 75);
            l_SoundManager_0:Play("PurchaseSuccess");
        end);
        spawn(function()
            local v137 = v61 and v61:GetRobuxAmountAsync();
            if not v137 then
                l_Utility_0.DebugLog("Unable to update user's balance because web call failed.");
            else
                v58 = v137;
                local v138 = l_UserData_0.GetTotalUserBalanceAsync();
                if v138 then
                    v59 = v138;
                    v70 = v137 ~= v138;
                    v67.Visible = v70;
                    v66.Selectable = v70;
                end;
                if v61 then
                    v138 = v61:GetAbsoluteSize();
                    v66.Size = UDim2.new(0, ((56 + v67.Size.X.Offset) + (not not v138 and v138.X or 0)) + 10, 0, 75);
                    return ;
                end;
            end;
        end);
        v132.TransitionTweens = l_ScreenManager_0:DefaultFadeIn(v63);
        l_ScreenManager_0:PlayDefaultOpenSound();
        if not v85 then
            spawn(v126);
        end;
        if v22() > 0 then
            if not v23() then
                l_Analytics_0.reportNavigationLoaded(v54:GetName());
            else
                l_Analytics_0.reportNavigationLoaded(l_Analytics_0.TabNames("StoreId"));
                return ;
            end;
        end;
    end;
    v54.Hide = function(v139)
        v63.Visible = false;
        v131 = l_Utility_0.DisconnectEvent(v131);
        l_ScreenManager_0:DefaultCancelFade(v139.TransitionTweens);
        v139.TransitionTweens = nil;
    end;
    v54.RemoveFocus = function(_)
        v60 = false;
        local l_SelectedCoreObject_1 = l_GuiService_0.SelectedCoreObject;
        if not (not l_SelectedCoreObject_1 or not l_SelectedCoreObject_1:IsDescendantOf(v63)) then
            l_Utility_0.SetSelectedCoreObject(nil);
        end;
    end;
    v54.SetPosition = function(_, v143)
        v63.Position = v143;
    end;
    v54.SetParent = function(_, v145)
        v63.Parent = v145;
    end;
    v54.IsAncestorOf = function(_, v147)
        return v63 and v63:IsAncestorOf(v147);
    end;
    return v54;
end;
