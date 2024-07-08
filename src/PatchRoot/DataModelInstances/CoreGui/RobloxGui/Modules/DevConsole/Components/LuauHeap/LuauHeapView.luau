local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v4 = require(l_Components_0.HeaderButton);
local v5 = require(l_Components_0.BannerButton);
local v6 = require(l_Components_0.CellLabel);
local v7 = require(l_Components_0.BoxButton);
local v8 = require(script.Parent.LuauHeapViewEntry);
local v9 = require(script.Parent.LuauHeapViewStatEntry);
local v10 = require(script.Parent.LuauHeapViewRefEntry);
local _ = require(script.Parent.LuauHeapTypes);
local l_Actions_0 = script.Parent.Parent.Parent.Actions;
local v13 = require(l_Actions_0.SetLuauHeapActiveSnapshot);
local v14 = require(l_Actions_0.SetLuauHeapCompareSnapshot);
local v15 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v15.GeneralFormatting.LineWidth;
local l_LineColor_0 = v15.GeneralFormatting.LineColor;
local l_HeaderFrameHeight_0 = v15.GeneralFormatting.HeaderFrameHeight;
local l_EntryFrameHeight_0 = v15.GeneralFormatting.EntryFrameHeight;
local l_ValueCellWidth_0 = v15.LuauHeapFormatting.ValueCellWidth;
local l_CellPadding_0 = v15.LuauHeapFormatting.CellPadding;
local l_ValuePadding_0 = v15.LuauHeapFormatting.ValuePadding;
local l_SnapshotWidth_0 = v15.LuauHeapFormatting.SnapshotWidth;
local l_SnapshotHighlightSize_0 = v15.LuauHeapFormatting.SnapshotHighlightSize;
local l_TabsHeight_0 = v15.LuauHeapFormatting.TabsHeight;
local l_TabButtonWidth_0 = v15.LuauHeapFormatting.TabButtonWidth;
local l_TabButtonHeight_0 = v15.LuauHeapFormatting.TabButtonHeight;
local _ = v15.LuauHeapFormatting.TabButtonPad;
local l_TabHighlightHeight_0 = v15.LuauHeapFormatting.TabHighlightHeight;
local l_TableHintHeight_0 = v15.LuauHeapFormatting.TableHintHeight;
local v36 = {
    graph = {
        hint = "Graph displays the size of the objects in Luau VM aggregated by the shortest path from the root Engine references to them.\n\t\tMost important root references are ModuleScript tables and functions connected to signals or the task scheduler.", 
        headers = {
            "Name", 
            "Size", 
            "Self"
        }, 
        initFragmentSource = function(v31)
            return v31:renderChildren();
        end
    }, 
    tag = {
        hint = "This memory breakdown displays how much memory is used by Luau VM types.", 
        headers = {
            "Name", 
            "Size", 
            "Count"
        }, 
        initFragmentSource = function(v32)
            return v32:renderChildrenStats("TagBreakdown");
        end
    }, 
    memcat = {
        hint = "Memory separated by the category at the time of allocation.\n\t\tBy default, memory category is assigned to a subset of scripts.\n\t\tCustom memory category can be created using 'debug.setmemorycategory' API.", 
        headers = {
            "Name", 
            "Size", 
            "Count"
        }, 
        initFragmentSource = function(v33)
            return v33:renderChildrenStats("MemcatBreakdown");
        end
    }, 
    userdata = {
        hint = "This breakdown shows how much memory inside Luau VM is taken by custom Roblox engine classes.\n\t\tFor DataModel classes like 'Part' this does not include the memory taken inside the engine itself.", 
        headers = {
            "Name", 
            "Size", 
            "Count"
        }, 
        initFragmentSource = function(v34)
            return v34:renderChildrenStats("UserdataBreakdown");
        end
    }, 
    refs = {
        hint = "This view shows engine DataModel instances that are only referenced by Luau VM and are not directly parented to the DataModel.\n\t\tFor each instance, it will show the set of paths that make it accessible and prevent garbage collection.\n\t\tMost often, engine Luau references come from ModuleScript tables, active signal connections and active coroutines in the task scheduler.", 
        headers = {
            "Name", 
            "Count", 
            "Total Instances"
        }, 
        initFragmentSource = function(v35)
            return v35:renderChildrenRefs();
        end
    }
};
local v37 = v1.PureComponent:extend("LuauHeapView");
v37.renderSnapshotList = function(v38)
    local l_data_0 = v38.props.data;
    local v40 = {};
    for v41, _ in l_data_0, nil, nil do
        v40[v41] = v1.createElement(v5, {
            size = UDim2.new(1, 0, 0, l_EntryFrameHeight_0), 
            inset = 0, 
            isExpanded = false, 
            isExpandable = false, 
            layoutOrder = v41, 
            onButtonPress = function()
                v38.props.dispatchSetLuauHeapActiveSnapshot(v41);
            end
        }, {
            name = v1.createElement(v6, {
                text = ("Snapshot #%*"):format(v41), 
                size = UDim2.new(UDim.new(1, 0), UDim.new(1, 0)), 
                pos = UDim2.new(0, l_CellPadding_0, 0, 0)
            }), 
            HorizontalHighlightTop = if v38.props.activeSnapshot == v41 then v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_SnapshotHighlightSize_0), 
                BackgroundColor3 = l_LineColor_0
            }) else nil, 
            HorizontalHighlightBottom = if v38.props.activeSnapshot == v41 then v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_SnapshotHighlightSize_0), 
                Position = UDim2.new(0, 0, 1, -l_SnapshotHighlightSize_0), 
                BackgroundColor3 = l_LineColor_0
            }) else nil, 
            HorizontalHighlightLeft = if v38.props.activeSnapshot == v41 then v1.createElement("Frame", {
                Size = UDim2.new(0, l_SnapshotHighlightSize_0, 1, 0), 
                BackgroundColor3 = l_LineColor_0
            }) else nil, 
            HorizontalHighlightRight = if v38.props.activeSnapshot == v41 then v1.createElement("Frame", {
                Size = UDim2.new(0, l_SnapshotHighlightSize_0, 1, 0), 
                Position = UDim2.new(1, -l_SnapshotHighlightSize_0, 0, 0), 
                BackgroundColor3 = l_LineColor_0
            }) else nil, 
            Compare = if v38.props.activeSnapshot ~= v41 then v1.createElement(v7, {
                text = "Compare", 
                size = UDim2.new(0.3, -6, 1, -6), 
                pos = UDim2.new(0.7, 3, 0, 3), 
                onClicked = function()
                    v38.props.dispatchSetLuauHeapCompareSnapshot(v41);
                end
            }) else nil
        });
    end;
    return v40;
