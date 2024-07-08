local v0 = require(script.Parent.Parent.Parent.Parent.React);
local _ = require(script.Parent.Parent.FlatList);
return function(v2)
    local v3 = not v2.cellRendererKey and "CellRendererView" or v2.cellRendererKey;
    local v4 = not v2.initialIndex and 1 or v2.initialIndex;
    local l_listRef_0 = v2.listRef;
    local l_onSelectedIndexChanged_0 = v2.onSelectedIndexChanged;
    local l_viewOffset_0 = v2.viewOffset;
    local v8 = not (v2.animated ~= nil) or v2.animated;
    local v9 = v0.useRef(v4);
    local l_data_0 = v2.data;
    return v0.useCallback(function(v11, _, _, v14)
        if not (not v14 or not v14:IsDescendantOf(v11)) then
            local l_v14_FirstAncestor_0 = v14:FindFirstAncestor(v3);
            if l_v14_FirstAncestor_0 and l_v14_FirstAncestor_0.LayoutOrder then
                if not (l_v14_FirstAncestor_0.LayoutOrder ~= v9.current and #l_data_0 >= l_v14_FirstAncestor_0.LayoutOrder) or l_v14_FirstAncestor_0.LayoutOrder < 1 then
                    return nil;
                else
                    v9.current = l_v14_FirstAncestor_0.LayoutOrder;
                    if l_onSelectedIndexChanged_0 then
                        l_onSelectedIndexChanged_0(v9.current);
                    end;
                    if l_listRef_0 and l_listRef_0.current then
                        l_listRef_0.current:scrollToIndex({
                            index = v9.current, 
                            animated = v8, 
                            viewOffset = l_viewOffset_0
                        });
                    else
                        return nil;
                    end;
                end;
            else
                return nil;
            end;
        end;
        return nil;
    end, {
        l_listRef_0, 
        v9, 
        v3, 
        l_onSelectedIndexChanged_0, 
        v8, 
        l_viewOffset_0, 
        l_data_0
    }), (v0.useCallback(function(v16)
        local v17 = v16.index * v16.averageItemLength;
        if not l_listRef_0 or not l_listRef_0.current then
            warn("Animated scrolling failed, the ref to the ScrollView is nil." .. "This could indicate that you are selecting focus before the ScrollView has mounted.");
            return ;
        else
            l_listRef_0.current:scrollToOffset({
                offset = v17
            });
            return ;
        end;
    end, {
        l_listRef_0
    }));
end;
