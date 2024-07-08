local v0 = require(game:GetService("CorePackages").Roact);
local _ = require(script.Parent.ProfilerDataFormatV2);
local v2 = require(script.Parent.ProfilerUtil);
local l_getDurations_0 = v2.getDurations;
local l_formatSessionLength_0 = v2.formatSessionLength;
local l_getPluginFlag_0 = v2.getPluginFlag;
local v6 = require(script.Parent.Parent.Parent.Components.HeaderButton);
local v7 = require(script.Parent.ProfilerFunctionViewEntry);
local v8 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v8.GeneralFormatting.LineWidth;
local l_LineColor_0 = v8.GeneralFormatting.LineColor;
local l_HeaderFrameHeight_0 = v8.GeneralFormatting.HeaderFrameHeight;
local _ = v8.GeneralFormatting.EntryFrameHeight;
local _ = v8.GeneralFormatting.NoResultSearchStr;
local l_HeaderNames_0 = v8.ScriptProfilerFormatting.HeaderNames;
local l_ValueCellWidth_0 = v8.ScriptProfilerFormatting.ValueCellWidth;
local l_CellPadding_0 = v8.ScriptProfilerFormatting.CellPadding;
local l_ValuePadding_0 = v8.ScriptProfilerFormatting.ValuePadding;
local v18 = v0.PureComponent:extend("ProfilerView");
v18.renderChildren = function(v19)
    local l_data_0 = v19.props.data;
    assert(l_data_0.Version == 2);
    local v21 = l_getDurations_0(l_data_0, 0);
    local v22 = {};
    local l_searchFilter_0 = v19.props.searchFilter;
    local l_showPlugins_0 = v19.props.showPlugins;
    local l_showGC_0 = v19.props.showGC;
    local l_gcFunctionOffsets_0 = v19.props.gcFunctionOffsets;
    local v27 = 1;
    if not (not (v19.props.average > 0) or not v19.props.sessionLength) then
        v27 = (v19.props.sessionLength / 1000) / v19.props.average;
    end;
    for v28, v29 in ipairs(l_data_0.Functions) do
        if not (#l_searchFilter_0 > 0 and not l_searchFilter_0[v28] or not l_showPlugins_0 and l_getPluginFlag_0(l_data_0, v29)) then
            v22[v28] = v0.createElement(v7, {
                layoutOrder = (v21 - v29.TotalDuration) * 1000000, 
                data = l_data_0, 
                functionId = v28, 
                nodeName = v29.Name, 
                average = v27, 
                gcOffset = if l_showGC_0 then nil else l_gcFunctionOffsets_0[v28], 
                percentageRatio = if not v19.props.showAsPercentages then nil else v21 / 100
            });
        end;
    end;
    return v22;
end;
v18.render = function(v30)
    local l_layoutOrder_0 = v30.props.layoutOrder;
    local l_size_0 = v30.props.size;
    local v33 = nil;
    if not v30.props.profiling or v30.props.data then
        if not v30.props.data then
            v33 = v0.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                Text = "Start Profiling to View Data", 
                TextColor3 = v8.Color.Text, 
                BackgroundTransparency = 1, 
                LayoutOrder = l_layoutOrder_0
            });
        end;
    else
        v33 = v0.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            Text = "Press Stop to Finish Profiling", 
            TextColor3 = v8.Color.Text, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0
        });
    end;
    local v34;
    v34 = l_formatSessionLength_0(v30.props.sessionLength) and "Session Duration: " .. v34;
    return v0.createElement("Frame", {
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, {
        SessionInfo = v0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_HeaderFrameHeight_0), 
            BackgroundTransparency = 1
        }, {
            Name = v0.createElement(v6, {
                text = v34 or "Session Info", 
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
            Name = v0.createElement(v6, {
                text = l_HeaderNames_0[1], 
                size = UDim2.new(1 - l_ValueCellWidth_0 * 2, -l_ValuePadding_0 - l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
                pos = UDim2.new(0, l_CellPadding_0, 0, 0), 
                sortfunction = v30.onSortChanged
            }), 
            Inclusive = v0.createElement(v6, {
                text = l_HeaderNames_0[2], 
                size = UDim2.new(l_ValueCellWidth_0, -l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
                pos = UDim2.new(1 - l_ValueCellWidth_0 * 1, l_ValuePadding_0, 0, 0), 
                sortfunction = v30.onSortChanged
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
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Children = if not v33 then v0.createFragment(v30:renderChildren()) else v33
        })
    });
end;
return v18;
