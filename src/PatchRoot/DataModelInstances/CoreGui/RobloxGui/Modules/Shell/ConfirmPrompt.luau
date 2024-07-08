local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserData_0 = require(l_Shell_0:FindFirstChild("UserData"));
local l_AssetManager_0 = require(l_Shell_0:FindFirstChild("AssetManager"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_CurrencyWidget_0 = require(l_Shell_0:FindFirstChild("CurrencyWidget"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local v12 = Vector2.new(0, 225);
local v13 = Vector2.new(0, -50);
local v14 = Vector2.new(0, -100);
local v15 = Vector2.new(0, -10);
return function(v16, v17)
    local v18 = {};
    v17 = v17 or {};
    local v19 = nil;
    local v20 = false;
    local v21 = nil;
    local v22 = l_Utility_0.Signal();
    local v23 = {};
    local l_ProductName_0 = v16.ProductName;
    local v25 = l_Utility_0.Create("Frame")({
        Name = "ConfirmPrompt", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BackgroundColor3 = l_GlobalSettings_0.ModalBackgroundColor, 
        BorderSizePixel = 0
    });
    local v26 = l_Utility_0.Create("Frame")({
        Name = "ContentContainer", 
        Size = UDim2.new(1, 0, 0.6388888888888888, 0), 
        Position = UDim2.new(v12.x / 1920, 0, v12.y / 1080, 0), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_GlobalSettings_0.OverlayColor, 
        BorderSizePixel = 0, 
        Parent = v25
    });
    local v27 = l_Utility_0.Create("Frame")({
        Name = "PackageBackgroundContainer", 
        Size = UDim2.new(0.7435897435897436, 0, 0.927536231884058, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundTransparency = 1, 
        Parent = l_Utility_0.Create("Frame")({
            Name = "PackageContainer", 
            Size = UDim2.new(0.40625, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Parent = v26
        }); 
        l_AssetManager_0.CreateShadow(1)
    });
    local v28 = l_Utility_0.Create("Frame")({
        Name = "PackageBackground", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_GlobalSettings_0.ForegroundGreyColor, 
        BorderSizePixel = 0, 
        ZIndex = 2, 
        Parent = v27
    });
    local v29 = l_Utility_0.Create("ImageLabel")({
        Name = "PackageImage", 
        Size = UDim2.new(1, 0, 1, 0), 
        Image = "", 
        BackgroundTransparency = 1, 
        ZIndex = v28.ZIndex, 
        Parent = v28
    });
    if not v16 or not v16.ProductImage then
        v27.Visible = false;
    else
        v29.Image = v16.ProductImage;
    end;
    local v30 = l_Utility_0.Create("Frame")({
        Name = "DetailsContainer", 
        Size = UDim2.new(0.59375, 0, 1, 0), 
        Position = UDim2.new(0.40625, 0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Parent = v26
    });
    local _ = l_Utility_0.Create("TextLabel")({
        Name = "ConfirmTitle", 
        Text = l_LocalizedStrings_0:LocalizedString("ConfirmPurchaseTitle"), 
        Position = UDim2.new(0, 0, 0, 66), 
        Size = UDim2.new(1, 0, 0, 25), 
        TextXAlignment = "Left", 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = l_GlobalSettings_0.HeadingFont, 
        FontSize = l_GlobalSettings_0.HeaderSize, 
        BackgroundTransparency = 1, 
        Parent = v30
    });
    local v32 = "";
    if v16.Cost then
        v32 = if type(v16.Cost) == "string" then v16.Cost else (v16.CurrencySymbol or "") .. l_Utility_0.FormatNumberString(v16.Cost);
    end;
    local v33 = v16.Currency == "Robux";
    local v34 = l_Utility_0.Create("ImageLabel")({
        Name = "RobuxIcon", 
        Position = UDim2.new(0, 0, 0, 125), 
        Size = UDim2.new(0, v17.ShowRobuxIcon == true and 50 or 0, 0, 50), 
        BackgroundTransparency = 1, 
        Parent = v30
    });
    if v33 then
        v34.Image = "rbxasset://textures/ui/common/robux_small@3x.png";
        v34.Size = UDim2.new(0, 48, 0, 48);
    end;
    local v35 = l_Utility_0.Create("TextLabel")({
        Name = "PackageCost", 
        Text = v32, 
        Size = UDim2.new(0, 0, 1, 0), 
        Position = not not v33 and UDim2.new(0, 56, 0, -2) or UDim2.new(1.3, 0, 0, 0), 
        TextXAlignment = "Left", 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.HeaderSize, 
        BackgroundTransparency = 1, 
        Parent = v34
    });
    if not (not v16 or not v16.Cost) and v16.Cost == 0 then
        v35.Text = l_LocalizedStrings_0:LocalizedString("FreeWord");
    end;
    local _ = nil;
    local _ = l_Utility_0.Create("TextLabel")({
        Name = "ConfirmItemDetail", 
        Text = if not not v16.Cost and v16.Cost == 0 then string.format(l_LocalizedStrings_0:LocalizedString("AreYouSureTakePhrase"), (tostring(l_ProductName_0))) else if v17.ConfirmWithPrice then string.format(l_LocalizedStrings_0:LocalizedString("AreYouSureWithPricePhrase"), tostring(l_ProductName_0), (tostring(v32))) else string.format(l_LocalizedStrings_0:LocalizedString("AreYouSurePhrase"), (tostring(l_ProductName_0))), 
        Position = UDim2.new(0, 0, 0, 205), 
        Size = UDim2.new(1, 0, 0, 25), 
        TextXAlignment = "Left", 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = l_GlobalSettings_0.LightFont, 
        FontSize = l_GlobalSettings_0.TitleSize, 
        BackgroundTransparency = 1, 
        Parent = v30
    });
    local v38 = l_Utility_0.Create("TextLabel")({
        Name = "RemaningBalance", 
        Text = "", 
        Position = UDim2.new(0, 0, 0, 285), 
        Size = UDim2.new(1, 0, 0, 25), 
        TextXAlignment = "Left", 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = l_GlobalSettings_0.LightFont, 
        FontSize = l_GlobalSettings_0.TitleSize, 
        BackgroundTransparency = 1, 
        Visible = v17.ShowRemainingBalance == true, 
        Parent = v30
    });
    local l_v13_0 = v13;
    if v33 == false then
        l_v13_0 = v14;
        local _ = l_Utility_0.Create("TextLabel")({
            Name = "LegalText", 
            Text = l_LocalizedStrings_0:LocalizedString("LegalText"), 
            Size = UDim2.new(0.9, 0, 0, 80), 
            TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
            Font = l_GlobalSettings_0.RegularFont, 
            FontSize = Enum.FontSize.Size18, 
            BackgroundTransparency = 1, 
            Parent = v30, 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1 + v15.Y / 690, 0), 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left
        });
    end;
    local v41 = l_Utility_0.Create("ImageButton")({
        Name = "ConfirmButton", 
        Size = UDim2.new(0, 320, 0, 64), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_GlobalSettings_0.BlueButtonColor, 
        BackgroundTransparency = 0, 
        Parent = v30, 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.new(0, 0, 1 + l_v13_0.Y / 690, 0)
    });
    l_Utility_0.ResizeButtonWithText(v41, l_Utility_0.Create("TextLabel")({
        Name = "ConfirmText", 
        Text = l_LocalizedStrings_0:LocalizedString("ConfirmWord"), 
        Size = UDim2.new(1, 0, 1, 0), 
        TextColor3 = l_GlobalSettings_0.TextSelectedColor, 
        Font = l_GlobalSettings_0.HeadingFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        BackgroundTransparency = 1, 
        Parent = v41
    }), l_GlobalSettings_0.TextHorizontalPadding);
    local function v43(v42)
        v21 = v42;
        while #v23 > 0 do
            table.remove(v23, #v23)(v21);
        end;
    end;
    local function _()
        if v18 == l_ScreenManager_0:GetTopScreen() then
            v43(false);
            l_ScreenManager_0:CloseCurrent();
        end;
    end;
    local function _()
        if v18 == l_ScreenManager_0:GetTopScreen() then
            v43(true);
            l_ScreenManager_0:CloseCurrent();
        end;
    end;
    v18.ResultAsync = function(_)
        if not v21 then
            v22:wait();
            return v21;
        else
            return v21;
        end;
    end;
    v18.AddResultCallback = function(_, v48)
        if v21 ~= nil then
            v48(v21);
            return ;
        else
            table.insert(v23, v48);
            return ;
        end;
    end;
    v18.FadeInBackground = function(_)
        l_Utility_0.PropertyTweener(v25, "BackgroundTransparency", 1, l_GlobalSettings_0.ModalBackgroundTransparency, 0.25, l_Utility_0.EaseInOutQuad, true);
    end;
    v18.GetDefaultSelectableObject = function(_)
        return v41;
    end;
    v18.GetPriority = function(_)
        return l_GlobalSettings_0.OverlayPriority;
    end;
    local v52 = nil;
    local v53 = nil;
    v18.Show = function(v54)
        v25.Visible = true;
        v25.Parent = l_ScreenManager_0:GetScreenGuiByPriority(v54:GetPriority());
        if v54.BackgroundTween then
            v54.BackgroundTween:Cancel();
        end;
        v54.BackgroundTween = l_Utility_0.PropertyTweener(v25, "BackgroundTransparency", 1, l_GlobalSettings_0.ModalBackgroundTransparency, 0, l_Utility_0.EaseInOutQuad, nil);
        l_SoundManager_0:Play("OverlayOpen");
        local function v56()
            local v55 = Vector2.new(420, 420);
            if v16.ProductImageSize then
                v55 = v16.ProductImageSize;
            end;
            v29.Size = l_Utility_0.CalculateFill(v28, v55);
            v29.AnchorPoint = Vector2.new(0.5, 0.5);
            v29.Position = UDim2.new(0.5, 0, 0.5, 0);
        end;
        v54.PackageBackgroundChangedConn = l_Utility_0.DisconnectEvent(v54.PackageBackgroundChangedConn);
        v54.PackageBackgroundChangedConn = v28:GetPropertyChangedSignal("AbsoluteSize"):connect(function()
            v56();
        end);
        v56();
        local function v58(v57)
            if not (((not v17.ShowRemainingBalance or not v57) or not v16) or not v16.Cost) then
                if v16.Cost and v16.Cost > 0 then
                    v38.Text = string.format(l_LocalizedStrings_0:LocalizedString("RemainingBalancePhrase"), l_Utility_0.FormatNumberString((tostring((v57 and v16.Cost) and v57 - v16.Cost))));
                    return ;
                else
                    v38.Text = "";
                end;
            end;
        end;
        if not v16.Balance then
            spawn(function()
                v58((l_UserData_0.GetTotalUserBalanceAsync()));
            end);
        else
            v58(v16.Balance);
        end;
        if not v52 then
            v52 = l_CurrencyWidget_0({
                Parent = v25, 
                Position = UDim2.new(0.052, 0, 0.88, 0)
            });
        end;
        l_Utility_0.DisconnectEvent(v53);
        v53 = v52.RobuxChanged:connect(v58);
    end;
    v18.Hide = function(v59)
        v25.Visible = false;
        v25.Parent = nil;
        if v59.BackgroundTween then
            v59.BackgroundTween:Cancel();
        end;
        v59.BackgroundTween = nil;
        v59.PackageBackgroundChangedConn = l_Utility_0.DisconnectEvent(v59.PackageBackgroundChangedConn);
        v53 = l_Utility_0.DisconnectEvent(v53);
    end;
    v18.ScreenRemoved = function(_)
        if v52 then
            v52:Destroy();
            v52 = nil;
        end;
        if v21 == nil then
            v43(false);
        end;
        v22:fire(v21);
    end;
    v18.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("ConfirmPromptId"), 
            ProductName = v16.ProductName, 
            ProductId = v16.ProductId
        };
    end;
    v18.Focus = function(v62)
        v20 = true;
        l_ContextActionService_0:BindCoreAction("ReturnFromCurrentConfirmScreen", function(_, v64, _)
            if v64 == Enum.UserInputState.End and v18 == l_ScreenManager_0:GetTopScreen() then
                v43(false);
                l_ScreenManager_0:CloseCurrent();
            end;
        end, false, Enum.KeyCode.ButtonB);
        local v66 = false;
        v62.ConfirmButtonConn = l_Utility_0.DisconnectEvent(v62.ConfirmButtonConn);
        v62.ConfirmButtonConn = v41.MouseButton1Click:connect(function()
            if not v66 then
                v66 = true;
                l_SoundManager_0:Play("ButtonPress");
                if v18 == l_ScreenManager_0:GetTopScreen() then
                    v43(true);
                    l_ScreenManager_0:CloseCurrent();
                end;
                v66 = false;
                return ;
            else
                return ;
            end;
        end);
        l_GuiService_0:AddSelectionParent("ConfirmOptionsSelectionGroup", v26);
        if v20 and l_GuiService_0.SelectedCoreObject == nil then
            l_Utility_0.SetSelectedCoreObject(v62:GetDefaultSelectableObject());
        end;
    end;
    v18.RemoveFocus = function(v67)
        l_ContextActionService_0:UnbindCoreAction("ReturnFromCurrentConfirmScreen");
        l_GuiService_0:RemoveSelectionGroup("ConfirmOptionsSelectionGroup");
        v67.ConfirmButtonConn = l_Utility_0.DisconnectEvent(v67.ConfirmButtonConn);
        l_Utility_0.SetSelectedCoreObject(nil);
        v20 = false;
    end;
    v18.SetParent = function(_, v69)
        v19 = v69;
        v25.Parent = v19;
    end;
    return v18;
end;
