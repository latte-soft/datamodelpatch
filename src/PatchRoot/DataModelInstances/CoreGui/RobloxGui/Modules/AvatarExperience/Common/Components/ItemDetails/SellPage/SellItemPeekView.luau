local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local v4 = require(l_CorePackages_0.UIBlox);
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_PeekView_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekView;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_useProperty_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useProperty;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_Focusable_0 = v3.Focusable;
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.SellPage.SellItemInfo);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.SellPage.SellItemSetPrice);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.SellPage.SellItemOverview);
local v18 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v19 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.GetMarketplaceFee);
local v20 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.GetCollectibleMarketplaceResaleParameters);
local v21 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.RemoveAvailableToSellAsset);
local v22 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.UpdateCollectibleInstanceResaleState);
local v23 = require(l_Modules_0.AvatarExperience.Common.Components.CenteredModalView);
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v25 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v26 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v27 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v29 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v30 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v31 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v32 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v33 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v34 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v35 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagL2ControllerSupport);
local v36 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLimitedBundlesHandleNewData);
local v37 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXResalePriceFloor);
local l_ButtonStack_0 = v4.App.Button.ButtonStack;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_LoadingStateContainer_0 = v4.App.Container.LoadingStateContainer;
local l_RetrievalStatus_1 = v4.App.Loading.Enum.RetrievalStatus;
local l_useStyle_0 = v4.Core.Style.useStyle;
local function _(v43, v44)
    if not v43 then
        return true;
    else
        local v45 = tonumber(v43);
        if not v37() then
            return not v45 or v45 <= 0;
        else
            return not v45 or v45 < (v44 or 0);
        end;
    end;
end;
local function _(v47, v48, v49, v50)
    local v51 = false;
    if v47 ~= nil then
        v51 = false;
        if v48 ~= nil then
            v51 = v49 ~= nil;
        end;
    end;
    if v51 then
        return ((((((v47.Y * math.clamp(if v50 ~= nil then v50 else 0.8, 0, 1) - 25) - 20) - v48.Y) - 30) - v49.Y) - 30) - 30;
    else
        return -1;
    end;
end;
local function _(v53, v54)
    if v37() then
        if v54 then
            if v53 == v29.ItemType.Bundle then
                return v29.BundleTypeIdStringToName[v54];
            elseif v53 == v29.ItemType.Asset then
                return v29.AssetTypeIdStringToName[v54];
            end;
        else
            return nil;
        end;
    end;
    return nil;
