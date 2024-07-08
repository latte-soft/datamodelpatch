local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_Object_0 = v2.Object;
local v6 = require(l_Parent_0.jsUtils.invariant);
local _ = require(script.Parent.ViewabilityHelper);
local l_keyExtractor_0 = require(script.Parent.VirtualizeUtils).keyExtractor;
local v9 = require(l_Parent_0.Components.View.View);
local v10 = require(script.Parent.VirtualizedList);
local v11 = require(l_Parent_1.React);
local v12 = nil;
local v13 = v11.PureComponent:extend("VirtualizedSectionList");
v13.init = function(v14)
    v14._updateHighlightMap = {};
    v14._updatePropsMap = {};
    v14._listRef = nil;
    v14._captureRef = function(v15)
        v14._listRef = v15;
    end;
    v14._keyExtractor = function(_, v17)
        local v18 = v14:_subExtractor(v17);
        if not v18 then
            return (tostring(v17));
        else
            return v18.key;
        end;
    end;
    v14._convertViewable = function(v19)
        v6(v19.index ~= nil, "Received a broken ViewToken");
        local v20 = v14:_subExtractor(v19.index);
        if v20 then
            local l_keyExtractor_1 = v20.section.keyExtractor;
            return l_Object_0.assign({}, v19, {
                index = v20.index, 
                key = if l_keyExtractor_1 ~= nil then l_keyExtractor_1(v19.item, v20.index) else (if not v14.props.keyExtractor then l_keyExtractor_0 else v14.props.keyExtractor)(v19.item, v20.index == nil and 1 or v20.index), 
                section = v20.section
            });
        else
            return nil;
        end;
    end;
    v14._onViewableItemsChanged = function(v22)
        local l_viewableItems_0 = v22.viewableItems;
        local l_changed_0 = v22.changed;
        local l_onViewableItemsChanged_0 = v14.props.onViewableItemsChanged;
        if l_onViewableItemsChanged_0 ~= nil then
            l_onViewableItemsChanged_0({
                viewableItems = l_Array_0.filter(l_Array_0.map(l_viewableItems_0, v14._convertViewable, v14), l_Boolean_0.toJSBoolean), 
                changed = l_Array_0.filter(l_Array_0.map(l_changed_0, v14._convertViewable, v14), l_Boolean_0.toJSBoolean)
            });
        end;
    end;
    v14._renderItem = function(v26)
        return function(v27)
            local l_item_0 = v27.item;
            local l_index_0 = v27.index;
            local v30 = v14:_subExtractor(l_index_0);
            if v30 then
                local l_index_1 = v30.index;
                if l_index_1 == nil then
                    local l_section_0 = v30.section;
                    if v30.header == true then
                        local l_renderSectionHeader_0 = v14.props.renderSectionHeader;
                        if not l_Boolean_0.toJSBoolean(l_renderSectionHeader_0) then
                            return nil;
                        else
                            return (l_renderSectionHeader_0({
                                section = l_section_0
                            }));
                        end;
                    else
                        local l_renderSectionFooter_0 = v14.props.renderSectionFooter;
                        if not l_Boolean_0.toJSBoolean(l_renderSectionFooter_0) then
                            return nil;
                        else
                            return (l_renderSectionFooter_0({
                                section = l_section_0
                            }));
                        end;
                    end;
                else
                    local v35 = v30.section.renderItem or v14.props.renderItem;
                    local v36 = v14:_getSeparatorComponent(l_index_0, v30, v26);
                    v6(v35, "no renderItem");
                    return v11.createElement(v12, {
                        SeparatorComponent = v36, 
                        LeadingSeparatorComponent = if l_index_1 == 1 then v14.props.SectionSeparatorComponent else nil, 
                        cellKey = v30.key, 
                        index = l_index_1, 
                        item = l_item_0, 
                        leadingItem = v30.leadingItem, 
                        leadingSection = v30.leadingSection, 
                        prevCellKey = (v14:_subExtractor(l_index_0 - 1) or {}).key, 
                        setSelfHighlightCallback = v14._setUpdateHighlightFor, 
                        setSelfUpdatePropsCallback = v14._setUpdatePropsFor, 
                        updateHighlightFor = v14._updateHighlightFor, 
                        updatePropsFor = v14._updatePropsFor, 
                        renderItem = v35, 
                        section = v30.section, 
                        trailingItem = v30.trailingItem, 
                        trailingSection = v30.trailingSection, 
                        inverted = l_Boolean_0.toJSBoolean(v14.props.inverted), 
                        horizontal = v14.props.horizontal
                    });
                end;
            else
                return nil;
            end;
        end;
    end;
    v14._updatePropsFor = function(v37, v38)
        local v39 = v14._updatePropsMap[v37];
        if v39 ~= nil then
            v39(v38);
        end;
    end;
    v14._updateHighlightFor = function(v40, v41)
        local v42 = v14._updateHighlightMap[v40];
        if v42 ~= nil then
            v42(v41);
        end;
    end;
    v14._setUpdateHighlightFor = function(v43, v44)
        if v44 ~= nil then
            v14._updateHighlightMap[v43] = v44;
            return ;
        else
            v14._updateHighlightMap[v43] = nil;
            return ;
        end;
    end;
    v14._setUpdatePropsFor = function(v45, v46)
        if v46 ~= nil then
            v14._updatePropsMap[v45] = v46;
            return ;
        else
            v14._updatePropsMap[v45] = nil;
            return ;
        end;
    end;
