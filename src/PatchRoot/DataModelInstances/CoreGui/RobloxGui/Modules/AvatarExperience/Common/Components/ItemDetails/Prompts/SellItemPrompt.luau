local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v7 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local v9 = require(l_CorePackages_0.AvatarExperienceDeps);
local v10 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v10.Focusable;
local l_RoactFitComponents_0 = v9.RoactFitComponents;
local l_FitFrameHorizontal_0 = l_RoactFitComponents_0.FitFrameHorizontal;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.RemoveAvailableToSellAsset);
local v17 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.GetMarketplaceFee);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v22 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v23 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v24 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v25 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v26 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v29 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v30 = require(l_Modules_0.AvatarExperience.Catalog.Components.IconTextBox);
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.RobuxAmountDisplay);
local v32 = require(l_CorePackages_0.UIBlox);
local l_ImageSetLabel_0 = v32.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v32.App.ImageSet.Images;
local l_withStyle_0 = v32.Style.withStyle;
local l_InteractiveAlert_0 = v32.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v32.App.Button.Enum.ButtonType;
local l_LoadingStateContainer_0 = v32.App.Container.LoadingStateContainer;
local l_RetrievalStatus_1 = v32.App.Loading.Enum.RetrievalStatus;
local v40 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXResalePriceFloor);
local v41 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLimitedBundlesHandleNewData);
local v42 = l_Images_0["icons/common/robux"];
local v43 = v3.PureComponent:extend("SellItemPrompt");
v43.init = function(v44)
    v44.isMounted = false;
    v44.state = {
        isKeyboardRepositioned = false, 
        priceInRobux = 0
    };
    v44.changeText = function(v45)
        if v44.isMounted then
            local l_priceInRobux_0 = v44.state.priceInRobux;
            local l_Text_0 = v45.Text;
            local v48 = l_priceInRobux_0 == 0 and "" or l_priceInRobux_0;
            if string.len(l_Text_0) > 10 then
                v45.Text = v48;
                return ;
            elseif l_priceInRobux_0 ~= 0 and (not (l_Text_0 ~= nil) or l_Text_0 == "") then
                v44:setState({
                    priceInRobux = 0
                });
                return ;
            elseif not string.match(l_Text_0, "^[0-9]+$") then
                v45.Text = v48;
                return ;
            else
                v44:setState({
                    priceInRobux = l_Text_0
                });
                return ;
            end;
        else
            return ;
        end;
    end;
    v44.sellItem = function()
        local l_priceInRobux_1 = v44.state.priceInRobux;
        if not (not l_priceInRobux_1 or tonumber(l_priceInRobux_1) <= 0) then
            v44.props.sellAsset(v44.props.networking, v44.props.itemId, v44.props.userAssetId, (tonumber(l_priceInRobux_1)));
            return ;
        else
            return ;
        end;
    end;
    v44.getMarketplaceFee = function()
        return v44.props.getMarketplaceFee(v44.props.networking);
    end;
    v44.keyboardConnection = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):connect(function()
        if v44.isMounted then
            if not (v44.state.isKeyboardRepositioned or not l_UserInputService_0.OnScreenKeyboardVisible) then
                v44:setState({
                    isKeyboardRepositioned = true
                });
            end;
            return ;
        else
            return ;
        end;
    end);
    v44.getMiddleContent = function(v50)
        return function()
            return v3.createElement(l_LoadingStateContainer_0, {
                dataStatus = l_RetrievalStatus_1.fromRawValue(v44.props.marketPlaceFeeFetchingState), 
                onRetry = v44.getMarketplaceFee, 
                renderOnLoaded = function()
                    return l_withStyle_0(function(v51)
                        return v44:renderOnLoaded(v50, v51);
                    end);
                end
            });
        end;
    end;
    v44.closePrompt = function()
        v19.closeOverlay(v44.props.navigation);
    end;
