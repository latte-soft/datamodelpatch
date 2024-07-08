local v0 = require(game:GetService("CorePackages").Packages.React);
local l_UIBlox_0 = require(script:FindFirstAncestor("Profile").dependencies).UIBlox;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_PlayerContext_0 = l_UIBlox_0.App.Indicator.PlayerContext;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
return function(v5)
    return v0.createElement("Frame", {
        LayoutOrder = v5.layoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        PlayerContext = v0.createElement(l_PlayerContext_0, {
            icon = l_Images_0["icons/status/player/friend"], 
            iconSize = UDim2.fromOffset(12, 12), 
            text = v5.text, 
            fontStyle = l_useStyle_0().Font.CaptionBody
        })
    });
end;
