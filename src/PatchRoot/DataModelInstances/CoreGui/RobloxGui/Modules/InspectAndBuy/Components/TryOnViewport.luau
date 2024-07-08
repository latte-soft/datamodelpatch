local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_Parent_0.Constants);
local v6 = require(l_Parent_0.Components.AvatarViewport);
local v7 = require(l_Parent_0.Thunks.GetHumanoidDescriptionFromCostumeId);
local v8 = require(l_Parent_0.Flags.GetFFlagIBEnableNewDataCollectionForCollectibleSystem);
local v9 = require(l_Parent_0.Flags.GetFFlagDisplayCollectiblesIcon);
local v10 = v3.PureComponent:extend("TryOnViewport");
local function _(v11)
    if not v8() then
        local l_v11_0 = v11;
        if l_v11_0 then
            l_v11_0 = v11.bundlesAssetIsIn;
            if l_v11_0 then
                l_v11_0 = false;
                if #v11.bundlesAssetIsIn == 1 then
                    l_v11_0 = not v11.isForSale;
                end;
            end;
        end;
        return l_v11_0;
    else
        return (not not v11 and v11.parentBundleId ~= nil) and (not v11.isForSale or false);
    end;
end;
local function _(v14, v15)
    return {
        AssetId = tonumber(v15), 
        Order = v5.LayeredClothingOrder[v14], 
        AccessoryType = v5.AssetTypeIdToAccessoryTypeEnum[v14], 
        IsLayered = v5.LayeredAssetTypes[v14] ~= nil
    };
end;
v10.init = function(v17)
    v17.model = v17.props.localPlayerModel;
    v17.model.HumanoidRootPart.Anchored = true;
    v17.humanoidDescriptions = {};
    v17.humanoidDescriptionForLocalPlayer = v17.model.Humanoid.HumanoidDescription;
    v17.state = {
        obtainedHumanoidDescriptions = {}
    };
end;
v10.didMount = function(v18)
    v18.isMounted = true;
end;
v10.didUpdate = function(v19, v20)
    local l_assetInfo_0 = v19.props.assetInfo;
    local l_bundles_0 = v19.props.bundles;
    local l_tryingOnInfo_0 = v19.props.tryingOnInfo;
    if not (not (l_tryingOnInfo_0 ~= v20.tryingOnInfo) or not l_tryingOnInfo_0.tryingOn) then
        local v24;
        if not v8() then
            v24 = l_assetInfo_0;
            if v24 then
                v24 = l_assetInfo_0.bundlesAssetIsIn;
                if v24 then
                    v24 = false;
                    if #l_assetInfo_0.bundlesAssetIsIn == 1 then
                        v24 = not l_assetInfo_0.isForSale;
                    end;
                end;
            end;
        else
            v24 = (not not l_assetInfo_0 and l_assetInfo_0.parentBundleId ~= nil) and (not l_assetInfo_0.isForSale or false);
        end;
        if v24 then
            v24 = nil;
            local l_costumeId_0 = l_bundles_0[if not v8() then l_assetInfo_0.bundlesAssetIsIn[1] else l_assetInfo_0.parentBundleId].costumeId;
            if l_costumeId_0 then
                v19.props.getHumanoidDescriptionFromCostumeId(l_costumeId_0, function(v26)
                    if not (not v19 or not v19.isMounted) then
                        v19.humanoidDescriptions[l_costumeId_0] = v26;
                        v19:setState({
                            obtainedHumanoidDescriptions = v1.Dictionary.join(v19.state.obtainedHumanoidDescriptions, {
                                [l_costumeId_0] = true
                            })
                        });
                    end;
                end);
            end;
        end;
    end;
end;
v10.tryOnBundleWithoutCostumeId = function(v27, v28, v29)
    local v30 = {};
    local v31 = {};
    local v32 = false;
    for _, v34 in pairs(v27.props.bundles[v28].assetIds) do
        local v35 = v27.props.assets[v34];
        local v36 = v5.AssetTypeIdToAccessoryTypeEnum[v35.assetTypeId];
        if v36 then
            v30[v36] = true;
            local v37 = v5.AssetTypeToAssetCategory[v35.assetTypeId];
            if v37 then
                v31[v37] = true;
            end;
            v32 = true;
        end;
    end;
    local l_v29_Accessories_0 = v29:GetAccessories(true);
    local v39 = {};
    if v32 then
        for _, v41 in pairs(l_v29_Accessories_0) do
            local v42 = v5.AssetTypeToAssetCategory[v5.AccessoryTypeEnumToAssetTypeId[v41.AccessoryType]];
            local v43 = not v42 or not v31[v42];
            if not (v30[v41.AccessoryType] or not v43) then
                table.insert(v39, v41);
            end;
        end;
    end;
    for _, v45 in pairs(v27.props.bundles[v28].assetIds) do
        local v46 = v27.props.assets[v45];
        if not v5.AssetTypeIdToAccessoryTypeEnum[v46.assetTypeId] then
            v29[v5.AssetTypeIdStringToHumanoidDescriptionProp[v46.assetTypeId]] = v45;
        else
            local l_assetTypeId_0 = v46.assetTypeId;
            table.insert(v39, {
                AssetId = tonumber(v45), 
                Order = v5.LayeredClothingOrder[l_assetTypeId_0], 
                AccessoryType = v5.AssetTypeIdToAccessoryTypeEnum[l_assetTypeId_0], 
                IsLayered = v5.LayeredAssetTypes[l_assetTypeId_0] ~= nil
            });
        end;
    end;
    if v32 then
        v29:SetAccessories(v39, true);
    end;
    return v29;
