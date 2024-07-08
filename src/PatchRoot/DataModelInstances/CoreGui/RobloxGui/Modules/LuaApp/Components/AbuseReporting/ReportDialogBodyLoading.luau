local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.UIBlox);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_ShimmerPanel_0 = v2.App.Loading.ShimmerPanel;
return function()
    local v5 = l_useDesignTokens_0();
    local v6 = {
        Padding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v5.Global.Space_400), 
            PaddingBottom = UDim.new(0, v5.Global.Space_300)
        })
    };
    for v7 = 1, 6 do
        v6[#v6 + 1] = v1.createElement(l_ShimmerPanel_0, {
            Size = UDim2.new(1, 0, 0, 30), 
            Position = UDim2.new(0, 0, 0, (v7 - 1) * 45), 
            shimmerSpeed = 1.5
        });
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = v5.Global.Opacity_0
    }, v6);
end;
