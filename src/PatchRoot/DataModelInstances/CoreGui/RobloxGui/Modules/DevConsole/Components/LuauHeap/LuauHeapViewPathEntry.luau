local v0 = require(game:GetService("CorePackages").Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v2 = require(l_Components_0.CellLabel);
local v3 = require(l_Components_0.BannerButton);
local _ = require(script.Parent.LuauHeapTypes);
local v5 = require(script.Parent.Parent.Parent.Constants);
local _ = v5.GeneralFormatting.LineWidth;
local _ = v5.GeneralFormatting.LineColor;
local l_PathEntryFrameHeight_0 = v5.LuauHeapFormatting.PathEntryFrameHeight;
local l_DepthIndent_0 = v5.LuauHeapFormatting.DepthIndent;
local _ = v5.LuauHeapFormatting.ValueCellWidth;
local l_CellPadding_0 = v5.LuauHeapFormatting.CellPadding;
local _ = v5.LuauHeapFormatting.ValuePadding;
local v13 = v0.PureComponent:extend("LuauHeapViewPathEntry");
v13.init = function(v14)
    v14.state = {
        expanded = false
    };
    v14.onButtonPress = function()
        v14:setState(function(v15)
            return {
                expanded = not v15.expanded
            };
        end);
    end;
end;
v13.renderChildren = function(v16, v17)
    local v18 = {};
    local v19 = 2 * l_DepthIndent_0 + l_CellPadding_0;
    if not ((not v16.state.expanded or not v17) or not #v17) then
        for v20, v21 in ipairs(v17) do
            v18[v20] = v0.createElement(v2, {
                text = v21, 
                layoutOrder = v20, 
                size = UDim2.new(UDim.new(1, -v19), UDim.new(0, l_PathEntryFrameHeight_0)), 
                pos = UDim2.new(0, v19, 0, 0)
            });
        end;
    end;
    return v18;
end;
v13.render = function(v22)
    local l_props_0 = v22.props;
    local v24 = l_props_0.size or UDim2.new(1, 0, 0, l_PathEntryFrameHeight_0);
    local v25 = l_props_0.layoutOrder or 0;
    local l_name_0 = l_props_0.name;
    local l_data_0 = l_props_0.data;
    local v28 = l_props_0.depth * l_DepthIndent_0;
    return v0.createElement("Frame", {
        Size = v24, 
        BackgroundTransparency = 1, 
        LayoutOrder = v25, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        layout = v0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        button = v0.createElement(v3, {
            size = UDim2.new(1, 0, 0, l_PathEntryFrameHeight_0), 
            inset = v28, 
            isExpanded = v22.state.expanded, 
            isExpandable = #l_data_0 ~= 0, 
            onButtonPress = v22.onButtonPress, 
            layoutOrder = -1
        }, {
            name = v0.createElement(v2, {
                text = l_name_0, 
                size = UDim2.new(UDim.new(1, -v28), UDim.new(1, 0)), 
                pos = UDim2.new(0, l_CellPadding_0 + v28, 0, 0)
            })
        }), 
        children = v0.createFragment(v22:renderChildren(l_data_0))
    });
end;
return v13;
