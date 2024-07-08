local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local l_LinkingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol;
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v4 = require(l_Components_0.BannerButton);
local v5 = require(l_Components_0.BoxButton);
local v6 = require(l_Components_0.CellCheckbox);
local v7 = require(l_Components_0.CellLabel);
local v8 = require(l_Components_0.DataConsumer);
local v9 = require(l_Components_0.HeaderButton);
local v10 = require(script.Parent.Parent.Parent.Constants);
local l_GeneralFormatting_0 = v10.GeneralFormatting;
local l_LineWidth_0 = l_GeneralFormatting_0.LineWidth;
local l_LineColor_0 = l_GeneralFormatting_0.LineColor;
local l_DebugVisualizationsFormatting_0 = v10.DebugVisualizationsFormatting;
local l_ChartHeaderNames_0 = l_DebugVisualizationsFormatting_0.ChartHeaderNames;
local l_ChartCellWidths_0 = l_DebugVisualizationsFormatting_0.ChartCellWidths;
local l_HeaderFrameHeight_0 = l_DebugVisualizationsFormatting_0.HeaderFrameHeight;
local l_EntryFrameHeight_0 = l_DebugVisualizationsFormatting_0.EntryFrameHeight;
local l_CellPadding_0 = l_DebugVisualizationsFormatting_0.CellPadding;
local l_MinFrameWidth_0 = l_DebugVisualizationsFormatting_0.MinFrameWidth;
local l_LearnMoreWidth_0 = l_DebugVisualizationsFormatting_0.LearnMoreWidth;
local v22 = 0;
for _, v24 in ipairs(l_ChartCellWidths_0) do
    v22 = v22 + v24;
end;
local v25 = -v22;
local v26 = {};
local v27 = {};
local v28 = {};
v25 = v25 / 2;
table.insert(v26, UDim2.fromOffset(l_CellPadding_0, 0));
table.insert(v27, UDim2.new(0.5, v25 - l_CellPadding_0, 0, l_HeaderFrameHeight_0));
table.insert(v28, UDim2.new(0.5, v25 - l_CellPadding_0, 0, l_EntryFrameHeight_0));
for _, v30 in ipairs(l_ChartCellWidths_0) do
    table.insert(v26, UDim2.new(0.5, v25 + l_CellPadding_0, 0, 0));
    table.insert(v27, UDim2.fromOffset(v30 - l_CellPadding_0, l_HeaderFrameHeight_0));
    table.insert(v28, UDim2.fromOffset(v30 - l_CellPadding_0, l_EntryFrameHeight_0));
    v25 = v25 + v30;
end;
table.insert(v26, UDim2.new(0.5, v25 + l_CellPadding_0, 0, 0));
table.insert(v27, UDim2.new(0.5, -v22 / 2 - l_CellPadding_0, 0, l_HeaderFrameHeight_0));
table.insert(v28, UDim2.new(0.5, -v22 / 2 - l_CellPadding_0, 0, l_EntryFrameHeight_0));
assert(#l_ChartCellWidths_0 == 2, "DebugVisualizationsChart expected DebugVisualizationsFormatting CELL_WIDTHS to have a length of 2");
assert(#v26 == 4, "DebugVisualizationsChart expected cellOffset to have length " .. 4);
assert(#v27 == 4, "DebugVisualizationsChart expected headerCellSize to have length " .. 4);
assert(#v28 == 4, "DebugVisualizationsChart expected entryCellSize to have length " .. 4);
local v31 = {};
for v32, v33 in ipairs(v26) do
    v31[v32] = UDim2.new(v33.X.Scale, v33.X.Offset - l_CellPadding_0, v33.Y.Scale, v33.Y.Offset);
end;
local v34 = v1.Component:extend("DebugVisualizationsChart");
local function v41(v35, v36)
    local v37 = {};
    for v38, v39 in ipairs(l_ChartHeaderNames_0) do
        v37[v39] = v1.createElement(v9, {
            text = v39, 
            size = v27[v38], 
            pos = v26[v38], 
            sortfunction = v35
        });
    end;
    v37.upperHorizontalLine = v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundColor3 = l_LineColor_0, 
        BorderSizePixel = 0
    });
    v37.lowerHorizontalLine = v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
        Position = UDim2.new(0, 0, 1, -l_LineWidth_0), 
        BackgroundColor3 = l_LineColor_0, 
        BorderSizePixel = 0
    });
    for v40 = 2, #v31 do
        v37[string.format("VerticalLine_%d", v40)] = v1.createElement("Frame", {
            Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
            Position = v31[v40], 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        });
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(0, v36, 0, l_HeaderFrameHeight_0), 
        BackgroundTransparency = 1
    }, v37);
