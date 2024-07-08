local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.Roact);
local v3 = nil;
local l_status_0, l_result_0 = pcall(function()
    return game:GetEngineFeature("TextBoundsRoundUp");
end);
v3 = l_status_0 and l_result_0;
l_status_0 = game:GetService("TextService");
l_result_0 = function(v6, v7, v8, v9)
    if not v3 then
        return l_status_0:GetTextSize(v6, v7, v8, Vector2.new(v9, 10000)).Y + 2;
    else
        return l_status_0:GetTextSize(v6, v7, v8, Vector2.new(v9, 10000)).Y;
    end;
end;
local function v13(v10, v11, v12)
    if not v3 then
        return l_status_0:GetTextSize(v10, v11, v12, Vector2.new(10000, 10000)).X + 2;
    else
        return l_status_0:GetTextSize(v10, v11, v12, Vector2.new(10000, 10000)).X;
    end;
end;
local v14 = {
    FitToText = {}
};
local v15 = v2.PureComponent:extend("FitTextLabel");
v15.defaultProps = {
    Font = Enum.Font.SourceSans, 
    Text = "Label", 
    TextSize = 12, 
    TextWrapped = true, 
    maximumWidth = math.huge
};
v15.init = function(v16)
    if v2.Ref == "ref" then
        v16.frameRef = v16.props.forwardedRef or v2.createRef();
    else
        v16.frameRef = v16.props[v2.Ref] or v2.createRef();
    end;
    v16.onResize = function()
        if v16.frameRef.current then
            v16.frameRef.current.Size = v16:__getSize(v16.frameRef.current);
            return ;
        else
            return ;
        end;
    end;
end;
v15.render = function(v17)
    return v2.createElement(not v17.props.onActivated and "TextLabel" or "TextButton", v17:__getFilteredProps());
end;
v15.didMount = function(v18)
    v18.onResize();
end;
v15.didUpdate = function(v19)
    v19.onResize();
end;
v15.__getFilteredProps = function(v20)
    local v21 = {
        width = v1.None, 
        maximumWidth = v1.None, 
        onActivated = v1.None, 
        forwardedRef = v1.None, 
        Size = UDim2.new(v20.props.width, UDim.new(0, 0)), 
        [v2.Ref] = v20.frameRef
    };
    local l_Children_0 = v2.Children;
    local l_join_0 = v1.Dictionary.join;
    local v24 = v20.props[v2.Children] or {};
    local v25 = {};
    local v26 = false;
    if v20.props.maximumWidth < math.huge then
        v26 = v2.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(v20.props.maximumWidth, math.huge)
        });
    end;
    v25.sizeConstraint = v26;
    v21[l_Children_0] = l_join_0(v24, v25);
    v21[v2.Event.Activated] = v20.props.onActivated;
    v21[v2.Change.AbsoluteSize] = function(v27)
        if v20.props[v2.Change.AbsoluteSize] then
            v20.props[v2.Change.AbsoluteSize](v27);
        end;
        v20.onResize();
    end;
    return v1.Dictionary.join(v20.props, v21);
end;
v15.__getSize = function(v28, v29)
    local l_maximumWidth_0 = v28.props.maximumWidth;
    local l_width_0 = v28.props.width;
    if l_width_0 == v14.FitToText then
        l_width_0 = UDim.new(0, (math.min(v13(v28.props.Text, v28.props.TextSize, v28.props.Font), l_maximumWidth_0)));
    end;
    return UDim2.new(l_width_0, UDim.new(0, (l_result_0(v28.props.Text, v28.props.TextSize, v28.props.Font, (math.max(l_maximumWidth_0 < math.huge and l_maximumWidth_0 or 0, v29.AbsoluteSize.X))))));
end;
local v32 = nil;
v32 = if v2.Ref == "ref" then v2.forwardRef(function(v33, v34)
    return v2.createElement(v15, v1.Dictionary.join(v33, {
        forwardedRef = v34
    }));
end) else v15;
v32.Width = v14;
return v32;
