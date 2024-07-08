local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.AvatarExperienceDeps);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v10 = require(l_CorePackages_0.RoactNavigation);
local l_GetFFlagEnableUISoundAndHaptics_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableUISoundAndHaptics;
local l_withTriggerFeedback_0 = require(l_CorePackages_0.Workspace.Packages.InteractionFeedback).withTriggerFeedback;
local l_withNavigation_0 = v10.withNavigation;
local l_RoactFitComponents_0 = v4.RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v19 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v24 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.PurchaseProduct);
local v25 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v26 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v27 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v28 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v29 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v30 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.RobuxAmountDisplay);
local v32 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.PurchasePromptInteractiveAlert);
local v33 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v33.Style.withStyle;
local l_Checkbox_0 = v33.App.InputButton.Checkbox;
local v36 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v37 = require(l_Modules_0.LuaApp.Thunks.Challenge.RenderChallenge);
local v38 = require(l_Modules_0.LuaApp.Thunks.Challenge.RenderPurchaseChallenge);
local v39 = require(l_Modules_0.AvatarExperience.Flags.FFlagEnableSpendFrictionTwoFactor);
local v40 = require(l_Modules_0.AvatarExperience.Flags.FFlagEnableTwoStepCatalogAnalytics);
local v41 = require(l_Modules_0.AvatarExperience.Flags.FFlagDisableWearAfterPurchaseForCollectibles);
local v42 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableWearAfterPurchaseDefaultChecked);
local v43 = v2.PureComponent:extend("PurchasePrompt");
v43.defaultProps = {
    sellerName = ""
};
v43.getPolicySpecifiedSellerName = function(v44, v45)
    if v44.props.robloxSellerNameShouldBeLuobu and string.lower((utf8.nfdnormalize(v45))) == "roblox" then
        return "\231\189\151\229\184\131\228\185\144\230\128\157";
    else
        return v45;
    end;
end;
v43.init = function(v46)
    v46.checkboxRef = v2.createRef();
    v46.state = {
        isWearAfterPurchaseChecked = v42()
    };
    v46.onCancel = function()
        v46.props.analytics.clickCancelPurchaseItem(v46.props.itemId, v46.props.itemType);
        v46.closePrompt();
    end;
    v46.onConfirm = function()
        if l_GetFFlagEnableUISoundAndHaptics_0() then
            v46.props.triggerFeedback("MakePurchase", "Press");
        end;
        local l_analytics_0 = v46.props.analytics;
        local l_itemId_0 = v46.props.itemId;
        local l_itemType_0 = v46.props.itemType;
        local l_priceInRobux_0 = v46.props.priceInRobux;
        local l_sellerId_0 = v46.props.sellerId;
        local l_networking_0 = v46.props.networking;
        local l_DEPRECATED_itemData_0 = v46.props.DEPRECATED_itemData;
        local l_itemInfo_0 = v46.props.itemInfo;
        local l_userAssetId_0 = v46.props.userAssetId;
        local l_itemSubType_0 = v46.props.itemSubType;
        local l_navigation_0 = v46.props.navigation;
        local l_fromProfile_0 = v46.props.fromProfile;
        local l_fromAvatarRoute_0 = v46.props.fromAvatarRoute;
        local l_widgetInfo_0 = v46.props.widgetInfo;
        local v61 = nil;
        local v62 = nil;
        local v63 = nil;
        if not v30 then
            v61 = (l_DEPRECATED_itemData_0 and l_DEPRECATED_itemData_0.product) and l_DEPRECATED_itemData_0.product.id;
            v62 = l_DEPRECATED_itemData_0 and l_DEPRECATED_itemData_0.collectibleItemId;
            v63 = (l_DEPRECATED_itemData_0 and l_DEPRECATED_itemData_0.creator) and l_DEPRECATED_itemData_0.creator.type;
        elseif l_itemInfo_0 then
            v61 = l_itemInfo_0.productId;
            v62 = l_itemInfo_0.collectibleItemId;
            if l_itemInfo_0.creator then
                v63 = l_itemInfo_0.creator.type;
            end;
        end;
        local l_isWearAfterPurchaseChecked_0 = v46.state.isWearAfterPurchaseChecked;
        local v65 = if not l_fromAvatarRoute_0 then nil else l_fromAvatarRoute_0.current.name;
        local l_collectibleInstanceId_0 = v46.props.collectibleInstanceId;
        if not v39 then
            v46.props.purchaseProduct(l_networking_0, v61, l_priceInRobux_0 or 0, l_sellerId_0, l_itemId_0, l_itemType_0, l_itemSubType_0, l_isWearAfterPurchaseChecked_0, l_userAssetId_0, l_analytics_0, l_navigation_0, l_fromProfile_0, false, v65, v62, l_collectibleInstanceId_0, v63, l_widgetInfo_0);
            return ;
        else
            v46.props.purchaseProduct(l_networking_0, v61, l_priceInRobux_0 or 0, l_sellerId_0, l_itemId_0, l_itemType_0, l_itemSubType_0, l_isWearAfterPurchaseChecked_0, l_userAssetId_0, l_analytics_0, l_navigation_0, l_fromProfile_0, false, v65, v62, l_collectibleInstanceId_0, v63, l_widgetInfo_0):andThen(function(v67)
                local l_purchased_0 = v67.purchased;
                local l_is2SVEnabled_0 = v67.is2SVEnabled;
                local l_challengeToken_0 = v67.challengeToken;
                if not l_purchased_0 then
                    if l_is2SVEnabled_0 == false then
                        if v40 then
                            l_analytics_0.shownEnableTwoStepAuthOnPurchase();
                        end;
                        v46.showTwoStepRequiredPrompt();
                        return ;
                    elseif not l_challengeToken_0 then
                        if v40 then
                            l_analytics_0.failedShowTwoStepAuthOnPurchase();
                        end;
                        v46.closePrompt();
                        return ;
                    else
                        if v40 then
                            l_analytics_0.shownTwoStepAuthOnPurchase();
                        end;
                        v46:renderTwoStepChallenge(l_challengeToken_0);
                        return ;
                    end;
                else
                    v46.closePrompt();
                    return ;
                end;
            end, function(_)
                v46.closePrompt();
            end);
            return ;
        end;
    end;
    v46.toggleWearAfterPurchase = function()
        local l_analytics_1 = v46.props.analytics;
        local l_itemId_1 = v46.props.itemId;
        local l_itemType_1 = v46.props.itemType;
        local v75 = not v46.state.isWearAfterPurchaseChecked;
        l_analytics_1.clickWearItemAfterPurchase(l_itemId_1, l_itemType_1, v75);
        v46:setState({
            isWearAfterPurchaseChecked = v75
        });
    end;
    v46.closePrompt = function()
        v9.closeOverlay(v46.props.navigation);
    end;
    v46.showTwoStepRequiredPrompt = function()
        v9.navigateToNextOverlay(v46.props.navigation, v7.TwoStepRequiredPrompt);
    end;