end;
return function(_)
    local v57 = v31({
        sellItemText = "Feature.Catalog.Heading.SellItem", 
        sellButtonText = "Feature.Catalog.Action.Sell", 
        cancelButtonText = "Feature.Catalog.Action.Cancel"
    });
    local v58 = l_useStyle_0();
    local l_Theme_0 = v58.Theme;
    local v60 = l_useDispatch_0();
    local v61 = v33(v34);
    local v62 = l_useNavigation_0();
    local l_params_0 = v62.state.params;
    local v64, v65 = v2.useState("");
    local v66 = v2.useRef(nil);
    local v67 = v2.useRef(nil);
    local v68 = v2.useRef(nil);
    local v69 = v2.useRef(nil);
    local v70 = v3.useRootFocusController();
    local v71 = l_useProperty_0(v66, "AbsoluteSize") or nil;
    local v72 = l_useProperty_0(v67, "AbsoluteSize") or nil;
    local v73 = l_useProperty_0(v68, "AbsoluteSize") or nil;
    local l_peekViewFillPercentage_0 = v62.state.params.peekViewFillPercentage;
    local v75 = false;
    if v71 ~= nil then
        v75 = false;
        if v72 ~= nil then
            v75 = v73 ~= nil;
        end;
    end;
    local v76 = if v75 then ((((((v71.Y * math.clamp(if l_peekViewFillPercentage_0 ~= nil then l_peekViewFillPercentage_0 else 0.8, 0, 1) - 25) - 20) - v72.Y) - 30) - v73.Y) - 30) - 30 else -1;
    l_peekViewFillPercentage_0 = v62.state.params.collectibleItemId;
    v75 = nil;
    local v77 = nil;
    local v78 = nil;
    local v79 = nil;
    if not v36() then
        v78 = l_peekViewFillPercentage_0;
    elseif not v27 then
        v77 = l_useSelector_0(function(v80)
            return v25(v80.AvatarExperience.Common, l_params_0.itemId, l_params_0.itemType);
        end);
        v78 = v30.DEPRECATED_isLimitedCollectible(v77);
        if v37() then
            local v81 = v30.DEPRECATED_GetItemSubType(l_params_0.itemType, v77);
            local l_itemType_0 = l_params_0.itemType;
            v79 = if not v37() then nil else if v81 then if l_itemType_0 == v29.ItemType.Bundle then v29.BundleTypeIdStringToName[v81] else if l_itemType_0 == v29.ItemType.Asset then v29.AssetTypeIdStringToName[v81] else nil else nil;
        end;
    else
        v75 = l_useSelector_0(function(v83)
            return v26(v83.AvatarExperience, l_params_0.itemId, l_params_0.itemType);
        end);
        v78 = v75 and v75.isLimitedCollectible;
        if v37() then
            local v84 = v75 and v75.itemSubType;
            local l_itemType_1 = l_params_0.itemType;
            v79 = if not v37() then nil else if v84 then if l_itemType_1 == v29.ItemType.Bundle then v29.BundleTypeIdStringToName[v84] else if l_itemType_1 == v29.ItemType.Asset then v29.AssetTypeIdStringToName[v84] else nil else nil;
        end;
    end;
    local v94 = l_useSelector_0(function(v86)
        local l_itemId_0 = v62.state.params.itemId;
        local l_itemType_2 = v62.state.params.itemType;
        local l_userAssetId_0 = v62.state.params.userAssetId;
        local v90 = nil;
        if not v27 then
            local v91 = v25(v86.AvatarExperience.Common, l_itemId_0, l_itemType_2);
            v90 = v91 and v91.averagePrice;
        else
            local v92 = v26(v86.AvatarExperience, l_itemId_0, l_itemType_2);
            v90 = if not v92 then nil else v92.averagePrice;
        end;
        local v93 = v86.AvatarExperience.Catalog.UserAssets[l_userAssetId_0];
        return {
            id = l_itemId_0, 
            averagePrice = v90, 
            serialNumber = if v93 ~= nil then v93.serialNumber else nil
        };
    end);
    local v97 = l_useSelector_0(function(v95)
        if not v78 or not l_peekViewFillPercentage_0 then
            return v95.AvatarExperience.Catalog.MarketplaceFee;
        else
            local v96 = v95.AvatarExperience.Common.Collectibles.CollectiblesMarketplaceResaleParameters[l_peekViewFillPercentage_0];
            if v96 ~= nil then
                return {
                    taxRate = v96.resalePercentageFee / 100, 
                    minimumFee = v96.minimumFee
                };
            else
                return {};
            end;
        end;
    end);
    local v99 = l_useSelector_0(function(v98)
        return l_PerformFetch_0.GetStatus(v98, v18.RemoveAvailableToSellAssetKey .. tostring(v62.state.params.userAssetId));
    end);
    local v101 = l_useSelector_0(function(v100)
        return l_PerformFetch_0.GetStatus(v100, v18.GetMarketplaceFeeKey);
    end);
    local v103 = l_useSelector_0(function(v102)
        return l_PerformFetch_0.GetStatus(v102, v18.GetCollectibleMarketplaceResaleParametersKey .. tostring(l_peekViewFillPercentage_0));
    end);
    local v106 = l_useSelector_0(function(v104)
        if not v37() then
            return 0;
        else
            local v105 = v104.AvatarExperience.Common.Collectibles.CollectiblesMarketplaceResaleParameters[l_peekViewFillPercentage_0];
            return not not v105 and v105.priceFloor or 0;
        end;
    end);
    v2.useEffect(function()
        if not (not v78 or not l_peekViewFillPercentage_0) and (not (v103 ~= l_RetrievalStatus_0.NotStarted) or v103 == l_RetrievalStatus_0.Failed) then
            v60(v20(v61, l_peekViewFillPercentage_0, if not v37() then nil else v79));
            return ;
        else
            if not (v101 ~= l_RetrievalStatus_0.NotStarted) or v101 == l_RetrievalStatus_0.Failed then
                v60(v19(v61));
            end;
            return ;
        end;
    end, {
        v101, 
        v103, 
        l_peekViewFillPercentage_0, 
        if not v37() then nil else v79
    });
    local v108 = v2.useCallback(function()
        v62.goBack();
        local l_onPeekViewClosed_0 = v62.state.params.onPeekViewClosed;
        if l_onPeekViewClosed_0 then
            l_onPeekViewClosed_0();
        end;
    end, {
        v62
    });
    local v111 = v2.useCallback(function(v109, _)
        if v109 == l_PeekViewState_0.Closed then
            v108();
        end;
    end, {
        v108
    });
    local v116 = v2.useCallback(function()
        local l_v64_0 = v64;
        local l_v106_0 = v106;
        local v114;
        if not l_v64_0 then
            v114 = true;
        else
            local v115 = tonumber(l_v64_0);
            v114 = if not v37() then not v115 or v115 <= 0 else not v115 or v115 < (l_v106_0 or 0);
        end;
        if not v114 then
            v114 = v94.id;
            l_v64_0 = v62.state.params.userAssetId;
            l_v106_0 = tonumber(v64);
            if not v78 or not l_peekViewFillPercentage_0 then
                v60(v21(v61, v114, l_v64_0, l_v106_0));
            else
                v60(v22(v61, l_peekViewFillPercentage_0, l_v64_0, true, l_v106_0));
            end;
            v108();
            return ;
        else
            return ;
        end;
    end, {
        v108, 
        v64, 
        v94, 
        v62, 
        v61, 
        l_peekViewFillPercentage_0, 
        if not v37() then nil else v106
    });
    local v119 = v2.useCallback(function()
        local l_Font_0 = v58.Font;
        local l_Header1_0 = l_Font_0.Header1;
        return v2.createElement("Frame", {
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 30)
            }), 
            SellItemHeader = v2.createElement("TextLabel", {
                LayoutOrder = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Text = v57.sellItemText, 
                Font = l_Header1_0.Font, 
                Size = UDim2.fromScale(1, 0), 
                TextSize = l_Header1_0.RelativeSize * l_Font_0.BaseSize, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextWrapped = true, 
                BackgroundTransparency = 1
            }), 
            ItemInfoContent = v2.createElement(v15, {
                layoutOrder = 2, 
                itemIdPriceSerialNumber = v94
            }), 
            SetPriceContent = v2.createElement(v16, {
                layoutOrder = 3, 
                priceFloor = v106, 
                priceInRobux = v64, 
                setPriceInRobux = v65, 
                ref = if not v35() then nil else v69, 
                NextSelectionDown = if not v35() then nil else v68
            }), 
            OverviewContent = v2.createElement(v17, {
                layoutOrder = 4, 
                marketplaceFee = v97, 
                priceInRobux = v64
            })
        });
    end, {
        v58, 
        l_Theme_0, 
        v57, 
        v94, 
        v64, 
        v65, 
        v97
    });
    local v120 = v2.useCallback(function()
        if v101 ~= l_RetrievalStatus_0.Fetching then
            v60(v19(v61));
        end;
    end, {
        v101, 
        v61
    });
    local v121 = v2.useCallback(function()
        if v103 ~= l_RetrievalStatus_0.Fetching then
            v60(v20(v61, l_peekViewFillPercentage_0, if not v37() then nil else v79));
        end;
    end, {
        v103, 
        v61, 
        l_peekViewFillPercentage_0, 
        if not v37() then nil else v79
    });
    local v122 = {};
    local v123 = {};
    local v124 = {
        props = {
            onActivated = v108, 
            text = v57.cancelButtonText
        }, 
        isDefaultChild = true
    };
    local v125 = {
        buttonType = l_ButtonType_0.PrimarySystem
    };
    local v126 = {};
    local v127;
    if not v64 then
        v127 = true;
    else
        local v128 = tonumber(v64);
        v127 = if not v37() then not v128 or v128 <= 0 else not v128 or v128 < (v106 or 0);
    end;
    v126.isDisabled = v127;
    v127 = true;
    if v99 ~= l_RetrievalStatus_0.Fetching then
        v127 = true;
        if v101 ~= l_RetrievalStatus_0.Fetching then
            v127 = v103 == l_RetrievalStatus_0.Fetching;
        end;
    end;
    v126.isLoading = v127;
    v126.onActivated = v116;
    v126.text = v57.sellButtonText;
    v125.props = v126;
    v125.isDefaultChild = false;
    setlist { ['R037[1 to 2]'] = 'R038 to R039' };
    v122.buttons = v123;
    v123 = v2.createElement;
    v124 = v23;
    v125 = {
        backgroundTransparency = 1
    };
    v126 = {};
    v127 = v2.createElement;
    local v129 = not v35() and "Frame" or l_Focusable_0.Frame;
    local v130 = {
        LayoutOrder = 1, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        focusController = if not v35() then nil else v70, 
        defaultChild = if not v35() then nil else v69, 
        inputBindings = if not v35() then nil else {
            NavigateBack = v3.Input.onBegin(Enum.KeyCode.ButtonB, function()
                v32.closeFocusedScreen(v62);
            end)
        }, 
        ref = v66
    };
    local v131 = {
        GamepadFocusHandlerForPage = v35() and v2.createElement(v24, {
            focusController = v70, 
            captureFocusOnMount = true
        })
    };
    local l_createElement_0 = v2.createElement;
    local l_l_PeekView_0_0 = l_PeekView_0;
    local v134 = {
        mountAsFullView = true, 
        isScrollingEnabled = false, 
        showDraggerInClosedState = false, 
        peekHeaderClose = true, 
        viewStateChanged = v111, 
        canDragFullViewToBrief = false, 
        thumbstickScrollEnabled = false, 
        backgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        backgroundTransparency = l_Theme_0.BackgroundUIDefault.Transparency
    };
    local v135 = {};
    local l_createElement_1 = v2.createElement;
    local v137 = "Frame";
    local v138 = {
        LayoutOrder = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1
    };
    local v139 = {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 30)
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 20), 
            PaddingRight = UDim.new(0, 20), 
            PaddingTop = UDim.new(0, 20), 
            PaddingBottom = UDim.new(0, 30)
        }), 
        ItemInfoContentFrame = v2.createElement("Frame", {
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1, 
            ref = v67
        }, {
            Content = v2.createElement(l_LoadingStateContainer_0, {
                dataStatus = if not not v78 and l_peekViewFillPercentage_0 then l_RetrievalStatus_1.fromRawValue(v103) else l_RetrievalStatus_1.fromRawValue(v101), 
                onRetry = if not not v78 and l_peekViewFillPercentage_0 then v121 else v120, 
                renderOnLoaded = v119
            })
        })
    };
    local v140 = false;
    if v76 >= 0 then
        v140 = v2.createElement("Frame", {
            LayoutOrder = 2, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, v76), 
            BackgroundTransparency = 1
        });
    end;
    v139.WhiteSpaceFrame = v140;
    v139.Footer = v2.createElement(l_Focusable_0.Frame, {
        LayoutOrder = 3, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        ref = v68, 
        NextSelectionUp = if not v35() then nil else v69
    }, {
        Buttons = v122 and v2.createElement(l_ButtonStack_0, v122)
    });
    v135.ContentContainer = l_createElement_1(v137, v138, v139);
    v131.PeekView = l_createElement_0(l_l_PeekView_0_0, v134, v135);
    v126.FullSizeFrame = v127(v129, v130, v131);
    return v123(v124, v125, v126);
end;
