local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v7 = require(l_Parent_0.Components.DetailsText);
local v8 = require(l_Parent_0.Components.DetailsThumbnail);
local v9 = require(l_Parent_0.Components.DetailsDescription);
local v10 = require(l_Parent_0.Components.DetailsButtons);
local v11 = require(l_Parent_0.Components.TryOnViewport);
local v12 = require(l_Parent_0.Actions.OpenOverlay);
local v13 = require(l_Parent_0.Enums.Overlay);
local v14 = require(l_Parent_0.Thunks.GetAssetBundles);
local v15 = require(l_Parent_0.Thunks.ReportOpenDetailsPage);
local v16 = require(l_Parent_0.Thunks.GetEconomyProductInfo);
local v17 = require(l_Parent_0.Thunks.GetCollectibleResellableInstances);
local v18 = require(l_Parent_0.Colors);
local v19 = require(l_Parent_0.Constants);
local v20 = require(l_Parent_0.UtilityFunctions);
local v21 = require(l_CorePackages_0.tutils);
local v22 = require(l_CoreGui_0.RobloxGui.Modules.RobloxTranslator);
local v23 = require(l_CorePackages_0.UIBlox);
local l_Images_0 = v23.App.ImageSet.Images;
local l_ImageSetLabel_0 = v23.Core.ImageSet.ImageSetLabel;
local l_ItemInfoList_0 = require(l_CorePackages_0.Workspace.Packages.ItemDetails).ItemInfoList;
local v27 = require(l_Parent_0.AttributionConstants);
local v28 = require(l_Parent_0.Flags.FFlagAssetDetailsUseAutomaticCanvasSize);
local v29 = require(l_Parent_0.Flags.FFlagAttributionInInspectAndBuy);
local v30 = require(l_Parent_0.Flags.GetCollectibleItemInInspectAndBuyEnabled);
local v31 = require(l_Parent_0.Components.InspectAndBuyContext);
local v32 = require(l_Parent_0.Flags.GetFFlagDisplayCollectiblesIcon);
local v33 = require(l_Parent_0.Flags.GetFFlagIBEnableLimitedItemBugFixAndAlignment);
local v34 = require(l_Parent_0.Flags.GetFFlagIBEnableNewDataCollectionForCollectibleSystem);
local v35 = require(l_Parent_0.Flags.GetFFlagIBEnableCollectiblePurchaseForUnlimited);
local v36 = require(l_Parent_0.Thunks.GetItemDetails);
local v37 = require(l_Parent_0.Actions.SetAssetFromBundleInfo);
local v38 = require(l_Parent_0.Flags.GetFFlagIBEnableLimitedBundle);
local v39 = require(l_CoreGui_0.RobloxGui.Modules.Settings.Theme);
local l_ControllerBarHeight_0 = require(l_CoreGui_0.RobloxGui.Modules.InGameMenuConstants).ControllerBarHeight;
local v41 = v4.PureComponent:extend("AssetDetails");
v41.setScrollingEnabled = function(v42, v43)
    if v42.state.scrollingEnabled ~= v43 then
        v42:setState({
            scrollingEnabled = v43
        });
    end;
