local l_Parent_0 = script.Parent;
local l_Responsive_0 = l_Parent_0.Parent.Responsive;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.Roact);
local v5 = require(l_Parent_2.t);
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v7 = require(l_Parent_1.Utility.bind);
local v8 = require(l_Responsive_0.ResponsiveLayoutContext);
local v9 = require(l_Responsive_0.ResponsiveLayoutConfigReader);
local v10 = v4.PureComponent:extend("GridContainer_DEPRECATED");
v10.validateProps = v5.strictInterface({
    config = v5.optional(v5.table), 
    layoutOrder = v5.optional(v5.integer), 
    padding = v5.optional(v5.UDim), 
    [v4.Children] = v5.optional(v5.table)
});
v10.defaultProps = {
    config = {
        columns = 1, 
        margin = 0, 
        gutter = 0
    }
};
v10.init = function(v11)
    v11:setState({
        breakpoint = v9.findBreakpoint(v11.props.config, -1)
    });
    v11.frameRef = v4.createRef();
    v11.updateBreakpoint = v7(v11.updateBreakpoint, v11);
end;
v10.updateBreakpoint = function(v12, v13)
    local l_X_0 = v13.AbsoluteSize.X;
    local l_breakpoint_0 = v12.state.breakpoint;
    if not (l_X_0 >= l_breakpoint_0.min) or l_breakpoint_0.max < l_X_0 then
        local v16 = v9.findBreakpoint(v12.props.config, l_X_0);
        if v16 ~= v12.state.breakpoint then
            v12:setState({
                breakpoint = v16
            });
        end;
    end;
end;
v10.render = function(v17)
    return v4.createElement(v8.Provider, {
        value = {
            config = v17.props.config, 
            breakpoint = v17.state.breakpoint.name
        }
    }, {
        GridContainer_DEPRECATED = v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v17.props.layoutOrder, 
            [v4.Ref] = v17.frameRef, 
            [v4.Change.AbsoluteSize] = v17.updateBreakpoint
        }, l_Object_0.assign({
            _uiblox_grid_layout_ = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = v17.props.padding
            })
        }, v17.props[v4.Children]))
    });
end;
v10.didMount = function(v18)
    v18:updateBreakpoint(v18.frameRef:getValue());
end;
v10.didUpdate = function(v19, v20)
    if v20.config ~= v19.props.config then
        v19:updateBreakpoint(v19.frameRef:getValue());
    end;
end;
return v10;
