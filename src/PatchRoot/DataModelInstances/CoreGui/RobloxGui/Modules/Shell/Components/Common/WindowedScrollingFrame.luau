local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Shell.Utility);
local v3 = require(l_Modules_0.Common.Roact);
local v4 = v3.PureComponent:extend("WindowedScrollingFrame");
local function v7(v5, v6)
    return Vector2.new(math.max(0, (math.min(v6.X, v5.CanvasSize.X.Offset - v5.AbsoluteWindowSize.X))), (math.max(0, (math.min(v6.Y, v5.CanvasSize.Y.Offset - v5.AbsoluteWindowSize.Y)))));
end;
v4.init = function(v8)
    v8.state = {
        viewStart = 0, 
        viewSize = 0, 
        paddingStart = 0
    };
    v8.scrollingFrameRef = function(v9)
        v8.scrollingFrame = v9;
    end;
end;
v4.onSelectionChanged = function(v10, v11)
    if v10.scrollingFrame then
        if (v11 ~= nil and v11 ~= v10.savedSelectedObject) and v11:IsDescendantOf(v10.scrollingFrame) then
            v10.savedSelectedObject = v11;
            local l_scrollingFrame_0 = v10.scrollingFrame;
            local v13 = v10.props.scrollingDirection or Enum.ScrollingDirection.Y;
            local l_AbsoluteWindowSize_0 = l_scrollingFrame_0.AbsoluteWindowSize;
            local l_CanvasPosition_0 = l_scrollingFrame_0.CanvasPosition;
            local v16 = "X";
            if v13 == Enum.ScrollingDirection.Y then
                v16 = "Y";
            end;
            if l_AbsoluteWindowSize_0[v16] == 0 then
                return ;
            else
                local v17 = v10.props.itemOffsetStart or 0;
                local v18 = v10.props.itemOffsetEnd or 0;
                local v19 = v10.props.customScrollDist or {};
                local v20 = nil;
                local v21 = nil;
                if v13 == Enum.ScrollingDirection.Y then
                    local v22 = v11.AbsolutePosition.Y - l_scrollingFrame_0.AbsolutePosition.Y;
                    local l_Y_0 = (((l_scrollingFrame_0.AbsolutePosition + l_scrollingFrame_0.AbsoluteWindowSize) - v11.AbsolutePosition) - v11.AbsoluteSize).Y;
                    if v22 < (v19.Top or v17) then
                        if v22 < 0 then
                            v20 = Vector2.new(l_CanvasPosition_0.X, l_CanvasPosition_0.Y + v22);
                        end;
                        v21 = Vector2.new(l_CanvasPosition_0.X, l_CanvasPosition_0.Y - (v17 - v22));
                    elseif l_Y_0 < (v19.Bottom or v18) then
                        if l_Y_0 < 0 then
                            v20 = Vector2.new(l_CanvasPosition_0.X, l_CanvasPosition_0.Y - l_Y_0);
                        end;
                        v21 = Vector2.new(l_CanvasPosition_0.X, (l_CanvasPosition_0.Y + v18) - l_Y_0);
                    end;
                elseif v13 == Enum.ScrollingDirection.X then
                    local v24 = v11.AbsolutePosition.X - l_scrollingFrame_0.AbsolutePosition.X;
                    local l_X_0 = (((l_scrollingFrame_0.AbsolutePosition + l_scrollingFrame_0.AbsoluteWindowSize) - v11.AbsolutePosition) - v11.AbsoluteSize).X;
                    if v24 < (v19.Left or v17) then
                        if v24 < 0 then
                            v20 = Vector2.new(l_CanvasPosition_0.X + v24, l_CanvasPosition_0.Y);
                        end;
                        v21 = Vector2.new(l_CanvasPosition_0.X - (v17 - v24), l_CanvasPosition_0.Y);
                    elseif l_X_0 < (v19.Right or v18) then
                        if l_X_0 < 0 then
                            v20 = Vector2.new(l_CanvasPosition_0.X - l_X_0, l_CanvasPosition_0.Y);
                        end;
                        v21 = Vector2.new((l_CanvasPosition_0.X + v18) - l_X_0, l_CanvasPosition_0.Y);
                    end;
                end;
                if v20 then
                    v20 = v7(l_scrollingFrame_0, v20);
                    v2.PropertyTweener(l_scrollingFrame_0, "CanvasPosition", v20, v20, 0, v2.EaseOutQuad, true, function()
                        if v21 then
                            v21 = v7(l_scrollingFrame_0, v21);
                            v2.PropertyTweener(l_scrollingFrame_0, "CanvasPosition", v20, v21, 0.2, v2.EaseOutQuad, true);
                        end;
                    end);
                end;
                if not (v20 or not v21) then
                    v21 = v7(l_scrollingFrame_0, v21);
                    v2.PropertyTweener(l_scrollingFrame_0, "CanvasPosition", l_CanvasPosition_0, v21, 0.2, v2.EaseOutQuad, true);
                end;
                return ;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v4.updateViewBounds = function(v26)
    if v26.scrollingFrame then
        local l_scrollingFrame_1 = v26.scrollingFrame;
        local l_itemSize_0 = v26.props.itemSize;
        local v29 = v26.props.itemsPaddingOffset or 0;
        local v30 = v26.props.scrollingDirection or Enum.ScrollingDirection.Y;
        local l_AbsoluteWindowSize_1 = l_scrollingFrame_1.AbsoluteWindowSize;
        local l_CanvasPosition_1 = l_scrollingFrame_1.CanvasPosition;
        local v33 = "X";
        if v30 == Enum.ScrollingDirection.Y then
            v33 = "Y";
        end;
        if l_AbsoluteWindowSize_1[v33] == 0 then
            return ;
        else
            l_CanvasPosition_1 = v7(l_scrollingFrame_1, l_CanvasPosition_1);
            local v34 = l_itemSize_0[v33] + v29;
            local v35 = math.ceil(l_AbsoluteWindowSize_1[v33] / v34) + 1;
            local v36 = math.floor(l_CanvasPosition_1[v33] / v34);
            local v37 = math.max(0, (v36 - 1) * v34);
            local v38 = true;
            if v35 == v26.state.viewSize then
                v38 = true;
                if v36 == v26.state.viewStart then
                    v38 = v37 ~= v26.state.paddingStart;
                end;
            end;
            if v38 then
                v26:setState({
                    viewStart = v36, 
                    viewSize = v35, 
                    paddingStart = v37
                });
            end;
            return ;
        end;
    else
        return ;
    end;
