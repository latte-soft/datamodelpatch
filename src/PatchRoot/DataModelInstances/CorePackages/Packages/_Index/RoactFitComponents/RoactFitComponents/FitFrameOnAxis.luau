local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Cryo);
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_0.isRoact17);
local v5 = require(l_Parent_0.Rect);
local v6 = {
    Horizontal = {}, 
    Vertical = {}, 
    Both = {}
};
local v7 = v3.PureComponent:extend("FitFrameOnAxis");
v7.defaultProps = {
    axis = v6.Vertical, 
    minimumSize = UDim2.new(UDim.new(0, 0), UDim.new(0, 0)), 
    margin = v5.square(0), 
    FillDirection = Enum.FillDirection.Vertical, 
    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
    ImageSet = {}, 
    VerticalAlignment = Enum.VerticalAlignment.Top, 
    contentPadding = UDim.new(0, 0), 
    textProps = nil
};
v7.init = function(v8)
    v8.layoutRef = v3.createRef();
    if not v4() then
        v8.frameRef = v8.props[v3.Ref] or v3.createRef();
    else
        v8.frameRef = v8.props.forwardedRef or v3.createRef();
    end;
    v8.onResize = function()
        local l_current_0 = v8.layoutRef.current;
        local l_current_1 = v8.frameRef.current;
        if l_current_1 and l_current_0 then
            l_current_1.Size = v8:__getSize(l_current_0);
            return ;
        else
            return ;
        end;
    end;
end;
v7.render = function(v11)
    assert(v11.props.Size == nil, "Size is not a valid property of FitFrameOnAxis. Did you mean `minimumSize`?");
    local v12 = v11.props[v3.Children] or {};
    local v13 = v11:__getFilteredProps();
    local v14 = not v11.props.onActivated and "ImageLabel" or "ImageButton";
    v12 = v2.Dictionary.join(v12, {
        ["$layout"] = v3.createElement("UIListLayout", {
            FillDirection = v11.props.FillDirection, 
            HorizontalAlignment = v11.props.HorizontalAlignment, 
            Padding = v11.props.contentPadding, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = v11.props.VerticalAlignment, 
            [v3.Change.AbsoluteContentSize] = v11.onResize, 
            [v3.Ref] = v11.layoutRef
        }), 
        ["$margin"] = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v11.props.margin.left), 
            PaddingRight = UDim.new(0, v11.props.margin.right), 
            PaddingTop = UDim.new(0, v11.props.margin.top), 
            PaddingBottom = UDim.new(0, v11.props.margin.bottom)
        })
    });
    if not v11.props.textProps then
        return v3.createElement(v14, v13, v12);
    else
        return v3.createElement(v14, v13, {
            TextLabel = v3.createElement("TextLabel", v2.Dictionary.join(v11.props.textProps, {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            })), 
            ChildFrame = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, v12)
        });
    end;
end;
v7.didMount = function(v15)
    v15.onResize();
end;
v7.didUpdate = function(v16)
    v16.onResize();
end;
v7.__getFilteredProps = function(v17)
    local v18 = v2.Dictionary.join(v17.props.ImageSet, {
        [v3.Ref] = v17.frameRef, 
        [v3.Event.Activated] = v17.props.onActivated
    });
    for v19, _ in pairs(v7.defaultProps) do
        v18[v19] = v2.None;
    end;
    v18.textProps = v2.None;
    return v2.Dictionary.join(v17.props, v18, {
        onActivated = v2.None, 
        forwardedRef = v2.None, 
        [v3.Children] = v2.None
    });
end;
v7.__getSize = function(v21, v22)
    if v21.props.axis == v6.Both then
        return v21:__getBothAxisSize(v22);
    else
        local v23 = v21:__getAxisUDim(v22.AbsoluteContentSize);
        local v24 = v21:__getOtherUDim();
        if v21.props.axis == v6.Vertical then
            return UDim2.new(v24, v23);
        elseif v21.props.axis == v6.Horizontal then
            return UDim2.new(v23, v24);
        else
            return ;
        end;
    end;
end;
v7.__getBothAxisSize = function(v25, v26)
    local l_minimumSize_0 = v25.props.minimumSize;
    local l_AbsoluteContentSize_0 = v26.AbsoluteContentSize;
    return UDim2.new(UDim.new(l_minimumSize_0.X.Scale, l_AbsoluteContentSize_0.X + v25:__getHorizontalMargin()), (UDim.new(l_minimumSize_0.Y.Scale, l_AbsoluteContentSize_0.Y + v25:__getVerticalMargin())));
end;
v7.__getAxisUDim = function(v29, v30)
    local l_minimumSize_1 = v29.props.minimumSize;
    local v32 = nil;
    local v33 = nil;
    if v29.props.axis == v6.Vertical then
        v32 = l_minimumSize_1.Y;
        v33 = v30.Y + v29:__getVerticalMargin();
    elseif v29.props.axis == v6.Horizontal then
        v32 = l_minimumSize_1.X;
        v33 = v30.X + v29:__getHorizontalMargin();
    end;
    return UDim.new(v32.Scale, (math.max(v33, v32.Offset)));
end;
v7.__getVerticalMargin = function(v34)
    return v34.props.margin.top + v34.props.margin.bottom;
end;
v7.__getHorizontalMargin = function(v35)
    return v35.props.margin.left + v35.props.margin.right;
end;
v7.__getOtherUDim = function(v36)
    local l_minimumSize_2 = v36.props.minimumSize;
    if v36.props.axis == v6.Vertical then
        return l_minimumSize_2.X;
    elseif v36.props.axis == v6.Horizontal then
        return l_minimumSize_2.Y;
    else
        return ;
    end;
end;
local v38 = nil;
v38 = if not v4() then v7 else v3.forwardRef(function(v39, v40)
    return v3.createElement(v7, v2.Dictionary.join(v39, {
        forwardedRef = v40
    }));
end);
v38.Axis = v6;
return v38;
