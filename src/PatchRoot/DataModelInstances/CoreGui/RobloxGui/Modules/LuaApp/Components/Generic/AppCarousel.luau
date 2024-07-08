local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local l_getFFlagUpdateFriendCarousel10ft_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagUpdateFriendCarousel10ft;
local v3 = v1.PureComponent:extend("AppCarousel");
v3.render = function(v4)
    local l_carouselHeight_0 = v4.props.carouselHeight;
    return v1.createElement("ScrollingFrame", {
        Size = UDim2.new(1, 0, 0, l_carouselHeight_0), 
        ScrollBarThickness = 0, 
        BackgroundTransparency = 1, 
        ClipsDescendants = false, 
        CanvasSize = UDim2.new(0, v4.props.canvasWidth, 0, l_carouselHeight_0), 
        CanvasPosition = v4.props.canvasPosition, 
        ScrollingEnabled = not v4.props.scrollingAnimationActive, 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        ElasticBehavior = Enum.ElasticBehavior.Always, 
        Selectable = if not l_getFFlagUpdateFriendCarousel10ft_0() then nil else false, 
        [v1.Change.CanvasPosition] = v4.props.onChangeCanvasPosition, 
        [v1.Ref] = v4.props.onRefCallback
    }, v4.props.items);
end;
return v3;