end;
v13.scrollToLocation = function(v47, v48)
    local l_itemIndex_0 = v48.itemIndex;
    local v50 = 1;
    while v50 < v48.sectionIndex do
        l_itemIndex_0 = l_itemIndex_0 + (v47.props.getItemCount(v47.props.sections[v50].data) + 2);
        v50 = v50 + 1;
    end;
    local v51 = v48.viewOffset or 0;
    if v47._listRef == nil then
        return ;
    else
        if not (not (v48.itemIndex > 1) or not v47.props.stickySectionHeadersEnabled) then
            v51 = v51 + v47._listRef.__getFrameMetricsApprox(l_itemIndex_0 - v48.itemIndex).length;
        end;
        v47._listRef:scrollToIndex((l_Object_0.assign({}, v48, {
            viewOffset = v51, 
            index = l_itemIndex_0
        })));
        return ;
    end;
end;
v13.getListRef = function(v52)
    return v52._listRef;
end;
v13.render = function(v53)
    local _ = v53.props.renderItem;
    local _ = v53.props.sections;
    local v56 = l_Object_0.assign({}, v53.props, {
        ItemSeparatorComponent = l_Object_0.None, 
        SectionSeparatorComponent = l_Object_0.None, 
        renderItem = l_Object_0.None, 
        renderSectionFooter = l_Object_0.None, 
        renderSectionHeader = l_Object_0.None, 
        sections = l_Object_0.None, 
        stickySectionHeadersEnabled = l_Object_0.None
    });
    local v57 = not v53.props.ListHeaderComponent and 0 or 1;
    local v58 = if not v53.props.stickySectionHeadersEnabled then nil else {};
    local v59 = 0;
    for _, v61 in ipairs(v53.props.sections) do
        if v58 ~= nil then
            table.insert(v58, v59 + v57);
        end;
        v59 = (v59 + 2) + v53.props.getItemCount(v61.data);
    end;
    return v11.createElement(v10, l_Object_0.assign({}, v56, {
        keyExtractor = v53._keyExtractor, 
        stickyHeaderIndices = v58, 
        renderItem = v53._renderItem(v59), 
        data = v53.props.sections, 
        getItem = function(v62, v63)
            return v53:_getItem(v53.props, v62, v63);
        end, 
        getItemCount = function()
            return v59;
        end, 
        onViewableItemsChanged = if not v53.props.onViewableItemsChanged then nil else v53._onViewableItemsChanged, 
        ref = v53._captureRef
    }));
