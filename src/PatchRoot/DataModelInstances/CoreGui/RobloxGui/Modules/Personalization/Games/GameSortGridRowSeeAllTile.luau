local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("CoreGui").RobloxGui.Modules;
local _ = game:GetService("CollectionService");
local v3 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.Cryo);
local v5 = require(l_CorePackages_0.UIBlox);
local l_ActionTile_0 = v5.App.Tile.ActionTile;
local l_Images_0 = v5.App.ImageSet.Images;
GameSortGridRowSeeAllTile = function(v8)
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1)
    }, {
        Tile = v3.createElement(l_ActionTile_0, {
            title = v8.title, 
            icon = l_Images_0["icons/navigation/pushRight"], 
            onActivated = v8.onSeeAll, 
            isHoverEnabled = false
        })
    });
end;
return GameSortGridRowSeeAllTile;