end;
v43.didMount = function(v52)
    v52.isMounted = true;
    if v52.props.marketPlaceFeeFetchingState ~= l_RetrievalStatus_0.Fetching then
        v52.getMarketplaceFee();
    end;
end;
v43.willUpdate = function(v53, v54, _)
    if v26.isFetchingDoneOrFailed(v53.props.sellFetchingState, v54.sellFetchingState) then
        v53.closePrompt();
    end;
end;
v43.renderOnLoaded = function(v56, v57, v58)
    local l_marketplaceFee_0 = v56.props.marketplaceFee;
    local l_averagePrice_0 = v56.props.averagePrice;
    local l_localization_0 = v56.props.localization;
    local l_priceInRobux_2 = v56.state.priceInRobux;
    local l_taxRate_0 = l_marketplaceFee_0.taxRate;
    local l_minimumFee_0 = l_marketplaceFee_0.minimumFee;
    local v65 = not not l_averagePrice_0 and l_NumberLocalization_0.localize(l_averagePrice_0, l_localization_0:GetLocale()) or "";
    local v66 = 0;
    local v67 = 0;
    local v68 = true;
    local v69 = tonumber(l_priceInRobux_2);
    if v69 and v69 > 0 then
        v68 = false;
        local v70 = v22.Round(l_taxRate_0 * v69);
        v66 = l_minimumFee_0 < v70 and v70 or l_minimumFee_0;
        v67 = l_NumberLocalization_0.localize(string.format("%.0f", v22.Round(v69 - v66)), l_localization_0:GetLocale());
    end;
    local v71 = v57.robloxFeeText:gsub("({feePercentage})", l_taxRate_0 * 100);
    local v72 = l_NumberLocalization_0.localize(string.format("%.0f", v66), l_localization_0:GetLocale());
    local l_Font_0 = v58.Font;
    local l_Theme_0 = v58.Theme;
    local v75 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v76 = v75 + 2;
    return v3.createElement(l_FitFrameVertical_0, {
        contentPadding = UDim.new(0, 6), 
        width = UDim.new(1, 0), 
        BackgroundTransparency = 1, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center
    }, {
        PriceTextBox = v3.createElement(l_Focusable_0[v30], {
            LayoutOrder = 1, 
            PlaceholderText = v57.placeholderText, 
            Image = v42, 
            TextInputType = Enum.TextInputType.Number, 
            [v3.Change.Text] = v56.changeText
        }), 
        WarningText = v68 and v3.createElement(l_FitTextLabel_0, {
            width = UDim.new(1, 0), 
            BackgroundTransparency = 1, 
            Text = v57.minimumWarningText, 
            LayoutOrder = 2, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = UDim2.new(1, 0, 0, 20), 
            TextColor3 = l_Theme_0.Alert.Color, 
            TextWrapped = true, 
            Font = l_Font_0.Body.Font, 
            TextSize = l_Font_0.Body.RelativeSize * l_Font_0.BaseSize
        }), 
        RobuxFeeContainer = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 3, 
            Size = UDim2.new(1, 0, 0, v76)
        }, {
            RobloxFeeLabel = v3.createElement(l_FitTextLabel_0, {
                width = l_FitTextLabel_0.Width.FitToText, 
                BackgroundTransparency = 1, 
                Font = l_Font_0.Body.Font, 
                Text = v71, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextSize = v75, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 1, 
                Size = UDim2.new(0, 0, 1, 0)
            }), 
            RobuxContainer = v3.createElement(l_FitFrameHorizontal_0, {
                height = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 6), 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                AnchorPoint = Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                Position = UDim2.new(1, 0, 0, 0)
            }, {
                MinusText = v3.createElement(l_FitTextLabel_0, {
                    width = l_FitTextLabel_0.Width.FitToText, 
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Text = "-", 
                    Font = l_Font_0.Body.Font, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency, 
                    TextSize = v75
                }), 
                Image = v3.createElement(l_ImageSetLabel_0, {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, v75, 0, v75), 
                    Image = v42, 
                    ImageColor3 = l_Theme_0.TextDefault.Color, 
                    ImageTransparency = l_Theme_0.TextDefault.Transparency
                }), 
                Text = v3.createElement(l_FitTextLabel_0, {
                    width = l_FitTextLabel_0.Width.FitToText, 
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Text = v72, 
                    Font = l_Font_0.Body.Font, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency, 
                    TextSize = v75
                })
            })
        }), 
        YouEarnContainer = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 4, 
            Size = UDim2.new(1, 0, 0, v76)
        }, {
            YouEarnLabel = v3.createElement(l_FitTextLabel_0, {
                width = l_FitTextLabel_0.Width.FitToText, 
                BackgroundTransparency = 1, 
                Font = l_Font_0.Body.Font, 
                Text = v57.sellCutText, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextSize = v75, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 1, 
                Size = UDim2.new(0, 0, 1, 0)
            }), 
            RobuxContainer = v3.createElement(l_FitFrameHorizontal_0, {
                height = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 6), 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                AnchorPoint = Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                Position = UDim2.new(1, 0, 0, 0)
            }, {
                Image = v3.createElement(l_ImageSetLabel_0, {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, v75, 0, v75), 
                    Image = v42, 
                    ImageColor3 = l_Theme_0.TextDefault.Color, 
                    ImageTransparency = l_Theme_0.TextDefault.Transparency
                }), 
                Text = v3.createElement(l_FitTextLabel_0, {
                    width = l_FitTextLabel_0.Width.FitToText, 
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Text = tostring(v67), 
                    Font = l_Font_0.Body.Font, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                    TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                    TextSize = v75
                })
            })
        }), 
        AverageSellPriceContainer = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 5, 
            Size = UDim2.new(1, 0, 0, v76)
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 12), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            AverageSellPriceLabel = v3.createElement(l_FitTextLabel_0, {
                width = l_FitTextLabel_0.Width.FitToText, 
                BackgroundTransparency = 1, 
                Font = l_Font_0.Body.Font, 
                Text = v57.averageSellPriceText, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextSize = v75, 
                LayoutOrder = 0
            }), 
            RobuxContainer = v3.createElement(v31, {
                robuxAmountText = v65, 
                iconSize = v75, 
                textSize = v75, 
                padding = 6
            })
        })
    });
