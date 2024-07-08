local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = v1.PureComponent:extend("DismissMenuBackground");
v4.validateProps = v3.strictInterface({
    Visible = v3.union(v3.boolean, v3.table), 
    ZIndex = v3.number, 
    onDismiss = v3.callback, 
    screenSize = v3.Vector2
});
v4.defaultProps = {
    ZIndex = 1
};
v4.render = function(v5)
    return v1.createElement("TextButton", {
        BackgroundTransparency = 1, 
        Text = "", 
        Visible = v5.props.Visible, 
        ZIndex = v5.props.ZIndex, 
        Size = UDim2.fromOffset(v5.props.screenSize.X, v5.props.screenSize.Y), 
        Position = UDim2.fromOffset(0, -13), 
        [v1.Event.Activated] = v5.props.onDismiss
    });
end;
return (v2.connect(function(v6, _)
    return {
        screenSize = v6.ScreenSize
    };
end, nil)(v4));
