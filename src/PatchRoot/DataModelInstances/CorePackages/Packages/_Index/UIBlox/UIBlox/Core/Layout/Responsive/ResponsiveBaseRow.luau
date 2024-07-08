local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v6 = require(l_Parent_1.UIBloxConfig);
local v7 = require(l_Parent_0.ResponsiveLayoutContext);
local v8 = require(l_Parent_0.ResponsiveLayoutConfigReader);
local v9 = v3.PureComponent:extend("ResponsiveBaseRow");
local function v11(v10)
    if not v10.multiLine or not v10.scrollable then
        return true;
    else
        return false, "multiLine can't be scrollable";
    end;
end;
v9.validateProps = v4.strictInterface({
    kind = v4.optional(v4.string), 
    layoutOrder = v4.optional(v4.integer), 
    zIndex = v4.optional(v4.number), 
    scrollable = v4.optional(v4.boolean), 
    clipsDescendants = v4.optional(v4.boolean), 
    selectable = v4.optional(v4.boolean), 
    pages = v4.optional(v4.numberPositive), 
    multiLine = v4.optional(v4.boolean), 
    lines = v4.optional(v4.intersection(v4.integer, v4.numberMin(0))), 
    paddingTopLines = v4.optional(v4.intersection(v4.integer, v4.numberMin(0))), 
    relativeHeight = v4.optional(v4.UDim), 
    scrollingFrameRef = v4.optional(v4.table), 
    [v3.Children] = v4.optional(v4.table), 
    gridBasicRowRef = v4.optional(v4.union(v4.table, v4.callback))
});
v9.defaultProps = {
    kind = "default", 
    scrollable = false, 
    selectable = false, 
    clipsDescendants = true, 
    multiLine = false
};
v9.renderChildrenWithPadding = function(v12, v13, v14)
    local v15 = v12.props.lines or 1;
    local v16 = v12.props.paddingTopLines or 0;
    return l_Object_0.assign({
        _uiblox_grid_padding_ = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v13), 
            PaddingRight = UDim.new(0, v13), 
            PaddingTop = if (not not v12.props.multiLine and v16 > 0) and v15 > 0 then UDim.new(v16 / v15, (v16 / v15) * v14) else nil
        })
    }, v12.props[v3.Children]);
end;
v9.renderChildrenMultiline = function(v17, v18, v19, v20, v21)
    local v22 = v17.props.lines or 1;
    if v17.props.paddingTopLines then
        v22 = v22 - v17.props.paddingTopLines;
    end;
    v22 = math.max(v22, 1);
    return l_Object_0.assign({
        _uiblox_grid_layout_ = v3.createElement("UIGridLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirectionMaxCells = v18, 
            CellSize = UDim2.new(1 / v18, math.floor(((1 - v18) / v18) * v20), 1 / v22, (math.floor(((1 - v22) / v22) * v21))), 
            CellPadding = UDim2.fromOffset(v20, v21)
        })
    }, v17:renderChildrenWithPadding(v19, v21));
end;
v9.renderChildren = function(v23, v24, v25, v26, v27)
    local v28 = l_Object_0.assign({
        _uiblox_grid_layout_ = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v26)
        })
    }, v23:renderChildrenWithPadding(v25, v27));
    if not v24 then
        return v28;
    else
        local v29 = v23.props.pages or 1;
        return {
            ResponsiveRowScroller = v3.createElement("ScrollingFrame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                ScrollingDirection = Enum.ScrollingDirection.X, 
                ScrollBarThickness = 0, 
                CanvasSize = UDim2.new(v29, (v29 - 1) * (v26 - 2 * v25), 1, 0), 
                AutomaticCanvasSize = not not v23.props.pages and Enum.AutomaticSize.None or Enum.AutomaticSize.X, 
                Selectable = v23.props.selectable, 
                ClipsDescendants = v23.props.clipsDescendants, 
                [v3.Ref] = if not v6.responsiveBaseRowScrollingFrameRef then nil else v23.props.scrollingFrameRef
            }, v28)
        };
    end;
end;
local function _(v30, v31)
    return v30.Scale * v31 + v30.Offset;
