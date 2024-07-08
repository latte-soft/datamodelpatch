local l_CorePackages_0 = game:GetService("CorePackages");
local l_TweenService_0 = game:GetService("TweenService");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(script.Parent.Parent.Parent.Components.HeaderButton);
local v4 = require(script.Parent.MemoryViewEntry);
local v5 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v5.GeneralFormatting.LineWidth;
local l_LineColor_0 = v5.GeneralFormatting.LineColor;
local l_ChartHeaderNames_0 = v5.MemoryFormatting.ChartHeaderNames;
local l_HeaderFrameHeight_0 = v5.GeneralFormatting.HeaderFrameHeight;
local l_ValueCellWidth_0 = v5.MemoryFormatting.ValueCellWidth;
local l_CellPadding_0 = v5.MemoryFormatting.CellPadding;
local l_ValuePadding_0 = v5.MemoryFormatting.ValuePadding;
local l_EntryFrameHeight_0 = v5.GeneralFormatting.EntryFrameHeight;
local l_LineGraphHeight_0 = v5.GeneralFormatting.LineGraphHeight;
local l_NoResultSearchStr_0 = v5.GeneralFormatting.NoResultSearchStr;
local v16 = game:DefineFastFlag("DevConsoleMemorySort", false);
local v17 = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0);
local v18 = v2.Component:extend("MemoryView");
local function v20(v19)
    return v19.time;
end;
local function v22(v21)
    return v21.data;
end;
local function v24(v23)
    return string.format("%.3f", v23);
end;
v18.init = function(v25, v26)
    v25.getOnButtonPress = function(v27, v28)
        return function(_, _)
            if not (not (v25.state.expandIndex ~= v27) or not v27) then
                local l_current_0 = v25.scrollingRef.current;
                if l_current_0 then
                    l_TweenService_0:Create(l_current_0, v17, {
                        CanvasPosition = Vector2.new(0, (v28 - 2.4) * l_EntryFrameHeight_0)
                    }):Play();
                end;
            end;
            local l_v25_0 = v25;
            local v33 = {};
            local v34 = false;
            if v25.state.expandIndex ~= v27 then
                v34 = v27;
            end;
            v33.expandIndex = v34;
            l_v25_0:setState(v33);
        end;
    end;
    v25.onSortChanged = function(v35)
        if v35 == v26.targetMemoryData:getSortType() then
            if v16 then
                v26.targetMemoryData:setSortType(v35);
            end;
            v25:setState({
                reverseSort = not v25.state.reverseSort
            });
            return ;
        else
            v26.targetMemoryData:setSortType(v35);
            v25:setState({
                reverseSort = false
            });
            return ;
        end;
    end;
    v25.onCanvasPosChanged = function()
        local l_CanvasPosition_0 = v25.scrollingRef.current.CanvasPosition;
        if v25.state.canvasPos ~= l_CanvasPosition_0 then
            v25:setState({
                absScrollSize = v25.scrollingRef.current.AbsoluteSize, 
                canvasPos = l_CanvasPosition_0
            });
        end;
    end;
    v25.scrollingRef = v2.createRef();
    v25.state = {
        memoryData = v26.targetMemoryData:getMemoryData(), 
        reverseSort = false, 
        expandIndex = false
    };
end;
v18.willUpdate = function(v37)
    if v37.canvasPosConnector then
        v37.canvasPosConnector:Disconnect();
    end;
end;
v18.didUpdate = function(v38)
    if v38.scrollingRef.current then
        v38.canvasPosConnector = v38.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v38.onCanvasPosChanged);
    end;
end;
v18.didMount = function(v39)
    v39.treeViewItemConnector = v39.props.targetMemoryData:treeUpdatedSignal():Connect(function(v40)
        v39:setState({
            memoryData = v40
        });
    end);
    if v39.scrollingRef.current then
        v39.canvasPosConnector = v39.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v39.onCanvasPosChanged);
        v39:setState({
            absScrollSize = v39.scrollingRef.current.AbsoluteSize, 
            canvasPos = v39.scrollingRef.current.CanvasPosition
        });
    end;
end;
v18.willUnmount = function(v41)
    v41.treeViewItemConnector:Disconnect();
end;
v18.appendAdditionTabInformation = function(v42, v43, v44, v45, v46, v47)
    local l_CanvasPosition_1 = v42.scrollingRef.current.CanvasPosition;
    local l_AbsoluteSize_0 = v42.scrollingRef.current.AbsoluteSize;
    for _, v51 in ipairs(v44) do
        local l_name_0 = v51.name;
        local l_value_0 = v51.value;
        local v54 = v45 .. l_name_0;
        v47.layoutOrder = v47.layoutOrder + 1;
        if l_CanvasPosition_1.Y <= v47.scrollingFrameHeight + l_EntryFrameHeight_0 and v47.usedFrameSpace < l_AbsoluteSize_0.Y then
            v43[v45 .. l_name_0] = v2.createElement(v4, {
                size = UDim2.new(1, 0, 0, l_EntryFrameHeight_0), 
                depth = v46, 
                name = l_name_0, 
                showGraph = false, 
                value = l_value_0, 
                formatValueStr = v24, 
                layoutOrder = v47.layoutOrder
            });
            if v47.paddingHeight < 0 then
                v47.paddingHeight = v47.scrollingFrameHeight;
            else
                v47.usedFrameSpace = v47.usedFrameSpace + l_EntryFrameHeight_0;
            end;
        end;
        v47.scrollingFrameHeight = v47.scrollingFrameHeight + l_EntryFrameHeight_0;
        if v51.moreInfo and type(v51.moreInfo) == "table" then
            v42:appendAdditionTabInformation(v43, v51.moreInfo, v54, v46 + 1, v47);
        end;
    end;
