local v0 = require(game:GetService("CorePackages").Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v2 = require(l_Components_0.DataConsumer);
local v3 = require(l_Components_0.CellLabel);
local v4 = require(l_Components_0.BannerButton);
local v5 = require(l_Components_0.LineGraph);
local v6 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v6.GeneralFormatting.LineWidth;
local l_LineColor_0 = v6.GeneralFormatting.LineColor;
local l_ChartHeaderNames_0 = v6.ServerStatsFormatting.ChartHeaderNames;
local l_ValueCellWidth_0 = v6.ServerStatsFormatting.ValueCellWidth;
local l_CellPadding_0 = v6.ServerStatsFormatting.CellPadding;
local l_ExpandArrowPadding_0 = v6.ServerStatsFormatting.ExpandArrowPadding;
local l_HeaderFrameHeight_0 = v6.ServerStatsFormatting.HeaderFrameHeight;
local l_EntryFrameHeight_0 = v6.ServerStatsFormatting.EntryFrameHeight;
local l_LineGraphHeight_0 = v6.GeneralFormatting.LineGraphHeight;
local l_NoResultSearchStr_0 = v6.GeneralFormatting.NoResultSearchStr;
local v17 = require(script.Parent.Parent.Parent.Util.convertTimeStamp);
local v18 = v0.Component:extend("ServerStats");
local function v20(v19)
    return string.format("%.3f", v19);
end;
local function v22(v21)
    return v21.time;
end;
local function v24(v23)
    return v23.value;
end;
v18.init = function(v25)
    local v26 = v25.props.ServerStatsData:getCurrentData();
    v25.getOnButtonPress = function(v27)
        return function(_, _)
            local l_v25_0 = v25;
            local v31 = {};
            local v32 = false;
            if v25.state.expandedEntry ~= v27 then
                v32 = v27;
            end;
            v31.expandedEntry = v32;
            l_v25_0:setState(v31);
        end;
    end;
    v25.state = {
        serverStatsData = v26
    };
end;
v18.didMount = function(v33)
    v33.statsConnector = v33.props.ServerStatsData:Signal():Connect(function(v34)
        v33:setState({
            serverStatsData = v34
        });
    end);
end;
v18.willUnmount = function(v35)
    v35.statsConnector:Disconnect();
    v35.statsConnector = nil;
end;
v18.render = function(v36)
    local v37 = {};
    local l_searchTerm_0 = v36.props.searchTerm;
    local l_layoutOrder_0 = v36.props.layoutOrder;
    local l_size_0 = v36.props.size;
    local l_expandedEntry_0 = v36.state.expandedEntry;
    local l_serverStatsData_0 = v36.state.serverStatsData;
    local v43 = 1;
    local v44 = 0;
    local v45 = 0;
    if l_serverStatsData_0 then
        for v46, v47 in pairs(l_serverStatsData_0) do
            v44 = v44 + 1;
            if not l_searchTerm_0 or string.find(v46:lower(), l_searchTerm_0:lower()) ~= nil then
                v43 = v43 + 1;
                local v48 = l_expandedEntry_0 == v46;
                local v49 = not not v48 and l_EntryFrameHeight_0 + l_LineGraphHeight_0 or l_EntryFrameHeight_0;
                v45 = not not v48 and v45 + 1 or v45;
                v37[v46] = v0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v49), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v43
                }, {
                    DataButton = v0.createElement(v4, {
                        size = UDim2.new(1, 0, 0, l_EntryFrameHeight_0), 
                        pos = UDim2.new(), 
                        isExpanded = v48, 
                        onButtonPress = v36.getOnButtonPress(v46)
                    }, {
                        [v46] = v0.createElement(v3, {
                            text = v46, 
                            size = UDim2.new(1 - l_ValueCellWidth_0, -l_CellPadding_0 - l_ExpandArrowPadding_0, 1, 0), 
                            pos = UDim2.new(0, l_CellPadding_0 + l_ExpandArrowPadding_0, 0, 0)
                        }), 
                        Data = v0.createElement(v3, {
                            text = string.format("%.3f", v47.dataSet:back().value), 
                            size = UDim2.new(l_ValueCellWidth_0, -l_CellPadding_0, 1, 0), 
                            pos = UDim2.new(1 - l_ValueCellWidth_0, l_CellPadding_0, 0, 0)
                        }), 
                        VerticalLine = v0.createElement("Frame", {
                            Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
                            Position = UDim2.new(1 - l_ValueCellWidth_0, 0, 0, 0), 
                            BackgroundColor3 = l_LineColor_0, 
                            BorderSizePixel = 0
                        }), 
                        HorizontalAlignment = v0.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
                            Position = UDim2.new(0, 0, 1, 0), 
                            BackgroundColor3 = l_LineColor_0, 
                            BorderSizePixel = 0
                        })
                    }), 
                    Graph = v48 and v0.createElement(v5, {
                        pos = UDim2.new(0, 0, 0, l_EntryFrameHeight_0), 
                        size = UDim2.new(1, 0, 1, -l_EntryFrameHeight_0), 
                        graphData = v47.dataSet, 
                        minY = v47.min, 
                        maxY = v47.max, 
                        getX = v22, 
                        getY = v24, 
                        axisLabelX = "Timestamp", 
                        axisLabelY = v46, 
                        stringFormatX = v17, 
                        stringFormatY = v20
                    })
                });
            end;
        end;
    end;
    if v43 == 1 then
        if v44 == 0 then
            return v0.createElement("TextLabel", {
                Size = l_size_0, 
                Position = UDim2.new(0, 0, 0, 0), 
                Text = "Awaiting Server Stats", 
                TextColor3 = v6.Color.Text, 
                BackgroundTransparency = 1, 
                LayoutOrder = l_layoutOrder_0
            });
        else
            v37.emptyResult = v0.createElement("TextLabel", {
                Size = l_size_0, 
                Text = string.format(l_NoResultSearchStr_0, l_searchTerm_0), 
                TextColor3 = v6.Color.Text, 
                BackgroundTransparency = 1
            });
        end;
    end;
    v37.UIListLayout = v0.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        SortOrder = Enum.SortOrder.LayoutOrder
    });
    return v0.createElement("Frame", {
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, {
        Header = v0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_HeaderFrameHeight_0), 
            BackgroundTransparency = 1
        }, {
            [l_ChartHeaderNames_0[1]] = v0.createElement(v3, {
                text = l_ChartHeaderNames_0[1], 
                size = UDim2.new(1 - l_ValueCellWidth_0, -l_CellPadding_0 - l_ExpandArrowPadding_0, 1, 0), 
                pos = UDim2.new(0, l_CellPadding_0 + l_ExpandArrowPadding_0, 0, 0)
            }), 
            [l_ChartHeaderNames_0[2]] = v0.createElement(v3, {
                text = l_ChartHeaderNames_0[2], 
                size = UDim2.new(l_ValueCellWidth_0, -l_CellPadding_0, 1, 0), 
                pos = UDim2.new(1 - l_ValueCellWidth_0, l_CellPadding_0, 0, 0)
            }), 
            upperHorizontalLine = v0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            }), 
            VerticalLine = v0.createElement("Frame", {
                Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
                Position = UDim2.new(1 - l_ValueCellWidth_0, 0, 0, 0), 
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
        mainFrame = v0.createElement("ScrollingFrame", {
            Position = UDim2.new(0, 0, 0, l_HeaderFrameHeight_0), 
            Size = UDim2.new(1, 0, 1, -l_HeaderFrameHeight_0), 
            CanvasSize = UDim2.new(1, 0, 0, v44 * l_EntryFrameHeight_0 + v45 * l_LineGraphHeight_0), 
            ScrollBarThickness = 5, 
            BackgroundTransparency = 1
        }, v37)
    });
end;
return v2(v18, "ServerStatsData");
