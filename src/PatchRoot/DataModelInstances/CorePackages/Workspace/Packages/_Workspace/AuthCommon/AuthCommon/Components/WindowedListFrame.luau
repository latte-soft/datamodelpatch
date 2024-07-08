local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.ArgCheck);
local l_Graphite_0 = require(l_Parent_0.Style).Colors.Graphite;
local v4 = v1.PureComponent:extend("WindowedListFrame");
v4.init = function(v5)
    v5.state = {
        windowStart = 1, 
        windowSize = 5, 
        topPadding = 0
    };
    v5.updateWindow = function(v6)
        local v7 = v5.props.ButtonSizeY + 1;
        local l_Y_0 = v6.AbsoluteSize.Y;
        local l_Y_1 = v6.CanvasPosition.Y;
        if l_Y_0 > 0 then
            local v10 = math.max(1, math.floor(l_Y_1 / v7) + 1);
            local v11 = math.floor(l_Y_0 / v7) + 2;
            if not (v10 == v5.state.windowStart) or v11 ~= v5.state.windowSize then
                v5:setState({
                    windowStart = v10, 
                    windowSize = v11, 
                    topPadding = v7 * (v10 - 1)
                });
            end;
        end;
    end;
end;
v4.defaultProps = {
    List = {}, 
    ButtonSizeY = 20, 
    ScrollingFrameOffset = 0, 
    ListButtonProps = {}
};
v4.render = function(v12)
    local l_ListButton_0 = v12.props.ListButton;
    local l_ListButtonProps_0 = v12.props.ListButtonProps;
    local l_List_0 = v12.props.List;
    local v16 = #l_List_0;
    local v17 = {
        v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        })
    };
    v2.isInTypes(l_ListButton_0, {
        "function", 
        "table"
    }, "ListButton prop in WindowedListFrame");
    if l_ListButton_0 then
        local l_windowStart_0 = v12.state.windowStart;
        for v19 = l_windowStart_0, math.min(#l_List_0, l_windowStart_0 + v12.state.windowSize) do
            local v20 = l_List_0[v19];
            local v21 = v19 + v19;
            v17[v21] = v1.createElement(l_ListButton_0, {
                Size = UDim2.new(1, 0, 0, v12.props.ButtonSizeY), 
                LayoutOrder = v21, 
                Data = v20, 
                ListButtonProps = l_ListButtonProps_0
            });
            v21 = v21 + 1;
            v17[v21] = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                BackgroundColor3 = l_Graphite_0, 
                LayoutOrder = v21, 
                BorderSizePixel = 0
            });
        end;
    end;
    return v1.createElement("ScrollingFrame", {
        Position = UDim2.new(0, 0, 0, v12.props.ScrollingFrameOffset), 
        Size = UDim2.new(1, 8, 1, -v12.props.ScrollingFrameOffset), 
        ScrollBarThickness = 4, 
        ScrollBarImageColor3 = l_Graphite_0, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        CanvasSize = UDim2.new(0, 0, 0, v16 * (v12.props.ButtonSizeY + 1)), 
        [v1.Change.CanvasPosition] = v12.updateWindow, 
        [v1.Change.AbsoluteSize] = v12.updateWindow
    }, {
        ListHolder = v1.createElement("Frame", {
            Size = UDim2.new(1, -8, 0, 1), 
            Position = UDim2.new(0, 0, 0, v12.state.topPadding), 
            BackgroundTransparency = 1
        }, v17)
    });
end;
return v4;
