local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local v4 = l_Roact_0.PureComponent:extend("AppCarousel");
local v5 = require(l_script_FirstAncestor_0.Flags.isSocialTabAutoSizedCarouselAndTileEnabled2);
v4.defaultProps = {
    carouselHeight = 100, 
    canvasWidth = 100, 
    items = {}, 
    onChangeCanvasPosition = function()
    end, 
    onRefCallback = nil
};
v4.validateProps = l_t_0.interface({
    carouselHeight = l_t_0.optional(l_t_0.number), 
    canvasWidth = l_t_0.optional(l_t_0.number), 
    items = l_t_0.optional(l_t_0.table), 
    onChangeCanvasPosition = l_t_0.optional(l_t_0.callback)
});
v4.render = function(v6)
    return l_Roact_0.createElement("ScrollingFrame", {
        AutomaticSize = not not v5() and Enum.AutomaticSize.Y or Enum.AutomaticSize.None, 
        Size = UDim2.new(1, 0, 0, v6.props.carouselHeight), 
        ScrollBarThickness = 0, 
        BackgroundTransparency = 1, 
        ClipsDescendants = false, 
        CanvasSize = UDim2.new(0, v6.props.canvasWidth, 0, v6.props.carouselHeight), 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        ElasticBehavior = Enum.ElasticBehavior.Always, 
        [l_Roact_0.Change.CanvasPosition] = v6.props.onChangeCanvasPosition, 
        [l_Roact_0.Ref] = v6.props.onRefCallback or l_Roact_0.createRef()
    }, v6.props.items);
end;
return v4;
