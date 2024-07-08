local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local _ = require(script.Parent.ProfilerDataFormatV2);
local v4 = require(script.Parent.ProfilerUtil);
local l_getDurations_0 = v4.getDurations;
local l_getNativeFlag_0 = v4.getNativeFlag;
local l_getPluginFlag_0 = v4.getPluginFlag;
local l_standardizeChildren_0 = v4.standardizeChildren;
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v10 = require(l_Components_0.CellLabel);
local v11 = require(l_Components_0.BannerButton);
local v12 = require(l_Components_0.Tooltip);
local v13 = require(script.Parent.Parent.Parent.Actions.SetScriptProfilerRoot);
local v14 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v14.GeneralFormatting.LineWidth;
local l_LineColor_0 = v14.GeneralFormatting.LineColor;
local l_EntryFrameHeight_0 = v14.GeneralFormatting.EntryFrameHeight;
local l_DepthIndent_0 = v14.ScriptProfilerFormatting.DepthIndent;
local l_ValueCellWidth_0 = v14.ScriptProfilerFormatting.ValueCellWidth;
local l_CellPadding_0 = v14.ScriptProfilerFormatting.CellPadding;
local l_ValuePadding_0 = v14.ScriptProfilerFormatting.ValuePadding;
local v22 = game:DefineFastFlag("ScriptProfilerRememberExpandedNodes2", false);
local v23 = game:DefineFastFlag("ScriptProfilerPluginAnnotation", false);
local v24 = game:DefineFastFlag("ScriptProfilerSetTerminalRootFix", false);
local v25 = game:DefineFastFlag("ScriptProfilerHideGCOverhead2", false);
local v26 = v1.PureComponent:extend("ProfilerViewEntry");
local v31 = v2.UNSTABLE_connect2(nil, function(v27)
    return {
        dispatchSetScriptProfilerRoot = function(v28, v29, v30)
            v27(v13(v28, v29, v30));
        end
    };
end)(v26);
local function v33(v32)
    return v1.createFragment({
        Label = v1.createElement(v10, {
            text = v32.text, 
            size = v32.size, 
            pos = v32.pos
        }), 
        LeftBorder = v1.createElement("Frame", {
            Size = UDim2.new(UDim.new(0, l_LineWidth_0), v32.size.Y), 
            Position = UDim2.fromOffset(-l_ValuePadding_0, 0) + v32.pos, 
            AnchorPoint = Vector2.new(0, 0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        })
    });
end;
local _ = function(v34)
    local l_depth_0 = v34.depth;
    local l_data_0 = v34.data;
    local l_functionId_0 = v34.functionId;
    local _ = l_data_0.Functions[l_functionId_0];
    local v39 = (l_depth_0 == 0 and l_functionId_0 == 0) and "<root>" or "<anonymous>";
    local l_nodeName_0 = v34.nodeName;
    if not l_nodeName_0 or #l_nodeName_0 == 0 then
        return v39;
    else
        return l_nodeName_0;
    end;
end;
v26.init = function(v42)
    local v43 = {};
    local v44 = true;
    if v42.props.depth ~= 0 then
        v44 = v22 and v42.props.expandedNodes[v42.props.nodeId];
    end;
    v43.expanded = v44;
    v43.showTooltip = false;
    v43.tooltipPos = UDim2.fromOffset(0, 0);
    v42.state = v43;
    v42.onButtonPress = function()
        if v22 then
            v42.props.expandedNodes[v42.props.nodeId] = not v42.state.expanded;
        end;
        v42:setState(function(_)
            return {
                expanded = not v42.state.expanded
            };
        end);
    end;
    v42.onMouseEnter = function(_, v47, v48)
        v42:setState({
            showTooltip = true, 
            tooltipPos = UDim2.fromOffset(v47, v48)
        });
    end;
    v42.onMouseMove = function(_, v50, v51)
        v42:setState({
            showTooltip = true, 
            tooltipPos = UDim2.fromOffset(v50, v51)
        });
    end;
    v42.onMouseLeave = function()
        v42:setState({
            showTooltip = false
        });
    end;
    v42.onMouse2Click = function()
        local l_dispatchSetScriptProfilerRoot_0 = v42.props.dispatchSetScriptProfilerRoot;
        local l_nodeId_0 = v42.props.nodeId;
        local l_functionId_1 = v42.props.functionId;
        local l_props_0 = v42.props;
        local l_depth_1 = l_props_0.depth;
        local l_data_1 = l_props_0.data;
        local l_functionId_2 = l_props_0.functionId;
        local _ = l_data_1.Functions[l_functionId_2];
        local v60 = (l_depth_1 == 0 and l_functionId_2 == 0) and "<root>" or "<anonymous>";
        local l_nodeName_1 = l_props_0.nodeName;
        if not l_nodeName_1 or #l_nodeName_1 == 0 then
            l_nodeName_1 = v60;
        end;
        l_dispatchSetScriptProfilerRoot_0(l_nodeId_0, l_functionId_1, l_nodeName_1);
    end;
end;
v26.renderChildren = function(v62, v63)
    local v64 = {};
    if v62.state.expanded then
        local l_percentageRatio_0 = v62.props.percentageRatio;
        local v66 = l_getDurations_0(v62.props.data, v62.props.nodeId);
        local v67 = v62.props.depth + 1;
        local l_average_0 = v62.props.average;
        local l_searchTerm_0 = v62.props.searchTerm;
        local l_searchFilter_0 = v62.props.searchFilter;
        local l_showPlugins_0 = v62.props.showPlugins;
        local l_showGC_0 = v62.props.showGC;
        local l_gcNodeOffsets_0 = v62.props.gcNodeOffsets;
        local l_expandedNodes_0 = v62.props.expandedNodes;
        local l_data_2 = v62.props.data;
        local l_GCFuncId_0 = l_data_2.GCFuncId;
        if not v63 then
            if not (not v24 or v62.props.nodeId ~= 0) or not v24 and v62.props.depth == 0 then
                assert(v63 == nil);
                for v77, v78 in l_data_2.Categories, nil, nil do
                    if not (#l_searchFilter_0 > 0 and not l_searchFilter_0[v78.NodeId]) then
                        local _ = l_data_2.Nodes[v78.NodeId];
                        local v80 = l_getDurations_0(l_data_2, v78.NodeId);
                        local v81 = v62.props.pluginOffsets[v77];
                        local v82 = v62.props.pluginGCOffsets[v77];
                        if not l_showPlugins_0 then
                            v80 = v80 - v81;
                            if not (not v25 or not l_showGC_0) then
                                v80 = v80 - v82;
                            end;
                        end;
                        v64[v77] = v1.createElement(v31, {
                            layoutOrder = (v66 - v80) * 1000000, 
                            depth = v67, 
                            data = l_data_2, 
                            nodeId = v78.NodeId, 
                            functionId = nil, 
                            nodeName = v78.Name, 
                            average = l_average_0, 
                            percentageRatio = l_percentageRatio_0, 
                            searchTerm = l_searchTerm_0, 
                            searchFilter = l_searchFilter_0, 
                            showPlugins = l_showPlugins_0, 
                            pluginOffset = v81, 
                            pluginGCOffset = v82, 
                            showGC = l_showGC_0, 
                            gcNodeOffsets = l_gcNodeOffsets_0, 
                            expandedNodes = l_expandedNodes_0
                        });
                    end;
                end;
            end;
        else
            for v83, v84 in pairs(v63) do
                if not (#l_searchFilter_0 > 0 and not l_searchFilter_0[v84]) and ((not v25 or l_showGC_0) or v83 ~= l_GCFuncId_0) then
                    local _ = l_data_2.Nodes[v84];
                    local v86 = l_data_2.Functions[v83];
                    if not (not l_showPlugins_0 and l_getPluginFlag_0(l_data_2, v86)) then
                        v64[v83] = v1.createElement(v31, {
                            layoutOrder = (v66 - l_getDurations_0(l_data_2, v84)) * 1000000, 
                            depth = v67, 
                            data = l_data_2, 
                            nodeId = v84, 
                            functionId = v83, 
                            nodeName = v86.Name, 
                            average = l_average_0, 
                            percentageRatio = l_percentageRatio_0, 
                            searchTerm = l_searchTerm_0, 
                            searchFilter = l_searchFilter_0, 
                            showPlugins = l_showPlugins_0, 
                            showGC = l_showGC_0, 
                            gcNodeOffsets = l_gcNodeOffsets_0, 
                            expandedNodes = l_expandedNodes_0
                        });
                    end;
                end;
            end;
            return v64;
        end;
    end;
    return v64;
end;
v26.renderValues = function(_, v88)
    local v89 = {};
    local v90 = UDim2.new(l_ValueCellWidth_0, -l_ValuePadding_0, 0, l_EntryFrameHeight_0);
    local v91 = UDim2.new(1 - l_ValueCellWidth_0 * #v88, l_ValuePadding_0, 0, 0);
    for v92, v93 in ipairs(v88) do
        v89[tostring(v92)] = v1.createElement(v33, {
            text = tostring(v93), 
            size = v90, 
            pos = v91 + UDim2.fromScale(l_ValueCellWidth_0 * (v92 - 1), 0)
        });
    end;
    return v89;
end;
v26.render = function(v94)
    local l_props_1 = v94.props;
    local v96 = l_props_1.size or UDim2.new(1, 0, 0, l_EntryFrameHeight_0);
    local l_depth_2 = l_props_1.depth;
    local v98 = l_props_1.layoutOrder or 0;
    local v99 = l_depth_2 * l_DepthIndent_0;
    local l_percentageRatio_1 = l_props_1.percentageRatio;
    local l_data_3 = l_props_1.data;
    local l_showPlugins_1 = l_props_1.showPlugins;
    local l_showGC_1 = l_props_1.showGC;
    local l_nodeId_1 = l_props_1.nodeId;
    local v105 = l_data_3.Functions[l_props_1.functionId];
    local v106 = l_data_3.Nodes[l_nodeId_1];
    local v107, v108 = l_getDurations_0(l_data_3, l_nodeId_1);
    v107 = v107 / v94.props.average;
    v108 = v108 / v94.props.average;
    local v109 = l_standardizeChildren_0(l_data_3, v106);
    if not l_showPlugins_1 then
        if l_nodeId_1 == 0 then
            v107 = v107 - (v94.props.pluginOffsets.Total or 0);
            if not (not v25 or not l_showGC_1) then
                v107 = v107 - (v94.props.pluginGCOffsets.Total or 0);
            end;
        else
            v107 = v107 - (v94.props.pluginOffset or 0);
            if not (not v25 or not l_showGC_1) then
                v107 = v107 - (v94.props.pluginGCOffset or 0);
            end;
        end;
    end;
    if not (not v25 or l_showGC_1) then
        local l_gcNodeOffsets_1 = l_props_1.gcNodeOffsets;
        v107 = if l_nodeId_1 == 0 then v107 - (l_gcNodeOffsets_1.Total or 0) else v107 - (l_gcNodeOffsets_1[l_nodeId_1] or 0);
    end;
    local v111 = nil;
    local v112 = nil;
    if not l_percentageRatio_1 then
        v111 = string.format("%.3f", v107 * 1000);
        v112 = string.format("%.3f", v108 * 1000);
    elseif l_percentageRatio_1 == 0 then
        v111 = "N/A";
        v112 = "N/A";
    else
        v111 = string.format("%.3f%%", v107 / l_percentageRatio_1);
        v112 = string.format("%.3f%%", v108 / l_percentageRatio_1);
    end;
    local v113 = {
        v111, 
        v112
    };
    local l_depth_3 = l_props_1.depth;
    local l_data_4 = l_props_1.data;
    local l_functionId_3 = l_props_1.functionId;
    local v117 = l_data_4.Functions[l_functionId_3];
    local v118 = (l_depth_3 == 0 and l_functionId_3 == 0) and "<root>" or "<anonymous>";
    local l_nodeName_2 = l_props_1.nodeName;
    if not l_nodeName_2 or #l_nodeName_2 == 0 then
        l_nodeName_2 = v118;
    end;
    local l_l_nodeName_2_0 = l_nodeName_2;
    l_depth_3 = v4.getSourceLocationString(l_data_3, v105, l_l_nodeName_2_0);
    l_data_4 = l_getNativeFlag_0(l_data_3, v105);
    l_functionId_3 = l_getPluginFlag_0(l_data_3, v105);
    if not (not v23 or not l_functionId_3) then
        l_l_nodeName_2_0 = l_l_nodeName_2_0 .. " <plugin>";
    end;
    if l_data_4 then
        l_l_nodeName_2_0 = l_l_nodeName_2_0 .. " <native>";
    end;
    v117 = UDim.new(1 - l_ValueCellWidth_0 * #v113, -v99);
    v118 = v1.createElement;
    l_nodeName_2 = "Frame";
    local v121 = {
        Size = v96, 
        BackgroundTransparency = 1, 
        LayoutOrder = v98, 
        AutomaticSize = Enum.AutomaticSize.Y
    };
    local v122 = {
        tooltip = if not v94.state.showTooltip then nil else v1.createElement(v12, {
            text = l_depth_3, 
            pos = v94.state.tooltipPos
        }), 
        layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local l_createElement_0 = v1.createElement;
    local l_v11_0 = v11;
    local v125 = {
        size = UDim2.new(1, 0, 0, l_EntryFrameHeight_0), 
        inset = v99, 
        isExpanded = v94.state.expanded
    };
    local v126;
    if v109 then
        v126 = true;
        if not (next(v109) == nil) then
            goto label0;
        end;
    end;
    v126 = l_depth_2 == 0;
    ::label0::;
    v125.isExpandable = v126;
    v125.onButtonPress = v94.onButtonPress;
    v125.onMouseEnter = v94.onMouseEnter;
    v125.onMouseLeave = v94.onMouseLeave;
    v125.onMouseMove = v94.onMouseMove;
    v125.onMouse2Click = v94.onMouse2Click;
    v125.layoutOrder = -1;
    v122.button = l_createElement_0(l_v11_0, v125, {
        name = v1.createElement(v10, {
            text = l_l_nodeName_2_0, 
            size = UDim2.new(v117, UDim.new(1, 0)), 
            pos = UDim2.new(0, l_CellPadding_0 + v99, 0, 0)
        }), 
        values = v1.createFragment(v94:renderValues(v113))
    });
    v122.children = v1.createFragment(v94:renderChildren(v109));
    return v118(l_nodeName_2, v121, v122);
end;
return v31;
