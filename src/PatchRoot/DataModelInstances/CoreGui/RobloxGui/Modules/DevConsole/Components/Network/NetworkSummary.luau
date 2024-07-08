local v0 = require(game:GetService("CorePackages").Roact);
local v1 = require(script.Parent.Parent.Parent.Constants);
local l_SummaryHeaderNames_0 = v1.NetworkFormatting.SummaryHeaderNames;
local l_SummaryCellWidths_0 = v1.NetworkFormatting.SummaryCellWidths;
local l_HeaderFrameHeight_0 = v1.NetworkFormatting.HeaderFrameHeight;
local l_EntryFrameHeight_0 = v1.NetworkFormatting.EntryFrameHeight;
local l_LineWidth_0 = v1.GeneralFormatting.LineWidth;
local l_LineColor_0 = v1.GeneralFormatting.LineColor;
local l_CellPadding_0 = v1.NetworkFormatting.CellPadding;
local l_Text_0 = v1.Color.Text;
local v10 = require(script.Parent.Parent.Parent.Components.CellLabel);
local v11 = require(script.Parent.Parent.Parent.Components.HeaderButton);
local v12 = 0;
for _, v14 in pairs(l_SummaryCellWidths_0) do
    v12 = v12 + v14;
end;
local v15 = -v12;
local v16 = {};
local v17 = {};
local v18 = {};
table.insert(v16, UDim2.new(0, l_CellPadding_0, 0, 0));
table.insert(v17, UDim2.new(1, -v12 - l_CellPadding_0, 0, l_HeaderFrameHeight_0));
table.insert(v18, UDim2.new(1, -v12 - l_CellPadding_0, 0, l_EntryFrameHeight_0));
for _, v20 in ipairs(l_SummaryCellWidths_0) do
    table.insert(v16, UDim2.new(1, v15 + l_CellPadding_0, 0, 0));
    table.insert(v17, UDim2.new(0, v20 - l_CellPadding_0, 0, l_HeaderFrameHeight_0));
    table.insert(v18, UDim2.new(0, v20 - l_CellPadding_0, 0, l_EntryFrameHeight_0));
    v15 = v15 + v20;
end;
local v21 = {};
for v22, v23 in ipairs(v16) do
    v21[v22] = UDim2.new(v23.X.Scale, v23.X.Offset - l_CellPadding_0, v23.Y.Scale, v23.Y.Offset);
end;
local v24 = v0.Component:extend("NetworkSummary");
v24.render = function(v25)
    local l_width_0 = v25.props.width;
    local v27 = v25.props.httpSummaryTable or {};
    local l_layoutOrder_0 = v25.props.layoutOrder;
    local v29 = {
        UIListLayout = v0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local v30 = {
        UpperHorizontalLine = v0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        }), 
        LowerHorizontalLine = v0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
            Position = UDim2.new(0, 0, 1, 0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        })
    };
    for v31 = 2, #v21 do
        v30[string.format("VerticalLine_%d", v31)] = v0.createElement("Frame", {
            Size = UDim2.new(0, l_LineWidth_0, 0, l_HeaderFrameHeight_0), 
            Position = v21[v31], 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        });
    end;
    for v32, v33 in ipairs(l_SummaryHeaderNames_0) do
        v30[v33] = v0.createElement(v11, {
            text = v33, 
            size = v17[v32], 
            pos = v16[v32]
        });
    end;
    v29.Header = v0.createElement("Frame", {
        Size = UDim2.new(0, l_width_0, 0, l_HeaderFrameHeight_0), 
        BackgroundTransparency = 1, 
        LayoutOrder = 1
    }, v30);
    local v34 = 0;
    for _, v36 in pairs(v27) do
        v34 = v34 + 1;
        local v37 = {
            RequestType = v0.createElement(v10, {
                text = v36.RequestType, 
                size = v17[1], 
                pos = v16[1]
            }), 
            RequestCount = v0.createElement(v10, {
                text = v36.RequestCount, 
                size = v17[2], 
                pos = v16[2]
            }), 
            FailedCount = v0.createElement(v10, {
                text = v36.FailedCount, 
                size = v17[3], 
                pos = v16[3]
            }), 
            AverageTime = v0.createElement(v10, {
                text = string.format("%.3f", v36.AverageTime), 
                size = v17[4], 
                pos = v16[4]
            }), 
            MinTime = v0.createElement(v10, {
                text = string.format("%.3f", v36.MinTime), 
                size = v17[5], 
                pos = v16[5]
            }), 
            MaxTime = v0.createElement(v10, {
                text = string.format("%.3f", v36.MaxTime), 
                size = v17[6], 
                pos = v16[6]
            }), 
            LowerHorizontalLine = v0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
                Position = UDim2.new(0, 0, 1, 0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            })
        };
        for v38 = 2, #v21 do
            v37[string.format("VerticalLine_%d", v38)] = v0.createElement("Frame", {
                Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
                Position = v21[v38], 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            });
        end;
        v29[v36.RequestType] = v0.createElement("Frame", {
            Size = UDim2.new(0, l_width_0, 0, l_EntryFrameHeight_0), 
            BackgroundTransparency = 1, 
            LayoutOrder = v34 + 1
        }, v37);
    end;
    if v34 == 0 then
        v29.Padding = v0.createElement("TextLabel", {
            Size = UDim2.new(0, l_width_0, 0, l_EntryFrameHeight_0), 
            Text = "No Summary Data Found", 
            TextColor3 = l_Text_0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        });
        v34 = 1;
    end;
    return v0.createElement("ScrollingFrame", {
        Size = UDim2.new(1, 0, 0, v34 * l_EntryFrameHeight_0 + l_HeaderFrameHeight_0), 
        ScrollingEnabled = false, 
        ScrollBarThickness = 0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, v29);
end;
return v24;
