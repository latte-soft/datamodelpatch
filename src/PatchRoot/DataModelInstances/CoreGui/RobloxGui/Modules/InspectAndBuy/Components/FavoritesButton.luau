local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Colors);
local v6 = require(l_Parent_0.Thunks.CreateFavoriteForAsset);
local v7 = require(l_Parent_0.Thunks.DeleteFavoriteForAsset);
local v8 = require(l_Parent_0.Thunks.CreateFavoriteForBundle);
local v9 = require(l_Parent_0.Thunks.DeleteFavoriteForBundle);
local v10 = require(l_Parent_0.Thunks.GetFavoriteForAsset);
local v11 = require(l_Parent_0.Thunks.GetFavoriteForBundle);
local v12 = require(l_Parent_0.Selectors.GotFavoriteForDetailsItem);
local v13 = require(l_Parent_0.Selectors.IsDetailsItemPartOfBundleAndOffsale);
local v14 = require(l_Parent_0.Selectors.GetIsFavorite);
local v15 = require(l_Parent_0.UtilityFunctions);
local v16 = require(l_Parent_0.getSelectionImageObjectRounded);
local v17 = require(l_Parent_0.Flags.GetFFlagIBEnableNewDataCollectionForCollectibleSystem);
local v18 = require(l_Parent_0.Flags.FFlagEnableFavoriteButtonForUgc);
local l_Favorite_0 = require(script.Parent.Common.ControllerShortcutKeycodes).Favorite;
local v20 = require(l_Parent_0.Flags.GetFFlagIBEnableCollectiblePurchaseForUnlimited);
local v21 = require(l_Parent_0.Flags.GetFFlagIBEnableLimitedBundle);
local v22 = v2.PureComponent:extend("FavoritesButton");
v22.init = function(v23)
    v23.selectedImage = v16();
    if v20() then
        v23.fetchFavoriteRetries = 0;
    end;
    l_ContextActionService_0:BindCoreAction("FavoriteGamepadShortcut", function(_, v25, _)
        if v25 == Enum.UserInputState.End then
            v23:activateButton();
            return Enum.ContextActionResult.Sink;
        else
            return Enum.ContextActionResult.Pass;
        end;
    end, false, l_Favorite_0);
end;
v22.willUpdate = function(v27, v28)
    local l_gotFavoriteForDetailsItem_0 = v28.gotFavoriteForDetailsItem;
    local l_getFavoriteForAsset_0 = v27.props.getFavoriteForAsset;
    local l_getFavoriteForBundle_0 = v27.props.getFavoriteForBundle;
    local v32 = (v28.assetInfo and v28.assetInfo.bundlesAssetIsIn) and not l_gotFavoriteForDetailsItem_0;
    if v17() then
        v32 = v28.assetInfo and not l_gotFavoriteForDetailsItem_0;
    end;
    if v20() then
        v32 = v32 and v27.fetchFavoriteRetries < 10;
    end;
    if v32 then
        local l_assetInfo_0 = v28.assetInfo;
        local v34 = nil;
        v34 = if not v17() then #l_assetInfo_0.bundlesAssetIsIn > 0 else l_assetInfo_0.parentBundleId ~= nil;
        local v35 = v34 and not l_assetInfo_0.isForSale;
        if v21() then
            v35 = v34;
        end;
        do
            local l_v35_0 = v35;
            coroutine.wrap(function()
                if l_v35_0 then
                    l_getFavoriteForBundle_0((v15.getBundleId(l_assetInfo_0)));
                    return ;
                else
                    l_getFavoriteForAsset_0(l_assetInfo_0.assetId);
                    return ;
                end;
            end)();
            if v20() then
                v27.fetchFavoriteRetries = v27.fetchFavoriteRetries + 1;
            end;
        end;
    end;
end;
v22.activateButton = function(v37)
    local l_isFavorited_0 = v37.props.isFavorited;
    local l_IsDetailsItemPartOfBundleAndOffsale_0 = v37.props.IsDetailsItemPartOfBundleAndOffsale;
    local l_createFavoriteForAsset_0 = v37.props.createFavoriteForAsset;
    local l_deleteFavoriteForAsset_0 = v37.props.deleteFavoriteForAsset;
    local l_createFavoriteForBundle_0 = v37.props.createFavoriteForBundle;
    local l_deleteFavoriteForBundle_0 = v37.props.deleteFavoriteForBundle;
    local l_assetInfo_1 = v37.props.assetInfo;
    local v45 = not not l_assetInfo_1 and l_assetInfo_1.creatorId or 0;
    if not v18 and v45 ~= "1" then
        return ;
    elseif not l_isFavorited_0 then
        if not l_IsDetailsItemPartOfBundleAndOffsale_0 then
            l_createFavoriteForAsset_0(l_assetInfo_1.assetId);
            return ;
        else
            l_createFavoriteForBundle_0((v15.getBundleId(l_assetInfo_1)));
            return ;
        end;
    elseif not l_IsDetailsItemPartOfBundleAndOffsale_0 then
        l_deleteFavoriteForAsset_0(l_assetInfo_1.assetId);
        return ;
    else
        l_deleteFavoriteForBundle_0((v15.getBundleId(l_assetInfo_1)));
        return ;
    end;
end;
v22.willUnmount = function(_)
    l_ContextActionService_0:UnbindCoreAction("FavoriteGamepadShortcut");
end;
v22.render = function(v47)
    local l_isFavorited_1 = v47.props.isFavorited;
    local l_favoriteButtonRef_0 = v47.props.favoriteButtonRef;
    local l_assetInfo_2 = v47.props.assetInfo;
    return v2.createElement("ImageButton", {
        AnchorPoint = Vector2.new(0.5, 0), 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 44, 0, 44), 
        LayoutOrder = 1, 
        Image = "rbxasset://textures/ui/InspectMenu/Button_outline.png", 
        ImageColor3 = v5.White, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(5, 5, 120, 20), 
        SelectionImageObject = v47.selectedImage, 
        Visible = not not v18 or (not not l_assetInfo_2 and l_assetInfo_2.creatorId or 0) == "1", 
        [v2.Ref] = l_favoriteButtonRef_0, 
        [v2.Event.Activated] = function()
            v47:activateButton();
        end
    }, {
        FavoriteIcon = v2.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 26, 0, 26), 
            Position = UDim2.new(0, 22, 0, 22), 
            Image = not l_isFavorited_1 and "rbxasset://textures/ui/InspectMenu/ico_favorite_off.png" or "rbxasset://textures/ui/InspectMenu/ico_favorite.png", 
            ImageColor3 = v5.White
        })
    });
end;
return v3.UNSTABLE_connect2(function(v51, _)
    return {
        view = v51.view, 
        assetInfo = v51.assets[v51.detailsInformation.assetId], 
        bundleInfo = v51.bundles, 
        gotFavoriteForDetailsItem = v12(v51), 
        isFavorited = v14(v51), 
        IsDetailsItemPartOfBundleAndOffsale = v13(v51)
    };
end, function(v53)
    return {
        createFavoriteForAsset = function(v54)
            v53(v6(v54));
        end, 
        deleteFavoriteForAsset = function(v55)
            v53(v7(v55));
        end, 
        createFavoriteForBundle = function(v56)
            v53(v8(v56));
        end, 
        deleteFavoriteForBundle = function(v57)
            v53(v9(v57));
        end, 
        getFavoriteForAsset = function(v58)
            v53(v10(v58));
        end, 
        getFavoriteForBundle = function(v59)
            v53(v11(v59));
        end
    };
end)(v22);