end;
v37.renderChildren = function(v43)
    local v44 = v43.props.data[v43.props.activeSnapshot];
    local v45 = v43.props.data[v43.props.compareSnapshot];
    return v1.createElement(v8, {
        layoutOrder = 0, 
        depth = 0, 
        data = v44.Graph, 
        compare = if not v45 then nil else v45.Graph
    });
end;
v37.renderChildrenStats = function(v46, v47)
    local v48 = v46.props.data[v46.props.activeSnapshot];
    local v49 = v46.props.data[v46.props.compareSnapshot];
    local v50 = v48[v47];
    local v51 = if not v49 then nil else v49[v47];
    local v52 = {};
    for v53, v54 in v50, nil, nil do
        local v55 = nil;
        if v51 then
            for _, v57 in ipairs(v51) do
                if v54.Name == v57.Name then
                    v55 = v57;
                    break;
                end;
            end;
        end;
        v52[v53] = v1.createElement(v9, {
            layoutOrder = -v54.Size, 
            depth = 0, 
            data = v54, 
            compare = v55
        });
    end;
    return v52;
end;
v37.renderChildrenRefs = function(v58)
    local l_Refs_0 = v58.props.data[v58.props.activeSnapshot].Refs;
    if l_Refs_0 then
        assert(l_Refs_0);
        local l_Roots_0 = l_Refs_0.Roots;
        local v61 = {};
        for v62, v63 in l_Roots_0, nil, nil do
            v61[v62] = v1.createElement(v10, {
                layoutOrder = -v63.Instances, 
                depth = 0, 
                data = v63
            });
        end;
        return v61;
    else
        return {};
    end;
end;
v37.createTabSelector = function(v64, v65, v66)
    local function _(v67)
        v64:setState({
            activeTab = v67
        });
    end;
    local function v72(v69, v70, v71)
        return v1.createElement(v7, {
            text = v70, 
            size = UDim2.new(0, l_TabButtonWidth_0, 0, l_TabButtonHeight_0), 
            pos = UDim2.new(0, l_TabButtonWidth_0 * v71, 0, 0), 
            onClicked = function()
                v64:setState({
                    activeTab = v69
                });
            end
        });
    end;
    local function v75(v73, v74)
        if v64.state.activeTab == v73 then
            return (v1.createElement("Frame", {
                Size = UDim2.new(0, l_TabButtonWidth_0, 0, l_TabHighlightHeight_0), 
                Position = UDim2.new(0, l_TabButtonWidth_0 * v74, 0, l_TabButtonHeight_0 - l_TabHighlightHeight_0), 
                BorderSizePixel = 0, 
                BackgroundColor3 = v15.Color.HighlightBlue, 
                ZIndex = 10
            }));
        else
            return nil;
        end;
    end;
    return v1.createElement("Frame", {
        Size = v65, 
        Position = v66, 
        BackgroundTransparency = 1
    }, {
        Graph = v72("graph", "Graph", 0), 
        GraphHighlight = v75("graph", 0), 
        Tags = v72("tag", "Object Tags", 1), 
        TagHighlight = v75("tag", 1), 
        Memcat = v72("memcat", "Memory Categories", 2), 
        MemcatHighlight = v75("memcat", 2), 
        Userdata = v72("userdata", "Object Classes", 3), 
        UserdataHighlight = v75("userdata", 3), 
        Refs = v72("refs", "Unique References", 4), 
        RefHighlight = v75("refs", 4)
    });
