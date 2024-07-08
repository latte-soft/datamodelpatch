local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.UIBlox);
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = v2.App.Constant.IconSize;
local l_Images_0 = v2.App.ImageSet.Images;
local v6 = {
    Offline = "OFFLINE", 
    Online = "ONLINE", 
    InGame = "IN_GAME", 
    InStudio = "IN_STUDIO"
};
local v7 = {
    [v6.Online] = {
        Image = "component_assets/circle_16", 
        Color = Color3.fromRGB(0, 180, 109), 
        Size = UDim2.new(0, 12, 0, 12)
    }, 
    [v6.InGame] = {
        Image = "icons/menu/games_small"
    }, 
    [v6.InStudio] = {
        Image = "icons/logo/studiologo_small"
    }
};
return {
    PresenceType = v6, 
    GetIcon = function(v8)
        local v9 = v7[v8];
        if v9 then
            return v1.createElement(l_ImageSetLabel_0, {
                Image = l_Images_0[v9.Image], 
                BackgroundTransparency = 1, 
                ImageColor3 = v9.Color, 
                Size = v9.Size or UDim2.new(0, l_IconSize_0.Small, 0, l_IconSize_0.Small)
            });
        else
            return ;
        end;
    end
};
