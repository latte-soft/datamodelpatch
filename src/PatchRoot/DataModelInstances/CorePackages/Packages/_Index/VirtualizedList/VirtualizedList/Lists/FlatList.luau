local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local v5 = {
    OS = "roblox"
};
local v6 = require(l_Parent_0.Utilities.differ.deepDiffer);
local v7 = require(l_Parent_1.React);
local v8 = require(l_Parent_0.Lists.VirtualizedList);
local v9 = require(l_Parent_0.Components.View.View);
local v10 = require(l_Parent_0.StyleSheet.StyleSheet);
local v11 = require(l_Parent_0.jsUtils.invariant);
local l_ScrollView_0 = l_Parent_0.Components.ScrollView;
local _ = require(l_ScrollView_0.ScrollView);
local _ = require(l_ScrollView_0.ScrollViewNativeComponent);
local _ = require(l_Parent_0.Lists.ViewabilityHelper);
local _ = require(l_Parent_0.Lists.VirtualizedList);
local l_keyExtractor_0 = require(script.Parent.VirtualizeUtils).keyExtractor;
local function _(v18)
    if v18 ~= nil then
        return v18;
    else
        return v5.OS == "android";
    end;
end;
local function _(v20)
    if v20 ~= nil then
        return v20;
    else
        return 1;
    end;
