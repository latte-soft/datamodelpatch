local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Images_0 = require(l_CorePackages_0.UIBlox).App.ImageSet.Images;
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Components.LimitedLabel);
local v5 = require(l_Parent_0.Constants);
local v6 = require(l_CorePackages_0.Roact);
local v7 = require(l_CorePackages_0.RoactRodux);
local v8 = require(l_Parent_0.UtilityFunctions);
local v9 = require(l_CoreGui_0.RobloxGui.Modules.RobloxTranslator);
local v10 = require(l_Parent_0.Components.InspectAndBuyContext);
local v11 = require(l_Parent_0.Flags.GetFFlagDisplayCollectiblesIcon);
local v12 = require(l_Parent_0.Flags.GetFFlagIBEnableCollectiblesSystemSupport);
local v13 = require(l_Parent_0.Flags.GetFFlagIBEnableLimitedItemBugFixAndAlignment);
local v14 = require(l_Parent_0.Flags.GetFFlagIBEnableNewDataCollectionForCollectibleSystem);
local v15 = require(l_Parent_0.Flags.GetFFlagIBEnableLimitedBundle);
local v16 = v6.PureComponent:extend("DetailsThumbnail");
local function _(v17)
    if not v15() then
        if not v17 or not v17.isForSale then
            if not v14() then
                local v18;
                if not (not v17 or not v17.bundlesAssetIsIn) then
                    v18 = true;
                    if not (#v17.bundlesAssetIsIn ~= 1) then
                        goto label0;
                    end;
                end;
                v18 = false;
                ::label0::;
                return v18;
            else
                local v19;
                if v17 then
                    v19 = true;
                    if not (v17.parentBundleId == nil) then
                        goto label1;
                    end;
                end;
                v19 = false;
                ::label1::;
                return v19;
            end;
        else
            return false;
        end;
    else
        local v20;
        if v17 then
            v20 = true;
            if not (v17.parentBundleId == nil) then
                goto label2;
            end;
        end;
        v20 = false;
        ::label2::;
        return v20;
    end;
end;
v16.getUrl = function(v22)
    local l_assetInfo_0 = v22.props.assetInfo;
    local l_detailsInformation_0 = v22.props.detailsInformation;
    local l_bundles_0 = v22.props.bundles;
    local v26 = v8.getBundleId(l_assetInfo_0);
    local v27;
    if not v15() then
        if not l_assetInfo_0 or not l_assetInfo_0.isForSale then
            if not v14() then
                if not (not l_assetInfo_0 or not l_assetInfo_0.bundlesAssetIsIn) then
                    v27 = true;
                    if not (#l_assetInfo_0.bundlesAssetIsIn ~= 1) then
                        goto label3;
                    end;
                end;
                v27 = false;
            else
                if l_assetInfo_0 then
                    v27 = true;
                    if not (l_assetInfo_0.parentBundleId == nil) then
                        goto label3;
                    end;
                end;
                v27 = false;
            end;
        else
            v27 = false;
        end;
    else
        if l_assetInfo_0 then
            v27 = true;
            if not (l_assetInfo_0.parentBundleId == nil) then
                goto label3;
            end;
        end;
        v27 = false;
    end;
    ::label3::;
    local _ = "";
    if (not v27 or not l_bundles_0[v26]) or not l_bundles_0[v26].costumeId then
        return "rbxthumb://type=Asset&id=" .. l_detailsInformation_0.assetId .. "&w=420&h=420";
    else
        return "rbxthumb://type=Outfit&id=" .. l_bundles_0[v26].costumeId .. "&w=420&h=420";
    end;
end;
v16.render = function(v29)
    local l_view_0 = v29.props.view;
    local l_detailsInformation_1 = v29.props.detailsInformation;
    local l_tryingOnInfo_0 = v29.props.tryingOnInfo;
    local l_locale_0 = v29.props.locale;
    local l_assetInfo_1 = v29.props.assetInfo;
    local v35 = l_Images_0["icons/status/item/limited"];
    local v36 = not not v35 and v35.ImageRectSize / l_Images_0.ImagesResolutionScale or Vector2.new(0, 0);
    return v6.createElement(v10.Consumer, {
        render = function(v37)
            local v38 = v37[l_view_0];
            local v39 = v11() and v8.isCollectibles(l_assetInfo_1);
            local v40 = nil;
            local v41 = nil;
            local v42 = nil;
            local v43 = nil;
            if not (not v12() or not l_assetInfo_1) then
                v40 = v8.hasLimitedQuantity(l_assetInfo_1);
                v41 = l_assetInfo_1.isLimitedUnique or l_assetInfo_1.collectibleIsLimited;
                if v13() then
                    v41 = v8.isLimited1Point0_LimitedUnique(l_assetInfo_1) or v8.isLimited2Point0_Or_LimitedCollectible(l_assetInfo_1);
                end;
                v42 = UDim2.new(0, v36.X + if not v41 then v5.LimitedIconFrameSizeXOffset else v5.LimitedIconFrameSizeXOffset * 2, 0, v36.Y + v5.LimitedIconFrameSizeYOffset);
                v43 = if not v41 then "    " .. v9:FormatByKeyForLocale("InGame.InspectMenu.Label.LimitedItems", l_locale_0) else "#" .. "    " .. v9:FormatByKeyForLocale("InGame.InspectMenu.Label.LimitedItems", l_locale_0);
            end;
            return v6.createElement("Frame", {
                Position = v38.DetailsThumbnailFramePosition, 
                Size = UDim2.new(1, 0, 0, not not v11() and v5.DetailsThumbnailFrameHeight or 300), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Visible = not l_tryingOnInfo_0.tryingOn
            }, {
                Thumbnail = l_detailsInformation_1.viewingDetails and v6.createElement("ImageLabel", {
                    Position = v38.DetailsThumbnailPosition, 
                    AnchorPoint = v38.DetailsThumbnailAnchorPoint, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    Image = v29:getUrl()
                }, {
                    AspectRatioConstraint = v6.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1, 
                        AspectType = Enum.AspectType.FitWithinMaxSize, 
                        DominantAxis = v38.DetailsThumbnailARDominantAxis
                    })
                }), 
                LimitedLabel = if not v12() then v39 else v40 and v6.createElement(v4, {
                    frameSize = if not v12() then UDim2.new(0, v36.X + 18, 0, v36.Y + 6) else v42, 
                    framePosition = UDim2.new(0, 0, 0, (v5.DetailsThumbnailFrameHeight - v36.Y) - 8), 
                    imageSize = UDim2.new(0, v36.X, 0, v36.Y), 
                    imagePosition = UDim2.new(0, 4, 0, 3), 
                    textSize = UDim2.new(0, 4 + v36.X, 0, v36.Y), 
                    textPosition = UDim2.new(0, 5 + v36.X, 0, 3), 
                    text = if not v12() then "#" .. "    " .. v9:FormatByKeyForLocale("InGame.InspectMenu.Label.LimitedItems", l_locale_0) else v43
                })
            });
        end
    });
end;
return v7.UNSTABLE_connect2(function(v44, _)
    return {
        view = v44.view, 
        tryingOnInfo = v44.tryingOnInfo, 
        detailsInformation = v44.detailsInformation, 
        assetInfo = v44.assets[v44.detailsInformation.assetId], 
        locale = v44.locale, 
        bundles = v44.bundles
    };
end)(v16);
