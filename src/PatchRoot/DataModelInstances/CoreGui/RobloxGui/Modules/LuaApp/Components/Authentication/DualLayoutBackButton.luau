local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.UIBlox);
local l_Images_0 = v2.App.ImageSet.Images;
local l_IconButton_0 = v2.App.Button.IconButton;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
return function(v6)
    local v7 = l_useDesignTokens_0();
    return v1.createElement(l_IconButton_0, {
        size = UDim2.new(0, v7.Global.Size_300, 0, v7.Global.Size_300), 
        position = UDim2.new(0, v7.Global.Size_100, 0.5, 0), 
        anchorPoint = Vector2.new(0, 0.5), 
        icon = l_Images_0["icons/navigation/close"], 
        onActivated = v6.navigateBack
    });
end;
