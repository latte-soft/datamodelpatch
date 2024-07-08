local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v5 = require(l_CorePackages_0.UIBlox);
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local v7 = require(l_CorePackages_0.Packages.t);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_ItemTile_0 = v5.Tile.ItemTile;
local l_ItemTileEnums_0 = v5.Tile.ItemTileEnums;
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_ShimmerPanel_0 = v5.App.Loading.ShimmerPanel;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v19 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v20 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v21 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v22 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v23 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v24 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v25 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v26 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local v27 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetEquippedInTryOnManagerThunk);
local v28 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v30 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v31 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.PremiumBar);
local v32 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.ActionButton);
local v33 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.OpenPremiumUpsellPrompt);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local v35 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v36 = require(l_Modules_0.AvatarExperience.Common.Models.ItemInfo);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v39 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXAvatarWidgetData);
local v40 = require(l_Modules_0.AvatarExperience.Flags.GetAXDisableBundleIcon);
local v41 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXImproveTryOnManagerUI);
local v42 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXTryOnManagerVerticalCenterItemText);
local v43 = l_Images_0["icons/common/robux"];
local v44 = not v41() and 110 or 95;
local v45 = not v41() and 20 or 0;
local v46 = not v41() and 32 or 15;
local v47 = not v41() and 56 or 46;
local v48 = not v41() and 28 or 22;
local v49 = utf8.char(57345);
local v50 = v2.PureComponent:extend("TryOnManagerElement");
v50.validateProps = v7.strictInterface({
    tryOnItem = v7.optional(v7.table), 
    layoutOrder = v7.optional(v7.number), 
    elementRef = v7.optional(v7.table), 
    updatePeekViewState = v7.optional(v7.callback), 
    allowAutomaticPeekViewStateChanges = v7.optional(v7.boolean), 
    NextSelectionDown = v7.optional(v7.table), 
    NextSelectionUp = v7.optional(v7.table), 
    NextSelectionLeft = v7.optional(v7.table), 
    NextSelectionRight = v7.optional(v7.table), 
    DEPRECATED_itemData = if not v35 then v7.optional(v7.table) else nil, 
    itemInfo = if not v35 then nil else v7.optional(v36.Validator), 
    playerMembership = v7.optional(v7.enum(Enum.MembershipType)), 
    fetchItemData = v7.callback, 
    setEquippedInTryOnManager = v7.callback, 
    openPremiumUpsell = v7.callback, 
    setTryOnManagerPeekViewState = v7.optional(v7.callback), 
    networking = v7.callback, 
    appAnalytics = v7.table, 
    catalogAnalytics = v7.table, 
    localization = v7.table, 
    navigation = v7.table
});
v50.init = function(v51)
    v51.openPremiumUpsell = function()
        local l_networking_0 = v51.props.networking;
        local l_catalogAnalytics_0 = v51.props.catalogAnalytics;
        local l_tryOnItem_0 = v51.props.tryOnItem;
        v51.props.openPremiumUpsell(l_networking_0, l_catalogAnalytics_0, l_tryOnItem_0.itemId, l_tryOnItem_0.itemType == v22.ItemType.Bundle, v51.props.navigation);
    end;
    v51.onTileActivated = function()
        local l_tryOnItem_1 = v51.props.tryOnItem;
        if l_tryOnItem_1 then
            v51.props.setEquippedInTryOnManager(l_tryOnItem_1.itemId, not l_tryOnItem_1.selectedInTryOnManager, v51.props.catalogAnalytics, if not v39() then nil else l_tryOnItem_1.itemType);
            if v51.props.allowAutomaticPeekViewStateChanges then
                v51.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Brief);
            end;
            return ;
        else
            return ;
        end;
    end;
