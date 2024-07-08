local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_t_0 = v0.t;
local v3 = l_Roact_0.PureComponent:extend("BarOnTopScrollingFrame");
v3.validateProps = l_t_0.strictInterface({
    Size = l_t_0.UDim2, 
    Position = l_t_0.optional(l_t_0.UDim2), 
    CanvasSize = l_t_0.UDim2, 
    ScrollingEnabled = l_t_0.optional(l_t_0.boolean), 
    [l_Roact_0.Children] = l_t_0.table, 
    onCanvasPositionChanged = l_t_0.optional(l_t_0.callback), 
    scrollingFrameRef = l_t_0.optional(l_t_0.table)
});
v3.defaultProps = {
    ScrollingEnabled = true
};
v3.init = function(v4)
    v4.state = {
        CanvasPosition = Vector2.new(0, 0)
    };
end;
v3.render = function(v5)
    return l_Roact_0.createElement("Frame", {
        Size = v5.props.Size, 
        Position = v5.props.Position, 
        BackgroundTransparency = 1, 
        ClipsDescendants = true
    }, {
        DisplayScrollingFrame = l_Roact_0.createElement("ScrollingFrame", {
            CanvasPosition = v5.state.CanvasPosition, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 8, 1, 0), 
            CanvasSize = v5.props.CanvasSize - UDim2.new(0, 8, 0, 0), 
            ScrollBarThickness = 8, 
            BorderSizePixel = 0, 
            ZIndex = 2, 
            Position = UDim2.new(1, -8, 0, 0), 
            ScrollingEnabled = v5.props.ScrollingEnabled, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            Selectable = false, 
            [l_Roact_0.Ref] = v5.props.scrollingFrameRef, 
            [l_Roact_0.Change.CanvasPosition] = function(v6)
                v5:setState({
                    CanvasPosition = v6.CanvasPosition
                });
                if v5.props.onCanvasPositionChanged then
                    v5.props.onCanvasPositionChanged(v6);
                end;
            end
        }), 
        ContentsScrollingFrame = l_Roact_0.createElement("ScrollingFrame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -8, 1, 0), 
            CanvasSize = v5.props.CanvasSize - UDim2.new(0, 8, 0, 0), 
            CanvasPosition = v5.state.CanvasPosition, 
            ScrollBarThickness = 0, 
            BorderSizePixel = 0, 
            ClipsDescendants = false, 
            ScrollingEnabled = v5.props.ScrollingEnabled, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            Selectable = false, 
            [l_Roact_0.Change.CanvasPosition] = function(v7)
                v5:setState({
                    CanvasPosition = v7.CanvasPosition
                });
            end
        }, {
            l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 8, 1, 0)
            }, v5.props[l_Roact_0.Children])
        })
    });
end;
return v3;
