local v0 = require(game:GetService("CorePackages").Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v2 = require(l_Components_0.CellLabel);
local v3 = require(l_Components_0.BannerButton);
local _ = require(script.Parent.LuauHeapTypes);
local v5 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v5.GeneralFormatting.LineWidth;
local l_LineColor_0 = v5.GeneralFormatting.LineColor;
local l_StatEntryFrameHeight_0 = v5.LuauHeapFormatting.StatEntryFrameHeight;
local _ = v5.LuauHeapFormatting.DepthIndent;
local l_ValueCellWidth_0 = v5.LuauHeapFormatting.ValueCellWidth;
local l_CellPadding_0 = v5.LuauHeapFormatting.CellPadding;
local l_ValuePadding_0 = v5.LuauHeapFormatting.ValuePadding;
local v13 = v0.PureComponent:extend("LuauHeapViewStatEntry");
local function v15(v14)
    return v0.createFragment({
        Label = v0.createElement(v2, {
            text = v14.text, 
            size = v14.size, 
            pos = v14.pos, 
            richText = true
        }), 
        LeftBorder = v0.createElement("Frame", {
            Size = UDim2.new(UDim.new(0, l_LineWidth_0), v14.size.Y), 
            Position = UDim2.fromOffset(-l_ValuePadding_0, 0) + v14.pos, 
            AnchorPoint = Vector2.new(0, 0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        })
    });
end;
v13.renderValues = function(_, v17)
    local v18 = {};
    local v19 = UDim2.new(l_ValueCellWidth_0, -l_ValuePadding_0, 0, l_StatEntryFrameHeight_0);
    local v20 = UDim2.new(1 - l_ValueCellWidth_0 * #v17, l_ValuePadding_0, 0, 0);
    for v21, v22 in v17, nil, nil do
        v18[tostring(v21)] = v0.createElement(v15, {
            text = tostring(v22), 
            size = v19, 
            pos = v20 + UDim2.fromScale(l_ValueCellWidth_0 * (v21 - 1), 0)
        });
    end;
    return v18;
end;
v13.render = function(v23)
    local l_props_0 = v23.props;
    local v25 = l_props_0.size or UDim2.new(1, 0, 0, l_StatEntryFrameHeight_0);
    local v26 = l_props_0.layoutOrder or 0;
    local l_data_0 = l_props_0.data;
    local l_compare_0 = l_props_0.compare;
    local v29 = string.format("%.0f", l_data_0.Size);
    local v30 = string.format("%.0f", l_data_0.Count);
    if l_compare_0 then
        if l_compare_0.Size ~= l_data_0.Size then
            v29 = string.format("%d <font color=\"#%s\">(%s%d)</font>", l_data_0.Size, l_data_0.Size < l_compare_0.Size and "0f0" or "f00", l_data_0.Size < l_compare_0.Size and "" or "+", l_data_0.Size - l_compare_0.Size);
        end;
        if l_compare_0.Count ~= l_data_0.Count then
            v30 = string.format("%d <font color=\"#%s\">(%s%d)</font>", l_data_0.Count, l_data_0.Count < l_compare_0.Count and "0f0" or "f00", l_data_0.Count < l_compare_0.Count and "" or "+", l_data_0.Count - l_compare_0.Count);
        end;
    end;
    local v31 = {
        v29, 
        v30
    };
    return v0.createElement("Frame", {
        Size = v25, 
        BackgroundTransparency = 1, 
        LayoutOrder = v26, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        layout = v0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        button = v0.createElement(v3, {
            size = UDim2.new(1, 0, 0, l_StatEntryFrameHeight_0), 
            inset = 0, 
            isExpanded = false, 
            isExpandable = false, 
            layoutOrder = -1
        }, {
            name = v0.createElement(v2, {
                text = l_data_0.Name, 
                size = UDim2.new(UDim.new(1 - l_ValueCellWidth_0 * #v31, 0), UDim.new(1, 0)), 
                pos = UDim2.new(0, l_CellPadding_0, 0, 0)
            }), 
            values = v0.createFragment(v23:renderValues(v31))
        })
    });
end;
return v13;