end;
v41.getInfoRowProps = function(v44)
    local v45 = v44.props.assetInfo or {};
    local l_locale_0 = v44.props.locale;
    local v47 = v45.bundlesAssetIsIn and #v45.bundlesAssetIsIn == 1;
    if v34() then
        v47 = v45.parentBundleId ~= nil;
    end;
    local v48 = {
        infoName = v22:FormatByKeyForLocale("Feature.Catalog.Label.Filter.Creator", l_locale_0), 
        infoData = v45.creatorName or "", 
        hasVerifiedBadge = v45.creatorHasVerifiedBadge, 
        LayoutOrder = 1, 
        Selectable = if not v29 then nil else false
    };
    local v49 = nil;
    local l_creatingUniverseId_0 = v45.creatingUniverseId;
    if l_creatingUniverseId_0 then
        local v51 = v44.props.creatingExperiences[l_creatingUniverseId_0];
        if not (not v51 or not v27.ShowPlayableAttributionMapper[v51.playabilityStatus]) then
            local l_v51_0 = v51 --[[ copy: 7 -> 11 ]];
            v49 = {
                infoName = v22:FormatByKeyForLocale("Feature.Catalog.Label.Attribution", l_locale_0), 
                infoData = v51.name or "", 
                onActivate = if not v29 then nil else function()
                    v44.props.openOverlay(v13.AttributionTraversal, l_v51_0);
                end, 
                LayoutOrder = 2, 
                [v4.Ref] = if not v29 then nil else v44.attributionRef, 
                Selectable = not not v29 or nil
            };
        end;
    end;
    local v53 = nil;
    if not v47 then
        local v54 = v19.AssetCategoriesLocalized[v19.AssetTypeIdToCategory[v45.assetTypeId]];
        local v55 = v19.AssetTypeIdToTypeLocalized[v45.assetTypeId];
        if not (not v54 or not v55) then
            v53 = v22:FormatByKeyForLocale(v54, l_locale_0) .. " | " .. v22:FormatByKeyForLocale(v55, l_locale_0);
        end;
    else
        v53 = v22:FormatByKeyForLocale("Feature.Catalog.Label.Bundle", l_locale_0);
    end;
    return {
        v48, 
        v49, 
        {
            infoName = v22:FormatByKeyForLocale("Feature.Catalog.Label.CategoryType", l_locale_0), 
            infoData = v53, 
            LayoutOrder = 3, 
            Selectable = if not v29 then nil else false
        }
    };
end;
v41.init = function(v56)
    v56.state = {
        scrollingEnabled = true
    };
    if v29 then
        v56.attributionRef = v4.createRef();
    end;
end;
v41.willUpdate = function(v57, v58)
    if not (not (not v34() and v57.props.assetInfo ~= v58.assetInfo) or not v58.assetInfo) then
        local l_getAssetBundles_0 = v57.props.getAssetBundles;
        if not v58.assetInfo.bundlesAssetIsIn then
            l_getAssetBundles_0(v58.assetInfo.assetId);
        end;
    end;
    if v20.isCollectibles(v57.props.assetInfo) then
        local l_collectibleItemId_0 = v57.props.assetInfo.collectibleItemId;
        local l_resellableInstances_0 = v57.props.resellableInstances;
        local l_resellableInstances_1 = v58.resellableInstances;
        if (((l_resellableInstances_0 and l_resellableInstances_0[l_collectibleItemId_0]) and l_resellableInstances_1) and l_resellableInstances_1[l_collectibleItemId_0]) and v21.fieldCount(l_resellableInstances_0[l_collectibleItemId_0]) ~= v21.fieldCount(l_resellableInstances_1[l_collectibleItemId_0]) then
            v57:setState({});
        end;
    end;
    if v38() then
        local v63 = v57.props.assetInfo and v57.props.assetInfo.parentBundleId;
        local l_bundles_0 = v57.props.bundles;
        local l_bundles_1 = v58.bundles;
        if not ((((not v63 or not l_bundles_0) or not l_bundles_0[v63]) or not l_bundles_1) or not l_bundles_1[v63]) and l_bundles_1[v63] ~= l_bundles_0[v63] then
            v57.props.setAssetFromBundleInfo(v57.props.assetInfo.assetId, l_bundles_1[v63]);
        end;
    end;