end;
v43.showWearAfterPurchase = function(v76)
    local l_itemType_2 = v76.props.itemType;
    local l_itemSubType_1 = v76.props.itemSubType;
    local v79 = false;
    if l_itemType_2 == v26.ItemType.Asset then
        v79 = l_itemSubType_1 ~= v26.AssetTypeIdStrings.EmoteAnimation;
    end;
    if v41 then
        local l_DEPRECATED_itemData_1 = v76.props.DEPRECATED_itemData;
        local l_itemInfo_1 = v76.props.itemInfo;
        local v82 = nil;
        if not v30 then
            v82 = l_DEPRECATED_itemData_1 and l_DEPRECATED_itemData_1.collectibleItemId;
        elseif l_itemInfo_1 then
            v82 = l_itemInfo_1.collectibleItemId;
        end;
        if v82 then
            v79 = false;
        end;
    end;
    return v79;
end;
v43.renderTwoStepChallenge = function(v83, v84)
    v83.props.renderPurchaseChallenge(v84, v83.props.userId, v83.props.analytics, v83.props.networking, v83.onConfirm, v83.closePrompt, v83.props.onRenderTwoStepChallenge);
end;
v43.willUpdate = function(v85, v86, _)
    if not (v39 or not v36.isFetchingDoneOrFailed(v85.props.fetchingState, v86.fetchingState)) then
        v85.closePrompt();
    end;
end;
v43.renderMiddle = function(v88, v89)
    local v90 = v88.props.priceInRobux or "";
    local v91 = v90 == 0;
    local v92 = not v91;
    return l_withStyle_0(function(v93)
        local l_Font_0 = v93.Font;
        local l_Theme_0 = v93.Theme;
        local v96 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
        return v2.createElement(l_Focusable_0[l_FitFrameVertical_0], {
            BackgroundTransparency = 1, 
            width = UDim.new(1, 0), 
            defaultChild = v88.checkboxRef
        }, {
            PriceContainer = not v91 and v2.createElement(l_FitFrameVertical_0, {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                contentPadding = UDim.new(0, 6), 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                margin = l_RoactFitComponents_0.Rect.quad(0, 0, 24, 0), 
                width = UDim.new(1, 0)
            }, {
                PriceLabel = v2.createElement(l_FitTextLabel_0, {
                    width = l_FitTextLabel_0.Width.FitToText, 
                    BackgroundTransparency = 1, 
                    Font = l_Font_0.Body.Font, 
                    Text = v89.priceLabel, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency, 
                    TextSize = v96, 
                    LayoutOrder = 0
                }), 
                RobuxContainer = v2.createElement(v31, {
                    robuxAmountText = tostring(v90), 
                    iconSize = not not v92 and v96 or 0, 
                    textSize = v96, 
                    padding = 4, 
                    showRobuxIcon = v92
                })
            }), 
            CheckboxContainer = v88:showWearAfterPurchase() and v2.createElement(l_Checkbox_0, {
                text = v89.wearItemLabel, 
                isSelected = v88.state.isWearAfterPurchaseChecked, 
                onActivated = v88.toggleWearAfterPurchase, 
                layoutOrder = 2, 
                [v2.Ref] = v88.checkboxRef
            })
        });
    end);
