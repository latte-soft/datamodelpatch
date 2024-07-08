local v0 = require(game:GetService("CorePackages").Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v2 = require(l_Components_0.CellLabel);
local v3 = require(l_Components_0.BannerButton);
local v4 = require(l_Components_0.Tooltip);
local _ = require(script.Parent.LuauHeapTypes);
local v6 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v6.GeneralFormatting.LineWidth;
local l_LineColor_0 = v6.GeneralFormatting.LineColor;
local l_GraphEntryFrameHeight_0 = v6.LuauHeapFormatting.GraphEntryFrameHeight;
local l_DepthIndent_0 = v6.LuauHeapFormatting.DepthIndent;
local l_ValueCellWidth_0 = v6.LuauHeapFormatting.ValueCellWidth;
local l_CellPadding_0 = v6.LuauHeapFormatting.CellPadding;
local l_ValuePadding_0 = v6.LuauHeapFormatting.ValuePadding;
local v14 = v0.PureComponent:extend("LuauHeapViewEntry");
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
        expanded = v17.props.depth == 0, 
        expandedEllipsis = false, 
        showTooltip = false, 
        tooltipPos = UDim2.fromOffset(0, 0)
    };
    v17.onButtonPress = function()
        v17:setState(function(v18)
            return {
                expanded = not v18.expanded
            };
        end);
    end;
    v17.onExpandEllipsis = function()
        v17:setState({
            expandedEllipsis = true
        });
    end;
    v17.onMouseEnter = function(_, v20, v21)
        v17:setState({
            showTooltip = true, 
            tooltipPos = UDim2.fromOffset(v20, v21)
        });
    end;
    v17.onMouseMove = function(_, v23, v24)
        v17:setState({
            showTooltip = true, 
            tooltipPos = UDim2.fromOffset(v23, v24)
        });
    end;
    v17.onMouseLeave = function()
        v17:setState({
            showTooltip = false
        });
    end;