end;
v13._getItem = function(_, v65, v66, v67)
    if v66 then
        local v68 = v67 - 1;
        local v69 = 1;
        while true do
            if v69 <= #v66 then
                local v70 = v66[v69];
                local l_data_0 = v70.data;
                local v72 = v65.getItemCount(l_data_0);
                if not (v68 ~= 0) or v68 == v72 + 1 then
                    return v70;
                elseif v68 <= v72 then
                    return v65.getItem(l_data_0, v68);
                else
                    v68 = v68 - (v72 + 2);
                    v69 = v69 + 1;
                end;
            else
                return nil;
            end;
        end;
    else
        return nil;
    end;
end;
v13._subExtractor = function(v73, v74)
    local l_v74_0 = v74;
    local v76 = nil;
    local v77 = nil;
    local v78 = nil;
    local v79 = nil;
    local l_props_0 = v73.props;
    v76 = l_props_0.getItem;
    v77 = l_props_0.getItemCount;
    v78 = l_props_0.keyExtractor;
    v79 = l_props_0.sections;
    l_props_0 = 1;
    while true do
        if l_props_0 <= #v79 then
            local v81 = v79[l_props_0];
            local l_data_1 = v81.data;
            local v83 = if not l_Boolean_0.toJSBoolean(v81.key) then tostring(l_props_0) else tostring(v81.key);
            l_v74_0 = l_v74_0 - 1;
            if v77(l_data_1) + 1 < l_v74_0 then
                l_v74_0 = l_v74_0 - (v77(l_data_1) + 1);
                l_props_0 = l_props_0 + 1;
            elseif l_v74_0 == 0 then
                return {
                    section = v81, 
                    key = v83 .. ":header", 
                    index = nil, 
                    header = true, 
                    trailingSection = v79[l_props_0 + 1]
                };
            elseif l_v74_0 == v77(l_data_1) + 1 then
                return {
                    section = v81, 
                    key = v83 .. ":footer", 
                    index = nil, 
                    header = false, 
                    trailingSection = v79[l_props_0 + 1]
                };
            else
                return {
                    section = v81, 
                    key = v83 .. ":" .. tostring(((v81.keyExtractor or v78) or l_keyExtractor_0)(v76(l_data_1, l_v74_0), l_v74_0)), 
                    index = l_v74_0, 
                    leadingItem = v76(l_data_1, l_v74_0 - 1), 
                    leadingSection = v79[l_props_0 - 1], 
                    trailingItem = v76(l_data_1, l_v74_0 + 1), 
                    trailingSection = v79[l_props_0 + 1]
                };
            end;
        else
            return nil;
        end;
    end;
end;
v13._getSeparatorComponent = function(v84, v85, v86, v87)
    if not v86 then
        v86 = v84:_subExtractor(v85);
    end;
    if v86 then
        local l_v86_0 = v86;
        local v89 = not not l_Boolean_0.toJSBoolean(l_v86_0.section.ItemSeparatorComponent) and l_v86_0.section.ItemSeparatorComponent or v84.props.ItemSeparatorComponent;
        local l_SectionSeparatorComponent_0 = v84.props.SectionSeparatorComponent;
        local v91 = v85 == v87;
        local v92 = l_v86_0.index == v84.props.getItemCount(l_v86_0.section.data);
        if not l_SectionSeparatorComponent_0 or not v92 then
            if (not v89 or v92) or v91 then
                return nil;
            else
                return v89;
            end;
        else
            return l_SectionSeparatorComponent_0;
        end;
    else
        return nil;
    end;
