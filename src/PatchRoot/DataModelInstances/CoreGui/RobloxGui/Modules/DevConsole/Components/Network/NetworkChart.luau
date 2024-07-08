local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(script.Parent.Parent.Parent.Constants);
local l_ChartHeaderNames_0 = v3.NetworkFormatting.ChartHeaderNames;
local l_ChartCellWidths_0 = v3.NetworkFormatting.ChartCellWidths;
local l_CellPadding_0 = v3.NetworkFormatting.CellPadding;
local l_HeaderFrameHeight_0 = v3.NetworkFormatting.HeaderFrameHeight;
local l_EntryFrameHeight_0 = v3.NetworkFormatting.EntryFrameHeight;
local l_LineWidth_0 = v3.GeneralFormatting.LineWidth;
local l_LineColor_0 = v3.GeneralFormatting.LineColor;
local l_MainWindow_0 = v3.DefaultFontSize.MainWindow;
local l_MainWindow_1 = v3.Font.MainWindow;
local l_ResponseStrHeight_0 = v3.NetworkFormatting.ResponseStrHeight;
local l_ResponseWidthRatio_0 = v3.NetworkFormatting.ResponseWidthRatio;
local v15 = require(script.Parent.Parent.Parent.Components.HeaderButton);
local v16 = require(script.Parent.NetworkChartEntry);
local v17 = 0;
for _, v19 in pairs(l_ChartCellWidths_0) do
    v17 = v17 + v19;
end;
local v20 = 0;
local v21 = {};
local v22 = {};
local v23 = {};
for _, v25 in ipairs(l_ChartCellWidths_0) do
    table.insert(v21, UDim2.new(0, v20 + l_CellPadding_0, 0, 0));
    table.insert(v22, UDim2.new(0, v25 - l_CellPadding_0, 0, l_HeaderFrameHeight_0));
    table.insert(v23, UDim2.new(0, v25 - l_CellPadding_0, 0, l_EntryFrameHeight_0));
    v20 = v20 + v25;
end;
table.insert(v21, UDim2.new(0, v20 + l_CellPadding_0, 0, 0));
table.insert(v22, UDim2.new(1, -v17 - l_CellPadding_0, 0, l_HeaderFrameHeight_0));
table.insert(v23, UDim2.new(1, -v17 - l_CellPadding_0, 0, l_EntryFrameHeight_0));
local v26 = {};
for v27, v28 in ipairs(v21) do
    v26[v27] = UDim2.new(v28.X.Scale, v28.X.Offset - l_CellPadding_0, v28.Y.Scale, v28.Y.Offset);
end;
local v29 = v2.Component:extend("NetworkChart");
v29.init = function(v30)
    v30.getOnExpandEntry = function(v31)
        return function(_, _)
            local l_v30_0 = v30;
            local v35 = {};
            local v36 = false;
            if v30.state.expandIndex ~= v31 then
                v36 = v31;
            end;
            v35.expandIndex = v36;
            l_v30_0:setState(v35);
        end;
    end;
    v30.onCanvasPosChanged = function()
        local l_CanvasPosition_0 = v30.scrollingRef.current.CanvasPosition;
        if v30.state.canvasPos ~= l_CanvasPosition_0 then
            v30:setState({
                absScrollSize = v30.scrollingRef.current.AbsoluteSize, 
                canvasPos = l_CanvasPosition_0
            });
        end;
    end;
    v30.ref = v2.createRef();
    v30.scrollingRef = v2.createRef();
    v30.state = {
        expandIndex = false
    };
end;
v29.willUpdate = function(v38)
    if v38.canvasPosConnector then
        v38.canvasPosConnector:Disconnect();
    end;
end;
v29.didUpdate = function(v39)
    if v39.scrollingRef.current then
        v39.canvasPosConnector = v39.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v39.onCanvasPosChanged);
        local l_AbsoluteSize_0 = v39.scrollingRef.current.AbsoluteSize;
        if v39.state.absScrollSize ~= l_AbsoluteSize_0 then
            v39:setState({
                absScrollSize = l_AbsoluteSize_0
            });
        end;
    end;
end;
v29.didMount = function(v41)
    if v41.scrollingRef.current then
        v41.canvasPosConnector = v41.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v41.onCanvasPosChanged);
        v41:setState({
            absScrollSize = v41.scrollingRef.current.AbsoluteSize, 
            canvasPos = v41.scrollingRef.current.CanvasPosition
        });
    end;
