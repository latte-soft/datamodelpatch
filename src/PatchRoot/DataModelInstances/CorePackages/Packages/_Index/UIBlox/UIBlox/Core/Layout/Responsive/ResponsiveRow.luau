local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_2.LuauPolyfill);
local l_Object_0 = v5.Object;
local l_Array_0 = v5.Array;
local v8 = require(l_Parent_1.UIBloxConfig);
local v9 = require(l_Parent_0.ResponsiveLayoutContext);
local v10 = require(l_Parent_0.ResponsiveLayoutConfigReader);
local v11 = require(l_Parent_0.ResponsiveBaseRow);
local v12 = require(l_Parent_0.ResponsiveCell);
local v13 = v3.PureComponent:extend("ResponsiveRow");
v13.validateProps = v4.strictInterface({
    kind = v4.optional(v4.string), 
    layoutOrder = v4.optional(v4.integer), 
    zIndex = v4.optional(v4.number), 
    scrollable = v4.optional(v4.boolean), 
    clipsDescendants = v4.optional(v4.boolean), 
    selectable = v4.optional(v4.boolean), 
    multiLine = v4.optional(v4.boolean), 
    displayLines = v4.optional(v4.NumberRange), 
    relativeHeight = v4.optional(v4.UDim), 
    data = v4.optional(v4.any), 
    getItem = v4.optional(v4.callback), 
    getItemCount = v4.optional(v4.callback), 
    renderItem = v4.optional(v4.callback), 
    keyExtractor = v4.optional(v4.callback), 
    getCellColspan = v4.optional(v4.callback), 
    getCellRowspan = v4.optional(v4.callback), 
    getCellOrder = v4.optional(v4.callback), 
    scrollingFrameRef = v4.optional(v4.table), 
    forwardedRef = v4.optional(v4.union(v4.table, v4.callback))
});
v13.defaultProps = {
    kind = "default", 
    multiLine = false, 
    data = {}, 
    getItem = function(v14, v15, _)
        if type(v14) == "table" then
            return v14[v15];
        else
            return nil;
        end;
    end, 
    renderItem = function(v17, _)
        return v17;
    end, 
    getCellColspan = function(_, _)
        return nil;
    end, 
    getCellRowspan = function(_, _)
        return nil;
    end, 
    getCellOrder = function(_, _)
        return nil;
    end
};
local function v28(v25, v26)
    if not v25.getItemCount then
        if v25.getItem == v13.defaultProps.getItem then
            return #v25.data;
        else
            for v27 = 1, v26.columns do
                if v25.getItem(v25.data, v27, v26) == nil then
                    return v27 - 1;
                end;
            end;
            return v26.columns;
        end;
    else
        return v25.getItemCount(v25.data, v26);
    end;
end;
local function _(v29, v30, v31, v32)
    if v29 then
        local v33 = v29(v30, v31);
        if v33 ~= nil then
            if type(v33) == table then
                local v34 = v31.breakpoint or "default";
                if v33[v34] ~= nil then
                    return v33[v34];
                elseif v33.default ~= nil then
                    return v33.default;
                end;
            else
                return v33;
            end;
        end;
    end;
    return v32;
