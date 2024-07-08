local v0 = require(game:GetService("CorePackages").Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v2 = require(l_Components_0.CellLabel);
local v3 = require(l_Components_0.BannerButton);
local v4 = require(l_Components_0.LineGraph);
local v5 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v5.GeneralFormatting.LineWidth;
local l_LineColor_0 = v5.GeneralFormatting.LineColor;
local l_ValueCellWidth_0 = v5.MemoryFormatting.ValueCellWidth;
local l_CellPadding_0 = v5.MemoryFormatting.CellPadding;
local l_ValuePadding_0 = v5.MemoryFormatting.ValuePadding;
local l_EntryFrameHeight_0 = v5.GeneralFormatting.EntryFrameHeight;
local l_DepthIndent_0 = v5.MemoryFormatting.DepthIndent;
local v13 = require(script.Parent.Parent.Parent.Util.convertTimeStamp);
return function(v14)
    local l_size_0 = v14.size;
    local l_depth_0 = v14.depth;
    local l_showGraph_0 = v14.showGraph;
    local l_dataStats_0 = v14.dataStats;
    local l_layoutOrder_0 = v14.layoutOrder;
    local l_onButtonPress_0 = v14.onButtonPress;
    local l_formatValueStr_0 = v14.formatValueStr;
    local l_getX_0 = v14.getX;
    local l_getY_0 = v14.getY;
    local v24 = l_depth_0 * l_DepthIndent_0;
    local l_name_0 = v14.name;
    local l_value_0 = v14.value;
    if l_dataStats_0 then
        l_value_0 = l_dataStats_0.dataSet:back().data;
    end;
    return v0.createElement("Frame", {
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, {
        button = v0.createElement(v3, {
            size = UDim2.new(1, -v24, 0, l_EntryFrameHeight_0), 
            pos = UDim2.new(0, v24, 0, 0), 
            isExpanded = l_showGraph_0, 
            onButtonPress = l_onButtonPress_0
        }, {
            name = v0.createElement(v2, {
                text = l_name_0, 
                size = UDim2.new(UDim.new(1 - l_ValueCellWidth_0, -v24), UDim.new(1, 0)), 
                pos = UDim2.new(0, l_CellPadding_0, 0, 0)
            }), 
            horizonal1 = v0.createElement("Frame", {
                Size = UDim2.new(1, -v24, 0, l_LineWidth_0), 
                Position = UDim2.new(0, v24, 0, 0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            }), 
            horizonal2 = v0.createElement("Frame", {
                Size = UDim2.new(1, -v24, 0, l_LineWidth_0), 
                Position = UDim2.new(0, v24, 1, 0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            })
        }), 
        value = l_value_0 and v0.createElement(v2, {
            text = l_formatValueStr_0(l_value_0), 
            size = UDim2.new(l_ValueCellWidth_0, -l_ValuePadding_0, 0, l_EntryFrameHeight_0), 
            pos = UDim2.new(1 - l_ValueCellWidth_0, l_ValuePadding_0, 0, 0)
        }), 
        vertical = v0.createElement("Frame", {
            Size = UDim2.new(0, 1, 0, l_EntryFrameHeight_0), 
            Position = UDim2.new(1 - l_ValueCellWidth_0, 0, 0, 0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        }), 
        Graph = l_showGraph_0 and v0.createElement(v4, {
            pos = UDim2.new(0, 0, 0, l_EntryFrameHeight_0), 
            size = UDim2.new(1, 0, 1, -l_EntryFrameHeight_0), 
            graphData = l_dataStats_0.dataSet, 
            maxY = l_dataStats_0.max, 
            minY = l_dataStats_0.min, 
            getX = l_getX_0, 
            getY = l_getY_0, 
            stringFormatX = v13, 
            stringFormatY = l_formatValueStr_0, 
            axisLabelX = "Timestamp", 
            axisLabelY = l_name_0
        })
    });
end;
