local v0 = require(game:GetService("CorePackages").Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v2 = require(script.Parent.Parent.Parent.Components.DataConsumer);
local v3 = require(l_Components_0.HeaderButton);
local v4 = require(script.Parent.ServerScriptsEntry);
local v5 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v5.GeneralFormatting.LineWidth;
local l_LineColor_0 = v5.GeneralFormatting.LineColor;
local l_ChartCellWidths_0 = v5.ServerScriptsFormatting.ChartCellWidths;
local l_ChartHeaderNames_0 = v5.ServerScriptsFormatting.ChartHeaderNames;
local l_HeaderFrameHeight_0 = v5.ServerScriptsFormatting.HeaderFrameHeight;
local l_EntryFrameHeight_0 = v5.ServerScriptsFormatting.EntryFrameHeight;
local l_CellPadding_0 = v5.ServerScriptsFormatting.CellPadding;
local l_LineGraphHeight_0 = v5.GeneralFormatting.LineGraphHeight;
local l_NoResultSearchStr_0 = v5.GeneralFormatting.NoResultSearchStr;
local v15 = {};
local v16 = {};
local v17 = {};
local v18 = 0;
for _, v20 in ipairs(l_ChartCellWidths_0) do
    table.insert(v15, UDim2.new(v18, l_CellPadding_0, 0, 0));
    table.insert(v16, UDim2.new(v20, -l_CellPadding_0, 0, l_HeaderFrameHeight_0));
    table.insert(v17, UDim2.new(v20, -l_CellPadding_0, 0, l_EntryFrameHeight_0));
    v18 = v18 + v20;
end;
local v21 = {};
for v22, v23 in ipairs(v15) do
    v21[v22] = UDim2.new(v23.X.Scale, v23.X.Offset - l_CellPadding_0, v23.Y.Scale, v23.Y.Offset);
end;
local v24 = v0.Component:extend("ServerScripts");
local function v28(v25)
    local v26 = {};
    for v27 = 1, #l_ChartHeaderNames_0 do
        v26[l_ChartHeaderNames_0[v27]] = v0.createElement(v3, {
            text = l_ChartHeaderNames_0[v27], 
            size = v16[v27], 
            pos = v15[v27], 
            sortfunction = v25
        });
    end;
    v26.upperHorizontalLine = v0.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundColor3 = l_LineColor_0, 
        BorderSizePixel = 0
    });
    v26.verticalLine1 = v0.createElement("Frame", {
        Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
        Position = v21[2], 
        BackgroundColor3 = l_LineColor_0, 
        BorderSizePixel = 0
    });
    v26.verticalLine2 = v0.createElement("Frame", {
        Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
        Position = v21[3], 
        BackgroundColor3 = l_LineColor_0, 
        BorderSizePixel = 0
    });
    v26.lowerHorizontalLine = v0.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
        Position = UDim2.new(0, 0, 1, 0), 
        BackgroundColor3 = l_LineColor_0, 
        BorderSizePixel = 0
    });
    return v0.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_HeaderFrameHeight_0), 
        BackgroundTransparency = 1
    }, v26);
end;
local function v30(v29)
    return v29.time;
end;
local function v32(v31)
    return v31.data[1];
end;
local function v34(v33)
    return v33.data[2];
end;
local function v36(v35)
    return string.format("%.3f", v35);
end;
v24.init = function(v37, v38)
    local v39 = v38.ServerScriptsData:getCurrentData();
    v37.onSortChanged = function(v40)
        if v40 == v38.ServerScriptsData:getSortType() then
            v37:setState({
                reverseSort = not v37.state.reverseSort
            });
            return ;
        else
            v38.ServerScriptsData:setSortType(v40);
            v37:setState({
                reverseSort = false
            });
            return ;
        end;
    end;
    v37.getOnButtonPress = function(v41)
        return function(_, _)
            local l_v37_0 = v37;
            local v45 = {};
            local v46 = false;
            if v37.state.expandIndex ~= v41 then
                v46 = v41;
            end;
            v45.expandIndex = v46;
            l_v37_0:setState(v45);
        end;
    end;
    v37.onCanvasPosChanged = function()
        local l_CanvasPosition_0 = v37.scrollingRef.current.CanvasPosition;
        if v37.state.canvasPos ~= l_CanvasPosition_0 then
            v37:setState({
                absScrollSize = v37.scrollingRef.current.AbsoluteSize, 
                canvasPos = l_CanvasPosition_0
            });
        end;
    end;
    v37.scrollingRef = v0.createRef();
    v37.state = {
        serverScriptsData = v39, 
        expandIndex = nil
    };
end;
v24.willUpdate = function(v48)
    if v48.canvasPosConnector then
        v48.canvasPosConnector:Disconnect();
    end;
end;
v24.didUpdate = function(v49)
    if v49.scrollingRef.current then
        v49.canvasPosConnector = v49.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v49.onCanvasPosChanged);
    end;
