local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v7 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Components.ItemsList.BaseItemCard);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.LoadableGridView);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchBundleAssetsDetails);
local v12 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableFixBundleItemDetailDeepLinkHydrationBug);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v14 = v2.PureComponent:extend("BundlesItemsGrid");
v14.init = function(v15)
    v15.renderItemTile = function(v16)
        return v2.createElement(v9, {
            itemId = v16.id, 
            itemType = v16.type, 
            onActivated = function()
            end
        });
    end;
end;
v14.willUpdate = function(v17, v18)
    if v12() and v17.props.bundleItemsList ~= v18.bundleItemsList then
        local v19 = {};
        local l_bundleItemsList_0 = v18.bundleItemsList;
        if l_bundleItemsList_0 then
            for _, v22 in l_bundleItemsList_0, nil, nil do
                table.insert(v19, (tonumber(v22.id)));
            end;
        end;
        v17.props.fetchBundleAssetsDetails(v17.props.networking, v17.props.bundleId or v18.bundleId, v19);
    end;
end;
v14.render = function(v23)
    local l_bundleItemsList_1 = v23.props.bundleItemsList;
    local l_LayoutOrder_0 = v23.props.LayoutOrder;
    local v26 = nil;
    if l_bundleItemsList_1 then
        v26 = {};
        for _, v28 in l_bundleItemsList_1, nil, nil do
            if v28.type == v6.ItemType.Asset then
                table.insert(v26, v28);
            end;
        end;
    end;
    return l_withStyle_0(function(v29)
        local l_Font_0 = v29.Font;
        return v2.createElement(v10, {
            renderItem = v23.renderItemTile, 
            getItemHeight = v7.GridItemHeightGetter(v6.ItemTileType.BundleItemTile, l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize), 
            items = v26, 
            LayoutOrder = l_LayoutOrder_0, 
            totalNumItems = v8.bundleIncludedItemsCount
        });
    end);
end;
v14 = v3.connect(function(v31, v32)
    local v33 = tostring(v32.itemId);
    local v34 = v31.AvatarExperience.Common.BundleInfos[v33];
    return {
        bundleId = if not v12() then nil else v33, 
        bundleItemsList = v34 and v34.items
    };
end, if not v12() then nil else function(v35)
    if not v12() then
        return {};
    else
        return {
            fetchBundleAssetsDetails = function(v36, v37, v38)
                v35(v11(v36, v37, v38));
            end
        };
    end;
end)(v14);
if v12() then
    v14 = l_RoactServices_0.connect({
        networking = v5
    })(v14);
end;
return v14;