end;
v50.getItemIconType = function(v56)
    local l_tryOnItem_2 = v56.props.tryOnItem;
    if not (l_tryOnItem_2.itemType == v22.ItemType.Bundle) then
        return l_tryOnItem_2.itemType == v22.ItemType.Bundle and l_ItemTileEnums_0.ItemIconType.Bundle or nil;
    elseif not (l_tryOnItem_2.itemSubType == v22.BundleTypeIdStrings.DynamicHead) then
        if not v40() then
            return l_ItemTileEnums_0.ItemIconType.Bundle;
        else
            return nil;
        end;
    else
        return l_ItemTileEnums_0.ItemIconType.DynamicHead;
    end;
end;
v50.DEPRECATED_getElementTextAndIcon = function(v58, v59, v60, v61)
    local v62 = not not v59 and (v59.lowestPrice or v59.priceInRobux) or nil;
    if not (not v60 or not (v58.props.playerMembership == Enum.MembershipType.Premium)) then
        v62 = v59.premiumPricing.premiumPriceInRobux;
    end;
    local v63 = v59 and v59.isOwned;
    local v64 = false;
    local v65 = "";
    if not v63 then
        if v62 == 0 then
            v65 = v61.freeText;
        elseif v62 ~= nil then
            v65 = l_NumberLocalization_0.localize(string.format("%.0f", v62), v58.props.localization:GetLocale());
            v64 = true;
        elseif v59 ~= nil then
            v65 = v61.offSaleText;
        end;
    else
        v65 = v61.ownedText;
    end;
    return v65, v64;
end;
v50.getElementTextAndIcon = function(v66, v67, v68, v69)
    local v70 = not not v67 and (v67.lowestPrice or v67.priceInRobux) or nil;
    if not ((not v68 or not (v66.props.playerMembership == Enum.MembershipType.Premium)) or not v67.premiumPricing) then
        v70 = v67.premiumPricing.premiumPriceInRobux;
    end;
    local v71 = v67 and v67.isOwned;
    local v72 = false;
    local v73 = "";
    if not v71 then
        if v70 == 0 then
            v73 = v69.freeText;
        elseif v70 ~= nil then
            v73 = l_NumberLocalization_0.localize(string.format("%.0f", v70), v66.props.localization:GetLocale());
            v72 = true;
        elseif v67 ~= nil then
            v73 = v69.offSaleText;
        end;
    else
        v73 = v69.ownedText;
    end;
    return v73, v72;
