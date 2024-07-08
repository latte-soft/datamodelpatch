local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useProperty_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useProperty;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_wasLastInputGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).wasLastInputGamepad;
local v8 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v8.Focusable;
local v10 = require(l_CorePackages_0.Packages.UIBlox);
local l_IconButton_0 = v10.App.Button.IconButton;
local l_IconSize_0 = v10.App.ImageSet.Enum.IconSize;
local l_Images_0 = v10.App.ImageSet.Images;
local l_VerticalScrollViewWithMargin_0 = v10.App.Container.VerticalScrollViewWithMargin;
local l_useStyle_0 = v10.Core.Style.useStyle;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.CenteredModalView);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v20 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v21 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemOwnershipPage.OwnedItemList);
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchSellPageData);
local v24 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibleResellableInstances);
local v25 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v26 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v27 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v28 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v29 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v30 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local _ = require(l_Modules_0.AvatarExperience.Common.Models.CollectibleInstance);
local v33 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v34 = require(l_Modules_0.Common.Text);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v36 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v37 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagL2ControllerSupport);
local v38 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLimitedBundlesHandleNewData);
local v39 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixItemOwnershipPageNilSelector);
local v40 = game:DefineFastFlag("AXFixItemOwnershipClickThrough", false);
local v41 = l_Images_0["icons/actions/info_small"];
return function(v42)
    local l_params_0 = v42.navigation.state.params;
    local v44 = l_useStyle_0();
    local v46 = l_useSelector_0(function(v45)
        return v45.LocalUserId;
    end);
    local v48 = l_useSelector_0(function(v47)
        return v47.AvatarExperience.Catalog.UserAssets;
    end);
    local v50 = l_useSelector_0(function(v49)
        return v49.AvatarExperience.Catalog.Sell.AvailableToSellAssets[l_params_0.itemId];
    end);
    local v52 = l_useSelector_0(function(v51)
        return v51.AvatarExperience.Catalog.Sell.CurrentlySellingAssets[l_params_0.itemId];
    end);
    local v53 = nil;
    local v54 = nil;
    if not v39() then
        local v58, v59 = l_useSelector_0((v2.useCallback(function(v55)
            local v56 = nil;
            local v57 = nil;
            if not v30 then
                return v56, (v28(v55.AvatarExperience.Common, l_params_0.itemId, l_params_0.itemType));
            else
                return v29(v55.AvatarExperience, l_params_0.itemId, l_params_0.itemType), v57;
            end;
        end, {
            l_params_0
        })));
        v54 = v58;
        v53 = v59;
    elseif not v30 then
        v53 = l_useSelector_0(function(v60)
            return v28(v60.AvatarExperience.Common, l_params_0.itemId, l_params_0.itemType);
        end);
    else
        v54 = l_useSelector_0(function(v61)
            return v29(v61.AvatarExperience, l_params_0.itemId, l_params_0.itemType);
        end);
    end;
    local v62 = nil;
    local v63 = nil;
    if not v38() then
        v63 = l_params_0.collectibleItemId ~= nil;
        v62 = if not v30 then if v53 then v53.collectibleItemId else nil else if v54 then v54.collectibleItemId else nil;
    else
        v63 = if not v54 then v36.DEPRECATED_isLimitedCollectible(v53) else v54.isLimitedCollectible;
        v62 = l_params_0.collectibleItemId;
    end;
    local v64 = nil;
    v64 = l_useSelector_0(function(v65)
        if not v38() or v63 then
            if not l_params_0.collectibleItemId then
                return {};
            else
                return v65.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[l_params_0.collectibleItemId];
            end;
        else
            return {};
        end;
    end);
    local v67 = l_useSelector_0((v2.useCallback(function(v66)
        if not v62 then
            return nil;
        else
            return v66.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v62];
        end;
    end, {
        v62
    })));
    local v72 = l_useSelector_0(function(v68)
        local v69 = v68.Users[v68.LocalUserId];
        local v70 = if not v69 then nil else v69.membership;
        local v71 = false;
        if v70 ~= nil then
            v71 = v70 ~= Enum.MembershipType.None;
        end;
        return v71;
    end);
    local v73 = v8.useRootFocusController();
    local v74 = v26(v27);
    local v75 = l_useDispatch_0();
    v2.useEffect(function()
        if not l_params_0.collectibleItemId then
            v75(v23(v74, l_params_0.itemId, v46));
            return ;
        else
            v75(v24(v74, l_params_0.collectibleItemId, v46));
            return ;
        end;
    end, {});
    local l_SellItemPeekView_0 = v31.SellItemPeekView;
    local v78 = v2.useCallback(function(v77)
        if v72 then
            v42.navigation.navigate(l_SellItemPeekView_0, {
                itemId = l_params_0.itemId, 
                itemType = l_params_0.itemType, 
                collectibleItemId = if not v38() then l_params_0.collectibleItemId else v62, 
                userAssetId = v77
            });
            return ;
        else
            v42.navigation.navigate(v31.PremiumSellOnlyPrompt);
            return ;
        end;
    end, {
        l_params_0.itemId, 
        l_params_0.itemType, 
        if not v38() then nil else l_params_0.collectibleItemId, 
        if not v38() then nil else v62
    });
    local v80 = v2.useCallback(function()
        local v79 = l_wasLastInputGamepad_0();
        v33("ItemOwnershipPage", v79);
        if v79 then
            v73.captureFocus();
        end;
    end);
    local v82 = v2.useCallback(function(v81)
        v42.navigation.navigate(v31.RemoveCurrentlySellingItemPrompt, {
            itemId = l_params_0.itemId, 
            isLimitedCollectible = if not v38() then nil else v63, 
            collectibleItemId = l_params_0.collectibleItemId, 
            userAssetId = v81, 
            onOverlayClosed = if not v37() then nil else v80
        });
    end, {
        l_params_0.itemId, 
        if not v38() then nil else l_params_0.collectibleItemId, 
        if not v38() then nil else v63
    });
    local v85 = v2.useCallback(function(v83, v84)
        if not v84 then
            v78(v83);
            return ;
        else
            v82(v83);
            return ;
        end;
    end);
    local v86 = nil;
    v86 = if not v30 then if v53 then v53.name else nil else if v54 then v54.name else nil;
    local v93 = v2.useCallback(function(v87, v88, v89)
        if v88 == nil then
            return ;
        else
            for _, v91 in v88, nil, nil do
                local v92 = v48[v91];
                if v92 then
                    table.insert(v87, {
                        id = v91, 
                        title = if not v92.serialNumber then v86 else "#" .. v92.serialNumber, 
                        salePrice = if not v89 then nil else v92.priceInRobux, 
                        isOnHold = if not v89 then v92.isOnHold else nil, 
                        isOnSale = v89, 
                        order = if not v92.serialNumber then v91 else v92.serialNumber
                    });
                end;
            end;
            return ;
        end;
    end, {
        v48
    });
    local v94 = if not v67 then v20.ResaleRestriction.None else v67.resaleRestriction;
    local v95 = false;
    local v96 = {};
    if not v63 then
        v93(v96, v52, true);
        v93(v96, v50, false);
        for _, v98 in v96, nil, nil do
            if v98.isOnHold then
                v95 = true;
                break;
            end;
        end;
    elseif v64 then
        for _, v100 in v64, nil, nil do
            if v100.isHeld then
                v95 = true;
            end;
            table.insert(v96, {
                id = v100.collectibleInstanceId, 
                title = "#" .. v100.serialNumber, 
                salePrice = if v100.saleState == "OnSale" then v100.price else nil, 
                isOnHold = v100.isHeld, 
                isOnSale = v100.saleState == "OnSale", 
                order = v100.serialNumber
            });
        end;
    end;
    table.sort(v96, function(v101, v102)
        return v101.order < v102.order;
    end);
    if v94 == v20.ResaleRestriction.Disabled then
        v95 = false;
    end;
    local v103 = l_useNavigation_0();
    local v104 = v25({
        headerText = {
            "Feature.Catalog.Label.ItemOwnedCount"; 
            itemCount = #v96
        }, 
        holdingMessageText = "Feature.Catalog.Label.ItemInAHold", 
        holdingPromptTitleText = "Feature.Catalog.Heading.HoldingPolicy", 
        holdingPromptBodyText = if not l_params_0.collectibleItemId then {
            "Feature.Catalog.Message.HoldingPolicyL1"; 
            days = 7
        } else {
            "Feature.Catalog.Message.HoldingPolicyL2"; 
            purchaseDays = 30, 
            resaleDays = 7
        }, 
        holdingPromptButtonText = "Feature.Avatar.Action.GotIt"
    });
    local function v107(_, _)
        v103.navigate(v31.GenericPrompt, {
            titleText = v104.holdingPromptTitleText, 
            bodyText = v104.holdingPromptBodyText, 
            buttonText = v104.holdingPromptButtonText
        });
    end;
    local v108 = v34.GetTextBounds(v104.holdingMessageText, v44.Font.SubHeader1.Font, v44.Font.BaseSize * v44.Font.SubHeader1.RelativeSize, Vector2.new(10000, 10000));
    local v109 = v2.useRef(nil);
    local v110 = v2.useRef(nil);
    local v111 = v2.useRef(nil);
    local v112 = l_useProperty_0(v109, "AbsoluteSize") or nil;
    local v113 = l_useProperty_0(v110, "AbsoluteSize") or nil;
    local v114 = 0;
    if v112 ~= nil and v113 ~= nil then
        v114 = (v112.Y - v113.Y) - 24;
    elseif v112 ~= nil then
        v114 = v112.Y - 24;
    end;
    local v115 = nil;
    v115 = if not v30 then if v53 then v53.tileRestrictionsMap else nil else if v54 then v54.tileRestrictionsMap else nil;
    local l_createElement_0 = v2.createElement;
    local l_v17_0 = v17;
    local v118 = {};
    local v119 = {};
    local l_createElement_1 = v2.createElement;
    local v121 = not v37() and "Frame" or l_Focusable_0.Frame;
    local v122 = {
        BackgroundColor3 = v44.Theme.BackgroundDefault.Color, 
        BackgroundTransparency = v44.Theme.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        Size = UDim2.fromScale(1, 1), 
        focusController = if not v37() then nil else v73, 
        defaultChild = if not v37() then nil else v111, 
        restorePreviousChildFocus = not not v37() or nil, 
        inputBindings = if not v37() then nil else {
            NavigateBack = v8.Input.onBegin(Enum.KeyCode.ButtonB, function()
                v19.closeFocusedScreen(v103);
            end)
        }, 
        Active = not not v40 or nil
    };
    local v123 = {
        GamepadFocusHandlerForPage = v37() and v2.createElement(v18, {
            focusController = v73, 
            captureFocusOnMount = true
        }), 
        TopBar = v2.createElement(v21.Container, {
            ZIndex = 2, 
            titleText = v104.headerText, 
            leftItem = v21.BackButton
        })
    };
    local l_createElement_2 = v2.createElement;
    local l_PageContent_0 = v21.PageContent;
    local v126 = {
        ZIndex = 2
    };
    local v127 = {};
    local l_createElement_3 = v2.createElement;
    local v129 = "Frame";
    local v130 = {
        LayoutOrder = 1, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        ref = v109
    };
    local v131 = {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 24)
        })
    };
    local l_createElement_4 = v2.createElement;
    local l_l_VerticalScrollViewWithMargin_0_0 = l_VerticalScrollViewWithMargin_0;
    local v134 = {
        useAutomaticCanvasSize = true, 
        canvasSizeY = UDim.new(1, 0), 
        size = UDim2.new(1, 0, 0, v114)
    };
    local v135 = {
        ListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, 24), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 24)
        })
    };
    local v136 = false;
    if #v96 > 0 then
        v136 = v2.createElement(v22, {
            itemsOnSale = true, 
            itemId = l_params_0.itemId, 
            itemType = l_params_0.itemType, 
            restrictionTypes = v115, 
            onItemActivated = v85, 
            resaleRestriction = v94, 
            items = v96, 
            layoutOrder = 1, 
            ref = if not v37() then nil else v111
        });
    end;
    v135.ItemsList = v136;
    v131.ScrollView = l_createElement_4(l_l_VerticalScrollViewWithMargin_0_0, v134, v135);
    v131.HoldingPolicyInfoContainer = v95 and v2.createElement("Frame", {
        LayoutOrder = 2, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        ref = v110
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 24)
        }), 
        HoldingPromptTextButton = v2.createElement("TextButton", {
            LayoutOrder = 1, 
            Text = v104.holdingMessageText, 
            Font = v44.Font.SubHeader1.Font, 
            Size = UDim2.new(0, v108.X, 0, v108.Y), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextSize = v44.Font.BaseSize * v44.Font.SubHeader1.RelativeSize, 
            TextColor3 = v44.Theme.TextEmphasis.Color, 
            TextTransparency = v44.Theme.TextEmphasis.Transparency, 
            BackgroundTransparency = 1, 
            [v2.Event.Activated] = v107
        }), 
        HoldingPromptIconButton = v2.createElement(l_IconButton_0, {
            layoutOrder = 2, 
            icon = v41, 
            iconSize = l_IconSize_0.Small, 
            iconColor3 = v44.Theme.IconEmphasis.Color, 
            iconTransparency = v44.Theme.IconEmphasis.Transparency, 
            backgroundTransparency = 1, 
            onActivated = v107
        })
    });
    v127.PageContentFrame = l_createElement_3(v129, v130, v131);
    v123.Contents = l_createElement_2(l_PageContent_0, v126, v127);
    v119.Background = l_createElement_1(v121, v122, v123);
    return l_createElement_0(l_v17_0, v118, v119);
end;
