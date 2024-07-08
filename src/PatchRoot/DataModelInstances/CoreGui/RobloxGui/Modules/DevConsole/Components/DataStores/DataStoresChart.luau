local v0 = require(game:GetService("CorePackages").Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v2 = require(l_Components_0.DataConsumer);
local v3 = require(l_Components_0.CellLabel);
local v4 = require(l_Components_0.BannerButton);
local v5 = require(l_Components_0.LineGraph);
local v6 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v6.GeneralFormatting.LineWidth;
local l_LineColor_0 = v6.GeneralFormatting.LineColor;
local l_ChartHeaderNames_0 = v6.DataStoresFormatting.ChartHeaderNames;
local l_ValueCellWidth_0 = v6.DataStoresFormatting.ValueCellWidth;
local l_CellPadding_0 = v6.DataStoresFormatting.CellPadding;
local l_ExpandArrowPadding_0 = v6.DataStoresFormatting.ExpandArrowPadding;
local l_HeaderFrameHeight_0 = v6.DataStoresFormatting.HeaderFrameHeight;
local l_EntryFrameHeight_0 = v6.DataStoresFormatting.EntryFrameHeight;
local l_LineGraphHeight_0 = v6.GeneralFormatting.LineGraphHeight;
local l_NoResultSearchStr_0 = v6.GeneralFormatting.NoResultSearchStr;
local v17 = require(script.Parent.Parent.Parent.Util.convertTimeStamp);
local v18 = v0.Component:extend("DataStoresChart");
local function v20(v19)
    return v19.time;
end;
local function v22(v21)
    return v21.value;
end;
local function v24(v23)
    return (math.ceil(v23));
end;
v18.init = function(v25, v26)
    local v27, v28 = v26.DataStoresData:getCurrentData();
    v25.getOnButtonPress = function(v29)
        return function(_, _)
            local l_v25_0 = v25;
            local v33 = {};
            local v34 = false;
            if v25.state.expandedEntry ~= v29 then
                v34 = v29;
            end;
            v33.expandedEntry = v34;
            l_v25_0:setState(v33);
        end;
    end;
    v25.state = {
        dataStoresData = v27, 
        dataStoresDataCount = v28, 
        expandedEntry = nil
    };
end;
v18.didMount = function(v35)
    v35.statsConnector = v35.props.DataStoresData:Signal():Connect(function(v36, v37)
        v35:setState({
            dataStoresData = v36, 
            dataStoresDataCount = v37
        });
    end);
end;
v18.willUnmount = function(v38)
    v38.statsConnector:Disconnect();
    v38.statsConnector = nil;
end;
v18.render = function(v39)
    local v40 = {};
    local l_searchTerm_0 = v39.props.searchTerm;
    local l_size_0 = v39.props.size;
    local l_layoutOrder_0 = v39.props.layoutOrder;
    local l_expandedEntry_0 = v39.state.expandedEntry;
    v40.UIListLayout = v0.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        SortOrder = Enum.SortOrder.LayoutOrder
    });
    local l_l_HeaderFrameHeight_0_0 = l_HeaderFrameHeight_0;
    local l_dataStoresData_0 = v39.state.dataStoresData;
    local v47 = 0;
    local v48 = 1;
    if l_dataStoresData_0 then
        for v49, v50 in pairs(l_dataStoresData_0) do
            v47 = v47 + 1;
            if not l_searchTerm_0 or string.find(v49:lower(), l_searchTerm_0:lower()) ~= nil then
                v48 = v48 + 1;
                local v51 = l_expandedEntry_0 == v49;
                v40[v49] = v0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, not not v51 and l_EntryFrameHeight_0 + l_LineGraphHeight_0 or l_EntryFrameHeight_0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v48
                }, {
                    DataButton = v0.createElement(v4, {
                        size = UDim2.new(1, 0, 0, l_EntryFrameHeight_0), 
                        pos = UDim2.new(), 
                        isExpanded = v51, 
                        onButtonPress = v39.getOnButtonPress(v49)
                    }, {
                        [v49] = v0.createElement(v3, {
                            text = v49, 
                            size = UDim2.new(1 - l_ValueCellWidth_0, -l_CellPadding_0 - l_ExpandArrowPadding_0, 1, 0), 
                            pos = UDim2.new(0, l_CellPadding_0 + l_ExpandArrowPadding_0, 0, 0)
                        }), 
                        Data = v0.createElement(v3, {
                            text = v50.dataSet:back().value, 
                            size = UDim2.new(l_ValueCellWidth_0, -l_CellPadding_0, 1, 0), 
                            pos = UDim2.new(1 - l_ValueCellWidth_0, l_CellPadding_0, 0, 0)
                        }), 
                        VerticalLine = v0.createElement("Frame", {
                            Size = UDim2.new(0, l_LineWidth_0, 0, l_EntryFrameHeight_0), 
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
                    Graph = v51 and v0.createElement(v5, {
                        pos = UDim2.new(0, 0, 0, l_EntryFrameHeight_0), 
                        size = UDim2.new(1, 0, 1, -l_EntryFrameHeight_0), 
                        graphData = v50.dataSet, 
                        maxY = v50.max, 
                        minY = v50.min, 
                        getX = v20, 
                        getY = v22, 
                        axisLabelX = "Timestamp", 
                        axisLabelY = v49, 
                        stringFormatX = v17, 
                        stringFormatY = v24
                    })
                });
                l_l_HeaderFrameHeight_0_0 = l_l_HeaderFrameHeight_0_0 + l_EntryFrameHeight_0;
            end;
        end;
    end;
    if v48 == 1 then
        if v47 == 0 then
            return v0.createElement("TextLabel", {
                Size = l_size_0, 
                Text = "Initialize DataStoresService to view DataStore Budget.", 
                TextColor3 = v6.Color.Text, 
                BackgroundTransparency = 1, 
                LayoutOrder = l_layoutOrder_0
            });
        else
            v40.emptyResult = v0.createElement("TextLabel", {
                Size = l_size_0, 
                Text = string.format(l_NoResultSearchStr_0, l_searchTerm_0), 
                TextColor3 = v6.Color.Text, 
                BackgroundTransparency = 1
            });
        end;
    end;
    return v0.createElement("Frame", {
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, {
        Header = v0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_HeaderFrameHeight_0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
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
            vertical = v0.createElement("Frame", {
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
            ScrollBarThickness = 5, 
            CanvasSize = UDim2.new(1, 0, 0, l_l_HeaderFrameHeight_0_0), 
            BackgroundTransparency = 1
        }, v40)
    });
end;
return v2(v18, "DataStoresData");