end;
v41.didUpdate = function(v66, v67)
    local l_reportOpenDetailsPage_0 = v66.props.reportOpenDetailsPage;
    local l_assetInfo_0 = v66.props.assetInfo;
    local l_assetInfo_1 = v67.assetInfo;
    local v71 = false;
    if l_assetInfo_0 ~= l_assetInfo_1 then
        v71 = l_assetInfo_0 and l_assetInfo_0.bundlesAssetIsIn;
    end;
    if v34() then
        v71 = l_assetInfo_0 and l_assetInfo_0 ~= l_assetInfo_1;
    end;
    if v71 then
        local l_getEconomyProductInfo_0 = v66.props.getEconomyProductInfo;
        local l_bundles_2 = v66.props.bundles;
        local v74 = l_assetInfo_0.bundlesAssetIsIn and #l_assetInfo_0.bundlesAssetIsIn == 1;
        if v34() then
            v74 = l_assetInfo_0.parentBundleId ~= nil;
        end;
        local v75 = v74 and v20.getBundleId(l_assetInfo_0);
        local v76 = not not v74 and l_bundles_2[v75].productId or l_assetInfo_0.productId;
        local v77 = v30() and l_assetInfo_0.productType == v19.ProductType.CollectibleItem;
        if not v35() then
            if not ((v74 or v77) or l_assetInfo_0.owned ~= nil) or v74 and l_bundles_2[v75].owned == nil then
                l_getEconomyProductInfo_0(v76, v74, v75);
            end;
        elseif not (v74 or l_assetInfo_0.owned ~= nil) or v74 and l_bundles_2[v75].owned == nil then
            local l_assetId_0 = l_assetInfo_0.assetId;
            local l_Asset_0 = Enum.AvatarItemType.Asset;
            if v74 then
                l_assetId_0 = v75;
                l_Asset_0 = Enum.AvatarItemType.Bundle;
            end;
            v66.props.getItemDetails(l_assetId_0, l_Asset_0);
        end;
    end;
    local v80 = v66.props.detailsInformation.viewingDetails and not v67.detailsInformation.viewingDetails;
    local v81 = (not not l_assetInfo_0 and l_assetInfo_0.bundlesAssetIsIn) and v80 or ((l_assetInfo_1 and not l_assetInfo_1.bundlesAssetIsIn) and l_assetInfo_0) and l_assetInfo_0.bundlesAssetIsIn;
    if v34() then
        v81 = v80;
    end;
    if v81 then
        l_reportOpenDetailsPage_0(l_assetInfo_0);
    end;