end;
v12 = function(v93)
    local l_LeadingSeparatorComponent_0 = v93.LeadingSeparatorComponent;
    local l_SeparatorComponent_0 = v93.SeparatorComponent;
    local l_cellKey_0 = v93.cellKey;
    local l_prevCellKey_0 = v93.prevCellKey;
    local l_setSelfHighlightCallback_0 = v93.setSelfHighlightCallback;
    local l_updateHighlightFor_0 = v93.updateHighlightFor;
    local l_setSelfUpdatePropsCallback_0 = v93.setSelfUpdatePropsCallback;
    local l_updatePropsFor_0 = v93.updatePropsFor;
    local l_item_1 = v93.item;
    local l_index_2 = v93.index;
    local l_section_1 = v93.section;
    local l_inverted_0 = v93.inverted;
    local v106, v107 = v11.useState(false);
    local v108, v109 = v11.useState(false);
    local v110, v111 = v11.useState({
        leadingItem = v93.leadingItem, 
        leadingSection = v93.leadingSection, 
        section = v93.section, 
        trailingItem = v93.item, 
        trailingSection = v93.trailingSection, 
        LayoutOrder = -1
    });
    local v112, v113 = v11.useState({
        leadingItem = v93.item, 
        leadingSection = v93.leadingSection, 
        section = v93.section, 
        trailingItem = v93.trailingItem, 
        trailingSection = v93.trailingSection, 
        LayoutOrder = 1
    });
    v11.useEffect(function()
        l_setSelfHighlightCallback_0(l_cellKey_0, v109);
        l_setSelfUpdatePropsCallback_0(l_cellKey_0, v113);
        return function()
            l_setSelfUpdatePropsCallback_0(l_cellKey_0, nil);
            l_setSelfHighlightCallback_0(l_cellKey_0, nil);
        end;
    end, {
        l_cellKey_0, 
        l_setSelfHighlightCallback_0, 
        v113, 
        l_setSelfUpdatePropsCallback_0
    });
    local v116 = v93.renderItem({
        item = l_item_1, 
        index = l_index_2, 
        section = l_section_1, 
        separators = {
            highlight = function()
                v107(true);
                v109(true);
                if l_prevCellKey_0 ~= nil then
                    l_updateHighlightFor_0(l_prevCellKey_0, true);
                end;
            end, 
            unhighlight = function()
                v107(false);
                v109(false);
                if l_prevCellKey_0 ~= nil then
                    l_updateHighlightFor_0(l_prevCellKey_0, false);
                end;
            end, 
            updateProps = function(v114, v115)
                if v114 == "leading" then
                    if l_LeadingSeparatorComponent_0 ~= nil then
                        v111(l_Object_0.assign({}, v110, v115));
                        return ;
                    elseif l_prevCellKey_0 ~= nil then
                        l_updatePropsFor_0(l_prevCellKey_0, l_Object_0.assign({}, v110, v115));
                        return ;
                    end;
                elseif v114 == "trailing" and l_SeparatorComponent_0 ~= nil then
                    v113(l_Object_0.assign({}, v112, v115));
                end;
            end
        }
    });
    local v117 = false;
    if l_LeadingSeparatorComponent_0 ~= nil then
        v117 = v11.createElement(l_LeadingSeparatorComponent_0, l_Object_0.assign({
            highlighted = v106
        }, v110));
    end;
    local v118 = false;
    if l_SeparatorComponent_0 ~= nil then
        v118 = v11.createElement(l_SeparatorComponent_0, l_Object_0.assign({
            highlighted = v108
        }, v112));
    end;
    if not v117 and not v118 then
        return v116;
    else
        return (v11.createElement(v9, {
            Size = if not v93.horizontal then UDim2.new(1, 0, 0, 0) else UDim2.new(0, 0, 1, 0), 
            AutomaticSize = if not v93.horizontal then Enum.AutomaticSize.Y else Enum.AutomaticSize.X
        }, v11.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = if not v93.horizontal then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal
        }), if l_inverted_0 == false then v117 else v118, v116, if l_inverted_0 == false then v118 else v117));
    end;
end;
return v13;
