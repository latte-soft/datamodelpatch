local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.AvatarExperienceDeps);
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v6.Focusable;
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local l_RoactFitComponents_0 = v5.RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local v12 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.SellPage.AvailableToSellRow);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.SellPage.AvailableToSellLimitedUniqueRow);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v18 = v3.PureComponent:extend("AvailableToSellList");
v18.init = function(v19)
    v19.sellLimitedUniqueItem = function(v20)
        v19.props.navigation.navigate(v15.SellItemPrompt, {
            itemId = v19.props.itemId, 
            itemType = v19.props.itemType, 
            userAssetId = v20, 
            onOverlayClosed = v19.props.onOverlayClosed
        });
    end;
    v19.sellLimitedItem = function()
        v19.props.navigation.navigate(v15.SellItemPrompt, {
            itemId = v19.props.itemId, 
            itemType = v19.props.itemType, 
            userAssetId = v19.props.availableItemsToSell[1], 
            onOverlayClosed = v19.props.onOverlayClosed
        });
    end;
    v19.focusableRefs = v6.createRefCache();
end;
v18.createAvailableToSellLimitedUniqueList = function(v21, v22)
    local l_availableItemsToSell_0 = v21.props.availableItemsToSell;
    local function _(v24)
        local v25 = false;
        if v24 >= 1 then
            v25 = v24 <= #l_availableItemsToSell_0;
        end;
        return not not v25 and v21.focusableRefs[v24] or nil;
    end;
    local v27 = {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local v28 = 0;
    if l_availableItemsToSell_0 then
        for v29, v30 in l_availableItemsToSell_0, nil, nil do
            local v31 = v29 < #l_availableItemsToSell_0;
            v28 = v28 + 1;
            local v32 = "AvailableToSellLimitedUniqueRow" .. v29;
            local l_createElement_0 = v3.createElement;
            local l_l_FitFrameVertical_0_0 = l_FitFrameVertical_0;
            local v35 = {
                width = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 8), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                BackgroundTransparency = 1, 
                LayoutOrder = v29
            };
            local v36 = {};
            local l_createElement_1 = v3.createElement;
            local l_v14_0 = v14;
            local v39 = {
                horizontalPadding = 24, 
                LayoutOrder = 1, 
                onActivated = function()
                    v21.sellLimitedUniqueItem(v30);
                end, 
                userAssetId = v30
            };
            local v40 = v29 - 1;
            local v41 = false;
            if v40 >= 1 then
                v41 = v40 <= #l_availableItemsToSell_0;
            end;
            v39.NextSelectionUp = not not v41 and v21.focusableRefs[v40] or nil;
            v40 = v29 + 1;
            v41 = false;
            if v40 >= 1 then
                v41 = v40 <= #l_availableItemsToSell_0;
            end;
            v39.NextSelectionDown = not not v41 and v21.focusableRefs[v40] or nil;
            local l_Ref_0 = v3.Ref;
            v41 = false;
            if v29 >= 1 then
                v41 = v29 <= #l_availableItemsToSell_0;
            end;
            v39[l_Ref_0] = not not v41 and v21.focusableRefs[v29] or nil;
            v36.AvailableToSellLimitedUniqueRow = l_createElement_1(l_v14_0, v39);
            v36.Divider = v31 and v3.createElement("Frame", {
                BackgroundColor3 = v22.Divider.Color, 
                BackgroundTransparency = v22.Divider.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, -24, 0, 1)
            });
            v27[v32] = l_createElement_0(l_l_FitFrameVertical_0_0, v35, v36);
        end;
    end;
    return v27;
end;
v18.renderLocalized = function(v43, v44)
    local l_availableItemsToSell_1 = v43.props.availableItemsToSell;
    local l_LayoutOrder_0 = v43.props.LayoutOrder;
    local l_itemRestrictions_0 = v43.props.itemRestrictions;
    local v48 = l_itemRestrictions_0 and l_itemRestrictions_0[v12.ItemRestrictions.LimitedUnique];
    local v49 = l_itemRestrictions_0 and l_itemRestrictions_0[v12.ItemRestrictions.Limited];
    local v50 = not not l_availableItemsToSell_1 and #l_availableItemsToSell_1 or 0;
    local _ = nil;
    local v52 = (if v50 == 1 then v44.itemCountSingularLabel else v44.itemCountPluralLabel):gsub("({itemCount})", v50);
    return l_withStyle_0(function(v53)
        local l_Font_0 = v53.Font;
        local l_Theme_0 = v53.Theme;
        return v3.createElement(l_Focusable_0[l_FitFrameVertical_0], {
            width = UDim.new(1, 0), 
            contentPadding = UDim.new(0, 6), 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_LayoutOrder_0, 
            NextSelectionLeft = v43.props.NextSelectionLeft, 
            NextSelectionRight = v43.props.NextSelectionRight, 
            NextSelectionUp = v43.props.NextSelectionUp, 
            NextSelectionDown = v43.props.NextSelectionDown, 
            [v3.Ref] = v43.props.forwardRef, 
            defaultChild = (not not l_availableItemsToSell_1 and #l_availableItemsToSell_1 > 0) and v43.focusableRefs[1] or nil
        }, {
            AvailableForSaleLabelContainer = v3.createElement(l_FitFrameVertical_0, {
                width = UDim.new(1, 0), 
                margin = l_RoactFitComponents_0.Rect.quad(0, 0, 0, 24), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                AvailableForSaleLabel = v3.createElement(l_FitTextLabel_0, {
                    width = l_FitTextLabel_0.Width.FitToText, 
                    Font = l_Font_0.CaptionSubHeader.Font, 
                    BackgroundTransparency = 1, 
                    Text = v44.headerText, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextSize = l_Font_0.BaseSize * l_Font_0.CaptionSubHeader.RelativeSize, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color
                })
            }), 
            LimitedCountRow = v49 and v3.createElement(v13, {
                horizontalPadding = 24, 
                LayoutOrder = 2, 
                onActivated = v43.sellLimitedItem, 
                Text = v52, 
                [v3.Ref] = v43.focusableRefs[1]
            }), 
            LimitedUniqueRowConatiner = v48 and v3.createElement(l_FitFrameVertical_0, {
                width = UDim.new(1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, v48 and v43:createAvailableToSellLimitedUniqueList(l_Theme_0))
        });
    end);
end;
v18.render = function(v56)
    local l_availableItemsToSell_2 = v56.props.availableItemsToSell;
    if not l_availableItemsToSell_2 or #l_availableItemsToSell_2 == 0 then
        return ;
    else
        return l_withLocalization_0({
            headerText = "Feature.Catalog.Label.AvailableForSale", 
            itemCountPluralLabel = "Feature.Catalog.Label.ItemsCount", 
            itemCountSingularLabel = "Feature.Catalog.Label.ItemCount"
        })(function(v58)
            return v56:renderLocalized(v58);
        end);
    end;
end;
v18 = l_withNavigation_0((v4.connect(function(v59, v60)
    local v61 = v59.AvatarExperience.Common.AssetInfos[v60.itemId];
    return {
        itemRestrictions = v61 and v61.itemRestrictions, 
        availableItemsToSell = v59.AvatarExperience.Catalog.Sell.AvailableToSellAssets[v60.itemId]
    };
end, nil)(v18)));
return v3.forwardRef(function(v62, v63)
    return v3.createElement(v18, v2.Dictionary.join(v62, {
        forwardRef = v63
    }));
end);
