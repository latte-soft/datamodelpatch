local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.UIBlox);
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local v6 = require(l_CoreGui_0.RobloxGui.Modules.LuaApp.Hooks.useLocalization);
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v4.Core.Style.useStyle;
local v10 = l_Images_0["icons/common/robux"];
return function(v11)
    local v12 = v6({
        itemInfoLabel = "Feature.Catalog.Heading.ItemInfo", 
        serialNumberLabel = "Feature.Catalog.Label.SerialNumberColon", 
        averagePriceLabel = "Feature.Catalog.Label.AveragePriceColon"
    });
    local v13 = l_useStyle_0();
    local l_averagePrice_0 = v11.itemIdPriceSerialNumber.averagePrice;
    local l_Theme_0 = v13.Theme;
    local l_Font_0 = v13.Font;
    local l_SubHeader1_0 = l_Font_0.SubHeader1;
    local l_Body_0 = l_Font_0.Body;
    local l_RelativeSize_0 = l_SubHeader1_0.RelativeSize;
    local l_RelativeSize_1 = l_Body_0.RelativeSize;
    local l_BaseSize_0 = l_Font_0.BaseSize;
    local v22 = l_RelativeSize_0 * l_BaseSize_0;
    local v23 = l_RelativeSize_1 * l_BaseSize_0;
    local v24 = not not l_averagePrice_0 and l_NumberLocalization_0.localize(l_averagePrice_0, l_LocalizationService_0.RobloxLocaleId) or "";
    local v25 = if not v11.itemIdPriceSerialNumber.serialNumber then nil else v11.itemIdPriceSerialNumber.serialNumber;
    return v3.createElement("Frame", {
        LayoutOrder = v11.layoutOrder, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 10)
        }), 
        ItemInfoSubHeader = v3.createElement("TextLabel", {
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Text = v12.itemInfoLabel, 
            Font = l_SubHeader1_0.Font, 
            Size = UDim2.fromScale(1, 0), 
            TextSize = v22, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
            TextWrapped = true, 
            BackgroundTransparency = 1
        }), 
        SerialNumberContainer = v25 and v3.createElement("Frame", {
            LayoutOrder = 2, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 10)
            }), 
            SerialNumberLabel = v3.createElement("TextLabel", {
                LayoutOrder = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = v12.serialNumberLabel, 
                Font = l_Body_0.Font, 
                TextSize = v23, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextWrapped = true, 
                BackgroundTransparency = 1
            }), 
            SerialNumberText = v3.createElement("TextLabel", {
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = v25, 
                Font = l_Body_0.Font, 
                TextSize = v23, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextWrapped = true, 
                BackgroundTransparency = 1
            })
        }), 
        AveragePriceContainer = v3.createElement("Frame", {
            LayoutOrder = 3, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 10)
            }), 
            AveragePriceLabel = v3.createElement("TextLabel", {
                LayoutOrder = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = v12.averagePriceLabel, 
                Font = l_Body_0.Font, 
                TextSize = v23, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextWrapped = true, 
                BackgroundTransparency = 1
            }), 
            AveragePriceTextContainer = v3.createElement("Frame", {
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 4)
                }), 
                AveragePriceRobuxImage = v3.createElement(l_ImageSetLabel_0, {
                    LayoutOrder = 1, 
                    Image = v10, 
                    Size = UDim2.fromOffset(v23, v23), 
                    ImageColor3 = l_Theme_0.TextDefault.Color, 
                    ImageTransparency = l_Theme_0.TextDefault.Transparency, 
                    BackgroundTransparency = 1
                }), 
                AveragePriceText = v3.createElement("TextLabel", {
                    LayoutOrder = 2, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = v24, 
                    Font = l_Body_0.Font, 
                    TextSize = v23, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency, 
                    TextWrapped = true, 
                    BackgroundTransparency = 1
                })
            })
        })
    });
end;