end;
v43.render = function(v77)
    return l_withLocalization_0({
        titleText = "Feature.Catalog.Heading.SellItem", 
        robloxFeeText = "Feature.Catalog.Label.RobuxFee", 
        sellCutText = "Feature.Catalog.Label.SellCut", 
        averageSellPriceText = "Feature.Catalog.Label.AveragePrice", 
        placeholderText = "Feature.Catalog.Label.Price", 
        minimumWarningText = "Feature.Catalog.Label.MinimumAmount", 
        minimumWarningTextWithPrice = if not v40() then nil else "Feature.Catalog.Label.MinimumAmountCustom", 
        confirmButtonText = "Feature.Catalog.Action.Sell", 
        cancelButtonText = "Feature.Catalog.Action.Cancel"
    })(function(v78)
        local l_screenSize_0 = v77.props.screenSize;
        local v80 = tonumber(v77.state.priceInRobux);
        local v81 = not v80 or v80 == 0;
        local v82 = UDim2.new(0.5, 0, 0.5, 0);
        if v77.state.isKeyboardRepositioned then
            v82 = UDim2.new(0.5, 0, 0, (l_screenSize_0.Y - l_UserInputService_0.OnScreenKeyboardSize.Y) / 2);
        end;
        local l_createElement_0 = v3.createElement;
        local l_Frame_0 = l_Focusable_0.Frame;
        local v85 = {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            inputBindings = {
                SellItem = v10.Input.onBegin(Enum.KeyCode.ButtonX, v77.sellItem, {
                    key = "Feature.Catalog.Action.Sell", 
                    disabled = v81
                })
            }
        };
        local v86 = {};
        local l_createElement_1 = v3.createElement;
        local l_l_InteractiveAlert_0_0 = l_InteractiveAlert_0;
        local v89 = {
            title = v78.titleText
        };
        local v90 = {};
        local v91 = {};
        local v92 = {
            props = {
                onActivated = v77.closePrompt, 
                text = v78.cancelButtonText
            }, 
            isDefaultChild = true
        };
        local v93 = {
            buttonType = l_ButtonType_0.PrimarySystem
        };
        local v94 = {
            isDisabled = v81
        };
        local v95 = true;
        if v77.props.sellFetchingState ~= l_RetrievalStatus_0.Fetching then
            v95 = v77.props.marketPlaceFeeFetchingState == l_RetrievalStatus_0.Fetching;
        end;
        v94.isLoading = v95;
        v94.onActivated = v77.sellItem;
        v94.text = v78.confirmButtonText;
        v93.props = v94;
        setlist { ['R015[1 to 2]'] = 'R016 to R017' };
        v90.buttons = v91;
        v89.buttonStackInfo = v90;
        v89.middleContent = v77.getMiddleContent(v78);
        v89.isMiddleContentFocusable = true;
        v89.position = v82;
        v89.screenSize = v77.props.screenSize;
        v89.defaultChildRef = v77.props.defaultChildRef;
        v86.InteractiveAlert = l_createElement_1(l_l_InteractiveAlert_0_0, v89);
        return l_createElement_0(l_Frame_0, v85, v86);
    end);
