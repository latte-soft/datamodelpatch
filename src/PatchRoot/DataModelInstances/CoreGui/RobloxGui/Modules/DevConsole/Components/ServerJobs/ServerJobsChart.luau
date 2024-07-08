local v0 = require(game:GetService("CorePackages").Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v2 = require(l_Components_0.DataConsumer);
local v3 = require(l_Components_0.HeaderButton);
local v4 = require(l_Components_0.CellLabel);
local v5 = require(l_Components_0.BannerButton);
local v6 = require(l_Components_0.LineGraph);
local v7 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v7.GeneralFormatting.LineWidth;
local l_LineColor_0 = v7.GeneralFormatting.LineColor;
local l_ChartHeaderNames_0 = v7.ServerJobsFormatting.ChartHeaderNames;
local l_ValueCellWidth_0 = v7.ServerJobsFormatting.ValueCellWidth;
local l_EntryFrameHeight_0 = v7.ServerJobsFormatting.EntryFrameHeight;
local l_HeaderFrameHeight_0 = v7.ServerJobsFormatting.HeaderFrameHeight;
local l_CellPadding_0 = v7.ServerJobsFormatting.CellPadding;
local l_MinFrameWidth_0 = v7.ServerJobsFormatting.MinFrameWidth;
local l_LineGraphHeight_0 = v7.GeneralFormatting.LineGraphHeight;
local v17 = require(script.Parent.Parent.Parent.Util.convertTimeStamp);
local v21 = {
    function(v18)
        return not not v18 and string.format("%.4f%%", v18) or "";
    end, 
    function(v19)
        return not not v19 and string.format("%.4f/s", v19) or "";
    end, 
    function(v20)
        return not not v20 and string.format("%.4fms", v20) or "";
    end
};
local l_NoResultSearchStr_0 = v7.GeneralFormatting.NoResultSearchStr;
local v23 = 0;
local v24 = {};
local v25 = {};
local v26 = {};
local v27 = l_EntryFrameHeight_0 - l_LineWidth_0;
for _, v29 in ipairs(l_ValueCellWidth_0) do
    table.insert(v24, UDim2.new(v23, l_CellPadding_0, 0, 0));
    table.insert(v25, UDim2.new(v29, -l_CellPadding_0, 0, l_HeaderFrameHeight_0));
    table.insert(v26, UDim2.new(v29, -l_CellPadding_0, 0, v27));
    v23 = v23 + v29;
end;
local v30 = {};
for v31, v32 in ipairs(v24) do
    v30[v31] = UDim2.new(v32.X.Scale, v32.X.Offset - l_CellPadding_0, v32.Y.Scale, v32.Y.Offset);
end;
local v33 = v0.Component:extend("ServerJobsChart");
local function v35(v34)
    return v34.time;
end;
local function v37(v36)
    return v36.data[1];
end;
local function v39(v38)
    return v38.data[2];
end;
local function v41(v40)
    return v40.data[3];
end;
v33.init = function(v42, v43)
    local v44 = v43.ServerJobsData:getCurrentData();
    v42.getOnButtonPress = function(v45)
        return function(_, _)
            local l_v42_0 = v42;
            local v49 = {};
            local v50 = false;
            if v42.state.expandIndex ~= v45 then
                v50 = v45;
            end;
            v49.expandIndex = v50;
            l_v42_0:setState(v49);
        end;
    end;
    v42.onSortChanged = function(v51)
        if v51 == v43.ServerJobsData:getSortType() then
            v42:setState({
                reverseSort = not v42.state.reverseSort
            });
            return ;
        else
            v43.ServerJobsData:setSortType(v51);
            v42:setState({
                reverseSort = false
            });
            return ;
        end;
    end;
    v42.onCanvasPosChanged = function()
        local l_CanvasPosition_0 = v42.scrollingRef.current.CanvasPosition;
        if v42.state.canvasPos ~= l_CanvasPosition_0 then
            v42:setState({
                canvasPos = l_CanvasPosition_0
            });
        end;
    end;
    v42.scrollingRef = v0.createRef();
    v42.state = {
        serverJobsList = v44, 
        reverseSort = false, 
        expandIndex = nil
    };
end;
v33.willUpdate = function(v53)
    if v53.canvasPosConnector then
        v53.canvasPosConnector:Disconnect();
    end;
end;
v33.didUpdate = function(v54)
    if v54.scrollingRef.current then
        v54.canvasPosConnector = v54.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v54.onCanvasPosChanged);
        local l_AbsoluteSize_0 = v54.scrollingRef.current.AbsoluteSize;
        local l_absScrollSize_0 = v54.state.absScrollSize;
        if not (l_AbsoluteSize_0.X == l_absScrollSize_0.X) or l_AbsoluteSize_0.Y ~= l_absScrollSize_0.Y then
            v54:setState({
                absScrollSize = l_AbsoluteSize_0
            });
        end;
    end;
