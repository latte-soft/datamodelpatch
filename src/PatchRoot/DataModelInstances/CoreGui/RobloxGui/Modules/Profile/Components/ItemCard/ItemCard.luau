local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_UIBlox_0 = v1.UIBlox;
local l_t_0 = v1.t;
local l_CatalogUtils_0 = v1.CatalogUtils;
local l_UserLib_0 = v1.UserLib;
local l_Constants_0 = l_UserLib_0.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = l_UserLib_0.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_FFlagAXFixItemTypeHandling_0 = v1.FFlagAXFixItemTypeHandling;
local _ = require(l_Parent_0.Reducers.Models.AssetInfo);
local _ = require(l_Parent_0.Reducers.Root);
local l_ItemTile_0 = l_UIBlox_0.Tile.ItemTile;
local v14 = l_Roact_0.PureComponent:extend("ItemCard");
v14.validateProps = l_t_0.strictInterface({
    assetId = l_t_0.string, 
    onActivated = l_t_0.optional(l_t_0.callback), 
    footer = l_t_0.optional(l_t_0.table), 
    layoutOrder = l_t_0.optional(l_t_0.integer), 
    assetInfo = l_t_0.optional(l_t_0.table)
});
v14.render = function(v15)
    local l_props_0 = v15.props;
    local l_assetInfo_0 = l_props_0.assetInfo;
    local l_assetId_0 = l_props_0.assetId;
    local v19 = nil;
    local v20 = nil;
    local v21 = nil;
    if l_assetInfo_0 then
        v19 = l_getRbxthumbWithTypeSizeAndOptions_0(l_assetId_0, l_Constants_0.RbxthumbTypes.Asset, 150);
        v20 = l_assetInfo_0.name;
        v21 = if not l_FFlagAXFixItemTypeHandling_0 then l_CatalogUtils_0.DEPRECATED_HasPremiumBenefits(l_assetInfo_0) else l_assetInfo_0.premiumPricing ~= nil;
    end;
    return l_Roact_0.createElement(l_ItemTile_0, {
        footer = l_props_0.footer, 
        LayoutOrder = l_props_0.layoutOrder, 
        isPremium = v21, 
        name = v20, 
        onActivated = l_props_0.onActivated, 
        thumbnail = v19
    });
end;
return l_RoactRodux_0.connect(function(v22, v23)
    return {
        assetInfo = v22.Profile.Assets[v23.assetId]
    };
end, nil)(v14);