end;
local function v54(v42, v43, v44, v45, v46, v47, v48)
    local l_name_0 = v42.name;
    local l_settingInfo_0 = v42.settingInfo;
    local v51 = tostring(l_settingInfo_0.Name);
    local v52 = {};
    for v53 = 2, #v31 do
        v52[string.format("line_%d", v53)] = v1.createElement("Frame", {
            Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
            Position = v31[v53], 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        });
    end;
    v52[l_name_0] = v1.createElement(v7, {
        text = v51, 
        size = v28[1], 
        pos = v26[1]
    });
    v52.checkbox = v1.createElement(v6, {
        name = v51, 
        isSelected = l_settingInfo_0.Value, 
        size = v28[2], 
        pos = v26[2], 
        OnCheckBoxClicked = v42.valueChangeCallback
    });
    v52.visualType = v1.createElement(v7, {
        text = l_settingInfo_0.Type, 
        size = v28[3], 
        pos = v26[3]
    });
    v52.tags = v1.createElement(v7, {
        text = tostring(l_settingInfo_0.Tagstring), 
        size = v28[4], 
        pos = v26[4]
    });
    v52.lowerHorizontalLine = v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
        Position = UDim2.new(0, 0, 1, 0), 
        BackgroundColor3 = l_LineColor_0, 
        BorderSizePixel = 0
    });
    return v1.createElement("Frame", {
        Size = UDim2.new(0, v43, 0, v44), 
        BackgroundTransparency = 1, 
        LayoutOrder = v45
    }, {
        Button = v1.createElement(v4, {
            size = UDim2.new(1, 0, 0, l_EntryFrameHeight_0), 
            pos = UDim2.new(), 
            isExpanded = v46, 
            onButtonPress = v47(l_name_0)
        }, v52), 
        DescriptionText = v46 and v1.createElement(v7, {
            pos = UDim2.new(0, l_CellPadding_0, 0, l_EntryFrameHeight_0 + l_CellPadding_0), 
            size = UDim2.new(0, (v43 - l_LearnMoreWidth_0) - l_CellPadding_0 * 2, 0, l_EntryFrameHeight_0), 
            text = tostring(l_settingInfo_0.Description)
        }), 
        LearnMoreButton = v46 and v1.createElement(v5, {
            text = "Learn More", 
            size = UDim2.new(0, l_LearnMoreWidth_0, 0, l_EntryFrameHeight_0), 
            pos = UDim2.new(0, (v43 - l_LearnMoreWidth_0) - l_CellPadding_0, 0, l_EntryFrameHeight_0 + l_CellPadding_0), 
            onClicked = v48(l_name_0)
        })
    });
end;
populateEntries = function(v55, v56, v57, v58, v59, v60, v61, v62, v63, v64)
    local v65 = {
        UIListLayout = v1.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local v66 = {};
    for v67, v68 in pairs(v56) do
        if v68 then
            table.insert(v66, v67);
        end;
    end;
    local v69 = #v57;
    local v70 = 0;
    if not (not v60 or not v59) then
        local v71 = -1;
        local v72 = 0;
        local v73 = 0;
        for v74, v75 in ipairs(v57) do
            local v76 = false;
            if v55 then
                v76 = string.find(tostring(v75.settingInfo.Name):lower(), v55:lower()) ~= nil or string.find(v75.name:lower(), v55:lower()) ~= nil;
            end;
            if #v66 > 0 then
                local v77 = false;
                for _, v79 in pairs(v66) do
                    if table.find(v75.settingInfo.Tags, v79) ~= nil then
                        v77 = true;
                        break;
                    end;
                end;
                if v55 then
                    v76 = v76 and v77;
                else
                    v55 = true;
                    v76 = v77;
                end;
            end;
            if not (v55 and not v76) then
                local v80 = v62 == v75.name;
                local v81 = not not v80 and l_EntryFrameHeight_0 * 2 + l_CellPadding_0 * 2 or l_EntryFrameHeight_0;
                if v59.Y <= v70 + l_EntryFrameHeight_0 then
                    if v72 < v60.Y then
                        v65[v74] = v54(v75, v61, v81, (not not v58 and v69 - v74 or v74) + 1, v80, v63, v64);
                    end;
                    if v71 < 0 then
                        v71 = v70;
                    else
                        v72 = v72 + l_EntryFrameHeight_0;
                    end;
                    v73 = v73 + 1;
                end;
                v70 = v70 + v81;
            end;
        end;
        if v73 == 0 then
            v65.NoneFound = v1.createElement("TextLabel", {
                Size = UDim2.fromScale(1, 1), 
                Text = "No DebugVisualizations Found", 
                TextColor3 = l_LineColor_0, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            });
        else
            v65.WindowingPadding = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v71), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            });
        end;
    end;
    return v65, v70;