end;
v37.createStatsTableHeader = function(v76, v77, v78, v79)
    return v1.createElement("Frame", {
        Size = UDim2.new(1 - l_SnapshotWidth_0, 0, 0, l_HeaderFrameHeight_0), 
        Position = UDim2.new(l_SnapshotWidth_0, 0, v77, v78), 
        BackgroundTransparency = 1
    }, {
        First = if not v79[1] then nil else v1.createElement(v4, {
            text = v79[1], 
            size = UDim2.new(1 - l_ValueCellWidth_0 * 2, -l_ValuePadding_0 - l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
            pos = UDim2.new(0, l_CellPadding_0, 0, 0), 
            sortfunction = v76.onSortChanged
        }), 
        Second = if not v79[2] then nil else v1.createElement(v4, {
            text = v79[2], 
            size = UDim2.new(l_ValueCellWidth_0, -l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
            pos = UDim2.new(1 - l_ValueCellWidth_0 * 2, l_ValuePadding_0, 0, 0), 
            sortfunction = v76.onSortChanged
        }), 
        Third = if not v79[3] then nil else v1.createElement(v4, {
            text = v79[3], 
            size = UDim2.new(l_ValueCellWidth_0, -l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
            pos = UDim2.new(1 - l_ValueCellWidth_0, l_ValuePadding_0, 0, 0), 
            sortfunction = v76.onSortChanged
        }), 
        TopHorizontal = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 1), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        }), 
        LowerHorizontal = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
            Position = UDim2.new(0, 0, 1, 0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        }), 
        Vertical1 = v1.createElement("Frame", {
            Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
            Position = UDim2.new(1 - l_ValueCellWidth_0, 0, 0, 0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        }), 
        Vertical2 = v1.createElement("Frame", {
            Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
            Position = UDim2.new(1 - l_ValueCellWidth_0 * 2, 0, 0, 0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        })
    });
end;
v37.init = function(v80)
    v80.state = {
        activeTab = "graph"
    };
end;
v37.render = function(v81)
    local l_layoutOrder_0 = v81.props.layoutOrder;
    local l_size_0 = v81.props.size;
    local v84 = nil;
    local v85 = v36[v81.state.activeTab];
    if not v81.props.data or #v81.props.data == 0 then
        v84 = v1.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            Text = "Capture a Snapshot to view details", 
            TextColor3 = v15.Color.Text, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0
        });
    end;
    return v1.createElement("Frame", {
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, {
        SnapshotHeader = v1.createElement(v4, {
            text = "Snapshots", 
            size = UDim2.new(l_SnapshotWidth_0, -l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
            pos = UDim2.new(0, l_CellPadding_0, 0, 0)
        }), 
        Snapshots = v1.createElement("ScrollingFrame", {
            Size = UDim2.new(l_SnapshotWidth_0, -4, 1, -l_HeaderFrameHeight_0), 
            Position = UDim2.new(0, 2, 0, l_HeaderFrameHeight_0), 
            BackgroundTransparency = 1, 
            VerticalScrollBarInset = Enum.ScrollBarInset.None, 
            ScrollBarThickness = 5, 
            CanvasSize = UDim2.fromScale(0, 0), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Stroke = v1.createElement("UIStroke", {
                Thickness = 2, 
                Color = Color3.new(0.6, 0.6, 0.6)
            }), 
            Children = v1.createFragment(v81:renderSnapshotList())
        }), 
        Tabs = v81:createTabSelector(UDim2.new(1 - l_SnapshotWidth_0, 0, 0, l_TabsHeight_0), UDim2.new(l_SnapshotWidth_0, 0, 0, 0)), 
        Hint = v1.createElement("TextLabel", {
            Size = UDim2.new(1 - l_SnapshotWidth_0, 0, 0, l_TableHintHeight_0), 
            Position = UDim2.new(l_SnapshotWidth_0, 0, 0, l_TabsHeight_0), 
            Text = v85.hint, 
            TextColor3 = v15.Color.Text, 
            BackgroundTransparency = 1
        }), 
        Headers = v81:createStatsTableHeader(0, l_TabsHeight_0 + l_TableHintHeight_0, v85.headers), 
        Entries = v1.createElement("ScrollingFrame", {
            Size = UDim2.new(1 - l_SnapshotWidth_0, 0, 1, -((l_TabsHeight_0 + l_TableHintHeight_0) + l_HeaderFrameHeight_0)), 
            Position = UDim2.new(l_SnapshotWidth_0, 0, 0, (l_TabsHeight_0 + l_TableHintHeight_0) + l_HeaderFrameHeight_0), 
            BackgroundTransparency = 1, 
            VerticalScrollBarInset = Enum.ScrollBarInset.None, 
            ScrollBarThickness = 5, 
            CanvasSize = UDim2.fromScale(0, 0), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Children = if not v84 then v1.createFragment(v85.initFragmentSource(v81)) else v84
        })
    });
end;
return v2.UNSTABLE_connect2(nil, function(v86)
    return {
        dispatchSetLuauHeapActiveSnapshot = function(v87)
            v86(v13(v87));
        end, 
        dispatchSetLuauHeapCompareSnapshot = function(v88)
            v86(v14(v88));
        end
    };
end)(v37);
