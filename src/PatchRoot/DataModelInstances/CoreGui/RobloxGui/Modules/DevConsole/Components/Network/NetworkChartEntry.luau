local v0 = require(game:GetService("CorePackages").Roact);
local v1 = require(script.Parent.Parent.Parent.Constants);
local l_EntryFrameHeight_0 = v1.NetworkFormatting.EntryFrameHeight;
local l_LineWidth_0 = v1.GeneralFormatting.LineWidth;
local l_LineColor_0 = v1.GeneralFormatting.LineColor;
local l_ResponseStrHeight_0 = v1.NetworkFormatting.ResponseStrHeight;
local l_ResponseWidthRatio_0 = v1.NetworkFormatting.ResponseWidthRatio;
local v7 = (1 - l_ResponseWidthRatio_0) / 2;
local v8 = (1 - l_ResponseWidthRatio_0) / 4;
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v10 = require(l_Components_0.CellLabel);
local v11 = require(l_Components_0.HeaderButton);
local v12 = require(l_Components_0.BannerButton);
return function(v13)
    local l_size_0 = v13.size;
    local l_entry_0 = v13.entry;
    local l_entryCellSize_0 = v13.entryCellSize;
    local l_cellOffset_0 = v13.cellOffset;
    local l_verticalOffsets_0 = v13.verticalOffsets;
    local l_layoutOrder_0 = v13.layoutOrder;
    local l_showResponse_0 = v13.showResponse;
    local l_responseBodyHeight_0 = v13.responseBodyHeight;
    local l_onButtonPress_0 = v13.onButtonPress;
    local v23 = {
        Num = v0.createElement(v10, {
            text = l_entry_0.Num, 
            size = l_entryCellSize_0[1], 
            pos = l_cellOffset_0[1]
        }), 
        Method = v0.createElement(v10, {
            text = l_entry_0.Method, 
            size = l_entryCellSize_0[2], 
            pos = l_cellOffset_0[2]
        }), 
        Status = v0.createElement(v10, {
            text = l_entry_0.Status, 
            size = l_entryCellSize_0[3], 
            pos = l_cellOffset_0[3]
        }), 
        Time = v0.createElement(v10, {
            text = string.format("%.3f", l_entry_0.Time), 
            size = l_entryCellSize_0[4], 
            pos = l_cellOffset_0[4]
        }), 
        RequestType = v0.createElement(v10, {
            text = l_entry_0.RequestType, 
            size = l_entryCellSize_0[5], 
            pos = l_cellOffset_0[5]
        }), 
        Url = v0.createElement(v10, {
            text = l_entry_0.Url, 
            size = l_entryCellSize_0[6], 
            pos = l_cellOffset_0[6]
        }), 
        LowerHorizontalLine = v0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 1), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        })
    };
    for v24 = 2, #l_verticalOffsets_0 do
        v23[string.format("VerticalLine_%d", v24)] = v0.createElement("Frame", {
            Size = UDim2.new(0, l_LineWidth_0, 0, l_EntryFrameHeight_0), 
            Position = l_verticalOffsets_0[v24], 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        });
    end;
    return v0.createElement("Frame", {
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, {
        Button = v0.createElement(v12, {
            size = UDim2.new(1, 0, 0, l_EntryFrameHeight_0), 
            pos = UDim2.new(), 
            isExpanded = l_showResponse_0, 
            onButtonPress = l_onButtonPress_0
        }, v23), 
        Response = l_showResponse_0 and v0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_responseBodyHeight_0), 
            Position = UDim2.new(v7, 0, 0, l_EntryFrameHeight_0), 
            BackgroundTransparency = 1
        }, {
            Text = v0.createElement(v11, {
                text = "Response Body:", 
                size = UDim2.new(1, 0, 0, l_ResponseStrHeight_0), 
                pos = UDim2.new(-v8, 0, 0, 0)
            }), 
            ResponseBody = v0.createElement(v10, {
                text = l_entry_0.Response, 
                size = UDim2.new(0.8, 0, 1, -l_ResponseStrHeight_0), 
                pos = UDim2.new(0, 0, 0, l_ResponseStrHeight_0)
            })
        })
    });
end;
