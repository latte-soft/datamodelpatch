local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.Parent.Roact);
local v3 = require(l_Parent_1.Parent.t);
local v4 = require(l_Parent_0.Enum.SlidingDirection);
local v5 = require(l_Parent_1.Utility.SpringAnimatedItem);
local v6 = {
    dampingRatio = 1, 
    frequency = 4
};
local v7 = v2.PureComponent:extend("SlidingContainer");
local v8 = {
    [v4.Up] = UDim2.new(0, 0, 1, 0), 
    [v4.Down] = UDim2.new(0, 0, -1, 0), 
    [v4.Left] = UDim2.new(1, 0, 0, 0), 
    [v4.Right] = UDim2.new(-1, 0, 0, 0)
};
v7.validateProps = v3.strictInterface({
    layoutOrder = v3.optional(v3.integer), 
    onComplete = v3.optional(v3.callback), 
    show = v3.optional(v3.boolean), 
    slidingDirection = v4.isEnumValue, 
    springOptions = v3.optional(v3.table), 
    [v2.Children] = v3.optional(v3.table)
});
v7.defaultProps = {
    springOptions = v6
};
v7.render = function(v9)
    local l_show_0 = v9.props.show;
    local l_slidingDirection_0 = v9.props.slidingDirection;
    return v2.createElement(v5.AnimatedFrame, {
        springOptions = v9.props.springOptions, 
        animatedValues = {
            step = not l_show_0 and 1 or 0
        }, 
        mapValuesToProps = function(v12)
            local v13 = v8[l_slidingDirection_0];
            return {
                Position = UDim2.new(v13.X.Scale * v12.step, 0, v13.Y.Scale * v12.step, 0)
            };
        end, 
        regularProps = {
            BackgroundTransparency = 1, 
            LayoutOrder = v9.props.layoutOrder, 
            Position = not not l_show_0 and v8[l_slidingDirection_0] or UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0)
        }, 
        onComplete = v9.props.onComplete, 
        [v2.Children] = v9.props[v2.Children]
    });
end;
return v7;