end;
v14.renderChildren = function(v25, v26, v27)
    if v25.state.expanded then
        local v28 = true;
        if #v26 == 0 then
            v28 = false;
            if v27 ~= nil then
                v28 = #v27 ~= 0;
            end;
        end;
        if v28 then
            local v29 = {};
            local l_TotalSize_0 = v25.props.data.TotalSize;
            local v31 = v25.props.depth + 1;
            local v32 = 0;
            local v33 = 0;
            local v34 = 0;
            local _ = function(v35)
                if v27 then
                    for _, v37 in ipairs(v27) do
                        if v35.Name == v37.Name then
                            return v37;
                        end;
                    end;
                end;
                return nil;
            end;
            for _, v40 in ipairs(v26) do
                local v41;
                if v27 then
                    for _, v43 in ipairs(v27) do
                        if v40.Name == v43.Name then
                            v41 = v43;
                            goto label0 --[[  true, false  ]];
                        end;
                    end;
                end;
                v41 = nil;
                ::label0::;
                if not (v40.TotalSize <= 128 and #v26 > 4) or v25.state.expandedEllipsis then
                    v34 = v34 + 1;
                    v29[v34] = v0.createElement(v14, {
                        layoutOrder = l_TotalSize_0 - v40.TotalSize, 
                        depth = v31, 
                        data = v40, 
                        compare = v41
                    });
                else
                    v32 = v32 + v40.TotalSize;
                    if v41 then
                        v33 = v33 + v41.TotalSize;
                    end;
                end;
            end;
            if v32 > 0 then
                v34 = v34 + 1;
                v29[v34] = v0.createElement(v14, {
                    layoutOrder = l_TotalSize_0, 
                    depth = v31, 
                    data = {
                        Size = v32, 
                        TotalSize = v32, 
                        Name = "...", 
                        Children = {}
                    }, 
                    compare = if not v27 then nil else {
                        Size = v33, 
                        TotalSize = v33, 
                        Name = "...", 
                        Children = {}
                    }, 
                    customButtonPress = v25.onExpandEllipsis
                });
            end;
            if v27 then
                for _, v45 in ipairs(v27) do
                    local v46 = false;
                    for _, v48 in ipairs(v26) do
                        if v48.Name == v45.Name then
                            v46 = true;
                            break;
                        end;
                    end;
                    if not v46 then
                        local v49 = {
                            Size = 0, 
                            TotalSize = 0, 
                            Name = v45.Name, 
                            Source = v45.Source, 
                            Children = {}
                        };
                        v34 = v34 + 1;
                        v29[v34] = v0.createElement(v14, {
                            layoutOrder = l_TotalSize_0, 
                            depth = v31, 
                            data = v49, 
                            compare = v45
                        });
                    end;
                end;
            end;
            return v29;
        else
            return {};
        end;
    else
        return {};
    end;
end;
v14.renderValues = function(_, v51)
    local v52 = {};
    local v53 = UDim2.new(l_ValueCellWidth_0, -l_ValuePadding_0, 0, l_GraphEntryFrameHeight_0);
    local v54 = UDim2.new(1 - l_ValueCellWidth_0 * #v51, l_ValuePadding_0, 0, 0);
    for v55, v56 in ipairs(v51) do
        v52[tostring(v55)] = v0.createElement(v16, {
            text = tostring(v56), 
            size = v53, 
            pos = v54 + UDim2.fromScale(l_ValueCellWidth_0 * (v55 - 1), 0)
        });
    end;
    return v52;
end;
v14.render = function(v57)
    local l_props_0 = v57.props;
    local v59 = l_props_0.size or UDim2.new(1, 0, 0, l_GraphEntryFrameHeight_0);
    local l_depth_0 = l_props_0.depth;
    local v61 = l_props_0.layoutOrder or 0;
    local v62 = l_depth_0 * l_DepthIndent_0;
    local l_data_0 = l_props_0.data;
    local l_compare_0 = l_props_0.compare;
    local _ = "";
    local _ = "";
    local v67 = {
        if not not l_compare_0 and l_compare_0.TotalSize ~= l_data_0.TotalSize then string.format("%d <font color=\"#%s\">(%s%d)</font>", l_data_0.TotalSize, l_data_0.TotalSize < l_compare_0.TotalSize and "0f0" or "f00", l_data_0.TotalSize < l_compare_0.TotalSize and "" or "+", l_data_0.TotalSize - l_compare_0.TotalSize) else string.format("%.0f", l_data_0.TotalSize), 
        if not not l_compare_0 and l_compare_0.Size ~= l_data_0.Size then string.format("%d <font color=\"#%s\">(%s%d)</font>", l_data_0.Size, l_data_0.Size < l_compare_0.Size and "0f0" or "f00", l_data_0.Size < l_compare_0.Size and "" or "+", l_data_0.Size - l_compare_0.Size) else string.format("%.0f", l_data_0.Size)
    };
    local v68 = if not l_data_0.Name or #l_data_0.Name == 0 then l_depth_0 == 0 and "<root>" or "<anonymous>" else l_data_0.Name;
    local v69 = if not l_data_0.Source or #l_data_0.Source == 0 then v68 else l_data_0.Source;
    local v70 = UDim.new(1 - l_ValueCellWidth_0 * #v67, -(l_CellPadding_0 + v62));
    local v71 = true;
    if #l_data_0.Children == 0 then
        if l_compare_0 ~= nil then
            v71 = true;
            if not (#l_compare_0.Children == 0) then
                goto label1;
            end;
        end;
        v71 = l_props_0.customButtonPress ~= nil;
    end;
    ::label1::;
    return v0.createElement("Frame", {
        Size = v59, 
        BackgroundTransparency = 1, 
        LayoutOrder = v61, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        tooltip = if not v57.state.showTooltip then nil else v0.createElement(v4, {
            text = v69, 
            pos = v57.state.tooltipPos
        }), 
        layout = v0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        button = v0.createElement(v3, {
            size = UDim2.new(1, 0, 0, l_GraphEntryFrameHeight_0), 
            inset = v62, 
            isExpanded = v57.state.expanded, 
            isExpandable = v71, 
            onButtonPress = if not l_props_0.customButtonPress then v57.onButtonPress else l_props_0.customButtonPress, 
            onMouseEnter = v57.onMouseEnter, 
            onMouseLeave = v57.onMouseLeave, 
            onMouseMove = v57.onMouseMove, 
            layoutOrder = -1
        }, {
            name = v0.createElement(v2, {
                text = v68, 
                size = UDim2.new(v70, UDim.new(1, 0)), 
                pos = UDim2.new(0, l_CellPadding_0 + v62, 0, 0)
            }), 
            values = v0.createFragment(v57:renderValues(v67))
        }), 
        children = v0.createFragment(v57:renderChildren(l_data_0.Children, if not l_compare_0 then nil else l_compare_0.Children))
    });
end;
return v14;