end;
v24.didMount = function(v50)
    v50.statsConnector = v50.props.ServerScriptsData:Signal():Connect(function(v51)
        v50:setState({
            serverScriptsData = v51
        });
    end);
    if v50.scrollingRef.current then
        v50.canvasPosConnector = v50.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v50.onCanvasPosChanged);
        v50:setState({
            absScrollSize = v50.scrollingRef.current.AbsoluteSize, 
            canvasPos = v50.scrollingRef.current.CanvasPosition
        });
    end;
end;
v24.willUnmount = function(v52)
    v52.statsConnector:Disconnect();
    v52.statsConnector = nil;
end;
v24.render = function(v53)
    local l_searchTerm_0 = v53.props.searchTerm;
    local l_scriptFilters_0 = v53.props.scriptFilters;
    local l_layoutOrder_0 = v53.props.layoutOrder;
    local l_size_0 = v53.props.size;
    local l_serverScriptsData_0 = v53.state.serverScriptsData;
    local l_reverseSort_0 = v53.state.reverseSort;
    local l_absScrollSize_0 = v53.state.absScrollSize;
    local l_canvasPos_0 = v53.state.canvasPos;
    local v62 = {};
    local v63 = #l_serverScriptsData_0;
    if v63 == 0 then
        return v0.createElement("TextLabel", {
            Size = l_size_0, 
            Position = UDim2.new(0, 0, 0, 0), 
            Text = "Awaiting Server Scripts Information.", 
            TextColor3 = v5.Color.Text, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0
        });
    else
        local v64 = 0;
        local v65 = -1;
        local v66 = 0;
        local v67 = 0;
        if not (not l_canvasPos_0 or not l_absScrollSize_0) then
            for v68, v69 in pairs(l_serverScriptsData_0) do
                if not l_searchTerm_0 or string.find(v69.name:lower(), l_searchTerm_0:lower()) ~= nil then
                    v67 = v67 + 1;
                    local v70 = true;
                    local l_Active_0 = l_scriptFilters_0.Active;
                    local l_Inactive_0 = l_scriptFilters_0.Inactive;
                    local v73 = v69.dataStats.dataSet:back();
                    if l_Active_0 ~= l_Inactive_0 then
                        if not (v73.data[1] > 0) or not l_Inactive_0 then
                            if not (not (v73.data[1] == 0) or not l_Active_0) then
                                v70 = false;
                            end;
                        else
                            v70 = false;
                        end;
                    end;
                    if v70 then
                        local v74 = v53.state.expandIndex == v69.name;
                        local v75 = not not v74 and l_EntryFrameHeight_0 + 2 * l_LineGraphHeight_0 or l_EntryFrameHeight_0;
                        if l_canvasPos_0.Y <= v64 + v75 then
                            if v66 < l_absScrollSize_0.Y then
                                v62[v68] = v0.createElement(v4, {
                                    scriptData = v69, 
                                    frameHeight = v75, 
                                    showGraph = v74, 
                                    layoutOrder = not not l_reverseSort_0 and v63 - v68 or v68, 
                                    activityBoxColor = v73.data[1] > 0 and v5.Color.ActiveBox or v5.Color.InactiveBox, 
                                    entryCellSize = v17, 
                                    cellOffset = v15, 
                                    verticalOffsets = v21, 
                                    onButtonPress = v53.getOnButtonPress(v69.name), 
                                    formatScriptsData = v36, 
                                    getX = v30, 
                                    getActivity = v32, 
                                    getRate = v34, 
                                    stringFormatY = v36
                                });
                            end;
                            if v65 < 0 then
                                v65 = v64;
                            else
                                v66 = v66 + v75;
                            end;
                        end;
                        v64 = v64 + v75;
                    end;
                end;
            end;
            if v67 > 0 then
                v62.WindowingPadding = v0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v65), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                });
            else
                v62.emptySearch = v0.createElement("TextLabel", {
                    Size = l_size_0, 
                    Text = string.format(l_NoResultSearchStr_0, l_searchTerm_0), 
                    TextColor3 = v5.Color.Text, 
                    BackgroundTransparency = 1
                });
            end;
        end;
        v62.UIListLayout = v0.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder
        });
        return v0.createElement("Frame", {
            Size = l_size_0, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0
        }, {
            Header = v28(v53.onSortChanged), 
            Entries = v0.createElement("ScrollingFrame", {
                Position = UDim2.new(0, 0, 0, l_HeaderFrameHeight_0), 
                Size = UDim2.new(1, 0, 1, -l_HeaderFrameHeight_0), 
                BackgroundTransparency = 1, 
                VerticalScrollBarInset = 1, 
                ScrollBarThickness = 5, 
                CanvasSize = UDim2.new(1, 0, 0, v64), 
                [v0.Ref] = v53.scrollingRef
            }, v62)
        });
    end;
end;
return v2(v24, "ServerScriptsData");