end;
v50.renderElement = function(v74, v75, v76)
    local l_tryOnItem_3 = v74.props.tryOnItem;
    local l_Theme_0 = v75.Theme;
    local l_Font_0 = v75.Font;
    local v80 = l_Font_0.BaseSize * if not v41() then l_Font_0.Header1.RelativeSize else l_Font_0.Header2.RelativeSize;
    local v81 = v74.props.playerMembership == Enum.MembershipType.Premium;
    local v82 = nil;
    local v83 = nil;
    local v84 = nil;
    local v85 = nil;
    local v86 = nil;
    local v87 = nil;
    local v88 = nil;
    local v89 = nil;
    local v90 = nil;
    local v91 = nil;
    if not v35 then
        local l_DEPRECATED_itemData_0 = v74.props.DEPRECATED_itemData;
        v82 = v23.DEPRECATED_HasPremiumBenefits(l_DEPRECATED_itemData_0);
        v83 = if not l_DEPRECATED_itemData_0 then nil else l_DEPRECATED_itemData_0.name;
        local v93 = false;
        if l_DEPRECATED_itemData_0 ~= nil then
            v93 = l_DEPRECATED_itemData_0.receivedCatalogData;
        end;
        v84 = v93;
        local v94;
        v93, v94 = v74:DEPRECATED_getElementTextAndIcon(l_DEPRECATED_itemData_0, v82, v76);
        v85 = v93;
        v86 = v94;
        v91 = v23.DEPRECATED_IsPremiumExclusive(l_DEPRECATED_itemData_0);
        v87 = v91 and not v81;
        v88 = l_DEPRECATED_itemData_0 and l_DEPRECATED_itemData_0.tileRestrictionsMap;
        if not (not l_DEPRECATED_itemData_0 or not l_DEPRECATED_itemData_0.premiumPricing) then
            v89 = l_DEPRECATED_itemData_0.premiumPricing.premiumDiscountPercentage;
            v90 = l_DEPRECATED_itemData_0.premiumPricing.premiumPriceInRobux;
        end;
    else
        local l_itemInfo_0 = v74.props.itemInfo;
        if l_itemInfo_0 then
            v82 = not not l_itemInfo_0.hasPremiumBenefits or false;
            local v96, v97 = v74:getElementTextAndIcon(l_itemInfo_0, v82, v76);
            v85 = v96;
            v86 = v97;
            v83 = l_itemInfo_0.name;
            v84 = l_itemInfo_0.receivedCatalogData;
            v91 = l_itemInfo_0.isPremiumExclusive;
            v87 = v91 and not v81;
            v88 = l_itemInfo_0.tileRestrictionsMap;
            if l_itemInfo_0.premiumPricing then
                v89 = l_itemInfo_0.premiumPricing.premiumDiscountPercentage;
                v90 = l_itemInfo_0.premiumPricing.premiumPriceInRobux;
            end;
        end;
    end;
    local v98 = not not l_tryOnItem_3.itemType and v23.GetRbxThumbType(l_tryOnItem_3.itemType) or nil;
    local v99 = nil;
    if not (not l_tryOnItem_3.itemId or not v98) then
        v99 = l_getRbxthumbWithTypeSizeAndOptions_0(l_tryOnItem_3.itemId, v98, 150);
    end;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = 1
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, v46)
        }), 
        TryOnManagerTileFrame = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(v44, v44), 
            LayoutOrder = 1
        }, {
            TryOnManagerTile = v2.createElement(l_ItemTile_0, {
                itemIconType = v74:getItemIconType(), 
                restrictionTypes = v88, 
                isSelected = l_tryOnItem_3.selectedInTryOnManager, 
                isPremium = v82, 
                onActivated = v74.onTileActivated, 
                thumbnail = v99, 
                titleTextLineCount = 0
            })
        }), 
        TryOnInfoFrame = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, ((-10 - v44) - v46) - v45, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, not v41() and 10 or 3)
            }), 
            ItemName = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, v47), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                TextSize = v80, 
                Font = l_Font_0.Header1.Font, 
                TextColor3 = l_Theme_0.IconEmphasis.Color, 
                TextTransparency = l_Theme_0.IconEmphasis.Transparency, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = if not v42() then Enum.TextYAlignment.Top else Enum.TextYAlignment.Center, 
                TextWrapped = true, 
                Text = if not not v82 and v83 then v49 .. " " .. v83 else v83
            }), 
            PremiumBar = v82 and v2.createElement(v31, {
                headerPadding = 0, 
                isPlayerPremium = v74.props.playerMembership == Enum.MembershipType.Premium, 
                isPremiumExclusive = v91, 
                discountPercent = v89, 
                premiumPrice = v90, 
                onPremiumActivated = if v81 or v87 then nil else v74.openPremiumUpsell, 
                LayoutOrder = 2, 
                paddingLeft = 0, 
                paddingTop = 0, 
                smallerTextSize = not not v41() or nil
            }), 
            GetPremiumButton = v87 and v2.createElement(v32, {
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 0, 44), 
                Font = l_Font_0, 
                buttonProps = {
                    buttonText = v76.getPremiumText, 
                    buttonColor = v75.Theme.SystemPrimaryDefault.Color, 
                    buttonTextColor = v75.Theme.SystemPrimaryContent.Color, 
                    onActivated = v74.openPremiumUpsell
                }
            }), 
            ItemPriceFrame = not v87 and v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, (v44 - v47) - (not v41() and 10 or 20)), 
                BackgroundTransparency = 1, 
                LayoutOrder = not v82 and 2 or 3
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    Padding = UDim.new(0, 0)
                }), 
                Shimmer = not v84 and v2.createElement(l_ShimmerPanel_0, {
                    Size = UDim2.new(0.8, 0, 0, v48)
                }) or nil, 
                Icon = (not not v84 and v86) and v2.createElement(l_ImageSetLabel_0, {
                    Image = v43, 
                    ImageTransparency = 0, 
                    ImageColor3 = l_Theme_0.SecondaryContent.Color, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromOffset(v48, v48), 
                    LayoutOrder = 1
                }) or nil, 
                Price = not not v84 and v2.createElement("TextLabel", {
                    Size = UDim2.new(1, -v48 - 10, 0, v48), 
                    Text = v85, 
                    TextSize = v80, 
                    Font = l_Font_0.Header1.Font, 
                    TextColor3 = l_Theme_0.SecondaryContent.Color, 
                    TextTransparency = l_Theme_0.SecondaryContent.Transparency, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = if not v42() then Enum.TextYAlignment.Bottom else Enum.TextYAlignment.Center, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }) or nil
            })
        })
    });
