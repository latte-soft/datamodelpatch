local v0 = require(game:GetService("CorePackages").Packages.React);
local l_UIBlox_0 = require(script:FindFirstAncestor("Profile").dependencies).UIBlox;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_ShimmerPanel_0 = l_UIBlox_0.App.Loading.ShimmerPanel;
return function(v4)
    local v5 = l_useStyle_0();
    local v6 = v5.Font.BaseSize * v5.Font.CaptionBody.RelativeSize;
    return v0.createElement("Frame", {
        LayoutOrder = v4.layoutOrder, 
        Size = UDim2.new(1, 0, 0, v6), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        Padding = v0.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 4), 
            PaddingBottom = UDim.new(0, 4)
        }), 
        ShimmerPanel = v0.createElement(l_ShimmerPanel_0, {
            Size = UDim2.new(0.6, 0, 0, v6)
        })
    });
end;