end;
v43.willUnmount = function(v96)
    v96.keyboardConnection:disconnect();
    v96.keyboardConnection = nil;
    v96.isMounted = false;
end;
return (v18((v21((l_RoactServices_0.connect({
    networking = v6, 
    localization = v7
})((v4.connect(function(v97, v98)
    local l_itemId_0 = v98.itemId;
    local l_itemType_0 = v98.itemType;
    local l_userAssetId_0 = v98.userAssetId;
    local v102 = nil;
    local v103 = nil;
    local v104 = 0;
    if not v25 then
        local v105 = v23(v97.AvatarExperience.Common, l_itemId_0, l_itemType_0);
        v102 = v105 and v105.averagePrice;
        if v41() then
            v103 = v105 and v105.collectibleItemId;
            if v40() then
                v104 = not not v97.AvatarExperience.Catalog.CollectibleMarketplaceResaleParameters[v103] and v97.AvatarExperience.Catalog.CollectibleMarketplaceResaleParameters[v103].priceFloor or 0;
            end;
        end;
    else
        local v106 = v24(v97.AvatarExperience, l_itemId_0, l_itemType_0);
        v102 = if not v106 then nil else v106.averagePrice;
        if v41() then
            v103 = v106 and v106.collectibleItemId;
            if v40() then
                v104 = (not not v97.AvatarExperience.Catalog.CollectibleMarketplaceResaleParameters and v97.AvatarExperience.Catalog.CollectibleMarketplaceResaleParameters[v103]) and v97.AvatarExperience.Catalog.CollectibleMarketplaceResaleParameters[v103].priceFloor or 0;
            end;
        end;
    end;
    return {
        screenSize = v97.ScreenSize, 
        averagePrice = v102, 
        sellFetchingState = l_PerformFetch_0.GetStatus(v97, v29.RemoveAvailableToSellAssetKey .. tostring(l_userAssetId_0)), 
        marketPlaceFeeFetchingState = l_PerformFetch_0.GetStatus(v97, v29.GetMarketplaceFeeKey), 
        marketplaceFee = v97.AvatarExperience.Catalog.MarketplaceFee, 
        collectibleItemId = v103, 
        priceFloor = v104
    };
end, function(v107)
    return {
        getMarketplaceFee = function(v108)
            return v107(v17(v108));
        end, 
        sellAsset = function(v109, v110, v111, v112)
            return v107(v16(v109, v110, v111, v112));
        end
    };
end)(v43))))))));
