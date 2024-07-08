local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.SellPage.AvailableToSellRow);
local v6 = v3.PureComponent:extend("AvailableToSellLimitedUniqueRow");
v6.render = function(v7)
    local l_userAssetInfo_0 = v7.props.userAssetInfo;
    if l_userAssetInfo_0 and (not l_userAssetInfo_0 or l_userAssetInfo_0.serialNumber) then
        return v3.createElement(v5, {
            LayoutOrder = v7.props.LayoutOrder, 
            onActivated = v7.props.onActivated, 
            horizontalPadding = v7.props.horizontalPadding, 
            Position = v7.props.Position, 
            Size = v7.props.Size, 
            Text = "# " .. l_userAssetInfo_0.serialNumber, 
            NextSelectionLeft = v7.props.NextSelectionLeft, 
            NextSelectionRight = v7.props.NextSelectionRight, 
            NextSelectionUp = v7.props.NextSelectionUp, 
            NextSelectionDown = v7.props.NextSelectionDown, 
            [v3.Ref] = v7.props.forwardRef
        });
    else
        return ;
    end;
end;
v6 = v4.connect(function(v9, v10)
    return {
        userAssetInfo = v9.AvatarExperience.Catalog.UserAssets[v10.userAssetId]
    };
end)(v6);
return v3.forwardRef(function(v11, v12)
    return v3.createElement(v6, v2.Dictionary.join(v11, {
        forwardRef = v12
    }));
end);
