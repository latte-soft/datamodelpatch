local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_0.HorizontalNav.ArrowNav);
local v6 = require(l_Parent_0.HorizontalNav.NavigationDirection);
local v7 = require(l_Parent_1.ImageSet.Images);
local v8 = v7["icons/actions/cycleLeft"];
local v9 = v7["icons/actions/cycleRight"];
local v10 = v3.PureComponent:extend("ArrowFrame");
v10.validateProps = v4.strictInterface({
    ZIndex = v4.optional(v4.number), 
    isVisibleLeft = v4.optional(v4.union(v4.boolean, v4.table)), 
    isVisibleRight = v4.optional(v4.union(v4.boolean, v4.table)), 
    onPressHoldInputBegan = v4.optional(v4.callback), 
    onPressHoldInputEnded = v4.optional(v4.callback), 
    defaultUseProps = v4.optional(v4.strictInterface({
        scrollingFrameRef = v4.table, 
        buttonRefs = v4.optional(v4.table), 
        buttonWidth = v4.optional(v4.number), 
        padOutsideEdges = v4.optional(v4.boolean), 
        numButtons = v4.optional(v4.number), 
        buttonPadding = v4.number, 
        updateCanvasPosition = v4.callback
    }))
});
v10.defaultProps = {
    ZIndex = 1, 
    isVisibleRight = true, 
    isVisibleLeft = true
};
v10.init = function(v11)
    v11.state = {
        isHovered = false
    };
    v11.onMouseEnter = function()
        v11:setState({
            isHovered = true
        });
    end;
    v11.onMouseLeave = function()
        v11:setState({
            isHovered = false
        });
    end;
end;
v10.render = function(v12)
    local l_isVisibleLeft_0 = v12.props.isVisibleLeft;
    local l_isVisibleRight_0 = v12.props.isVisibleRight;
    local l_defaultUseProps_0 = v12.props.defaultUseProps;
    local l_onPressHoldInputBegan_0 = v12.props.onPressHoldInputBegan;
    local l_onPressHoldInputEnded_0 = v12.props.onPressHoldInputEnded;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        ZIndex = v12.props.ZIndex, 
        [v3.Event.MouseEnter] = v12.onMouseEnter, 
        [v3.Event.MouseLeave] = v12.onMouseLeave
    }, {
        ArrowLeft = v3.createElement(v5, {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, -6, 0.5, 0), 
            Image = v8, 
            Visible = v12.state.isHovered and l_isVisibleLeft_0, 
            navDirection = v6.IsLeft, 
            defaultUseProps = l_defaultUseProps_0, 
            onPressHoldInputBegan = l_onPressHoldInputBegan_0, 
            onPressHoldInputEnded = l_onPressHoldInputEnded_0
        }), 
        ArrowRight = v3.createElement(v5, {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(1, -30, 0.5, 0), 
            Image = v9, 
            Visible = v12.state.isHovered and l_isVisibleRight_0, 
            navDirection = v6.IsRight, 
            defaultUseProps = l_defaultUseProps_0, 
            onPressHoldInputBegan = l_onPressHoldInputBegan_0, 
            onPressHoldInputEnded = l_onPressHoldInputEnded_0
        })
    });
end;
return v10;
