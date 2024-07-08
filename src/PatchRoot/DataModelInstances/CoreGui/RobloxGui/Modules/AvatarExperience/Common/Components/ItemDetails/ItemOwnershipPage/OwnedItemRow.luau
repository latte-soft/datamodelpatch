local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_ItemTile_0 = v5.Tile.ItemTile;
local l_Button_0 = v5.App.Button.Button;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v11 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v13 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v14 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v15 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local v17 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagL2ControllerSupport);
return (v2.forwardRef(function(v18, v19)
    local v20 = l_getRbxthumbWithTypeSizeAndOptions_0(v18.itemId, v11.GetRbxThumbType(v18.itemType), 150);
    local v21 = v13({
        holdingLabel = "Feature.Catalog.Label.Holding", 
        offSaleLabel = "Feature.Catalog.Heading.TakeOffSale", 
        sellAction = "Feature.Catalog.Action.Sell", 
        buyPriceLabel = "Feature.Catalog.Label.BuyPrice", 
        salePriceLabel = "Feature.Catalog.Label.SalePrice"
    });
    local v22 = l_useStyle_0();
    local v23 = v14(v15);
    local v24 = v18.buyPrice and string.format("%.0f", v18.buyPrice);
    local v25 = v24 and l_NumberLocalization_0.localize(v24, v23:GetLocale());
    local v26 = v18.salePrice and string.format("%.0f", v18.salePrice);
    local v27 = v26 and l_NumberLocalization_0.localize(v26, v23:GetLocale());
    local v28 = if not v18.isOnHold then if v18.isOnSale then v21.offSaleLabel else v21.sellAction else v21.holdingLabel;
    local l_createElement_0 = v2.createElement;
    local v30 = "Frame";
    local v31 = {
        Size = UDim2.new(1, 0, 0, 100), 
        BackgroundTransparency = 1, 
        LayoutOrder = v18.layoutOrder
    };
    local v32 = {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 8)
        }), 
        ItemTileContainer = v2.createElement("Frame", {
            Size = UDim2.fromOffset(100, 100), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            ItemTile = v2.createElement(l_ItemTile_0, {
                thumbnail = v20, 
                name = "", 
                restrictionTypes = v18.restrictionTypes
            })
        })
    };
    local l_createElement_1 = v2.createElement;
    local v34 = "Frame";
    local v35 = {
        Size = UDim2.new(1, -108, 1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = 2
    };
    local v36 = {
        LabelsContainer = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1
        }, {
            Layout = v2.createElement("UIListLayout", {
                Padding = UDim.new(0, 4), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            ItemTitleLabel = v2.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                Text = v18.title, 
                Font = v22.Font.Header2.Font, 
                TextSize = v22.Font.BaseSize * v22.Font.Header2.RelativeSize, 
                TextColor3 = v22.Theme.TextEmphasis.Color, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }), 
            BuyPriceLabel = v25 and v2.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = v21.buyPriceLabel .. " " .. v12.RobloxEmoji.Robux .. v25, 
                Font = v22.Font.Body.Font, 
                TextSize = v22.Font.BaseSize * v22.Font.Body.RelativeSize, 
                TextColor3 = v22.Theme.TextEmphasis.Color, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }), 
            SalePriceLabel = v27 and v2.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = v21.salePriceLabel .. " " .. v12.RobloxEmoji.Robux .. v27, 
                Font = v22.Font.Body.Font, 
                TextSize = v22.Font.BaseSize * v22.Font.Body.RelativeSize, 
                TextColor3 = v22.Theme.TextEmphasis.Color, 
                BackgroundTransparency = 1, 
                LayoutOrder = 3
            })
        })
    };
    local v37 = false;
    if v18.resaleRestriction ~= v12.ResaleRestriction.Disabled then
        v37 = not v17() and v2.createElement(l_Button_0, {
            buttonType = if not v18.isOnSale then l_ButtonType_0.PrimarySystem else l_ButtonType_0.Secondary, 
            size = UDim2.new(1, 0, 0, 28), 
            text = v28, 
            position = UDim2.fromScale(0, 1), 
            anchorPoint = Vector2.new(0, 1), 
            layoutOrder = 2, 
            onActivated = v18.onActivated, 
            isDisabled = v18.isOnHold
        });
    end;
    v36.Button = v37;
    v37 = false;
    if v18.resaleRestriction ~= v12.ResaleRestriction.Disabled then
        v37 = v17() and v2.createElement(l_Focusable_0.Frame, {
            Size = UDim2.new(1, 0, 0, 28), 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            NextSelectionUp = if not v17() then nil else v18.NextSelectionUp, 
            NextSelectionDown = if not v17() then nil else v18.NextSelectionDown, 
            ref = if not v17() then nil else v19
        }, {
            OnSaleButton = v18.isOnSale and v2.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.Secondary, 
                size = UDim2.fromScale(1, 1), 
                text = v28, 
                onActivated = v18.onActivated, 
                isDisabled = v18.isOnHold
            }), 
            OffSaleButton = not v18.isOnSale and v2.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.PrimarySystem, 
                size = UDim2.fromScale(1, 1), 
                text = v28, 
                onActivated = v18.onActivated, 
                isDisabled = v18.isOnHold
            })
        });
    end;
    v36.ButtonContainer = v37;
    v32.DetailsContainer = l_createElement_1(v34, v35, v36);
    return l_createElement_0(v30, v31, v32);
end));
