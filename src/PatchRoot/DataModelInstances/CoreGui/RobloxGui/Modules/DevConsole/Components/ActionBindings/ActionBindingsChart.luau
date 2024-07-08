local v0 = require(game:GetService("CorePackages").Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v2 = require(l_Components_0.DataConsumer);
local v3 = require(l_Components_0.HeaderButton);
local v4 = require(l_Components_0.CellLabel);
local v5 = require(script.Parent.Parent.Parent.Constants);
local l_GeneralFormatting_0 = v5.GeneralFormatting;
local l_LineWidth_0 = l_GeneralFormatting_0.LineWidth;
local l_LineColor_0 = l_GeneralFormatting_0.LineColor;
local l_ActionBindingsFormatting_0 = v5.ActionBindingsFormatting;
local l_ChartHeaderNames_0 = l_ActionBindingsFormatting_0.ChartHeaderNames;
local l_ChartCellWidths_0 = l_ActionBindingsFormatting_0.ChartCellWidths;
local l_HeaderFrameHeight_0 = l_ActionBindingsFormatting_0.HeaderFrameHeight;
local l_EntryFrameHeight_0 = l_ActionBindingsFormatting_0.EntryFrameHeight;
local l_CellPadding_0 = l_ActionBindingsFormatting_0.CellPadding;
local l_MinFrameWidth_0 = l_ActionBindingsFormatting_0.MinFrameWidth;
local v16 = 0;
for _, v18 in ipairs(l_ChartCellWidths_0) do
    v16 = v16 + v18;
end;
local v19 = -v16;
local v20 = {};
local v21 = {};
local v22 = {};
v19 = v19 / 2;
table.insert(v20, UDim2.new(0, l_CellPadding_0, 0, 0));
table.insert(v21, UDim2.new(0.5, v19 - l_CellPadding_0, 0, l_HeaderFrameHeight_0));
table.insert(v22, UDim2.new(0.5, v19 - l_CellPadding_0, 0, l_EntryFrameHeight_0));
for _, v24 in ipairs(l_ChartCellWidths_0) do
    table.insert(v20, UDim2.new(0.5, v19 + l_CellPadding_0, 0, 0));
    table.insert(v21, UDim2.new(0, v24 - l_CellPadding_0, 0, l_HeaderFrameHeight_0));
    table.insert(v22, UDim2.new(0, v24 - l_CellPadding_0, 0, l_EntryFrameHeight_0));
    v19 = v19 + v24;
end;
table.insert(v20, UDim2.new(0.5, v19 + l_CellPadding_0, 0, 0));
table.insert(v21, UDim2.new(0.5, -v16 / 2 - l_CellPadding_0, 0, l_HeaderFrameHeight_0));
table.insert(v22, UDim2.new(0.5, -v16 / 2 - l_CellPadding_0, 0, l_EntryFrameHeight_0));
local v25 = {};
for v26, v27 in ipairs(v20) do
    v25[v26] = UDim2.new(v27.X.Scale, v27.X.Offset - l_CellPadding_0, v27.Y.Scale, v27.Y.Offset);
end;
local v28 = v0.Component:extend("ActionBindingsChart");
local function v35(v29, v30)
    local v31 = {};
    for v32, v33 in ipairs(l_ChartHeaderNames_0) do
        v31[v33] = v0.createElement(v3, {
            text = v33, 
            size = v21[v32], 
            pos = v20[v32], 
            sortfunction = v29
        });
    end;
    v31.upperHorizontalLine = v0.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundColor3 = l_LineColor_0, 
        BorderSizePixel = 0
    });
    v31.lowerHorizontalLine = v0.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
        Position = UDim2.new(0, 0, 1, -l_LineWidth_0), 
        BackgroundColor3 = l_LineColor_0, 
        BorderSizePixel = 0
    });
    for v34 = 2, #v25 do
        v31[string.format("VerticalLine_%d", v34)] = v0.createElement("Frame", {
            Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
            Position = v25[v34], 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        });
    end;
    return v0.createElement("Frame", {
        Size = UDim2.new(0, v30, 0, l_HeaderFrameHeight_0), 
        BackgroundTransparency = 1
    }, v31);
