local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.ReactUtils);
local l_useProperties_0 = v3.useProperties;
local l_usePropertiesDeferred_0 = v3.usePropertiesDeferred;
local v6 = require(l_Parent_0.UIBloxConfig);
local v7 = require(l_Parent_0.Core.Layout.Responsive.ResponsiveRow);
local v8 = require(l_Parent_0.Core.Layout.Responsive.useResponsiveLayout);
local function v17(v9, v10)
    local v11 = v8("columns", v10) or 1;
    local v12 = v8("gutter", v10) or 0;
    local v13 = v8("verticalGutter", v10) or v12;
    local v14 = v8("margin", v10) or 0;
    local v15 = v9 or v8("relativeHeight", v10);
    return v2.useCallback(function(v16)
        if not v15 then
            return nil;
        else
            return math.max((((v16 - 2 * v14) + v12) / v11 - v12) * v15.Scale + v15.Offset, 0) + v13;
        end;
    end, {
        v11, 
        v12, 
        v13, 
        v14, 
        v15
    });
end;
local v18 = if not v6.responsiveGridDisplayLinesNonNil then nil else NumberRange.new(0, 0);
return v2.forwardRef(function(v19, v20)
    local v21, v22 = v2.useState(v18);
    local v23 = v17(v19.relativeHeight, v19.kind);
    return v2.createElement(v7, {
        kind = v19.kind, 
        layoutOrder = v19.layoutOrder, 
        scrollable = false, 
        multiLine = true, 
        displayLines = if not not v19.absoluteWindowTop and v19.absoluteWindowHeight then v21 else nil, 
        relativeHeight = v19.relativeHeight, 
        data = v19.data, 
        getItem = v19.getItem, 
        getItemCount = v19.getItemCount, 
        renderItem = v19.renderItem, 
        keyExtractor = v19.keyExtractor, 
        getCellColspan = v19.getCellColspan, 
        getCellRowspan = v19.getCellRowspan, 
        getCellOrder = v19.getCellOrder, 
        ref = (if not v19.enableDeferredRefPropEvents then l_useProperties_0 else l_usePropertiesDeferred_0)(v20, v2.useCallback(function(v24, v25)
            if not (not v19.absoluteWindowTop or not v19.absoluteWindowHeight) then
                local v26 = v23(v25.X);
                if v26 and v26 > 0 then
                    local v27 = math.floor(math.max(v19.absoluteWindowTop - v24.Y, 0) / v26) + 1;
                    return v22(NumberRange.new(v27, (v27 + (math.ceil(math.max(v19.absoluteWindowHeight, 0) / v26) + 1)) - 1));
                end;
            end;
            return v22(v18);
        end, {
            v23, 
            v19.absoluteWindowTop, 
            v19.absoluteWindowHeight, 
            v22
        }), {
            "AbsolutePosition", 
            "AbsoluteSize"
        })
    });
end);
