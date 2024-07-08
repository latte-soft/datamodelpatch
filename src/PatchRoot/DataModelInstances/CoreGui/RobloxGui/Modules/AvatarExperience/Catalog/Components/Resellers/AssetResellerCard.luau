local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Components.ResellerCard);
local v6 = v3.PureComponent:extend("AssetResellerCard");
v6.render = function(v7)
    local l_userAssetInfo_0 = v7.props.userAssetInfo;
    if l_userAssetInfo_0 then
        return v3.createElement(v5, {
            LayoutOrder = v7.props.LayoutOrder, 
            itemId = v7.props.itemId, 
            itemType = v7.props.itemType, 
            itemPrice = l_userAssetInfo_0.priceInRobux, 
            productId = v7.props.productId, 
            sellerId = l_userAssetInfo_0.userId, 
            sellerName = l_userAssetInfo_0.userName, 
            sellerHasVerifiedBadge = l_userAssetInfo_0.sellerHasVerifiedBadge, 
            serialNumber = l_userAssetInfo_0.serialNumber, 
            userAssetId = v7.props.userAssetId, 
            hasDivider = v7.props.hasDivider, 
            horizontalPadding = v7.props.horizontalPadding, 
            focusController = v7.props.focusController
        });
    else
        return ;
    end;
end;
return v4.connect(function(v9, v10)
    return {
        userAssetInfo = v9.AvatarExperience.Catalog.UserAssets[v10.userAssetId]
    };
end)(v6);