end;
v10.render = function(v48)
    local l_assetInfo_1 = v48.props.assetInfo;
    local l_bundles_1 = v48.props.bundles;
    local l_tryingOnInfo_1 = v48.props.tryingOnInfo;
    local v52 = v48.humanoidDescriptionForLocalPlayer:Clone();
    local l_tryingOn_0 = l_tryingOnInfo_1.tryingOn;
    local l_setScrollingEnabled_0 = v48.props.setScrollingEnabled;
    if not (not l_tryingOnInfo_1 or not l_tryingOnInfo_1.tryingOn) then
        local v55;
        if not v8() then
            v55 = l_assetInfo_1;
            if v55 then
                v55 = l_assetInfo_1.bundlesAssetIsIn;
                if v55 then
                    v55 = false;
                    if #l_assetInfo_1.bundlesAssetIsIn == 1 then
                        v55 = not l_assetInfo_1.isForSale;
                    end;
                end;
            end;
        else
            v55 = (not not l_assetInfo_1 and l_assetInfo_1.parentBundleId ~= nil) and (not l_assetInfo_1.isForSale or false);
        end;
        if not v55 then
            if not v5.AssetTypeIdToAccessoryTypeEnum[l_tryingOnInfo_1.assetTypeId] then
                v52[v5.AssetTypeIdStringToHumanoidDescriptionProp[l_tryingOnInfo_1.assetTypeId]] = l_tryingOnInfo_1.assetId;
            else
                v55 = v5.AssetTypeIdToAccessoryTypeEnum[l_tryingOnInfo_1.assetTypeId];
                local l_v52_Accessories_0 = v52:GetAccessories(true);
                local v57 = {};
                for _, v59 in pairs(l_v52_Accessories_0) do
                    local v60 = v5.AccessoryTypeEnumToAssetTypeId[v59.AccessoryType];
                    local v61 = v5.AssetTypeToAssetCategory[l_tryingOnInfo_1.assetTypeId];
                    local v62 = not v61 or v5.AssetTypeToAssetCategory[v60] ~= v61;
                    if not (not (v59.AccessoryType ~= v55) or not v62) then
                        table.insert(v57, v59);
                    end;
                end;
                local l_assetTypeId_1 = l_tryingOnInfo_1.assetTypeId;
                table.insert(v57, {
                    AssetId = tonumber(l_tryingOnInfo_1.assetId), 
                    Order = v5.LayeredClothingOrder[l_assetTypeId_1], 
                    AccessoryType = v5.AssetTypeIdToAccessoryTypeEnum[l_assetTypeId_1], 
                    IsLayered = v5.LayeredAssetTypes[l_assetTypeId_1] ~= nil
                });
                v52:SetAccessories(v57, true);
            end;
        else
            v55 = nil;
            v55 = if not v8() then l_assetInfo_1.bundlesAssetIsIn[1] else l_assetInfo_1.parentBundleId;
            local l_costumeId_1 = l_bundles_1[v55].costumeId;
            if not l_costumeId_1 then
                v52 = v48:tryOnBundleWithoutCostumeId(v55, v52);
            else
                local v65 = v48.humanoidDescriptions[l_costumeId_1];
                l_tryingOn_0 = v48.state.obtainedHumanoidDescriptions[l_costumeId_1] == true;
                if v65 then
                    for v66, v67 in pairs(v5.AssetTypeIdStringToHumanoidDescriptionProp) do
                        if not (not (v5.AssetTypeIdToAccessoryTypeEnum[v66] == nil) or not tonumber(v65[v67])) and tostring(v65[v67]) ~= "0" then
                            v52[v67] = v65[v67];
                        end;
                    end;
                    v52:SetAccessories(v65:GetAccessories(true), true);
                end;
            end;
        end;
    end;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, not not v9() and v5.DetailsThumbnailFrameHeight or 300), 
        LayoutOrder = 2, 
        Visible = l_tryingOn_0
    }, {
        AvatarViewport = v3.createElement(v6, {
            size = UDim2.new(0.75, 0, 1, 0), 
            position = UDim2.new(0.5, 0, 0.5, 0), 
            humanoidDescription = v52, 
            model = v48.model, 
            visible = true, 
            backgroundTransparency = 1, 
            setScrollingEnabled = l_setScrollingEnabled_0
        })
    });
end;
v10.willUnmount = function(v68)
    v68.isMounted = false;
end;
return v4.UNSTABLE_connect2(function(v69, _)
    return {
        assets = v69.assets, 
        assetInfo = v69.assets[v69.detailsInformation.assetId], 
        bundles = v69.bundles, 
        tryingOnInfo = v69.tryingOnInfo
    };
end, function(v71)
    return {
        getHumanoidDescriptionFromCostumeId = function(v72, v73)
            return v71(v7(v72, v73));
        end
    };
end)(v10);