end;
v43.renderAlertLocalized = function(v97, v98)
    local l_DEPRECATED_itemData_2 = v97.props.DEPRECATED_itemData;
    local l_itemInfo_2 = v97.props.itemInfo;
    local l_priceInRobux_1 = v97.props.priceInRobux;
    local v102 = v97:getPolicySpecifiedSellerName(v97.props.sellerName);
    local v103 = nil;
    if not v30 then
        v103 = not not l_DEPRECATED_itemData_2 and l_DEPRECATED_itemData_2.name or "";
    elseif l_itemInfo_2 then
        v103 = l_itemInfo_2.name;
    end;
    local v104 = (l_priceInRobux_1 or "") == 0;
    local v105 = nil;
    local v106 = nil;
    local v107 = nil;
    if not v104 then
        v105 = v98.titleText;
        v106 = v98.descriptionText;
        v107 = v98.confirmButtonText;
    else
        v105 = v98.freeTitleText;
        v106 = v98.freeDescriptionText;
        v107 = v98.freeConfirmButtonText;
    end;
    return v2.createElement(v32, {
        priceInRobux = l_priceInRobux_1, 
        showWearAfterPurchase = v97:showWearAfterPurchase(), 
        isWearAfterPurchaseChecked = v97.state.isWearAfterPurchaseChecked, 
        toggleWearAfterPurchase = v97.toggleWearAfterPurchase, 
        titleText = v105, 
        bodyText = v106:gsub("({itemName})", function()
            return v103;
        end):gsub("({creatorName})", function()
            return v102;
        end), 
        confirmButtonText = v107, 
        onConfirm = v97.onConfirm, 
        onCancel = v97.onCancel, 
        isLoading = v97.props.fetchingState == l_RetrievalStatus_0.Fetching, 
        defaultChildRef = v97.props.defaultChildRef
    });
end;
v43.render = function(v108)
    local v109 = "Feature.Catalog.Label.BuyConfirmation";
    if v108.props.enablePurchasePromptIncludingWarning then
        v109 = "Feature.Catalog.Label.BuyConfirmationIncludingWarning";
    end;
    return l_withLocalization_0({
        freeConfirmButtonText = "Feature.Catalog.Label.Get", 
        freeDescriptionText = "Feature.Catalog.Label.FreeItemConfirmation", 
        freeTitleText = "Feature.Catalog.Heading.FreeItemConfirmation", 
        titleText = "Feature.Catalog.Heading.BuyItem", 
        priceLabel = "Feature.Catalog.Label.PriceColon", 
        confirmButtonText = "Feature.Catalog.Heading.BuyItem", 
        cancelButtonText = "Feature.Catalog.Action.Cancel", 
        descriptionText = v109, 
        wearItemLabel = "Feature.Catalog.Label.WearAfterPurchase"
    })(function(v110)
        return v108:renderAlertLocalized(v110);
    end);
end;
v43 = l_withNavigation_0((v8((v6((l_RoactServices_0.connect({
    networking = v19, 
    analytics = v23
})((v3.connect(function(v111, v112)
    local l_itemId_2 = v112.itemId;
    local l_itemType_3 = v112.itemType;
    local v115 = nil;
    local v116 = nil;
    local v117 = nil;
    local v118 = nil;
    if not v30 then
        v116 = v28(v111.AvatarExperience.Common, l_itemId_2, l_itemType_3);
        v115 = (v116 and v116.product) and v116.product.id;
        v118 = v27.DEPRECATED_GetItemSubType(l_itemType_3, v116);
    else
        v117 = v29(v111.AvatarExperience, l_itemId_2, l_itemType_3);
        v115 = if not v117 then nil else v117.productId;
        v118 = if not v117 then nil else v117.itemSubType;
    end;
    return {
        DEPRECATED_itemData = if not v30 then v116 else nil, 
        itemInfo = if not v30 then nil else v117, 
        itemSubType = v118, 
        fetchingState = l_PerformFetch_0.GetStatus(v111, v25.PurchaseProductKey .. tostring(v115)), 
        screenSize = v111.ScreenSize, 
        userId = not not v39 and v111.LocalUserId or nil
    };
end, function(v119)
    return {
        purchaseProduct = function(v120, v121, v122, v123, v124, v125, v126, v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137)
            return v119(v24(v120, v121, v122, v123, v124, v125, v126, v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137));
        end, 
        renderChallenge = function(v138, v139)
            return v119(v37(v138, v139));
        end, 
        renderPurchaseChallenge = function(v140, v141, v142, v143, v144, v145, v146)
            return v119(v38(v140, v141, v142, v143, v144, v145, v146));
        end
    };
end)((l_RoactAppPolicy_0.connect(function(v147, _)
    return {
        robloxSellerNameShouldBeLuobu = v147.getRobloxCreatedItemsCreatedByLuobu(), 
        enablePurchasePromptIncludingWarning = v147.getPurchasePromptIncludingWarning()
    };
end)(v43)))))))))));
if l_GetFFlagEnableUISoundAndHaptics_0() then
    v43 = l_withTriggerFeedback_0(v43);
end;
return v43;