end;
local function v45(v36, v37, v38)
    local l_name_0 = v36.name;
    local l_actionInfo_0 = v36.actionInfo;
    local v41 = tostring(l_actionInfo_0.inputTypes[1]);
    local v42 = "Core";
    if l_actionInfo_0.isCore then
        v42 = "Developer";
    end;
    local v43 = {};
    for v44 = 2, #v25 do
        v43[string.format("line_%d", v44)] = v0.createElement("Frame", {
            Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
            Position = v25[v44], 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        });
    end;
    v43[l_name_0] = v0.createElement(v4, {
        text = v41, 
        size = v22[1], 
        pos = v20[1]
    });
    v43.priorityLevel = v0.createElement(v4, {
        text = l_actionInfo_0.priorityLevel, 
        size = v22[2], 
        pos = v20[2]
    });
    v43.isCore = v0.createElement(v4, {
        text = v42, 
        size = v22[3], 
        pos = v20[3]
    });
    v43.actionName = v0.createElement(v4, {
        text = l_name_0, 
        size = v22[4], 
        pos = v20[4]
    });
    v43.inputTypes = v0.createElement(v4, {
        text = v41, 
        size = v22[5], 
        pos = v20[5]
    });
    v43.lowerHorizontalLine = v0.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
        Position = UDim2.new(0, 0, 1, 0), 
        BackgroundColor3 = l_LineColor_0, 
        BorderSizePixel = 0
    });
    return v0.createElement("Frame", {
        Size = UDim2.new(0, v37, 0, l_EntryFrameHeight_0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v38
    }, v43);
end;
v28.init = function(v46, v47)
    local v48 = v47.ActionBindingsData:getCurrentData();
    v46.onSortChanged = function(v49)
        if v49 == v47.ActionBindingsData:getSortType() then
            v46:setState({
                reverseSort = not v46.state.reverseSort
            });
            return ;
        else
            v47.ActionBindingsData:setSortType(v49);
            v46:setState({
                reverseSort = false
            });
            return ;
        end;
    end;
    v46.onCanvasPosChanged = function()
        local l_CanvasPosition_0 = v46.scrollingRef.current.CanvasPosition;
        if v46.state.canvasPos ~= l_CanvasPosition_0 then
            v46:setState({
                canvasPos = l_CanvasPosition_0
            });
        end;
    end;
    v46.scrollingRef = v0.createRef();
    v46.state = {
        actionBindingEntries = v48, 
        reverseSort = false
    };
end;
v28.willUpdate = function(v51)
    if v51.canvasPosConnector then
        v51.canvasPosConnector:Disconnect();
    end;
end;
v28.didUpdate = function(v52)
    if v52.scrollingRef.current then
        v52.canvasPosConnector = v52.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v52.onCanvasPosChanged);
        local l_AbsoluteSize_0 = v52.scrollingRef.current.AbsoluteSize;
        local l_absScrollSize_0 = v52.state.absScrollSize;
        if not (l_AbsoluteSize_0.X == l_absScrollSize_0.X) or l_AbsoluteSize_0.Y ~= l_absScrollSize_0.Y then
            v52:setState({
                absScrollSize = l_AbsoluteSize_0
            });
        end;
    end;
end;
v28.didMount = function(v55)
    v55.bindingsUpdated = v55.props.ActionBindingsData:Signal():Connect(function(v56)
        v55:setState({
            actionBindingEntries = v56
        });
    end);
    if v55.scrollingRef.current then
        v55.canvasPosConnector = v55.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v55.onCanvasPosChanged);
        v55:setState({
            absScrollSize = v55.scrollingRef.current.AbsoluteSize, 
            canvasPos = v55.scrollingRef.current.CanvasPosition
        });
    end;
end;
v28.willUnmount = function(v57)
    v57.bindingsUpdated:Disconnect();
    v57.bindingsUpdated = nil;
    v57.canvasPosConnector:Disconnect();
    v57.canvasPosConnector = nil;
end;
v28.render = function(v58)
    local v59 = {};
    local l_searchTerm_0 = v58.props.searchTerm;
    local l_size_0 = v58.props.size;
    local l_layoutOrder_0 = v58.props.layoutOrder;
    local l_actionBindingEntries_0 = v58.state.actionBindingEntries;
    local l_reverseSort_0 = v58.state.reverseSort;
    local l_canvasPos_0 = v58.state.canvasPos;
    local l_absScrollSize_1 = v58.state.absScrollSize;
    local v67 = not not l_absScrollSize_1 and math.max(l_absScrollSize_1.X, l_MinFrameWidth_0) or l_MinFrameWidth_0;
    v59.UIListLayout = v0.createElement("UIListLayout", {
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        SortOrder = Enum.SortOrder.LayoutOrder
    });
    local v68 = #l_actionBindingEntries_0;
    local v69 = 0;
    if not (not l_absScrollSize_1 or not l_canvasPos_0) then
        local v70 = -1;
        local v71 = 0;
        local v72 = 0;
        for v73, v74 in ipairs(l_actionBindingEntries_0) do
            local v75 = false;
            if l_searchTerm_0 then
                v75 = string.find(tostring(v74.actionInfo.inputTypes[1]):lower(), l_searchTerm_0:lower()) ~= nil or string.find(v74.name:lower(), l_searchTerm_0:lower()) ~= nil;
            end;
            if not (l_searchTerm_0 and not v75) then
                if l_canvasPos_0.Y <= v69 + l_EntryFrameHeight_0 then
                    if v71 < l_absScrollSize_1.Y then
                        v59[v73] = v45(v74, v67, (not not l_reverseSort_0 and v68 - v73 or v73) + 1);
                    end;
                    if v70 < 0 then
                        v70 = v69;
                    else
                        v71 = v71 + l_EntryFrameHeight_0;
                    end;
                    v72 = v72 + 1;
                end;
                v69 = v69 + l_EntryFrameHeight_0;
            end;
        end;
        if v72 == 0 then
            v59.NoneFound = v0.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                Text = "No ActionBindings Found", 
                TextColor3 = l_LineColor_0, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            });
        else
            v59.WindowingPadding = v0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v70), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            });
        end;
    end;
    return v0.createElement("Frame", {
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        LayoutOrder = l_layoutOrder_0
    }, {
        Header = v35(v58.onSortChanged, v67), 
        MainChart = v0.createElement("ScrollingFrame", {
            Position = UDim2.new(0, 0, 0, l_HeaderFrameHeight_0), 
            Size = UDim2.new(1, 0, 1, -l_HeaderFrameHeight_0), 
            CanvasSize = UDim2.new(0, v67, 0, v69), 
            ScrollBarThickness = 6, 
            BackgroundColor3 = v5.Color.BaseGray, 
            BackgroundTransparency = 1, 
            [v0.Ref] = v58.scrollingRef
        }, v59)
    });
end;
return v2(v28, "ActionBindingsData");
