local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.t);
local v4 = require(script.Parent.getPageMargin);
local v5 = v2.Component:extend("PageMargin");
v5.validateProps = v3.interface({
    anchorPoint = v3.optional(v3.Vector2), 
    position = v3.optional(v3.UDim2), 
    backgroundColor3 = v3.optional(v3.Color3), 
    backgroundTransparency = v3.optional(v3.number), 
    layoutOrder = v3.optional(v3.number), 
    size = v3.optional(v3.UDim2), 
    useAutomaticSizing = v3.optional(v3.boolean), 
    zIndex = v3.optional(v3.number)
});
v5.defaultProps = {
    anchorPoint = Vector2.new(0, 0), 
    position = UDim2.new(), 
    size = UDim2.fromScale(1, 1), 
    backgroundTransparency = 0, 
    layoutOrder = 0, 
    useAutomaticSizing = false
};
v5.init = function(v6)
    v6.state = {};
    v6.ref = v2.createRef();
    v6.onResize = function(v7)
        if v6.mounted then
            local l_X_0 = v7.AbsoluteSize.X;
            v6:setState(function(v9)
                local v10 = v4(l_X_0);
                if v9.margin ~= v10 then
                    return {
                        margin = v10
                    };
                else
                    return nil;
                end;
            end);
        end;
    end;
end;
v5.render = function(v11)
    return v2.createElement("Frame", {
        AnchorPoint = v11.props.anchorPoint, 
        AutomaticSize = not not v11.props.useAutomaticSizing and Enum.AutomaticSize.Y or Enum.AutomaticSize.None, 
        BackgroundColor3 = v11.props.backgroundColor3, 
        BackgroundTransparency = v11.props.backgroundTransparency, 
        BorderSizePixel = 0, 
        Position = v11.props.position, 
        Size = v11.props.size, 
        [v2.Change.AbsoluteSize] = v11.onResize, 
        [v2.Ref] = v11.ref, 
        LayoutOrder = v11.props.layoutOrder, 
        ZIndex = v11.props.zIndex
    }, v1.Dictionary.join(v11.props[v2.Children], {
        padding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v11.state.margin), 
            PaddingRight = UDim.new(0, v11.state.margin)
        })
    }));
end;
v5.didMount = function(v12)
    v12.mounted = true;
    if v12.ref.current then
        v12.onResize(v12.ref.current);
    end;
end;
v5.willUnmount = function(v13)
    v13.mounted = false;
end;
return v5;
