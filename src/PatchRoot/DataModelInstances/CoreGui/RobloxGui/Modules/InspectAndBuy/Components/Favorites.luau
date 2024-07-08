local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v5 = require(l_Parent_0.UtilityFunctions);
local v6 = require(l_Parent_0.Thunks.GetAssetFavoriteCount);
local v7 = require(l_Parent_0.Thunks.GetBundleFavoriteCount);
local v8 = require(l_Parent_0.Selectors.GotCurrentFavoriteCount);
local v9 = require(l_Parent_0.getSelectionImageObjectRegular);
local v10 = require(l_Parent_0.Flags.GetFFlagIBEnableNewDataCollectionForCollectibleSystem);
local v11 = require(l_Parent_0.Flags.GetFFlagIBEnableLimitedBundle);
local v12 = v2.PureComponent:extend("Favorites");
v12.setText = function(v13)
    local v14 = v13.props.assetInfo or {};
    local v15 = v14.bundlesAssetIsIn and #v14.bundlesAssetIsIn > 0;
    if v10() then
        v15 = v14.parentBundleId ~= nil;
    end;
    local v16 = v15 and not v14.isForSale;
    if v11() then
        v16 = v15;
    end;
    local l_bundleInfo_0 = v13.props.bundleInfo;
    if not v16 then
        if v14 then
            v13.numFavorites = v14.numFavorites;
        end;
    else
        local v18 = v5.getBundleId(v14);
        if l_bundleInfo_0[v18] then
            v13.numFavorites = l_bundleInfo_0[v18].numFavorites;
            return ;
        end;
    end;
end;
v12.init = function(v19)
    v19.numFavorites = "";
    v19.selectionImageObject = v9();
end;
v12.willUpdate = function(v20, v21)
    local l_getAssetFavoriteCount_0 = v20.props.getAssetFavoriteCount;
    local l_getBundleFavoriteCount_0 = v20.props.getBundleFavoriteCount;
    local v24 = v21.assetInfo and v21.assetInfo.bundlesAssetIsIn;
    if v10() then
        v24 = v21.assetInfo;
    end;
    if v24 then
        local l_assetInfo_0 = v21.assetInfo;
        local v26 = nil;
        v26 = if not v10() then #l_assetInfo_0.bundlesAssetIsIn > 0 else l_assetInfo_0.parentBundleId ~= nil;
        local v27 = v26 and not l_assetInfo_0.isForSale;
        if v11() then
            v27 = v26;
        end;
        do
            local l_v27_0 = v27;
            if not v21.gotCurrentFavoriteCount then
                coroutine.wrap(function()
                    if l_v27_0 then
                        l_getBundleFavoriteCount_0((v5.getBundleId(l_assetInfo_0)));
                        return ;
                    else
                        l_getAssetFavoriteCount_0(l_assetInfo_0.assetId);
                        return ;
                    end;
                end)();
            end;
        end;
    end;
end;
v12.render = function(v29)
    v29:setText();
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 16), 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    }, {
        FavoriteIcon = v2.createElement("ImageButton", {
            Selectable = false, 
            Size = UDim2.new(0, 16, 0, 16), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/InspectMenu/ico_favorite.png", 
            SelectionImageObject = v29.selectionImageObject
        }), 
        FavoriteText = v2.createElement("TextLabel", {
            Size = UDim2.new(1, -16, 1, 0), 
            Position = UDim2.new(0, 21, 0, 0), 
            BackgroundTransparency = 1, 
            Text = v29.numFavorites or "", 
            Font = l_AppFonts_0.default:getDefault(), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextSize = 12, 
            TextColor3 = Color3.new(1, 1, 1)
        })
    });
end;
v12.shouldUpdate = function(_, v31)
    if v31.detailsInformation.viewingDetails then
        return true;
    else
        return false;
    end;
end;
return v3.UNSTABLE_connect2(function(v32, _)
    return {
        detailsInformation = v32.detailsInformation, 
        assetInfo = v32.assets[v32.detailsInformation.assetId], 
        bundleInfo = v32.bundles, 
        gotCurrentFavoriteCount = v8(v32)
    };
end, function(v34)
    return {
        getAssetFavoriteCount = function(v35)
            v34(v6(v35));
        end, 
        getBundleFavoriteCount = function(v36)
            v34(v7(v36));
        end
    };
end)(v12);
