local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserData_0 = require(l_Shell_0:FindFirstChild("UserData"));
local l_ScrollingTextBox_0 = require(l_Shell_0:FindFirstChild("ScrollingTextBox"));
local l_ConfirmPrompt_0 = require(l_Shell_0:FindFirstChild("ConfirmPrompt"));
local l_LoadingWidget_0 = require(l_Shell_0:FindFirstChild("LoadingWidget"));
local l_AssetManager_0 = require(l_Shell_0:FindFirstChild("AssetManager"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local l_ErrorOverlay_0 = require(l_Shell_0:FindFirstChild("ErrorOverlay"));
local l_Errors_0 = require(l_Shell_0:FindFirstChild("Errors"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_CurrencyWidget_0 = require(l_Shell_0:FindFirstChild("CurrencyWidget"));
local l_StoreScreen_0 = require(l_Shell_0.XboxPrimaryNav:FindFirstChild("StoreScreen"));
local v19 = require(l_Shell_0.Experiment.XboxPrimaryNavIXPTest);
local v20 = Vector2.new(0, 225);
local v21 = Vector2.new(0, -50);
return function(v22)
    local v23 = {
        GetDefaultSelectableObject = nil
    };
    local v24 = nil;
    local v25 = nil;
    local v26 = false;
    local v27 = false;
    local v28 = nil;
    local v29 = false;
    local v30 = l_Utility_0.Signal();
    local l_v22_FullName_0 = v22:GetFullName();
    local l_v22_RobuxPrice_0 = v22:GetRobuxPrice();
    local v33 = l_Utility_0.Create("Frame")({
        Name = "PurchasePackagePrompt", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BackgroundColor3 = l_GlobalSettings_0.ModalBackgroundColor, 
        BorderSizePixel = 0
    });
    local v34 = l_Utility_0.Create("Frame")({
        Name = "ContentContainer", 
        Size = UDim2.new(1, 0, 0.6388888888888888, 0), 
        Position = UDim2.new(v20.x / 1920, 0, v20.y / 1080, 0), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_GlobalSettings_0.OverlayColor, 
        BorderSizePixel = 0, 
        Parent = v33
    });
    local v35 = l_Utility_0.Create("Frame")({
        Name = "PackageBackground", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_GlobalSettings_0.ForegroundGreyColor, 
        BorderSizePixel = 0, 
        ZIndex = 2, 
        Parent = l_Utility_0.Create("Frame")({
            Name = "PackageBackgroundContainer", 
            Size = UDim2.new(0.7435897435897436, 0, 0.927536231884058, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            Parent = l_Utility_0.Create("Frame")({
                Name = "PackageContainer", 
                Size = UDim2.new(0.40625, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Parent = v34
            }); 
            l_AssetManager_0.CreateShadow(1)
        })
    });
    local v36 = l_Utility_0.Create("ImageLabel")({
        Name = "PackageImage", 
        Size = UDim2.new(1, 0, 1, 0), 
        Image = string.format("rbxthumb://type=BundleThumbnail&id=%d&w=420&h=420", v22:GetBundleId()), 
        BackgroundTransparency = 1, 
        ZIndex = v35.ZIndex, 
        Parent = v35
    });
    local v37 = l_Utility_0.Create("Frame")({
        Name = "DetailsContainer", 
        Size = UDim2.new(0.59375, 0, 1, 0), 
        Position = UDim2.new(0.40625, 0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Parent = v34
    });
    local v38 = l_Utility_0.Create("TextLabel")({
        Name = "PurchasingTitle", 
        Text = l_LocalizedStrings_0:LocalizedString("PurchasingTitle"), 
        Position = UDim2.new(0, 0, 0, 66), 
        Size = UDim2.new(1, 0, 0, 25), 
        TextXAlignment = "Left", 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = l_GlobalSettings_0.HeadingFont, 
        FontSize = l_GlobalSettings_0.HeaderSize, 
        BackgroundTransparency = 1, 
        Visible = false, 
        Parent = v37
    });
    local v39 = l_Utility_0.Create("Frame")({
        Name = "DetailsContent", 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Parent = v37
    });
    local _ = l_Utility_0.Create("TextLabel")({
        Name = "PackageName", 
        Text = l_v22_FullName_0 or "Unknown Package", 
        Position = UDim2.new(0, 0, 0, 66), 
        Size = UDim2.new(1, 0, 0, 25), 
        TextXAlignment = "Left", 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = l_GlobalSettings_0.HeadingFont, 
        FontSize = l_GlobalSettings_0.HeaderSize, 
        BackgroundTransparency = 1, 
        Parent = v39
    });
    local v41 = l_Utility_0.Create("ImageLabel")({
        Name = "RobuxIcon", 
        Position = UDim2.new(0, 0, 0, 125), 
        BackgroundTransparency = 1, 
        Parent = v39, 
        Image = "rbxasset://textures/ui/common/robux_small@3x.png", 
        Size = UDim2.new(0, 48, 0, 48)
    });
    local v42 = l_Utility_0.Create("TextLabel")({
        Name = "PackageCost", 
        Text = "", 
        Size = UDim2.new(0, 0, 1, 0), 
        Position = UDim2.new(0, 56, 0, -2), 
        TextXAlignment = "Left", 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.HeaderSize, 
        BackgroundTransparency = 1, 
        Parent = v41
    });
    local v43 = l_Utility_0.Create("TextLabel")({
        Name = "AlreadyOwnTextLabel", 
        Text = "", 
        Size = UDim2.new(0, 0, 0, 50), 
        Position = UDim2.new(0, 0, 0, 125), 
        TextXAlignment = "Left", 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = l_GlobalSettings_0.ItalicFont, 
        FontSize = l_GlobalSettings_0.DescriptionSize, 
        BackgroundTransparency = 1, 
        Visible = false, 
        Parent = v39
    });
    local v44 = l_ScrollingTextBox_0(UDim2.new(0.7017543859649122, 0, 0.463768115942029, 0), UDim2.new(0, 0, 0, 200), v39);
    v44:SetFontSize(l_GlobalSettings_0.TitleSize);
    v44:SetFont(l_GlobalSettings_0.LightFont);
    local v45 = l_Utility_0.Create("ImageButton")({
        Name = "BuyButton", 
        Size = UDim2.new(0, 320, 0, 64), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_GlobalSettings_0.BlueButtonColor, 
        BackgroundTransparency = 0, 
        Parent = v39, 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.new(0, 0, 1 + v21.Y / 690, 0)
    });
    local v46 = l_Utility_0.Create("TextLabel")({
        Name = "BuyText", 
        Text = "", 
        Size = UDim2.new(1, 0, 1, 0), 
        TextColor3 = l_GlobalSettings_0.TextSelectedColor, 
        Font = l_GlobalSettings_0.HeadingFont, 
        FontSize = l_GlobalSettings_0.MediumLargeHeadingSize, 
        BackgroundTransparency = 1, 
        Parent = v45
    });
    l_Utility_0.ResizeButtonWithDynamicText(v45, v46, {
        l_LocalizedStrings_0:LocalizedString("OkWord"), 
        l_LocalizedStrings_0:LocalizedString("BuyWord"), 
        l_LocalizedStrings_0:LocalizedString("GetRobuxPhrase"), 
        l_LocalizedStrings_0:LocalizedString("TakeWord")
    }, l_GlobalSettings_0.TextHorizontalPadding);
    local function v47()
        if not v22:IsOwned() and not v22:IsXboxAddOn() then
            if l_v22_RobuxPrice_0 and l_v22_RobuxPrice_0 == 0 then
                v42.Text = l_LocalizedStrings_0:LocalizedString("FreeWord");
            else
                v42.Text = not not l_v22_RobuxPrice_0 and l_Utility_0.FormatNumberString((tostring(l_v22_RobuxPrice_0))) or "-";
            end;
            v41.Visible = true;
            v43.Visible = false;
            if l_v22_RobuxPrice_0 == 0 then
                v46.Text = l_LocalizedStrings_0:LocalizedString("TakeWord");
                return ;
            elseif v28 and v28 < l_v22_RobuxPrice_0 then
                v46.Text = l_LocalizedStrings_0:LocalizedString("GetRobuxPhrase");
                return ;
            else
                v46.Text = l_LocalizedStrings_0:LocalizedString("BuyWord");
            end;
        else
            if v22:IsOwned() then
                if l_v22_RobuxPrice_0 and l_v22_RobuxPrice_0 > 0 then
                    v43.Text = string.format(l_LocalizedStrings_0:LocalizedString("PurchasedThisPhrase"), l_Utility_0.FormatNumberString((tostring(l_v22_RobuxPrice_0))));
                else
                    v43.Text = l_LocalizedStrings_0:LocalizedString("AlreadyOwnedPhrase");
                end;
            end;
            v43.Visible = v22:IsOwned() == true;
            v41.Visible = false;
            v46.Text = l_LocalizedStrings_0:LocalizedString("OkWord");
            if not (not v22:IsXboxAddOn() or v22:IsOwned()) then
                v46.Text = l_LocalizedStrings_0:LocalizedString("BuyWord");
                return ;
            end;
        end;
    end;
    local function v49(v48)
        v28 = v48;
        v47();
    end;
    v23.UpdateOwned = function(_)
        v47();
    end;
    v23.ResultAsync = function(_)
        if not v25 then
            v30:wait();
            return v25;
        else
            return v25;
        end;
    end;
    local function v52()
        v28 = l_UserData_0.GetTotalUserBalanceAsync();
        v47();
    end;
    local function v53()
        v44:SetText(v22:GetDescription() or "");
    end;
    v39.Visible = false;
    local v54 = l_LoadingWidget_0({
        Parent = v37
    }, {
        v52, 
        v53
    });
    do
        local l_v54_0 = v54;
        spawn(function()
            l_v54_0:AwaitFinished();
            l_v54_0:Cleanup();
            l_v54_0 = nil;
            l_ScreenManager_0:DefaultFadeIn(v39);
            v39.Visible = true;
            if v29 then
                l_Utility_0.SetSelectedCoreObject(v23:GetDefaultSelectableObject());
            end;
            v27 = true;
        end);
    end;
    v52 = function()
        v26 = true;
        local v56 = v22:IsOwned();
        local v57 = v22:BuyAsync();
        v28 = not not v57 and v57.balanceAfterSale or l_UserData_0.GetTotalUserBalanceAsync();
        v47();
        local v58 = v22:IsOwned() and not v56;
        v25 = v58;
        if v58 then
            v23:UpdateOwned();
        end;
        v26 = false;
        if not (v56 or v58) then
            if l_ScreenManager_0:GetTopScreen() == v23 then
                l_ScreenManager_0:CloseCurrent();
            end;
            l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Errors_0.PackagePurchase[1]), false);
        end;
        l_Utility_0.DebugLog("Done with purchase");
    end;
    v47();
    v23.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("PurchasePackagePromptId"), 
            AssetId = v22:GetBundleId(), 
            IsOwned = v22:IsOwned()
        };
    end;
    v23.GetDefaultSelectableObject = function(_)
        return v45;
    end;
    v23.FadeInBackground = function(_)
        l_Utility_0.PropertyTweener(v33, "BackgroundTransparency", 1, l_GlobalSettings_0.ModalBackgroundTransparency, 0.25, l_Utility_0.EaseInOutQuad, true);
    end;
    v23.GetPriority = function(_)
        return l_GlobalSettings_0.OverlayPriority;
    end;
    v53 = nil;
    v54 = nil;
    v23.Show = function(v63)
        v33.Visible = true;
        v33.Parent = l_ScreenManager_0:GetScreenGuiByPriority(v63:GetPriority());
        local function v64()
            v36.Size = l_Utility_0.CalculateFill(v35, Vector2.new(420, 420));
            v36.AnchorPoint = Vector2.new(0.5, 0.5);
            v36.Position = UDim2.new(0.5, 0, 0.5, 0);
        end;
        v63.PackageBackgroundChangedConn = l_Utility_0.DisconnectEvent(v63.PackageBackgroundChangedConn);
        v63.PackageBackgroundChangedConn = v35:GetPropertyChangedSignal("AbsoluteSize"):connect(function()
            v64();
        end);
        v64();
        if not v53 then
            v53 = l_CurrencyWidget_0({
                Parent = v33, 
                Position = UDim2.new(0.052, 0, 0.88, 0)
            });
        end;
        l_Utility_0.DisconnectEvent(v54);
        v54 = v53.RobuxChanged:connect(v49);
        l_SoundManager_0:Play("OverlayOpen");
    end;
    v23.Hide = function(v65)
        v33.Visible = false;
        v33.Parent = nil;
        v65.PackageBackgroundChangedConn = l_Utility_0.DisconnectEvent(v65.PackageBackgroundChangedConn);
        v54 = l_Utility_0.DisconnectEvent(v54);
    end;
    v23.ScreenRemoved = function(_)
        if v53 then
            v53:Destroy();
            v53 = nil;
        end;
        v30:fire();
    end;
    v23.Focus = function(v67)
        v29 = true;
        l_ContextActionService_0:BindCoreAction("ReturnFromPurchasePackageScreen", function(_, v69, _)
            if not v26 and v69 == Enum.UserInputState.End then
                l_ScreenManager_0:CloseCurrent();
            end;
        end, false, Enum.KeyCode.ButtonB);
        local v71 = false;
        v67.BuyButtonConn = l_Utility_0.DisconnectEvent(v67.BuyButtonConn);
        v67.BuyButtonConn = v45.MouseButton1Click:connect(function()
            if not (v71 or v26) and v27 then
                v71 = true;
                if not v22:IsOwned() and not v22:IsXboxAddOn() then
                    if v28 then
                        if l_v22_RobuxPrice_0 > 0 and v28 < l_v22_RobuxPrice_0 then
                            l_Utility_0.DebugLog("Goto robux screen");
                            if not v19.isUserEnrolled() then
                                l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.NavigateToRobuxScreen);
                            else
                                l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.OpenStoreScreen, l_StoreScreen_0());
                            end;
                        else
                            local v72 = l_ConfirmPrompt_0({
                                ProductId = not not v22 and v22:GetBundleId() or "Unknown", 
                                ProductName = l_v22_FullName_0, 
                                Cost = l_v22_RobuxPrice_0, 
                                Balance = v28, 
                                ProductImage = string.format("rbxthumb://type=BundleThumbnail&id=%d&w=420&h=420", v22:GetBundleId()), 
                                Currency = "Robux", 
                                CurrencySymbol = ""
                            }, {
                                ShowRemainingBalance = true, 
                                ShowRobuxIcon = true
                            });
                            l_ScreenManager_0:OpenScreen(v72);
                            if v72:ResultAsync() == true then
                                local v73 = l_LoadingWidget_0({
                                    Parent = v37
                                }, {
                                    v52
                                });
                                v39.Visible = false;
                                v38.Visible = true;
                                do
                                    local l_v73_0 = v73;
                                    spawn(function()
                                        l_v73_0:AwaitFinished();
                                        l_v73_0:Cleanup();
                                        l_v73_0 = nil;
                                        l_ScreenManager_0:DefaultFadeIn(v39);
                                        v39.Visible = true;
                                        v38.Visible = false;
                                        if l_ScreenManager_0:GetTopScreen() == v23 then
                                            l_ScreenManager_0:CloseCurrent();
                                        end;
                                    end);
                                end;
                            else
                                l_Utility_0.DebugLog("Declined to buy");
                            end;
                        end;
                    end;
                else
                    l_SoundManager_0:Play("ButtonPress");
                    l_ScreenManager_0:CloseCurrent();
                    if not (not v22:IsXboxAddOn() or v22:IsOwned()) then
                        v22:OpenAvatarDetailInXboxStore();
                    end;
                end;
                v71 = false;
                return ;
            else
                return ;
            end;
        end);
        l_GuiService_0:AddSelectionParent("PurchasePackagePromptSelectionGroup", v34);
        l_Utility_0.SetSelectedCoreObject(v67:GetDefaultSelectableObject());
    end;
    v23.RemoveFocus = function(v75)
        v29 = false;
        l_ContextActionService_0:UnbindCoreAction("ReturnFromPurchasePackageScreen");
        l_GuiService_0:RemoveSelectionGroup("PurchasePackagePromptSelectionGroup");
        v75.BuyButtonConn = l_Utility_0.DisconnectEvent(v75.BuyButtonConn);
        l_Utility_0.SetSelectedCoreObject(nil);
    end;
    v23.SetParent = function(_, v77)
        v24 = v77;
        v33.Parent = v24;
    end;
    return v23;
end;
