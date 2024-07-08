local v0 = require(game:GetService("CorePackages").Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v2 = require(l_Components_0.CellLabel);
local v3 = require(l_Components_0.BannerButton);
local v4 = require(l_Components_0.LineGraph);
local v5 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v5.GeneralFormatting.LineWidth;
local l_LineColor_0 = v5.GeneralFormatting.LineColor;
local l_ChartHeaderNames_0 = v5.ServerScriptsFormatting.ChartHeaderNames;
local l_EntryFrameHeight_0 = v5.ServerScriptsFormatting.EntryFrameHeight;
local l_ActivityBoxWidth_0 = v5.ServerScriptsFormatting.ActivityBoxWidth;
local l_ActivityBoxPadding_0 = v5.ServerScriptsFormatting.ActivityBoxPadding;
local v12 = UDim2.new(0, l_ActivityBoxPadding_0, 0, 0);
local l_LineGraphHeight_0 = v5.GeneralFormatting.LineGraphHeight;
local v14 = require(script.Parent.Parent.Parent.Util.convertTimeStamp);
return function(v15)
    local l_scriptData_0 = v15.scriptData;
    local l_frameHeight_0 = v15.frameHeight;
    local l_showGraph_0 = v15.showGraph;
    local l_layoutOrder_0 = v15.layoutOrder;
    local l_activityBoxColor_0 = v15.activityBoxColor;
    local l_entryCellSize_0 = v15.entryCellSize;
    local l_cellOffset_0 = v15.cellOffset;
    local l_verticalOffsets_0 = v15.verticalOffsets;
    local l_onButtonPress_0 = v15.onButtonPress;
    local l_getX_0 = v15.getX;
    local l_getActivity_0 = v15.getActivity;
    local l_getRate_0 = v15.getRate;
    local l_formatScriptsData_0 = v15.formatScriptsData;
    local l_dataStats_0 = l_scriptData_0.dataStats;
    local v30 = l_dataStats_0.dataSet:back();
    return v0.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_frameHeight_0), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, {
        button = v0.createElement(v3, {
            size = UDim2.new(1, 0, 0, l_EntryFrameHeight_0), 
            pos = UDim2.new(), 
            isExpanded = l_showGraph_0, 
            onButtonPress = l_onButtonPress_0
        }, {
            ActivityBox = v0.createElement("Frame", {
                Size = UDim2.new(0, l_ActivityBoxWidth_0, 0, l_ActivityBoxWidth_0), 
                Position = UDim2.new(0, l_ActivityBoxPadding_0, 0, (l_EntryFrameHeight_0 - l_ActivityBoxWidth_0) / 2), 
                BackgroundColor3 = l_activityBoxColor_0
            }), 
            ScriptName = v0.createElement(v2, {
                text = l_scriptData_0.name, 
                size = l_entryCellSize_0[1] - v12, 
                pos = l_cellOffset_0[1] + v12
            }), 
            ScriptAcitivity = v0.createElement(v2, {
                text = l_formatScriptsData_0(v30.data[1]), 
                size = l_entryCellSize_0[2], 
                pos = l_cellOffset_0[2]
            }), 
            scriptFreqStr = v0.createElement(v2, {
                text = l_formatScriptsData_0(v30.data[2]), 
                size = l_entryCellSize_0[3], 
                pos = l_cellOffset_0[3]
            }), 
            upperHorizontalLine = v0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            }), 
            verticalLine1 = v0.createElement("Frame", {
                Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
                Position = l_verticalOffsets_0[2], 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            }), 
            verticalLine2 = v0.createElement("Frame", {
                Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
                Position = l_verticalOffsets_0[3], 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            }), 
            lowerHorizontalLine = v0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
                Position = UDim2.new(0, 0, 1, 0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            })
        }), 
        ActivityGraph = l_showGraph_0 and v0.createElement(v4, {
            pos = UDim2.new(0, 0, 0, l_EntryFrameHeight_0), 
            size = UDim2.new(1, 0, 0, l_LineGraphHeight_0), 
            graphData = l_dataStats_0.dataSet, 
            maxY = l_dataStats_0.max[1], 
            minY = l_dataStats_0.min[1], 
            getX = l_getX_0, 
            getY = l_getActivity_0, 
            stringFormatX = v14, 
            stringFormatY = l_formatScriptsData_0, 
            axisLabelX = "Timestamp", 
            axisLabelY = l_ChartHeaderNames_0[2]
        }), 
        RateGraph = l_showGraph_0 and v0.createElement(v4, {
            pos = UDim2.new(0, 0, 0, l_EntryFrameHeight_0 + l_LineGraphHeight_0), 
            size = UDim2.new(1, 0, 0, l_LineGraphHeight_0), 
            graphData = l_dataStats_0.dataSet, 
            maxY = l_dataStats_0.max[2], 
            minY = l_dataStats_0.min[2], 
            getX = l_getX_0, 
            getY = l_getRate_0, 
            stringFormatX = v14, 
            stringFormatY = l_formatScriptsData_0, 
            axisLabelX = "Timestamp", 
            axisLabelY = l_ChartHeaderNames_0[3]
        })
    });
end;
