local v0 = require(game:GetService("CorePackages").Roact);
local v1 = require(script.Parent.ProfilerUtil);
local l_getDurations_0 = v1.getDurations;
local l_formatSessionLength_0 = v1.formatSessionLength;
local _ = require(script.Parent.ProfilerDataFormatV2);
local v5 = require(script.Parent.Parent.Parent.Components.HeaderButton);
local v6 = require(script.Parent.ProfilerViewEntry);
local v7 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v7.GeneralFormatting.LineWidth;
local l_LineColor_0 = v7.GeneralFormatting.LineColor;
local l_HeaderFrameHeight_0 = v7.GeneralFormatting.HeaderFrameHeight;
local _ = v7.GeneralFormatting.EntryFrameHeight;
local _ = v7.GeneralFormatting.NoResultSearchStr;
local l_HeaderNames_0 = v7.ScriptProfilerFormatting.HeaderNames;
local l_ValueCellWidth_0 = v7.ScriptProfilerFormatting.ValueCellWidth;
local l_CellPadding_0 = v7.ScriptProfilerFormatting.CellPadding;
local l_ValuePadding_0 = v7.ScriptProfilerFormatting.ValuePadding;
local v17 = v0.PureComponent:extend("ProfilerView");
v17.renderChildren = function(v18)
    local l_data_0 = v18.props.data;
    assert(l_data_0.Version == 2);
    local v20 = l_getDurations_0(l_data_0, 0);
    local v21 = 1;
    if not (not (v18.props.average > 0) or not v18.props.sessionLength) then
        v21 = (v18.props.sessionLength / 1000) / v18.props.average;
    end;
    return v0.createElement(v6, {
        layoutOrder = 0, 
        depth = 0, 
        data = l_data_0, 
        nodeId = v18.props.rootNode, 
        functionId = v18.props.rootFunc, 
        nodeName = v18.props.rootNodeName, 
        average = v21, 
        searchTerm = v18.props.searchTerm, 
        searchFilter = v18.props.searchFilter, 
        showPlugins = v18.props.showPlugins, 
        pluginOffsets = v18.props.pluginOffsets, 
        showGC = v18.props.showGC, 
        gcNodeOffsets = v18.props.gcNodeOffsets, 
        pluginGCOffsets = v18.props.pluginGCOffsets, 
        expandedNodes = v18.props.expandedNodes, 
        percentageRatio = if not v18.props.showAsPercentages then nil else v20 / 100
    });
end;
v17.render = function(v22)
    local l_layoutOrder_0 = v22.props.layoutOrder;
    local l_size_0 = v22.props.size;
    local v25 = nil;
    if not v22.props.profiling or v22.props.data then
        if not v22.props.data then
            v25 = v0.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                Text = "Start Profiling to View Data", 
                TextColor3 = v7.Color.Text, 
                BackgroundTransparency = 1, 
                LayoutOrder = l_layoutOrder_0
            });
        end;
    else
        v25 = v0.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            Text = "Press Stop to Finish Profiling", 
            TextColor3 = v7.Color.Text, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0
        });
    end;
    local v26;
    v26 = l_formatSessionLength_0(v22.props.sessionLength) and "Session Duration: " .. v26;
    return v0.createElement("Frame", {
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, {
        SessionInfo = v0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_HeaderFrameHeight_0), 
            BackgroundTransparency = 1
        }, {
            Name = v0.createElement(v5, {
                text = v26 or "Session Info", 
                size = UDim2.new(1 - l_ValueCellWidth_0 * 2, -l_ValuePadding_0 - l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
                pos = UDim2.new(0, l_CellPadding_0, 0, 0)
            }), 
            TopHorizontal = v0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            })
        }), 
        Header = v0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_HeaderFrameHeight_0), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 0, l_HeaderFrameHeight_0)
        }, {
            Name = v0.createElement(v5, {
                text = l_HeaderNames_0[1], 
                size = UDim2.new(1 - l_ValueCellWidth_0 * 2, -l_ValuePadding_0 - l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
                pos = UDim2.new(0, l_CellPadding_0, 0, 0), 
                sortfunction = v22.onSortChanged
            }), 
            Inclusive = v0.createElement(v5, {
                text = l_HeaderNames_0[2], 
                size = UDim2.new(l_ValueCellWidth_0, -l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
                pos = UDim2.new(1 - l_ValueCellWidth_0 * 2, l_ValuePadding_0, 0, 0), 
                sortfunction = v22.onSortChanged
            }), 
            Self = v0.createElement(v5, {
                text = l_HeaderNames_0[3], 
                size = UDim2.new(l_ValueCellWidth_0, -l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
                pos = UDim2.new(1 - l_ValueCellWidth_0, l_ValuePadding_0, 0, 0), 
                sortfunction = v22.onSortChanged
            }), 
            TopHorizontal = v0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            }), 
            LowerHorizontal = v0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
                Position = UDim2.new(0, 0, 1, 0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            }), 
            Vertical1 = v0.createElement("Frame", {
                Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
                Position = UDim2.new(1 - l_ValueCellWidth_0, 0, 0, 0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            }), 
            Vertical2 = v0.createElement("Frame", {
                Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
                Position = UDim2.new(1 - l_ValueCellWidth_0 * 2, 0, 0, 0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            })
        }), 
        Entries = v0.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, -l_HeaderFrameHeight_0 * 2), 
            Position = UDim2.new(0, 0, 0, l_HeaderFrameHeight_0 * 2), 
            BackgroundTransparency = 1, 
            VerticalScrollBarInset = Enum.ScrollBarInset.None, 
            ScrollBarThickness = 5, 
            CanvasSize = UDim2.fromScale(0, 0), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y
        }, {
            Layout = v0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical
            }), 
            Children = if not v25 then v0.createFragment(v22:renderChildren()) else v25
        })
    });
end;
return v17;
