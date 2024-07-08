local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local _ = game:GetService("CoreGui").RobloxGui.Modules;
local l_LoadableImage_0 = require(l_CorePackages_0.UIBlox).App.Loading.LoadableImage;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
return function(v5)
    local v6 = l_useDesignTokens_0();
    return v1.createElement("Frame", {
        Size = UDim2.fromOffset(v6.Global.Size_1200, v6.Global.Size_1200), 
        BackgroundTransparency = 0
    }, {
        AvatarThumbnail = v1.createElement(l_LoadableImage_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, v6.Global.Size_1200, 0, v6.Global.Size_1200), 
            ScaleType = Enum.ScaleType.Fit, 
            BackgroundTransparency = 1, 
            Image = v5.thumbnailUrl, 
            useShimmerAnimationWhileLoading = true, 
            ZIndex = 2
        })
    });
end;