end;
local function v54(v36, v37)
    local v38 = {};
    local function _(v39)
        local v40 = math.floor(v39 / v37.columns);
        return v38[string.format("%d,%d", v39 - v40 * v37.columns, v40)];
    end;
    local function v49(v42, v43, v44)
        local v45 = math.floor(v42 / v37.columns);
        local v46 = v42 - v45 * v37.columns;
        for v47 = v46, (v46 + v43) - 1 do
            for v48 = v45, (v45 + v44) - 1 do
                v38[string.format("%d,%d", v47, v48)] = true;
            end;
        end;
    end;
    return l_Array_0.reduce(v36, function(v50, v51)
        while true do
            local v52 = #v50;
            local v53 = math.floor(v52 / v37.columns);
            if v38[string.format("%d,%d", v52 - v53 * v37.columns, v53)] then
                table.insert(v50, {
                    order = #v50 + 1
                });
            else
                break;
            end;
        end;
        if not (v51.colspan <= 1) or v51.rowspan > 1 then
            v49(#v50, v51.colspan, v51.rowspan);
        end;
        table.insert(v50, l_Object_0.assign({}, v51, {
            order = #v50 + 1
        }));
        return v50;
    end, {});
end;
local function _(v55, v56)
    return string.format("ResponsiveRowCell%0" .. math.floor(math.log10(v56) + 1) .. "d", v55);
end;
filterDisplayedCells = function(v58, v59, v60)
    local v61 = (v60.Min - 1) * v59.columns + 1;
    local v62 = v60.Max * v59.columns;
    local v66 = l_Array_0.filter(v58, function(_, v64)
        local v65 = false;
        if v61 <= v64 then
            v65 = v64 <= v62;
        end;
        return v65;
    end);
    local v67 = ((v60.Max - v60.Min) + 1) * v59.columns;
    return l_Array_0.map(v66, function(v68, _)
        return l_Object_0.assign({}, v68, {
            key = string.format("ResponsiveRowCell%0" .. math.floor(math.log10(v67) + 1) .. "d", (v68.order - 1) % v67 + 1)
        });
    end);
end;
v13.init = function(v70)
    v70.itemCache = {};
end;
v13.renderChildren = function(v71, v72)
    local v73 = {};
    local v74 = {};
    local v75 = 1;
    local v76 = 1;
    for v77 = 1, v28(v71.props, v72) do
        local v78 = v71.props.getItem(v71.props.data, v77, v72);
        local v79 = nil;
        local v80 = nil;
        if v71.props.keyExtractor then
            v79 = v71.props.keyExtractor(v78, v77, v72);
        end;
        if not (not v79 or not v71.itemCache[v79]) then
            v80 = v71.itemCache[v79];
        end;
        if not v80 then
            v80 = v71.props.renderItem(v78, v72);
        end;
        if v79 then
            v74[v79] = v80;
        end;
        local v81 = {};
        local l_getCellColspan_0 = v71.props.getCellColspan;
        local v83;
        if l_getCellColspan_0 then
            local v84 = l_getCellColspan_0(v78, v72);
            if v84 ~= nil then
                if type(v84) == table then
                    local v85 = v72.breakpoint or "default";
                    if v84[v85] ~= nil then
                        v83 = v84[v85];
                        goto label0 --[[  true, true  ]];
                    elseif v84.default ~= nil then
                        v83 = v84.default;
                        goto label0 --[[  true, true  ]];
                    end;
                else
                    v83 = v84;
                    goto label0 --[[  true, true  ]];
                end;
            end;
        end;
        v83 = 1;
        ::label0::;
        v81.colspan = v83;
        l_getCellColspan_0 = v71.props.getCellRowspan;
        if l_getCellColspan_0 then
            local v86 = l_getCellColspan_0(v78, v72);
            if v86 ~= nil then
                if type(v86) == table then
                    local v87 = v72.breakpoint or "default";
                    if v86[v87] ~= nil then
                        v83 = v86[v87];
                        goto label1 --[[  true, true  ]];
                    elseif v86.default ~= nil then
                        v83 = v86.default;
                        goto label1 --[[  true, true  ]];
                    end;
                else
                    v83 = v86;
                    goto label1 --[[  true, true  ]];
                end;
            end;
        end;
        v83 = 1;
        ::label1::;
        v81.rowspan = v83;
        l_getCellColspan_0 = v71.props.getCellOrder;
        if l_getCellColspan_0 then
            local v88 = l_getCellColspan_0(v78, v72);
            if v88 ~= nil then
                if type(v88) == table then
                    local v89 = v72.breakpoint or "default";
                    if v88[v89] ~= nil then
                        v83 = v88[v89];
                        goto label2 --[[  true, true  ]];
                    elseif v88.default ~= nil then
                        v83 = v88.default;
                        goto label2 --[[  true, true  ]];
                    end;
                else
                    v83 = v88;
                    goto label2 --[[  true, true  ]];
                end;
            end;
        end;
        v83 = v77;
        ::label2::;
        v81.order = v83;
        v81.cell = v80;
        table.insert(v73, v81);
    end;
    v71.itemCache = v74;
    if not v71.props.multiLine then
        if v71.props.scrollable then
            v76 = l_Array_0.reduce(v73, function(v90, v91)
                return v90 + v91.colspan;
            end, 0) / v72.columns;
        end;
    else
        l_Array_0.sort(v73, function(v92, v93)
            return v92.order - v93.order;
        end);
        v73 = v54(v73, v72);
        v75 = math.ceil(#v73 / v72.columns);
        if v71.props.displayLines then
            v73 = filterDisplayedCells(v73, v72, v71.props.displayLines);
        end;
    end;
    if v8.setZIndexOnGridCells then
        for v94 = 1, #v73 do
            v73[v94].zIndex = (#v73 + 2) - v94;
        end;
    end;
    return l_Array_0.map(v73, function(v95, v96)
        return v3.createElement(v12, {
            key = v95.key or string.format("ResponsiveRowCell%0" .. math.floor(math.log10(#v73) + 1) .. "d", v96), 
            colspan = v95.colspan, 
            rowspan = v95.rowspan, 
            order = v95.order, 
            zIndex = v95.zIndex
        }, {
            ResponsiveItem = v95.cell
        });
    end), v76, v75;
end;
v13.render = function(v97)
    return v3.createElement(v9.Consumer, {
        render = function(v98)
            local v99 = l_Object_0.assign({}, v98, {
                kind = v97.props.kind or l_Object_0.None
            });
            local v100, v101, v102 = v97:renderChildren({
                breakpoint = v99.breakpoint, 
                kind = v99.kind, 
                width = v10.getValue(v99, "width") or 1, 
                columns = v10.getValue(v99, "columns") or 1, 
                margin = v10.getValue(v99, "margin") or 1, 
                gutter = v10.getValue(v99, "gutter") or 1, 
                verticalGutter = v10.getValue(v99, "verticalGutter")
            });
            return v3.createElement(v11, {
                kind = v97.props.kind, 
                layoutOrder = v97.props.layoutOrder, 
                zIndex = v97.props.zIndex, 
                scrollable = v97.props.scrollable, 
                clipsDescendants = v97.props.clipsDescendants, 
                selectable = v97.props.selectable, 
                pages = v101, 
                multiLine = v97.props.multiLine, 
                lines = v102, 
                paddingTopLines = if not not v97.props.multiLine and v97.props.displayLines then math.max(v97.props.displayLines.Min - 1, 0) else nil, 
                relativeHeight = v97.props.relativeHeight, 
                scrollingFrameRef = if not v8.responsiveBaseRowScrollingFrameRef then nil else v97.props.scrollingFrameRef, 
                [v3.Ref] = v97.props.forwardedRef
            }, v100);
        end
    });
end;
return v3.forwardRef(function(v103, v104)
    return v3.createElement(v13, l_Object_0.assign({}, v103, {
        forwardedRef = v104
    }));
end);
