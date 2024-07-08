local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local l_ImageSetButton_0 = v4.Core.ImageSet.ImageSetButton;
local l_Colors_0 = v4.App.Style.Colors;
local l_Flint_0 = l_Colors_0.Flint;
local l_Graphite_0 = l_Colors_0.Graphite;
local l_White_0 = l_Colors_0.White;
local v11 = Color3.fromRGB(250, 250, 250);
local v12 = require(l_CoreGui_0.RobloxGui.Modules.Flags.GetFFlagForceChatBubbleColorCS);
local v13 = v2.PureComponent:extend("ControlBubble");
v13.validateProps = v3.strictInterface({
    LayoutOrder = v3.optional(v3.number), 
    icon = v3.any, 
    onActivated = v3.callback, 
    enabled = v3.boolean, 
    isImageSet = v3.boolean
});
v13.render = function(v14)
    local l_chatSettings_0 = v14.props.chatSettings;
    local l_BackgroundImage_0 = l_chatSettings_0.BackgroundImage;
    local l_BackgroundGradient_0 = l_chatSettings_0.BackgroundGradient;
    return v2.createElement("ImageButton", {
        AnchorPoint = Vector2.new(0.5, 1), 
        Size = UDim2.new(0, 44, 1, 0), 
        LayoutOrder = v14.props.LayoutOrder, 
        BorderSizePixel = 0, 
        Transparency = 1, 
        ZIndex = 2, 
        [v2.Event.Activated] = v14.props.onActivated
    }, {
        UICorner = l_chatSettings_0.CornerEnabled and v2.createElement("UICorner", {
            CornerRadius = l_chatSettings_0.CornerRadius
        }), 
        Contents = v2.createElement("ImageLabel", v5.Dictionary.join(l_BackgroundImage_0, {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = if not (l_chatSettings_0.BackgroundColor3 ~= v11) or v12() then l_Graphite_0 else l_chatSettings_0.BackgroundColor3, 
            BorderSizePixel = 0
        }), {
            UICorner = l_chatSettings_0.CornerEnabled and v2.createElement("UICorner", {
                CornerRadius = l_chatSettings_0.CornerRadius
            }), 
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_chatSettings_0.Padding), 
                PaddingRight = UDim.new(0, l_chatSettings_0.Padding), 
                PaddingBottom = UDim.new(0, l_chatSettings_0.Padding), 
                PaddingLeft = UDim.new(0, l_chatSettings_0.Padding)
            }), 
            Icon = v2.createElement(not v14.props.isImageSet and "ImageButton" or l_ImageSetButton_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = not v14.props.isImageSet and v14.props.iconSize or UDim2.fromOffset(28, 28), 
                BackgroundTransparency = 1, 
                ImageTransparency = not v14.props.enabled and 0.5 or 0, 
                ImageColor3 = if not v14.props.enabled then l_Flint_0 else l_White_0, 
                BorderSizePixel = 0, 
                Image = v14.props.icon
            }), 
            Gradient = l_BackgroundGradient_0.Enabled and v2.createElement("UIGradient", l_BackgroundGradient_0)
        })
    });
end;
return v13;