end;
v4.render = function(v39)
    local l_items_0 = v39.props.items;
    local l_generateKey_0 = v39.props.generateKey;
    local l_renderItem_0 = v39.props.renderItem;
    local l_itemSize_1 = v39.props.itemSize;
    local v44 = v39.props.itemsPaddingOffset or 0;
    local v45 = v39.props.scrollingDirection or Enum.ScrollingDirection.Y;
    assert(v45 ~= Enum.ScrollingDirection.XY, "Can't set ScrollingDirection as XY.");
    local v46 = {
        UIListLayout = v3.createElement("UIListLayout", {
            Padding = UDim.new(0, v44), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = v45 == Enum.ScrollingDirection.Y and Enum.FillDirection.Vertical or Enum.FillDirection.Horizontal
        })
    };
    if v45 == Enum.ScrollingDirection.Y then
        v46.UIPadding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v39.state.paddingStart)
        });
    elseif v45 == Enum.ScrollingDirection.X then
        v46.UIPadding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v39.state.paddingStart)
        });
    end;
    for v47 = math.max(1, v39.state.viewStart), math.min(#l_items_0, v39.state.viewStart + v39.state.viewSize) do
        v46[not not l_generateKey_0 and l_generateKey_0(v47) or v47] = l_renderItem_0(l_items_0[v47], v47);
    end;
    local v48 = v39.props.scrollingFrameProps or {};
    local v49 = nil;
    if v45 == Enum.ScrollingDirection.Y then
        v49 = UDim2.new(1, 0, 0, #l_items_0 * l_itemSize_1.Y + (#l_items_0 - 1) * v44);
    elseif v45 == Enum.ScrollingDirection.X then
        v49 = UDim2.new(0, #l_items_0 * l_itemSize_1.X + (#l_items_0 - 1) * v44, 1, 0);
    end;
    return v3.createElement("ScrollingFrame", {
        Size = UDim2.new(1, 0, 1, 0), 
        ScrollingEnabled = false, 
        CanvasSize = v49, 
        Selectable = v48.selectable or false, 
        ScrollBarThickness = 0, 
        ClipsDescendants = v48.clipsDescendants, 
        BackgroundTransparency = 1, 
        ScrollingDirection = v45, 
        [v3.Ref] = v39.scrollingFrameRef, 
        [v3.Change.CanvasPosition] = function()
            v39:updateViewBounds();
        end, 
        [v3.Change.AbsoluteSize] = function()
            v39:updateViewBounds();
        end
    }, v46);
end;
v4.didMount = function(v50)
    v50:updateViewBounds();
end;
v4.didUpdate = function(v51, v52, _)
    if v52.inFocus or not v51.props.inFocus then
        if not (not v52.inFocus or v51.props.inFocus) then
            v2.DisconnectEvent(v51.conn);
        end;
    else
        v51.conn = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):connect(function()
            v51:onSelectionChanged(l_GuiService_0.SelectedCoreObject);
        end);
    end;
    if v51.props ~= v52 then
        v51:updateViewBounds();
    end;
end;
return v4;
