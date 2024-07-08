local v0 = require(game:GetService("CorePackages").Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v2 = require(l_Components_0.CellLabel);
local v3 = require(l_Components_0.BannerButton);
local _ = require(script.Parent.LuauHeapTypes);
local v5 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v5.GeneralFormatting.LineWidth;
local l_LineColor_0 = v5.GeneralFormatting.LineColor;
local l_RefEntryFrameHeight_0 = v5.LuauHeapFormatting.RefEntryFrameHeight;
local _ = v5.LuauHeapFormatting.DepthIndent;
local l_ValueCellWidth_0 = v5.LuauHeapFormatting.ValueCellWidth;
local l_CellPadding_0 = v5.LuauHeapFormatting.CellPadding;
local l_ValuePadding_0 = v5.LuauHeapFormatting.ValuePadding;
local v13 = require(script.Parent.LuauHeapViewPathEntry);
local v14 = v0.PureComponent:extend("LuauHeapViewRefEntry");
local function v16(v15)
    return v0.createFragment({
        Label = v0.createElement(v2, {
            text = v15.text, 
            size = v15.size, 
            pos = v15.pos, 
            richText = true
        }), 
        LeftBorder = v0.createElement("Frame", {
            Size = UDim2.new(UDim.new(0, l_LineWidth_0), v15.size.Y), 
            Position = UDim2.fromOffset(-l_ValuePadding_0, 0) + v15.pos, 
            AnchorPoint = Vector2.new(0, 0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        })
    });
end;
v14.init = function(v17)
    v17.state = {
        expanded = false
    };
    v17.onButtonPress = function()
        v17:setState(function(v18)
            return {
                expanded = not v18.expanded
            };
        end);
    end;
end;
v14.renderValues = function(_, v20)
    local v21 = {};
    local v22 = UDim2.new(l_ValueCellWidth_0, -l_ValuePadding_0, 0, l_RefEntryFrameHeight_0);
    local v23 = UDim2.new(1 - l_ValueCellWidth_0 * #v20, l_ValuePadding_0, 0, 0);
    for v24, v25 in v20, nil, nil do
        v21[tostring(v24)] = v0.createElement(v16, {
            text = tostring(v25), 
            size = v22, 
            pos = v23 + UDim2.fromScale(l_ValueCellWidth_0 * (v24 - 1), 0)
        });
    end;
    return v21;
end;
v14.renderChildren = function(v26, v27)
    local v28 = {};
    if not ((not v26.state.expanded or not v27) or not #v27) then
        for v29, v30 in ipairs(v27) do
            v28[v29] = v0.createElement(v13, {
                layoutOrder = v29, 
                depth = 1, 
                name = ("Path #%*"):format(v29), 
                data = v30
            });
        end;
    end;
    return v28;
end;
v14.render = function(v31)
    local l_props_0 = v31.props;
    local v33 = l_props_0.size or UDim2.new(1, 0, 0, l_RefEntryFrameHeight_0);
    local v34 = l_props_0.layoutOrder or 0;
    local l_data_0 = l_props_0.data;
    local v36 = {
        ("%*"):format(l_data_0.Count), 
        (("%*"):format(l_data_0.Instances))
    };
    return v0.createElement("Frame", {
        Size = v33, 
        BackgroundTransparency = 1, 
        LayoutOrder = v34, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        layout = v0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        button = v0.createElement(v3, {
            size = UDim2.new(1, 0, 0, l_RefEntryFrameHeight_0), 
            inset = 0, 
            isExpanded = v31.state.expanded, 
            isExpandable = l_data_0.Paths and #l_data_0.Paths ~= 0, 
            onButtonPress = v31.onButtonPress, 
            layoutOrder = -1
        }, {
            name = v0.createElement(v2, {
                text = l_data_0.Name, 
                size = UDim2.new(UDim.new(1 - l_ValueCellWidth_0 * #v36, 0), UDim.new(1, 0)), 
                pos = UDim2.new(0, l_CellPadding_0, 0, 0)
            }), 
            values = v0.createFragment(v31:renderValues(v36))
        }), 
        children = v0.createFragment(v31:renderChildren(l_data_0.Paths))
    });
end;
return v14;