end;
local v22 = v7.PureComponent:extend("FlatList");
v22.init = function(v23, _)
    v23._virtualizedListPairs = {};
    v23._captureRef = function(v25)
        v23._listRef = v25;
    end;
    v23._getItem = function(v26, v27)
        local l_numColumns_0 = v23.props.numColumns;
        local v29 = if l_numColumns_0 ~= nil then l_numColumns_0 else 1;
        if v29 > 1 then
            l_numColumns_0 = {};
            for v30 = 1, v29 do
                local v31 = v26[(v27 - 1) * v29 + v30];
                if v31 ~= nil then
                    table.insert(l_numColumns_0, v31);
                end;
            end;
            return l_numColumns_0;
        else
            return v26[v27];
        end;
    end;
    v23._getItemCount = function(v32)
        if v32 ~= nil then
            local l_numColumns_1 = v23.props.numColumns;
            local v34 = if l_numColumns_1 ~= nil then l_numColumns_1 else 1;
            if v34 > 1 then
                return (math.ceil(#v32 / v34));
            else
                return #v32;
            end;
        else
            return 0;
        end;
    end;
    v23._keyExtractor = function(v35, v36)
        local l_numColumns_2 = v23.props.numColumns;
        local v38 = if l_numColumns_2 ~= nil then l_numColumns_2 else 1;
        l_numColumns_2 = if v23.props.keyExtractor ~= nil then v23.props.keyExtractor else l_keyExtractor_0;
        if v38 > 1 then
            if not l_Array_0.isArray(v35) then
                v11(l_Array_0.isArray(v35), "FlatList: Encountered internal consistency error, expected each item to consist of an " .. "array with 1-%s columns; instead, received a single item.", v38);
                return nil;
            else
                return l_Array_0.join(l_Array_0.map(v35, function(v39, v40)
                    return l_numColumns_2(v39, (v36 - 1) * v38 + v40);
                end), ":");
            end;
        else
            return l_numColumns_2(v35, v36);
        end;
    end;
    v23._renderer = function()
        local l_ListItemComponent_0 = v23.props.ListItemComponent;
        local l_renderItem_0 = v23.props.renderItem;
        local l_columnWrapperStyle_0 = v23.props.columnWrapperStyle;
        local l_numColumns_3 = v23.props.numColumns;
        local v45 = if l_numColumns_3 ~= nil then l_numColumns_3 else 1;
        l_numColumns_3 = not l_ListItemComponent_0 and "renderItem" or "ListItemComponent";
        local function v47(v46)
            if not l_ListItemComponent_0 then
                if not l_renderItem_0 then
                    return nil;
                else
                    return l_renderItem_0(v46);
                end;
            else
                return v7.createElement(l_ListItemComponent_0, v46);
            end;
        end;
        return {
            [l_numColumns_3] = function(v48)
                if v45 > 1 then
                    local v49 = v7.createElement("UIListLayout", {
                        key = not v23.props.horizontal and "UIListHorizontalLayout" or "UIListVerticalLayout", 
                        Name = not v23.props.horizontal and "UIListHorizontalLayout" or "UIListVerticalLayout", 
                        FillDirection = if not v23.props.horizontal then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    });
                    local l_item_0 = v48.item;
                    local l_index_0 = v48.index;
                    v11(l_Array_0.isArray(l_item_0), "Expected array of items with numColumns > 1");
                    return v7.createElement(v9, {
                        style = v10.compose(l_columnWrapperStyle_0)
                    }, l_Array_0.concat({
                        v49
                    }, l_Array_0.map(l_item_0, function(v52, v53)
                        local v54 = {
                            item = l_Object_0.assign({}, v52, {
                                LayoutOrder = v53
                            }), 
                            index = (l_index_0 - 1) * v45 + v53, 
                            separators = v48.separators
                        };
                        local v55 = if not l_ListItemComponent_0 then if l_renderItem_0 then l_renderItem_0(v54) else nil else v7.createElement(l_ListItemComponent_0, v54);
                        if v55 ~= nil then
                            return (v7.createElement(v7.Fragment, {
                                key = v53
                            }, v55));
                        else
                            return nil;
                        end;
                    end)));
                else
                    return v47(v48);
                end;
            end
        };
    end;
    v23:_checkProps(v23.props);
    if not v23.props.viewabilityConfigCallbackPairs then
        if v23.props.onViewableItemsChanged then
            table.insert(v23._virtualizedListPairs, {
                viewabilityConfig = v23.props.viewabilityConfig, 
                onViewableItemsChanged = v23:_createOnViewableItemsChanged(v23.props.onViewableItemsChanged)
            });
        end;
        return ;
    else
        v23._virtualizedListPairs = l_Array_0.map(v23.props.viewabilityConfigCallbackPairs, function(v56)
            return {
                viewabilityConfig = v56.viewabilityConfig, 
                onViewableItemsChanged = v23:_createOnViewableItemsChanged(v56.onViewableItemsChanged)
            };
        end);
        return ;
    end;
end;
v22.scrollToEnd = function(v57, v58)
    if v57._listRef then
        v57._listRef:scrollToEnd(v58);
    end;
end;
v22.scrollToIndex = function(v59, v60)
    if v59._listRef then
        v59._listRef:scrollToIndex(v60);
    end;
end;
v22.scrollToItem = function(v61, v62)
    if v61._listRef then
        v61._listRef:scrollToItem(v62);
    end;
end;
v22.scrollToOffset = function(v63, v64)
    if v63._listRef then
        v63._listRef:scrollToOffset(v64);
    end;
end;
v22.recordInteraction = function(v65)
    if v65._listRef then
        v65._listRef:recordInteraction();
    end;
end;
v22.flashScrollIndicators = function(v66)
    if v66._listRef then
        v66._listRef:flashScrollIndicators();
    end;
end;
v22.getScrollResponder = function(v67)
    if not v67._listRef then
        return ;
    else
        return v67._listRef:getScrollResponder();
    end;
end;
v22.getNativeScrollRef = function(v68)
    if not v68._listRef then
        return ;
    else
        return v68._listRef:getScrollRef();
    end;
end;
v22.getScrollableNode = function(v69)
    if not v69._listRef then
        return ;
    else
        return v69._listRef:getScrollableNode();
    end;
end;
v22.setNativeProps = function(v70, v71)
    if v70._listRef then
        v70._listRef:setNativeProps(v71);
    end;
end;
v22.componentDidUpdate = function(v72, v73)
    v11(v73.numColumns == v72.props.numColumns, "Changing numColumns on the fly is not supported. Change the key prop on FlatList when " .. "changing the number of columns to force a fresh render of the component.");
    v11(v73.onViewableItemsChanged == v72.props.onViewableItemsChanged, "Changing onViewableItemsChanged on the fly is not supported");
    v11(not v6(v73.viewabilityConfig, v72.props.viewabilityConfig), "Changing viewabilityConfig on the fly is not supported");
    v11(v73.viewabilityConfigCallbackPairs == v72.props.viewabilityConfigCallbackPairs, "Changing viewabilityConfigCallbackPairs on the fly is not supported");
    v72:_checkProps(v72.props);
end;
v22._checkProps = function(v74, v75)
    local l_getItem_0 = v75.getItem;
    local l_getItemCount_0 = v75.getItemCount;
    local l_horizontal_0 = v75.horizontal;
    local l_columnWrapperStyle_1 = v75.columnWrapperStyle;
    local l_onViewableItemsChanged_0 = v75.onViewableItemsChanged;
    local l_viewabilityConfigCallbackPairs_0 = v75.viewabilityConfigCallbackPairs;
    local l_numColumns_4 = v74.props.numColumns;
    local v83 = if l_numColumns_4 ~= nil then l_numColumns_4 else 1;
    v11(not l_getItem_0 and not l_getItemCount_0, "FlatList does not support custom data formats.");
    if v83 > 1 then
        v11(not l_horizontal_0, "numColumns does not support horizontal.");
    else
        v11(not l_columnWrapperStyle_1, "columnWrapperStyle not supported for single column lists");
    end;
    v11(not (l_onViewableItemsChanged_0 and l_viewabilityConfigCallbackPairs_0), "FlatList does not support setting both onViewableItemsChanged and " .. "viewabilityConfigCallbackPairs.");
end;
v22._pushMultiColumnViewable = function(v84, v85, v86)
    local l_numColumns_5 = v84.props.numColumns;
    local v88 = if l_numColumns_5 ~= nil then l_numColumns_5 else 1;
    l_numColumns_5 = if v84.props.keyExtractor ~= nil then v84.props.keyExtractor else l_keyExtractor_0;
    l_Array_0.forEach(v86.item, function(v89, v90)
        v11(v86.index ~= nil, "Missing index");
        local v91 = (v86.index - 1) * v88 + v90;
        table.insert(v85, l_Object_0.assign({}, v86, {
            item = v89, 
            key = l_numColumns_5(v89, v91), 
            index = v91
        }));
    end);
end;
v22._createOnViewableItemsChanged = function(v92, v93)
    return function(v94)
        local l_numColumns_6 = v92.props.numColumns;
        local v96 = if l_numColumns_6 ~= nil then l_numColumns_6 else 1;
        if v93 ~= nil then
            if v96 > 1 then
                l_numColumns_6 = {};
                local v97 = {};
                l_Array_0.forEach(v94.viewableItems, function(v98)
                    return v92:_pushMultiColumnViewable(v97, v98);
                end);
                l_Array_0.forEach(v94.changed, function(v99)
                    return v92:_pushMultiColumnViewable(l_numColumns_6, v99);
                end);
                v93({
                    viewableItems = v97, 
                    changed = l_numColumns_6
                });
                return ;
            else
                v93(v94);
            end;
        end;
    end;
end;
v22.render = function(v100)
    local l_props_0 = v100.props;
    local _ = l_props_0.numColumns;
    local _ = l_props_0.columnWrapperStyle;
    local l_removeClippedSubviews_0 = l_props_0.removeClippedSubviews;
    return v7.createElement(v8, l_Object_0.assign({}, l_Object_0.assign({}, l_props_0, {
        numColumns = l_Object_0.None, 
        columnWrapperStyle = l_Object_0.None, 
        removeClippedSubviews = l_Object_0.None
    }), {
        getItem = v100._getItem, 
        getItemCount = v100._getItemCount, 
        keyExtractor = v100._keyExtractor, 
        ref = v100._captureRef, 
        viewabilityConfigCallbackPairs = v100._virtualizedListPairs, 
        removeClippedSubviews = if l_removeClippedSubviews_0 ~= nil then l_removeClippedSubviews_0 else v5.OS == "android"
    }, v100._renderer()));
end;
return v22;