end;
v41.render = function(v82)
    local l_view_0 = v82.props.view;
    local l_detailsInformation_0 = v82.props.detailsInformation;
    local v85 = v82.props.assetInfo or {};
    local l_localPlayerModel_0 = v82.props.localPlayerModel;
    local l_scrollingEnabled_0 = v82.state.scrollingEnabled;
    local l_locale_1 = v82.props.locale;
    local v89 = l_Images_0["icons/status/item/owned"];
    local v90 = not not v89 and v89.ImageRectSize / l_Images_0.ImagesResolutionScale or Vector2.new(0, 0);
    return v4.createElement(v31.Consumer, {
        render = function(v91)
            local v92 = v91[l_view_0];
            local v93 = 0;
            local v94 = v32() and v20.isCollectibles(v85);
            local v95 = 0;
            if v94 then
                local l_getCollectibleResellableInstances_0 = v82.props.getCollectibleResellableInstances;
                local l_resellableInstances_2 = v82.props.resellableInstances;
                l_getCollectibleResellableInstances_0(v85.collectibleItemId, l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId);
                v95 = (l_resellableInstances_2 and l_resellableInstances_2[v85.collectibleItemId]) and v21.fieldCount(l_resellableInstances_2[v85.collectibleItemId]);
                if v33() then
                    v95 = v95 or 0;
                end;
            end;
            local l_v94_0 = v94;
            if v33() then
                l_v94_0 = v20.isLimited2Point0_Or_LimitedCollectible(v85);
            end;
            if v82.props.gamepadEnabled then
                v93 = -1 * l_ControllerBarHeight_0;
            end;
            if v39.UIBloxThemeEnabled then
                v93 = v93 + -v39.DefaultCornerRadius.Offset;
            end;
            return v4.createElement("Frame", {
                Position = UDim2.new(0, v92.BorderPaddingSize, 0, 0), 
                Size = UDim2.new(1, -(2 * v92.BorderPaddingSize), 1, v93), 
                BackgroundTransparency = 0, 
                BackgroundColor3 = v18.Carbon, 
                BorderSizePixel = 0, 
                Visible = if not v34() then l_detailsInformation_0.viewingDetails and v85.bundlesAssetIsIn ~= nil else l_detailsInformation_0.viewingDetails
            }, {
                DetailsButtons = v4.createElement(v10, {
                    localPlayerModel = l_localPlayerModel_0
                }), 
                Container = v4.createElement("ScrollingFrame", {
                    BackgroundTransparency = 1, 
                    ScrollBarThickness = 0, 
                    Size = UDim2.new(1, 0, 1, -55), 
                    ScrollingEnabled = l_scrollingEnabled_0, 
                    Selectable = false, 
                    CanvasSize = if not v28 then nil else UDim2.new(1, 0, 0, 0), 
                    AutomaticCanvasSize = if not v28 then nil else Enum.AutomaticSize.Y
                }, {
                    UIListLayout = v4.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 10)
                    }), 
                    DetailsThumbnail = v4.createElement(v8), 
                    TryOnViewport = l_localPlayerModel_0 and v4.createElement(v11, {
                        localPlayerModel = l_localPlayerModel_0, 
                        setScrollingEnabled = function(v99)
                            v82:setScrollingEnabled(v99);
                        end
                    }), 
                    DetailsText = v4.createElement(v7, {
                        localPlayerModel = l_localPlayerModel_0
                    }), 
                    ItemOwnedLabelContainer = l_v94_0 and v4.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, v90.Y + 20), 
                        BorderSizePixel = 0, 
                        LayoutOrder = 3, 
                        BackgroundColor3 = Color3.fromRGB(57, 59, 61)
                    }, {
                        Corner = v4.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 8)
                        }), 
                        OwnedIcon = v4.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.new(0, v90.X, 0, v90.Y), 
                            Position = UDim2.new(0, 12, 0, 10), 
                            Image = v89, 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0
                        }), 
                        ItemOwnedLabel = v4.createElement("TextLabel", {
                            Size = UDim2.new(0, v90.X, 0, v90.Y), 
                            Position = UDim2.new(0, v90.X + 60, 0, 10), 
                            Text = v22:FormatByKeyForLocale("InGame.InspectMenu.Label.OwnedItems", l_locale_1, {
                                QUANTITY = tostring(v95)
                            }), 
                            Font = l_AppFonts_0.default:getDefault(), 
                            TextSize = 12, 
                            TextColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1
                        })
                    }), 
                    DetailsDescription = v4.createElement(v9), 
                    ItemInfoList = v29 and v4.createElement(l_ItemInfoList_0, {
                        rowData = v82:getInfoRowProps(), 
                        LayoutOrder = 5
                    })
                })
            });
        end
    });
end;
return v5.UNSTABLE_connect2(function(v100, _)
    return {
        view = v100.view, 
        detailsInformation = v100.detailsInformation, 
        assetInfo = v100.assets[v100.detailsInformation.assetId], 
        bundles = v100.bundles, 
        gamepadEnabled = v100.gamepadEnabled, 
        locale = v100.locale, 
        resellableInstances = v100.collectibleResellableInstances, 
        creatingExperiences = v100.creatingExperiences
    };
end, function(v102)
    return {
        getAssetBundles = function(v103)
            v102(v14(v103));
        end, 
        getEconomyProductInfo = function(v104, v105, v106)
            v102(v16(v104, v105, v106));
        end, 
        reportOpenDetailsPage = function(v107)
            v102(v15(v107));
        end, 
        getCollectibleResellableInstances = function(v108, v109)
            v102(v17(v108, v109));
        end, 
        openOverlay = if not v29 then nil else function(v110, v111)
            v102(v12(v110, v111));
        end, 
        getItemDetails = function(v112, v113)
            v102(v36(v112, v113));
        end, 
        setAssetFromBundleInfo = if not v38() then nil else function(v114, v115)
            v102(v37(v114, v115));
        end
    };
end)(v41);
