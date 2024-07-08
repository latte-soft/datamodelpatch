local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local l_ItemTile_0 = require(l_CorePackages_0.UIBlox).Tile.ItemTile;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v8 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Actions.SetSelectedAccessory);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v10 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_getRbxthumbWithTypeSizeAndOptions_0 = v10.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Constants_0 = v10.Utils.Constants;
local v13 = v2.PureComponent:extend("ItemSelectorTile");
v13.validateProps = v4.strictInterface({
    assetId = v4.string, 
    tileSize = v4.number, 
    tileRef = v4.table, 
    LayoutOrder = v4.number, 
    setSelectedAccessory = v4.callback, 
    navigation = v4.table
});
v13.init = function(v14)
    v14.selectItem = function()
        v14.props.setSelectedAccessory(v14.props.assetId);
        v14.props.navigation.navigate(v9.AccessoryAdjustment);
    end;
end;
v13.render = function(v15)
    local l_tileSize_0 = v15.props.tileSize;
    local v17 = nil;
    if v15.props.assetId then
        v17 = l_getRbxthumbWithTypeSizeAndOptions_0(v15.props.assetId, l_Constants_0.RbxthumbTypes.Asset, 150);
    end;
    return v2.createElement("Frame", {
        Size = UDim2.fromOffset(l_tileSize_0, l_tileSize_0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v15.props.LayoutOrder, 
        [v2.Ref] = v15.props.tileRef
    }, {
        ItemTile = v2.createElement(l_ItemTile_0, {
            titleTextLineCount = 0, 
            thumbnail = v17, 
            onActivated = v15.selectItem
        })
    });
end;
return (v3.connect(nil, function(v18)
    return {
        setSelectedAccessory = function(v19)
            v18(v8(v19));
        end
    };
end)((l_withNavigation_0(v13, nil))));