end;
v34.init = function(v82, v83)
    local v84 = v83.DebugVisualizationsData:getCurrentData();
    v82.getOnButtonPress = function(v85)
        return function(_, _)
            local l_v82_0 = v82;
            local v89 = {};
            local v90 = false;
            if v82.state.expandedEntry ~= v85 then
                v90 = v85;
            end;
            v89.expandedEntry = v90;
            l_v82_0:setState(v89);
        end;
    end;
    v82.getLearnMorePress = function(v91)
        return function(_, _)
            l_LinkingProtocol_0.default:openURL("https://create.roblox.com/docs/reference/engine/classes/PhysicsSettings#" .. v91);
        end;
    end;
    v82.onSortChanged = function(v94)
        if v94 == v83.DebugVisualizationsData:getSortType() then
            v82:setState(function(v95)
                return {
                    reverseSort = not v95.reverseSort
                };
            end);
            return ;
        else
            v83.DebugVisualizationsData:setSortType(v94);
            v82:setState({
                reverseSort = false
            });
            return ;
        end;
    end;
    v82.onCanvasPosChanged = function()
        v82:setState({
            canvasPos = v82.scrollingRef.current.CanvasPosition
        });
    end;
    v82.scrollingRef = v1.createRef();
    v82.state = {
        visualizationEntries = v84, 
        reverseSort = false, 
        expandedEntry = nil
    };
end;
v34.didUpdate = function(v96)
    if v96.scrollingRef.current then
        local l_AbsoluteSize_0 = v96.scrollingRef.current.AbsoluteSize;
        if l_AbsoluteSize_0 ~= v96.state.absScrollSize then
            v96:setState({
                absScrollSize = l_AbsoluteSize_0
            });
        end;
    end;
end;
v34.didMount = function(v98)
    v98.visualizationsUpdated = v98.props.DebugVisualizationsData:Signal():Connect(function(v99)
        v98:setState({
            visualizationEntries = v99
        });
    end);
    if v98.scrollingRef.current then
        v98.canvasPosConnector = v98.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v98.onCanvasPosChanged);
        v98:setState({
            absScrollSize = v98.scrollingRef.current.AbsoluteSize, 
            canvasPos = v98.scrollingRef.current.CanvasPosition
        });
    end;
end;
v34.willUnmount = function(v100)
    v100.visualizationsUpdated:Disconnect();
    v100.visualizationsUpdated = nil;
    v100.canvasPosConnector:Disconnect();
    v100.canvasPosConnector = nil;
end;
v34.render = function(v101)
    local l_absScrollSize_0 = v101.state.absScrollSize;
    local v103 = not not l_absScrollSize_0 and math.max(l_absScrollSize_0.X, l_MinFrameWidth_0) or l_MinFrameWidth_0;
    local v104, v105 = populateEntries(v101.props.searchTerm, v101.props.typeFilters, v101.state.visualizationEntries, v101.state.reverseSort, v101.state.canvasPos, l_absScrollSize_0, v103, v101.state.expandedEntry, v101.getOnButtonPress, v101.getLearnMorePress);
    return v1.createElement("Frame", {
        Size = v101.props.size, 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        LayoutOrder = v101.props.layoutOrder
    }, {
        Header = v41(v101.onSortChanged, v103), 
        MainChart = v1.createElement("ScrollingFrame", {
            Position = UDim2.fromOffset(0, l_HeaderFrameHeight_0), 
            Size = UDim2.new(1, 0, 1, -l_HeaderFrameHeight_0), 
            CanvasSize = UDim2.fromOffset(v103, v105), 
            ScrollBarThickness = 6, 
            BackgroundColor3 = v10.Color.BaseGray, 
            BackgroundTransparency = 1, 
            [v1.Ref] = v101.scrollingRef
        }, v104)
    });
end;
return v8(v34, "DebugVisualizationsData");
