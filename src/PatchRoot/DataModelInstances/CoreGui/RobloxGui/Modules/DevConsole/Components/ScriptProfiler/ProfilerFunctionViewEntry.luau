local v0 = require(game:GetService("CorePackages").Roact);
local v1 = require(script.Parent.ProfilerUtil);
local _ = v1.getDurations;
local _ = v1.getSourceName;
local _ = v1.getLine;
local l_getNativeFlag_0 = v1.getNativeFlag;
local l_getPluginFlag_0 = v1.getPluginFlag;
local _ = v1.standardizeChildren;
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v9 = require(l_Components_0.CellLabel);
local v10 = require(l_Components_0.BannerButton);
local v11 = require(l_Components_0.Tooltip);
local v12 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v12.GeneralFormatting.LineWidth;
local l_LineColor_0 = v12.GeneralFormatting.LineColor;
local l_EntryFrameHeight_0 = v12.GeneralFormatting.EntryFrameHeight;
local _ = v12.ScriptProfilerFormatting.DepthIndent;
local l_ValueCellWidth_0 = v12.ScriptProfilerFormatting.ValueCellWidth;
local l_CellPadding_0 = v12.ScriptProfilerFormatting.CellPadding;
local l_ValuePadding_0 = v12.ScriptProfilerFormatting.ValuePadding;
local v20 = v0.PureComponent:extend("ProfilerFunctionViewEntry");
local v21 = game:DefineFastFlag("ScriptProfilerFunctionsViewUseSourceInfoForAnon", false);
local v22 = game:DefineFastFlag("ScriptProfilerPluginAnnotation", false);
local v23 = game:DefineFastFlag("ScriptProfilerHideGCOverhead2", false);
local function v25(v24)
    return v0.createFragment({
        Label = v0.createElement(v9, {
            text = v24.text, 
            size = v24.size, 
            pos = v24.pos
        }), 
        LeftBorder = v0.createElement("Frame", {
            Size = UDim2.new(UDim.new(0, l_LineWidth_0), v24.size.Y), 
            Position = UDim2.fromOffset(-l_ValuePadding_0, 0) + v24.pos, 
            AnchorPoint = Vector2.new(0, 0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        })
    });
end;
v20.init = function(v26)
    v26.state = {
        expanded = v26.props.depth == 0, 
        showTooltip = false, 
        tooltipPos = UDim2.fromOffset(0, 0)
    };
    v26.onButtonPress = function()
        v26:setState(function(_)
            return {
                expanded = not v26.state.expanded
            };
        end);
    end;
    v26.onMouseEnter = function(_, v29, v30)
        v26:setState({
            showTooltip = true, 
            tooltipPos = UDim2.fromOffset(v29, v30)
        });
    end;
    v26.onMouseMove = function(_, v32, v33)
        v26:setState({
            showTooltip = true, 
            tooltipPos = UDim2.fromOffset(v32, v33)
        });
    end;
    v26.onMouseLeave = function()
        v26:setState({
            showTooltip = false
        });
    end;
end;
v20.renderValues = function(_, v35)
    local v36 = {};
    local v37 = UDim2.new(l_ValueCellWidth_0, -l_ValuePadding_0, 0, l_EntryFrameHeight_0);
    local v38 = UDim2.new(1 - l_ValueCellWidth_0 * #v35, l_ValuePadding_0, 0, 0);
    for v39, v40 in ipairs(v35) do
        v36[tostring(v39)] = v0.createElement(v25, {
            text = tostring(v40), 
            size = v37, 
            pos = v38 + UDim2.fromScale(l_ValueCellWidth_0 * (v39 - 1), 0)
        });
    end;
    return v36;
end;
v20.render = function(v41)
    local l_props_0 = v41.props;
    local v43 = l_props_0.size or UDim2.new(1, 0, 0, l_EntryFrameHeight_0);
    local v44 = l_props_0.layoutOrder or 0;
    local l_percentageRatio_0 = l_props_0.percentageRatio;
    local l_data_0 = l_props_0.data;
    local v47 = l_data_0.Functions[l_props_0.functionId];
    local v48 = v47.TotalDuration / v41.props.average;
    if v23 then
        v48 = v48 - (v41.props.gcOffset or 0);
    end;
    local v49 = l_getNativeFlag_0(l_data_0, v47);
    local v50 = l_getPluginFlag_0(l_data_0, v47);
    local _ = nil;
    local v52 = {
        if not l_percentageRatio_0 then string.format("%.3f", v48 * 1000) else l_percentageRatio_0 == 0 and "N/A" or string.format("%.3f%%", v48 / l_percentageRatio_0)
    };
    local l_nodeName_0 = l_props_0.nodeName;
    if not l_nodeName_0 or #l_nodeName_0 == 0 then
        l_nodeName_0 = "<anonymous>";
    end;
    local v54 = v1.getSourceLocationString(l_data_0, v47, l_nodeName_0);
    if v21 and l_nodeName_0 == "<anonymous>" then
        l_nodeName_0 = v54;
        v54 = "";
    end;
    if not (not v22 or not v50) then
        l_nodeName_0 = l_nodeName_0 .. " <plugin>";
    end;
    if v49 then
        l_nodeName_0 = l_nodeName_0 .. " <native>";
    end;
    return v0.createElement("Frame", {
        Size = v43, 
        BackgroundTransparency = 1, 
        LayoutOrder = v44, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        tooltip = if not v41.state.showTooltip then nil else v0.createElement(v11, {
            text = v54, 
            pos = v41.state.tooltipPos
        }), 
        layout = v0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        button = v0.createElement(v10, {
            size = UDim2.new(1, 0, 0, l_EntryFrameHeight_0), 
            inset = 0, 
            isExpanded = v41.state.expanded, 
            isExpandable = false, 
            onButtonPress = v41.onButtonPress, 
            onMouseEnter = v41.onMouseEnter, 
            onMouseLeave = v41.onMouseLeave, 
            onMouseMove = v41.onMouseMove, 
            layoutOrder = -1
        }, {
            name = v0.createElement(v9, {
                text = l_nodeName_0, 
                size = UDim2.new(UDim.new(1 - l_ValueCellWidth_0 * #v52, 0), UDim.new(1, 0)), 
                pos = UDim2.new(0, l_CellPadding_0 + 0, 0, 0)
            }), 
            values = v0.createFragment(v41:renderValues(v52))
        })
    });
end;
return v20;
