local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.QRCodeDisplay);
local l_DisplayQRCode_0 = v3.DisplayQRCode;
local l_ECLevels_0 = v3.ECLevels;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v8 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v9 = require(l_Modules_0.LuaApp.TenFootUI.MoreComponents.MoreText);
local l_BodyText_0 = v9.BodyText;
local l_SubheaderText_0 = v9.SubheaderText;
local l_BoldBodyText_0 = v9.BoldBodyText;
local _ = require(script.Parent.Types);
local v14 = v8.static.settings.account();
local function v21(v15)
    local l_layoutOrder_0 = v15.layoutOrder;
    local l_itemsPadding_0 = v15.itemsPadding;
    local l_subheaderText_0 = v15.subheaderText;
    local l_bodyText_0 = v15.bodyText;
    local l_boldBodyText_0 = v15.boldBodyText;
    return v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = l_itemsPadding_0
        }), 
        Subheader = v2.createElement(l_SubheaderText_0, {
            layoutOrder = 1, 
            text = l_subheaderText_0
        }), 
        Body = if not l_bodyText_0 then nil else v2.createElement(l_BodyText_0, {
            layoutOrder = 2, 
            text = l_bodyText_0
        }), 
        BoldBody = if not l_boldBodyText_0 then nil else v2.createElement(l_BoldBodyText_0, {
            layoutOrder = 3, 
            text = l_boldBodyText_0
        })
    });
end;
return function(v22)
    local v23 = l_useDesignTokens_0();
    local v24 = UDim.new(0, v23.Global.Space_200);
    local l_QrSize_0 = v23.LuaApps.More.QrSize;
    local v26 = l_useLocalization_0({
        accountSettingsWebsite = "Feature.Settings.Subheading.AccountSettingsWebsite", 
        accountSettingsWebsiteDescription = "Feature.Settings.Description.AccountSettingsWebsite", 
        accountSettingsScan = "Feature.Settings.Subheading.AccountSettingsScan", 
        accountSettingsScanDescription = "Feature.Settings.Description.AccountSettingsScan"
    });
    return v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        LayoutOrder = v22.layoutOrder, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    }, {
        v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), v2.createElement("Frame", {
            Size = UDim2.new(1, -l_QrSize_0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = v24
        }), v2.createElement(v21, {
            layoutOrder = 1, 
            itemsPadding = v24, 
            subheaderText = v26.accountSettingsWebsite, 
            bodyText = v26.accountSettingsWebsiteDescription, 
            boldBodyText = v14
        }), v2.createElement(v21, {
            layoutOrder = 2, 
            itemsPadding = v24, 
            subheaderText = v26.accountSettingsScan, 
            bodyText = v26.accountSettingsScanDescription
        })), v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, v2.createElement(l_DisplayQRCode_0, {
            ecLevel = l_ECLevels_0.EC_LEVEL_1, 
            sideLength = l_QrSize_0, 
            toEncode = v14
        })))
    });
end;