end;
v50.renderWithProviders = function(v100, v101, v102)
    return v2.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v100.props.layoutOrder, 
        ref = v100.props.elementRef, 
        NextSelectionDown = v100.props.NextSelectionDown, 
        NextSelectionUp = v100.props.NextSelectionUp
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, 12)
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 10)
        }), 
        TryOnManagerElement = v100:renderElement(v101, v102), 
        Divider = if not v41() then v2.createElement("Frame", {
            BackgroundTransparency = 0.8, 
            BackgroundColor3 = v101.Theme.SystemPrimaryDefault.Color, 
            Size = UDim2.new(1, -10, 0, 1), 
            LayoutOrder = 2
        }) else nil
    });
end;
v50.render = function(v103)
    return l_withStyle_0(function(v104)
        return l_withLocalization_0({
            ownedText = "Feature.Catalog.Label.Owned", 
            freeText = "Feature.Catalog.Label.FreeUpperCase", 
            getPremiumText = "Feature.PremiumUpsell.Title.GetPremium", 
            offSaleText = "Feature.Catalog.LabelOffSale"
        })(function(v105)
            return v103:renderWithProviders(v104, v105);
        end);
    end);
end;
v50.didMount = function(v106)
    local _ = nil;
    if if not v35 then not v106.props.DEPRECATED_itemData or not v106.props.DEPRECATED_itemData.receivedCatalogData else not v106.props.itemInfo or not v106.props.tryOnItem.receivedCatalogData then
        local l_tryOnItem_4 = v106.props.tryOnItem;
        v106.props.fetchItemData(v106.props.networking, v106.props.appAnalytics, l_tryOnItem_4.itemId, l_tryOnItem_4.itemType);
    end;
end;
return (v3.connect(function(v109, v110)
    local v111 = nil;
    local v112 = nil;
    if not v35 then
        v111 = v24(v109.AvatarExperience.Common, v110.tryOnItem.itemId, v110.tryOnItem.itemType);
    else
        v112 = v25(v109.AvatarExperience, v110.tryOnItem.itemId, v110.tryOnItem.itemType);
    end;
    local l_LocalUserId_0 = v109.LocalUserId;
    return {
        DEPRECATED_itemData = v111, 
        itemInfo = v112, 
        playerMembership = not not v109.Users[l_LocalUserId_0] and v109.Users[l_LocalUserId_0].membership or Enum.MembershipType.None
    };
end, function(v114)
    return {
        fetchItemData = function(v115, v116, v117, v118)
            return v114(v26(v115, v116, v117, v118));
        end, 
        setEquippedInTryOnManager = function(v119, v120, v121, v122)
            return v114(v27(v119, v120, v121, v122));
        end, 
        openPremiumUpsell = function(v123, v124, v125, v126, v127)
            v114(v33(v123, v124, nil, v127, {
                assetId = v125, 
                isBundle = v126
            }));
        end, 
        setTryOnManagerPeekViewState = function(v128)
            v114(v28(v128));
        end
    };
end)((l_withNavigation_0((l_RoactServices_0.connect({
    appAnalytics = v21, 
    catalogAnalytics = v30, 
    networking = v19, 
    localization = v20
})(v50))))));
