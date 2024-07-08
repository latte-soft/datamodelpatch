local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local l_ImageSetButton_0 = require(l_CorePackages_0.UIBlox).Core.ImageSet.ImageSetButton;
local v4 = v1.PureComponent:extend("PermissionButton");
v4.validateProps = v2.strictInterface({
    callback = v2.callback, 
    image = v2.table, 
    LayoutOrder = v2.number, 
    useNewMenuTheme = v2.boolean, 
    imageLabelProps = v2.optional(v2.table)
});
v4.render = function(v5)
    return v1.createElement("ImageButton", {
        LayoutOrder = v5.props.LayoutOrder, 
        Image = not v5.props.useNewMenuTheme and "rbxasset://textures/ui/dialog_white.png" or "rbxasset://textures/ui/TopBar/iconBase.png", 
        ImageTransparency = not v5.props.useNewMenuTheme and 0.85 or 0, 
        BackgroundTransparency = 1, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(10, 10, 10, 10), 
        Size = UDim2.new(0, 32, 0, 32)
    }, {
        ImageLabel = v1.createElement(l_ImageSetButton_0, {
            LayoutOrder = 2, 
            Image = v5.props.image, 
            BackgroundTransparency = 1, 
            Size = not not v5.props.imageLabelProps and v5.props.imageLabelProps.Size or UDim2.new(0, 32, 0, 32), 
            Position = v5.props.imageLabelProps and v5.props.imageLabelProps.Position, 
            [v1.Event.Activated] = v5.props.callback
        })
    });
end;
return v4;
