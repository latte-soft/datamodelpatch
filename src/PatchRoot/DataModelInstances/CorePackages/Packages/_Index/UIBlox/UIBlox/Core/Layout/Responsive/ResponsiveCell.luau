local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
local v5 = require(l_Parent_0.ResponsiveLayoutContext);
local v6 = require(l_Parent_0.ResponsiveLayoutConfigReader);
local v7 = v2.PureComponent:extend("ResponsiveCell");
v7.validateProps = v3.interface({
    layoutOrder = v3.optional(v3.integer), 
    zIndex = v3.optional(v3.integer), 
    colspan = v3.optional(v3.union(v3.integer, v3.table)), 
    rowspan = v3.optional(v3.union(v3.integer, v3.table)), 
    order = v3.optional(v3.union(v3.integer, v3.table)), 
    [v2.Children] = v3.optional(v3.table), 
    gridCellRef = v3.optional(v3.union(v3.table, v3.callback))
});
local function v11(v8, v9, v10)
    if v10 == nil then
        v10 = "default";
    end;
    if v8[v9 .. "_" .. v10] ~= nil then
        return v8[v9 .. "_" .. v10];
    elseif v8[v9] ~= nil then
        if type(v8[v9]) == "table" then
            if v8[v9][v10] ~= nil then
                return v8[v9][v10];
            else
                return v8[v9].default;
            end;
        else
            return v8[v9];
        end;
    else
        return nil;
    end;
end;
v7.getColspan = function(v12, v13)
    local v14 = v11(v12.props, "colspan", v13);
    if v14 ~= nil then
        return v14;
    else
        return 1;
    end;
end;
v7.getRowspan = function(v15, v16)
    local v17 = v11(v15.props, "rowspan", v16);
    if v17 ~= nil then
        return v17;
    else
        return 1;
    end;
end;
v7.getOrder = function(v18, v19)
    if not v18.props.layoutOrder then
        return (v11(v18.props, "order", v19));
    else
        return v18.props.layoutOrder;
    end;
end;
local function _(v20, v21)
    local v22 = math.floor(v20);
    v21.subPixelOffset = v21.subPixelOffset + (v20 - v22);
    local v23 = math.floor(v21.subPixelOffset + 0.5);
    v21.subPixelOffset = v21.subPixelOffset - v23;
    return v22 + v23;
end;
v7.getSize = function(_, v26, v27, v28)
    local v29 = v6.getValue(v28, "gutter") or 0;
    if not v28.multiLine then
        local v30 = v6.getValue(v28, "columns") or 1;
        if v28.scrollable then
            v30 = v30 * math.max(v28.pages, 1);
        end;
        local l_new_0 = UDim2.new;
        local v32 = v26 / v30;
        local v33 = (v26 / v30 - 1) * v29;
        local v34 = math.floor(v33);
        v28.subPixelOffset = v28.subPixelOffset + (v33 - v34);
        local v35 = math.floor(v28.subPixelOffset + 0.5);
        v28.subPixelOffset = v28.subPixelOffset - v35;
        return l_new_0(v32, v34 + v35, 1, 0);
    else
        return UDim2.new(v26, (v26 - 1) * v29, v27, (v27 - 1) * (v6.getValue(v28, "verticalGutter") or v29));
    end;
end;
v7.render = function(v36)
    return v2.createElement(v5.Consumer, {
        render = function(v37)
            local v38 = v36:getColspan(v37.breakpoint);
            local v39 = not v37.multiLine and 1 or v36:getRowspan(v37.breakpoint);
            if v38 > 0 and v39 > 0 then
                local v40 = v36:getOrder(v37.breakpoint);
                local v41 = not v40 and "ResponsiveCell" or string.format("ResponsiveCell%02d", v40);
                local l_multiLine_0 = v37.multiLine;
                if l_multiLine_0 then
                    l_multiLine_0 = true;
                    if v38 <= 1 then
                        l_multiLine_0 = v39 > 1;
                    end;
                end;
                local v43 = v2.createElement("Frame", {
                    Name = if not l_multiLine_0 then v41 else nil, 
                    Size = v36:getSize(v38, v39, v37), 
                    AutomaticSize = if not v37.relativeHeight then Enum.AutomaticSize.Y else Enum.AutomaticSize.None, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v40, 
                    ZIndex = v36.props.zIndex, 
                    [v2.Ref] = v36.props.gridCellRef
                }, v36.props[v2.Children]);
                if not l_multiLine_0 then
                    return v43;
                else
                    return v2.createElement("Frame", {
                        Name = v41, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = v40
                    }, {
                        ResponsiveCellInner = v43
                    });
                end;
            else
                return nil;
            end;
        end
    });
end;
return v2.forwardRef(function(v44, v45)
    return v2.createElement(v7, l_Object_0.assign({}, v44, {
        gridCellRef = v45
    }));
end);
