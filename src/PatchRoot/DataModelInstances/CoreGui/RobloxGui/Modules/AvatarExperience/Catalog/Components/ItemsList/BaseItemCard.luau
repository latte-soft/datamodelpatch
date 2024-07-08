local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local v11 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v12 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v13 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableFixBundleItemDetailDeepLinkHydrationBug);
local l_ItemTile_0 = v5.Tile.ItemTile;
local v15 = v3.PureComponent:extend("BaseItemCard");
v15.validateProps = v6.strictInterface({
    itemId = v6.optional(v6.string), 
    itemType = v6.optional(v6.string), 
    onActivated = v6.callback, 
    hideItemTitle = v6.optional(v6.boolean), 
    DEPRECATED_itemData = if not v12 then v6.optional(v6.table) else nil, 
    itemInfo = if not v12 then nil else v6.optional(v6.table)
});
v15.render = function(v16)
    local l_DEPRECATED_itemData_0 = v16.props.DEPRECATED_itemData;
    local l_itemInfo_0 = v16.props.itemInfo;
    local l_itemId_0 = v16.props.itemId;
    local l_itemType_0 = v16.props.itemType;
    local v21 = nil;
    if v16.props.hideItemTitle then
        v21 = 0;
    end;
    local v22 = nil;
    local v23 = nil;
    local v24 = nil;
    if not v12 then
        if not v13() then
            if l_DEPRECATED_itemData_0 then
                v22 = l_getRbxthumbWithTypeSizeAndOptions_0(l_itemId_0, v8.GetRbxThumbType(l_itemType_0), 150);
                v23 = l_DEPRECATED_itemData_0.name;
                v24 = v8.DEPRECATED_HasPremiumBenefits(l_DEPRECATED_itemData_0);
            end;
        else
            if not (not l_itemType_0 or not l_itemId_0) then
                v22 = l_getRbxthumbWithTypeSizeAndOptions_0(l_itemId_0, v8.GetRbxThumbType(l_itemType_0), 150);
            end;
            if l_DEPRECATED_itemData_0 then
                v23 = l_DEPRECATED_itemData_0.name;
                v24 = v8.DEPRECATED_HasPremiumBenefits(l_DEPRECATED_itemData_0);
            end;
        end;
    elseif not v13() then
        if l_itemInfo_0 then
            v22 = l_getRbxthumbWithTypeSizeAndOptions_0(l_itemId_0, v8.GetRbxThumbType(l_itemType_0), 150);
            v23 = l_itemInfo_0.name;
            v24 = l_itemInfo_0.hasPremiumBenefits;
        end;
    else
        if not (not l_itemType_0 or not l_itemId_0) then
            v22 = l_getRbxthumbWithTypeSizeAndOptions_0(l_itemId_0, v8.GetRbxThumbType(l_itemType_0), 150);
        end;
        if l_itemInfo_0 then
            v23 = l_itemInfo_0.name;
            v24 = l_itemInfo_0.hasPremiumBenefits;
        end;
    end;
    return v3.createElement(l_ItemTile_0, {
        footer = v16.props.footer, 
        onActivated = v16.props.onActivated, 
        name = v23, 
        thumbnail = v22, 
        isPremium = v24, 
        titleTextLineCount = v21
    });
end;
return (v4.connect(function(v25, v26)
    local v27 = nil;
    local v28 = nil;
    if not v12 then
        v27 = v7(v25.AvatarExperience.Common, v26.itemId, v26.itemType);
    else
        v28 = v11(v25.AvatarExperience, v26.itemId, v26.itemType);
    end;
    return {
        itemInfo = v28, 
        DEPRECATED_itemData = v27
    };
end)(v15));