end;
v29.render = function(v42)
    local v43 = v42.props.httpEntryList or {};
    local l_chartHeight_0 = v42.props.chartHeight;
    local l_width_0 = v42.props.width;
    local l_searchTerm_0 = v42.props.searchTerm;
    local l_layoutOrder_0 = v42.props.layoutOrder;
    local l_reverseSort_0 = v42.props.reverseSort;
    local l_onSortChanged_0 = v42.props.onSortChanged;
    local l_expandIndex_0 = v42.state.expandIndex;
    local l_absScrollSize_0 = v42.state.absScrollSize;
    local l_canvasPos_0 = v42.state.canvasPos;
    local v53 = {};
    for v54, v55 in ipairs(l_ChartHeaderNames_0) do
        v53[v55] = v2.createElement(v15, {
            text = v55, 
            size = v22[v54], 
            pos = v21[v54], 
            sortfunction = l_onSortChanged_0
        });
    end;
    for v56 = 2, #v26 do
        v53[string.format("VerticalLine_%d", v56)] = v2.createElement("Frame", {
            Size = UDim2.new(0, l_LineWidth_0, 0, l_HeaderFrameHeight_0), 
            Position = v26[v56], 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        });
    end;
    local v57 = {};
    local v58 = 0;
    local v59 = -1;
    local v60 = 0;
    local v61 = #v43;
    local v62 = 0;
    v57.UIListLayout = v2.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        SortOrder = Enum.SortOrder.LayoutOrder
    });
    if not (not l_canvasPos_0 or not l_absScrollSize_0) then
        for v63, v64 in ipairs(v43) do
            local v65 = true;
            if l_searchTerm_0 ~= "" then
                local v66 = true;
                if string.find(v64.RequestType:lower(), l_searchTerm_0:lower()) == nil then
                    v66 = string.find(v64.Url:lower(), l_searchTerm_0:lower()) ~= nil;
                end;
                v65 = v66;
            end;
            if not (not (v64.RequestType ~= "Default") or not v65) then
                v62 = v62 + 1;
                local v67 = l_expandIndex_0 == v64.Num;
                local l_l_EntryFrameHeight_0_0 = l_EntryFrameHeight_0;
                local v69 = 0;
                if v67 then
                    l_l_EntryFrameHeight_0_0 = l_l_EntryFrameHeight_0_0 + l_ResponseStrHeight_0;
                    if v42.ref.current then
                        v69 = l_ResponseStrHeight_0 + l_TextService_0:GetTextSize(v64.Response, l_MainWindow_0, l_MainWindow_1, (Vector2.new(v42.ref.current.AbsoluteSize.X * l_ResponseWidthRatio_0, 100000000))).Y;
                        l_l_EntryFrameHeight_0_0 = l_l_EntryFrameHeight_0_0 + v69;
                    end;
                end;
                if l_canvasPos_0.Y <= v58 + l_l_EntryFrameHeight_0_0 then
                    if v60 < l_absScrollSize_0.Y then
                        v57[v63] = v2.createElement(v16, {
                            size = UDim2.new(1, 0, 0, l_l_EntryFrameHeight_0_0), 
                            entry = v64, 
                            entryCellSize = v23, 
                            cellOffset = v21, 
                            verticalOffsets = v26, 
                            showResponse = v67, 
                            responseBodyHeight = v69, 
                            layoutOrder = (not not l_reverseSort_0 and v61 - v63 or v63) + 1, 
                            onButtonPress = v42.getOnExpandEntry(v64.Num)
                        });
                    end;
                    if v59 < 0 then
                        v59 = v58;
                    else
                        v60 = v60 + l_l_EntryFrameHeight_0_0;
                    end;
                end;
                v58 = v58 + l_l_EntryFrameHeight_0_0;
            end;
        end;
        if v62 > 0 then
            v57.WindowingPadding = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v59), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            });
        end;
    end;
    if not (v61 ~= 0) or v62 == 0 then
        v57["NONE FOUND"] = v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, l_chartHeight_0), 
            Text = "No Network Entries Found", 
            TextColor3 = v3.Color.Text, 
            BackgroundTransparency = 1
        });
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_chartHeight_0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        LayoutOrder = l_layoutOrder_0, 
        [v2.Ref] = v42.ref
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Header = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_HeaderFrameHeight_0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, v53), 
        HorizontalLine_1 = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 0, 
            LayoutOrder = 2
        }), 
        scrollingFrameEntries = v2.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, -l_HeaderFrameHeight_0), 
            CanvasSize = UDim2.new(0, l_width_0, 0, v58), 
            ScrollBarThickness = 6, 
            BackgroundTransparency = 1, 
            LayoutOrder = 3, 
            [v2.Ref] = v42.scrollingRef
        }, v57)
    });
end;
return v29;
