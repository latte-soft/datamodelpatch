local l_TextService_0 = game:GetService("TextService");
local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_Errors_0 = require(l_Shell_0:FindFirstChild("Errors"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_ErrorOverlay_0 = require(l_Shell_0:FindFirstChild("ErrorOverlay"));
local l_PurchasePackagePrompt_0 = require(l_Shell_0:FindFirstChild("PurchasePackagePrompt"));
local l_BaseTile_0 = require(l_Shell_0:FindFirstChild("BaseTile"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
return function(v12)
    local v13 = l_BaseTile_0();
    local v14 = false;
    local _ = v12:GetFullName();
    local function v17()
        if not (not v12:IsOwned() or v12:IsWearing()) then
            local v16 = v12:WearAsync();
            if v16 and v16.success == true then
                v13:UpdateEquipButton();
                return ;
            else
                l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Errors_0.PackageEquip.Default), false);
            end;
        end;
    end;
    local function v19()
        local v18 = l_PurchasePackagePrompt_0(v12);
        l_ScreenManager_0:OpenScreen(v18, false);
        v18:FadeInBackground();
        spawn(function()
            if v18:ResultAsync() then
                l_SoundManager_0:Play("PurchaseSuccess");
                v17();
            end;
        end);
    end;
    local v20 = l_Utility_0.Create("Frame")({
        Name = "PriceFrame", 
        Size = UDim2.new(1, 0, 0, 36), 
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.new(1, -6, 0, 6), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_GlobalSettings_0.PriceLabelColor, 
        ZIndex = 2, 
        Visible = false, 
        Parent = v13.AvatarItemContainer
    });
    local v21 = l_Utility_0.Create("TextLabel")({
        Name = "PriceText", 
        Text = "", 
        Size = UDim2.new(1, 0, 1, 0), 
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.new(1, -14, 0, 0), 
        TextColor3 = l_GlobalSettings_0.BlackTextColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.DescriptionSize, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_GlobalSettings_0.PriceLabelColor, 
        BackgroundTransparency = 1, 
        ZIndex = 2, 
        Visible = true, 
        Parent = v20
    });
    local v22 = l_Utility_0.Create("TextLabel")({
        Name = "PromoText", 
        Text = "", 
        Size = UDim2.new(1, 0, 0, 36), 
        Position = UDim2.new(0, 0, 0, 0), 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.DescriptionSize, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_GlobalSettings_0.PromoLabelColor, 
        ZIndex = 2, 
        Visible = false, 
        Parent = v13.AvatarItemContainer
    });
    local v23 = l_Utility_0.Create("ImageLabel")({
        Name = "RobuxIcon", 
        Size = UDim2.new(0, 24, 0, 24), 
        AnchorPoint = Vector2.new(1, 0.5), 
        Position = UDim2.new(0, -6, 0.5, 2), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/common/robux_small@3x.png", 
        ZIndex = 2, 
        ImageColor3 = l_GlobalSettings_0.BlackTextColor, 
        Parent = v21
    });
    v13.UpdatePriceText = function(_)
        local v25 = "";
        local l_v12_RobuxPrice_0 = v12:GetRobuxPrice();
        if not v12:IsXboxAddOn() then
            if l_v12_RobuxPrice_0 == 0 then
                v25 = l_LocalizedStrings_0:LocalizedString("FreeWord");
            elseif l_v12_RobuxPrice_0 then
                v25 = l_Utility_0.FormatNumberString(l_v12_RobuxPrice_0);
            end;
        else
            v25 = "";
        end;
        v21.Text = v25;
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v21.Text, l_Utility_0.ConvertFontSizeEnumToInt(v21.FontSize), v21.Font, Vector2.new());
        v23.Visible = l_v12_RobuxPrice_0 ~= 0;
        local v28 = l_l_TextService_0_TextSize_0.X + 28;
        if v23.Visible then
            v28 = (v28 + 6) + 24;
        end;
        v20.Size = UDim2.new(0, v28, 0, 36);
        v21.Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X, 0, l_l_TextService_0_TextSize_0.Y);
        local v29 = false;
        if l_v12_RobuxPrice_0 ~= nil then
            v29 = not v12:IsOwned() and not v12:IsXboxAddOn();
        end;
        v20.Visible = v29;
    end;
    v13.UpdatePromoText = function(_)
        if v12:IsOwned() then
            v22.Visible = false;
        else
            local v31 = l_Utility_0.GetFastVariable("XboxSaleAvatarPackageIds");
            if type(v31) == "string" and v31 ~= "" then
                for v32 in string.gmatch(v31, "([^;]+)") do
                    if tonumber(v32) ~= nil and tonumber(v32) == tonumber(v12:GetAssetId()) then
                        v22.Text = "SALE";
                        v22.Size = UDim2.new(0, l_TextService_0:GetTextSize(v22.Text, l_Utility_0.ConvertFontSizeEnumToInt(v22.FontSize), v22.Font, Vector2.new()).X + 28, 0, 36);
                        v22.AnchorPoint = Vector2.new(1, 0);
                        v22.Position = UDim2.new(1, -6, 0, 42);
                        v22.Visible = true;
                        return ;
                    end;
                end;
                return ;
            end;
        end;
    end;
    v13:SetImage(string.format("rbxthumb://type=BundleThumbnail&id=%d&w=150&h=150", v12:GetBundleId()));
    v13:ColorizeImage(not v12:IsOwned() and 0 or 1, 0);
    v13:SetPopupText(v12:GetName());
    v13.GetAssetId = function(_)
        return v12:GetAssetId();
    end;
    v13.GetPackageInfo = function(_)
        return v12;
    end;
    v13.UpdateOwnership = function(v35)
        local v36 = v12:IsOwned();
        v35:SetActive(v36);
        v35:ColorizeImage(not v36 and 0 or 1, 0);
        v35:UpdateEquipButton();
        v35:UpdatePriceText();
        v35:UpdatePromoText();
    end;
    v13.UpdateEquipButton = function(v37)
        v37.EquippedCheckmark.Visible = v12:IsWearing();
    end;
    local v38 = false;
    v13.Select = function(_)
        if not v38 then
            local v40 = false;
            if not (not v12:IsOwned() or v12:IsWearing()) then
                v38 = true;
                spawn(function()
                    v17();
                    v38 = false;
                end);
                v40 = true;
            end;
            return v40;
        else
            return false;
        end;
    end;
    v13.OnClick = function(_)
        v19();
    end;
    local v42 = nil;
    local v43 = nil;
    local l_Show_0 = v13.Show;
    v13.Show = function(v45)
        l_Show_0(v45);
        l_Utility_0.DisconnectEvent(v42);
        v12.IsWearingChanged:connect(function()
            v45:UpdateEquipButton();
        end);
        l_Utility_0.DisconnectEvent(v43);
        v43 = v12.OwnershipChanged:connect(function()
            v45:UpdateOwnership();
        end);
        v45:UpdateEquipButton();
        v45:UpdateOwnership();
    end;
    local l_Hide_0 = v13.Hide;
    v13.Hide = function(v47)
        l_Hide_0(v47);
        v42 = l_Utility_0.DisconnectEvent(v42);
        v43 = l_Utility_0.DisconnectEvent(v43);
    end;
    local l_Focus_0 = v13.Focus;
    local v49 = nil;
    v13.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("AvatarTileId"), 
            AssetId = v12:GetAssetId(), 
            IsOwned = v12:IsOwned()
        };
    end;
    v13.Focus = function(v51)
        l_Focus_0(v51);
        v14 = true;
        l_Utility_0.DisconnectEvent(v49);
        v49 = v51.AvatarItemContainer.MouseButton1Click:connect(function()
            v51:OnClick();
        end);
        v51:UpdateEquipButton();
        spawn(function()
            wait(0.17);
            if not (not v14 or v12:IsOwned()) then
                v51:ColorizeImage(1);
            end;
        end);
    end;
    local l_RemoveFocus_0 = v13.RemoveFocus;
    v13.RemoveFocus = function(v53)
        l_RemoveFocus_0(v53);
        v14 = false;
        v49 = l_Utility_0.DisconnectEvent(v49);
        if not v12:IsOwned() then
            v53:ColorizeImage(0);
        end;
    end;
    return v13;
end;
