local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Components.ResellerCard);
local v6 = v3.PureComponent:extend("CollectibleResellerCard");
local v7 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLimitedBundlesHandleNewData);
v6.render = function(v8)
    local l_collectibleInstance_0 = v8.props.collectibleInstance;
    if l_collectibleInstance_0 then
        return v3.createElement(v5, {
            LayoutOrder = v8.props.LayoutOrder, 
            itemId = v8.props.itemId, 
            itemType = v8.props.itemType, 
            itemPrice = l_collectibleInstance_0.price, 
            productId = l_collectibleInstance_0.collectibleProductId, 
            sellerId = tostring(l_collectibleInstance_0.seller.sellerId), 
            sellerName = l_collectibleInstance_0.seller.name, 
            sellerHasVerifiedBadge = l_collectibleInstance_0.seller.hasVerifiedBadge, 
            serialNumber = l_collectibleInstance_0.serialNumber, 
            hasDivider = v8.props.hasDivider, 
            horizontalPadding = v8.props.horizontalPadding, 
            focusController = v8.props.focusController, 
            collectibleInstanceId = l_collectibleInstance_0.collectibleInstanceId
        });
    else
        return ;
    end;
end;
return v4.connect(function(v10, v11)
    if not v7() then
        return {
            collectibleInstance = v10.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances[v11.collectibleItemId].Instances[v11.collectibleInstanceId]
        };
    else
        local v12 = if not v11.collectibleItemId then nil else v10.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances[v11.collectibleItemId];
        return {
            collectibleInstance = if not not v12 and v11.collectibleInstanceId then v12.Instances[v11.collectibleInstanceId] else nil
        };
    end;
end)(v6);