end;
v33.didMount = function(v57)
    v57.statsConnector = v57.props.ServerJobsData:Signal():Connect(function(v58)
        v57:setState({
            serverJobsList = v58
        });
    end);
    if v57.scrollingRef.current then
        v57.canvasPosConnector = v57.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v57.onCanvasPosChanged);
        v57:setState({
            absScrollSize = v57.scrollingRef.current.AbsoluteSize, 
            canvasPos = v57.scrollingRef.current.CanvasPosition
        });
    end;
end;
v33.willUnmount = function(v59)
    v59.statsConnector:Disconnect();
    v59.statsConnector = nil;
    if v59.canvasPosConnector then
        v59.canvasPosConnector:Disconnect();
        v59.canvasPosConnector = nil;
    end;
end;
v33.render = function(v60)
    local v61 = {};
    local l_searchTerm_0 = v60.props.searchTerm;
    local l_size_0 = v60.props.size;
    local l_layoutOrder_0 = v60.props.layoutOrder;
    local l_serverJobsList_0 = v60.state.serverJobsList;
    local l_reverseSort_0 = v60.state.reverseSort;
    local l_expandIndex_0 = v60.state.expandIndex;
    local l_canvasPos_0 = v60.state.canvasPos;
    local l_absScrollSize_1 = v60.state.absScrollSize;
    local v70 = not not l_absScrollSize_1 and math.max(l_absScrollSize_1.X, l_MinFrameWidth_0) or l_MinFrameWidth_0;
    local v71 = #l_serverJobsList_0;
    if v71 == 0 then
        return v0.createElement("TextLabel", {
            Size = l_size_0, 
            Position = UDim2.new(0, 0, 0, 0), 
            Text = "Awaiting Server Jobs Information", 
            TextColor3 = v7.Color.Text, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0
        });
    else
        local v72 = 0;
        if l_absScrollSize_1 then
            local v73 = -1;
            local v74 = 0;
            for v75, v76 in pairs(l_serverJobsList_0) do
                local l_name_0 = v76.name;
                if not l_searchTerm_0 or string.find(l_name_0:lower(), l_searchTerm_0:lower()) ~= nil then
                    local l_dataStats_0 = v76.dataStats;
                    local v79 = l_dataStats_0.dataSet:back();
                    local v80 = l_expandIndex_0 == l_name_0;
                    local v81 = not not v80 and (l_EntryFrameHeight_0 + (3 * l_LineGraphHeight_0) / 2) + l_CellPadding_0 * 4 or l_EntryFrameHeight_0;
                    if l_canvasPos_0.Y <= v72 + v81 then
                        if v74 < l_absScrollSize_1.Y then
                            local v82 = not not l_reverseSort_0 and v71 - v75 or v75;
                            local v83 = {
                                [l_name_0] = v0.createElement(v4, {
                                    text = l_name_0, 
                                    size = v25[1], 
                                    pos = v24[1]
                                })
                            };
                            for v84, v85 in pairs(v79.data) do
                                v83[l_ChartHeaderNames_0[v84]] = v0.createElement(v4, {
                                    text = v21[v84](v85), 
                                    size = v25[v84 + 1], 
                                    pos = v24[v84 + 1]
                                });
                            end;
                            for v86 = 2, #v30 do
                                v83[string.format("VerticalLine_%d", v86)] = v0.createElement("Frame", {
                                    Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
                                    Position = v30[v86], 
                                    BackgroundColor3 = l_LineColor_0, 
                                    BorderSizePixel = 0
                                });
                            end;
                            v83.lowerHorizontalLine = v0.createElement("Frame", {
                                Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
                                Position = UDim2.new(0, 0, 1, 0), 
                                BackgroundColor3 = l_LineColor_0, 
                                BorderSizePixel = 0
                            });
                            v61[l_name_0] = v0.createElement("Frame", {
                                Size = UDim2.new(0, v70, 0, v81), 
                                BackgroundTransparency = 1, 
                                LayoutOrder = v82 + 1
                            }, {
                                Button = v0.createElement(v5, {
                                    size = UDim2.new(1, 0, 0, l_EntryFrameHeight_0), 
                                    pos = UDim2.new(), 
                                    isExpanded = v80, 
                                    onButtonPress = v60.getOnButtonPress(l_name_0)
                                }, v83), 
                                DutyCycleGraph = v80 and v0.createElement(v6, {
                                    pos = UDim2.new(0, 0, 0, l_EntryFrameHeight_0 + l_CellPadding_0), 
                                    size = UDim2.new(0, v70, 0, l_LineGraphHeight_0 / 2), 
                                    graphData = l_dataStats_0.dataSet, 
                                    maxY = l_dataStats_0.max[1], 
                                    minY = l_dataStats_0.min[1], 
                                    getX = v35, 
                                    getY = v37, 
                                    stringFormatX = v17, 
                                    stringFormatY = v21[1], 
                                    axisLabelX = "Timestamp", 
                                    axisLabelY = l_name_0 .. " " .. l_ChartHeaderNames_0[2]
                                }), 
                                StepsPerSecGraph = v80 and v0.createElement(v6, {
                                    pos = UDim2.new(0, 0, 0, (l_EntryFrameHeight_0 + l_LineGraphHeight_0 / 2) + l_CellPadding_0 * 2), 
                                    size = UDim2.new(0, v70, 0, l_LineGraphHeight_0 / 2), 
                                    graphData = l_dataStats_0.dataSet, 
                                    maxY = l_dataStats_0.max[2], 
                                    minY = l_dataStats_0.min[2], 
                                    getX = v35, 
                                    getY = v39, 
                                    stringFormatX = v17, 
                                    stringFormatY = v21[2], 
                                    axisLabelX = "Timestamp", 
                                    axisLabelY = l_name_0 .. " " .. l_ChartHeaderNames_0[3]
                                }), 
                                StepTimeGraph = v80 and v0.createElement(v6, {
                                    pos = UDim2.new(0, 0, 0, (l_EntryFrameHeight_0 + l_LineGraphHeight_0) + l_CellPadding_0 * 3), 
                                    size = UDim2.new(0, v70, 0, l_LineGraphHeight_0 / 2), 
                                    graphData = l_dataStats_0.dataSet, 
                                    maxY = l_dataStats_0.max[3], 
                                    minY = l_dataStats_0.min[3], 
                                    getX = v35, 
                                    getY = v41, 
                                    stringFormatX = v17, 
                                    stringFormatY = v21[3], 
                                    axisLabelX = "Timestamp", 
                                    axisLabelY = l_name_0 .. " " .. l_ChartHeaderNames_0[4]
                                })
                            });
                        end;
                        if v73 < 0 then
                            v73 = v72;
                        else
                            v74 = v74 + v81;
                        end;
                    end;
                    v72 = v72 + v81;
                end;
            end;
            if v73 == -1 then
                v61.emptyResult = v0.createElement("TextLabel", {
                    Size = l_size_0, 
                    Text = string.format(l_NoResultSearchStr_0, l_searchTerm_0), 
                    TextColor3 = v7.Color.Text, 
                    BackgroundTransparency = 1
                });
            else
                v61.WindowingPadding = v0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v73), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                });
            end;
        end;
        local v87 = {};
        for v88 = 1, #l_ChartHeaderNames_0 do
            v87[l_ChartHeaderNames_0[v88]] = v0.createElement(v3, {
                text = l_ChartHeaderNames_0[v88], 
                size = v25[v88], 
                pos = v24[v88], 
                sortfunction = v60.onSortChanged
            });
        end;
        v87.upperHorizontalLine = v0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        });
        v87.lowerHorizontalLine = v0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
            Position = UDim2.new(0, 0, 1, -l_LineWidth_0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        });
        for v89 = 2, #v30 do
            v87[string.format("VerticalLine_%d", v89)] = v0.createElement("Frame", {
                Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
                Position = v30[v89], 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            });
        end;
        v61.UIListLayout = v0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder
        });
        return v0.createElement("Frame", {
            Size = l_size_0, 
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            LayoutOrder = l_layoutOrder_0
        }, {
            Header = v0.createElement("Frame", {
                Size = UDim2.new(0, v70, 0, l_HeaderFrameHeight_0), 
                BackgroundTransparency = 1
            }, v87), 
            MainChart = v0.createElement("ScrollingFrame", {
                Size = UDim2.new(1, 0, 1, -l_HeaderFrameHeight_0), 
                Position = UDim2.new(0, 0, 0, l_HeaderFrameHeight_0), 
                BackgroundTransparency = 1, 
                VerticalScrollBarInset = 1, 
                ScrollBarThickness = 5, 
                CanvasSize = UDim2.new(0, v70, 0, v72), 
                [v0.Ref] = v60.scrollingRef
            }, v61)
        });
    end;
end;
return v2(v33, "ServerJobsData");