end;
v9.getSize = function(v33, v34, v35, v36, v37, v38)
    if v34 == nil then
        return UDim2.fromScale(1, 0);
    else
        local v39 = v34.Scale / v38;
        local v40 = v34.Scale * ((v35 - 2 * v37) / v38 - v35) + v34.Offset;
        if not (not v33.props.multiLine or not v33.props.lines) then
            if v33.props.lines == 0 then
                return UDim2.fromScale(1, 0);
            else
                v39 = v39 * v33.props.lines;
                v40 = v40 * v33.props.lines + (v33.props.lines - 1) * v36;
            end;
        end;
        return UDim2.new(1, 0, v39, v40);
    end;
end;
v9.render = function(v41)
    assert(v11(v41.props));
    local l_relativeHeight_0 = v41.props.relativeHeight;
    local l_scrollable_0 = v41.props.scrollable;
    local l_multiLine_0 = v41.props.multiLine;
    local v45 = not v41.props.layoutOrder and "ResponsiveRow" or string.format("ResponsiveRow%02d", v41.props.layoutOrder);
    return v3.createElement(v7.Consumer, {
        render = function(v46)
            local v47 = l_Object_0.assign({}, v46, {
                kind = v41.props.kind or l_Object_0.None, 
                scrollable = l_scrollable_0, 
                pages = v41.props.pages or 1, 
                multiLine = l_multiLine_0, 
                relativeHeight = l_relativeHeight_0, 
                subPixelOffset = 0
            });
            if not l_relativeHeight_0 then
                l_relativeHeight_0 = v8.getValue(v47, "relativeHeight");
                v47.relativeHeight = l_relativeHeight_0;
            end;
            local v48 = v8.getValue(v47, "width");
            local v49 = v8.getValue(v47, "gutter") or 0;
            local v50 = v8.getValue(v47, "verticalGutter") or v49;
            local v51 = v8.getValue(v47, "margin") or 0;
            local v52 = v8.getValue(v47, "columns") or 1;
            local v53 = l_relativeHeight_0 and (not l_multiLine_0 or v41.props.lines);
            local v54 = v41:getSize(l_relativeHeight_0, v49, v50, v51, v52);
            local l_createElement_0 = v3.createElement;
            local l_Provider_0 = v7.Provider;
            local v57 = {
                value = v47
            };
            local v58 = {};
            local l_v45_0 = v45;
            local l_createElement_1 = v3.createElement;
            local v61 = "Frame";
            local v62 = {
                Size = v54, 
                SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                AutomaticSize = if not v53 then Enum.AutomaticSize.Y else Enum.AutomaticSize.None, 
                BackgroundTransparency = 1, 
                LayoutOrder = v41.props.layoutOrder, 
                ZIndex = v41.props.zIndex, 
                [v3.Ref] = v41.props.gridBasicRowRef
            };
            local l_assign_0 = l_Object_0.assign;
            local v64 = {};
            local v65;
            if not v48 then
                v65 = nil;
            else
                v65 = v3.createElement;
                local v66 = "UISizeConstraint";
                local v67 = {};
                local l_new_0 = Vector2.new;
                local l_v48_0 = v48;
                local v70;
                if not l_relativeHeight_0 then
                    v70 = math.huge;
                else
                    local l_Y_0 = v54.Y;
                    v70 = l_Y_0.Scale * v48 + l_Y_0.Offset;
                end;
                v67.MaxSize = l_new_0(l_v48_0, v70);
                v65 = v65(v66, v67);
            end;
            v64._uiblox_grid_maxwidth_ = v65;
            v58[l_v45_0] = l_createElement_1(v61, v62, l_assign_0(v64, if not l_multiLine_0 then v41:renderChildren(l_scrollable_0, v51, v49, v50) else v41:renderChildrenMultiline(v52, v51, v49, v50)));
            return l_createElement_0(l_Provider_0, v57, v58);
        end
    });
end;
return v3.forwardRef(function(v72, v73)
    return v3.createElement(v9, l_Object_0.assign({}, v72, {
        gridBasicRowRef = v73
    }));
end);
