local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_Modules_0.LuaApp.FitChildren);
local v4 = v2.PureComponent:extend("MorePageScrollingFrame");
v4.defaultProps = {
    maxWidth = math.huge
};
v4.render = function(v5)
    return v2.createElement(v3.FitScrollingFrame, {
        Position = v5.props.Position, 
        Size = v5.props.Size, 
        CanvasSize = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ScrollBarThickness = 0, 
        ElasticBehavior = Enum.ElasticBehavior.Always, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        fitFields = {
            CanvasSize = v3.FitAxis.Height
        }
    }, {
        v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            UISizeConstraint = v2.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v5.props.maxWidth, math.huge)
            }); 
            v2.createFragment(v5.props[v2.Children])
        })
    });
end;
return v4;
