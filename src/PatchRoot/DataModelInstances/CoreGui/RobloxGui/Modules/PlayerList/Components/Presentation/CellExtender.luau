local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = v1.PureComponent:extend("CellExtender");
v3.validateProps = v2.strictInterface({
    layoutOrder = v2.integer, 
    size = v2.UDim2, 
    backgroundStyle = v2.strictInterface({
        Color = v2.Color3, 
        Transparency = v2.number
    }), 
    overlayStyle = v2.strictInterface({
        Color = v2.Color3, 
        Transparency = v2.number
    }), 
    doubleOverlay = v2.boolean
});
v3.render = function(v4)
    return v1.createElement("Frame", {
        LayoutOrder = v4.props.layoutOrder, 
        Size = v4.props.size, 
        BackgroundTransparency = v4.props.backgroundStyle.Transparency, 
        BackgroundColor3 = v4.props.backgroundStyle.Color, 
        BorderSizePixel = 0
    }, {
        DoubleOverLay = v1.createElement("Frame", {
            ZIndex = 1, 
            Visible = v4.props.doubleOverlay, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v4.props.overlayStyle.Transparency, 
            BackgroundColor3 = v4.props.overlayStyle.Color, 
            BorderSizePixel = 0
        }), 
        OverlayFrame = v1.createElement("Frame", {
            ZIndex = 2, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v4.props.overlayStyle.Transparency, 
            BackgroundColor3 = v4.props.overlayStyle.Color, 
            BorderSizePixel = 0
        })
    });
end;
return v3;
