local l_Parent_0 = script.Parent.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local v2 = require(l_Parent_0.React);
local l_useMemo_0 = v2.useMemo;
local l_useContext_0 = v2.useContext;
local v5 = {};
local v6 = v2.createContext(nil);
v5.VirtualizedListContext = v6;
if _G.__DEV__ then
    v6.displayName = "VirtualizedListContext";
end;
v5.VirtualizedListContextResetter = function(v7)
    return v2.createElement(v6.Provider, {
        value = nil
    }, v7.children);
end;
v5.VirtualizedListContextProvider = function(v8)
    local l_children_0 = v8.children;
    local l_value_0 = v8.value;
    return v2.createElement(v6.Provider, {
        value = l_useMemo_0(function()
            return {
                cellKey = nil, 
                getScrollMetrics = l_value_0.getScrollMetrics, 
                horizontal = l_value_0.horizontal, 
                getOutermostParentListRef = l_value_0.getOutermostParentListRef, 
                getNestedChildState = l_value_0.getNestedChildState, 
                registerAsNestedChild = l_value_0.registerAsNestedChild, 
                unregisterAsNestedChild = l_value_0.unregisterAsNestedChild, 
                debugInfo = {
                    cellKey = l_value_0.debugInfo.cellKey, 
                    horizontal = l_value_0.debugInfo.horizontal, 
                    listKey = l_value_0.debugInfo.listKey, 
                    parent = l_value_0.debugInfo.parent
                }
            };
        end, {
            l_value_0.getScrollMetrics, 
            l_value_0.horizontal, 
            l_value_0.getOutermostParentListRef, 
            l_value_0.getNestedChildState, 
            l_value_0.registerAsNestedChild, 
            l_value_0.unregisterAsNestedChild, 
            l_value_0.debugInfo.cellKey, 
            l_value_0.debugInfo.horizontal, 
            l_value_0.debugInfo.listKey, 
            l_value_0.debugInfo.parent
        })
    }, l_children_0);
end;
v5.VirtualizedListCellContextProvider = function(v11)
    local l_cellKey_0 = v11.cellKey;
    local l_children_1 = v11.children;
    local v14 = l_useContext_0(v6);
    return v2.createElement(v6.Provider, {
        value = if v14 == nil then nil else l_Object_0.assign(table.clone(v14), {
            cellKey = l_cellKey_0
        })
    }, l_children_1);
end;
return v5;