end;
v18.recursiveConstructEntries = function(v55, v56, v57, v58, v59)
    assert(v55.scrollingRef.current, "ScrollingFrame not initialized yet");
    local l_expandIndex_0 = v55.state.expandIndex;
    local v61 = v55.props.searchTerm or "";
    local l_reverseSort_0 = v55.state.reverseSort;
    local l_CanvasPosition_2 = v55.scrollingRef.current.CanvasPosition;
    local l_AbsoluteSize_1 = v55.scrollingRef.current.AbsoluteSize;
    local l_name_1 = v57.name;
    if string.find(l_name_1:lower(), v61:lower()) then
        local v66 = l_expandIndex_0 == l_name_1;
        local v67 = not not v66 and l_EntryFrameHeight_0 + l_LineGraphHeight_0 or l_EntryFrameHeight_0;
        v59.layoutOrder = v59.layoutOrder + 1;
        if l_CanvasPosition_2.Y <= v59.scrollingFrameHeight + v67 and v59.usedFrameSpace < l_AbsoluteSize_1.Y then
            v56[l_name_1] = v2.createElement(v4, {
                size = UDim2.new(1, 0, 0, v67), 
                depth = v58, 
                name = v57.name, 
                showGraph = v66, 
                dataStats = v57.dataStats, 
                onButtonPress = v55.getOnButtonPress(l_name_1, v59.layoutOrder), 
                formatValueStr = v24, 
                getX = v20, 
                getY = v22, 
                layoutOrder = v59.layoutOrder
            });
            if v59.paddingHeight < 0 then
                v59.paddingHeight = v59.scrollingFrameHeight;
            else
                v59.usedFrameSpace = v59.usedFrameSpace + v67;
            end;
        end;
        v59.scrollingFrameHeight = v59.scrollingFrameHeight + v67;
        if not (not v66 or not v57.dataStats.additionalInfoFunc) then
            v55:appendAdditionTabInformation(v56, v57.dataStats.additionalInfoFunc(), v57.name, v58 + 1, v59);
        end;
    end;
    local l_sortedChildren_0 = v57.dataStats.sortedChildren;
    if l_sortedChildren_0 then
        if not l_reverseSort_0 then
            for _, v70 in ipairs(l_sortedChildren_0) do
                v55:recursiveConstructEntries(v56, v70, v58 + 1, v59);
            end;
        else
            local v71 = #l_sortedChildren_0;
            for v72 = 1, v71 do
                v55:recursiveConstructEntries(v56, l_sortedChildren_0[(v71 - v72) + 1], v58 + 1, v59);
            end;
            return ;
        end;
    end;
end;
v18.render = function(v73)
    local v74 = {};
    local l_layoutOrder_0 = v73.props.layoutOrder;
    local l_size_0 = v73.props.size;
    local v77 = v73.props.searchTerm or "";
    local v78 = {
        scrollingFrameHeight = 0, 
        paddingHeight = -1, 
        usedFrameSpace = 0, 
        layoutOrder = 1
    };
    if v73.scrollingRef.current then
        for _, v80 in ipairs(v73.state.memoryData) do
            v73:recursiveConstructEntries(v74, v80, 0, v78);
        end;
        v74.UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder
        });
        v74.WindowingPadding = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v78.paddingHeight), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        });
    end;
    if v78.layoutOrder == 1 then
        if v77 == "" then
            v74.noDataMessage = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                Text = "Awaiting Memory Stats", 
                TextColor3 = v5.Color.Text, 
                BackgroundTransparency = 1, 
                LayoutOrder = l_layoutOrder_0
            });
        else
            v74.noDataMessage = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                Text = string.format(l_NoResultSearchStr_0, v77), 
                TextColor3 = v5.Color.Text, 
                BackgroundTransparency = 1, 
                LayoutOrder = l_layoutOrder_0
            });
        end;
    end;
    return v2.createElement("Frame", {
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, {
        Header = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_HeaderFrameHeight_0), 
            BackgroundTransparency = 1
        }, {
            Name = v2.createElement(v3, {
                text = l_ChartHeaderNames_0[1], 
                size = UDim2.new(1 - l_ValueCellWidth_0, -l_ValuePadding_0 - l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
                pos = UDim2.new(0, l_CellPadding_0, 0, 0), 
                sortfunction = v73.onSortChanged
            }), 
            ValueMB = v2.createElement(v3, {
                text = l_ChartHeaderNames_0[2], 
                size = UDim2.new(l_ValueCellWidth_0, -l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
                pos = UDim2.new(1 - l_ValueCellWidth_0, l_ValuePadding_0, 0, 0), 
                sortfunction = v73.onSortChanged
            }), 
            TopHorizontal = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            }), 
            LowerHorizontal = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
                Position = UDim2.new(0, 0, 1, 0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            }), 
            vertical = v2.createElement("Frame", {
                Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
                Position = UDim2.new(1 - l_ValueCellWidth_0, 0, 0, 0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            })
        }), 
        Entries = v2.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, -l_HeaderFrameHeight_0), 
            Position = UDim2.new(0, 0, 0, l_HeaderFrameHeight_0), 
            BackgroundTransparency = 1, 
            VerticalScrollBarInset = 1, 
            ScrollBarThickness = 5, 
            CanvasSize = UDim2.new(1, 0, 0, v78.scrollingFrameHeight), 
            [v2.Ref] = v73.scrollingRef
        }, v74)
    });
end;
return v18;
