local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v3.Focusable;
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemOwnershipPage.OwnedItemRow);
local v8 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v10 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagL2ControllerSupport);
return (v2.forwardRef(function(v11, v12)
    local v13 = l_useStyle_0();
    local v14 = v8({
        itemsOnSaleHeading = "Feature.Catalog.Heading.ItemsOnSale", 
        availableItemsHeading = "Feature.Catalog.Heading.AvailableItems", 
        cannotBeResold = "Feature.Catalog.Message.CannotBeResold"
    });
    local v15 = v3.useRefCache();
    local v16 = {};
    for v17, v18 in v11.items, nil, nil do
        v16[v18.id] = v2.createElement(v7, {
            itemId = v11.itemId, 
            itemType = v11.itemType, 
            title = v18.title, 
            buyPrice = v18.buyPrice, 
            salePrice = v18.salePrice, 
            isOnHold = v18.isOnHold, 
            resaleRestriction = v11.resaleRestriction, 
            isOnSale = v18.isOnSale, 
            restrictionTypes = v11.restrictionTypes, 
            layoutOrder = v17, 
            onActivated = function()
                v11.onItemActivated(v18.id, v18.isOnSale);
            end, 
            ref = if not v10() then nil else v15[v17], 
            NextSelectionUp = if not not v10() and v17 > 1 then v15[v17 - 1] else nil, 
            NextSelectionDown = if not not v10() and v17 < #v11.items then v15[v17 + 1] else nil
        });
    end;
    local l_createElement_0 = v2.createElement;
    local v20 = not v10() and "Frame" or l_Focusable_0.Frame;
    local v21 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v11.layoutOrder, 
        ref = if not v10() then nil else v12, 
        defaultChild = if not v10() then nil else v15[1], 
        restorePreviousChildFocus = not not v10() or nil
    };
    local v22 = {
        ListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, 24), 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local v23 = false;
    if v11.resaleRestriction == v9.ResaleRestriction.Disabled then
        v23 = v2.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Text = v14.cannotBeResold, 
            Font = v13.Font.Header2.Font, 
            TextSize = v13.Font.BaseSize * v13.Font.Header2.RelativeSize, 
            TextColor3 = v13.Theme.TextEmphasis.Color, 
            BackgroundTransparency = 1, 
            LayoutOrder = 0
        });
    end;
    v22.ResaleRestrictionLabel = v23;
    v22.Rows = v2.createElement(v2.Fragment, nil, v16);
    return l_createElement_0(v20, v21, v22);
end));
