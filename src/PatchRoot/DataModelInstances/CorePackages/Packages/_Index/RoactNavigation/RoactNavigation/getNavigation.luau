local l_Parent_0 = script.Parent;
local l_Object_0 = require(l_Parent_0.Parent.LuauPolyfill).Object;
local v2 = require(l_Parent_0.Events);
local v3 = require(l_Parent_0.routers.getNavigationActionCreators);
local v4 = require(l_Parent_0.getChildNavigation);
local v5 = require(l_Parent_0.getChildrenNavigationCache);
return function(v6, v7, v8, v9, v10, v11)
    local v12 = v6.getActionCreators(v7, nil);
    local v13 = {
        actions = v12, 
        router = v6, 
        state = v7, 
        dispatch = v8, 
        getScreenProps = v10, 
        _dangerouslyGetParent = function()
            return nil;
        end, 
        isFirstRouteInParent = function()
            return true;
        end, 
        _childrenNavigation = v5(v11())
    };
    v13.getChildNavigation = function(v14)
        return v4(v13, v14, v11);
    end;
    v13.isFocused = function(v15)
        local l_state_0 = v11().state;
        local l_routes_0 = l_state_0.routes;
        local l_index_0 = l_state_0.index;
        local v19 = true;
        if v15 ~= nil then
            v19 = l_routes_0[l_index_0].key == v15;
        end;
        return v19;
    end;
    v13.addListener = function(v20, v21)
        if v20 ~= v2.Action then
            return {
                remove = function()
                end
            };
        else
            v9[v21] = true;
            return {
                remove = function()
                    v9[v21] = nil;
                end
            };
        end;
    end;
    local v22 = l_Object_0.assign(v3(v13.state), v12);
    for v23, _ in v22, nil, nil do
        v13[v23] = function(...)
            v13.dispatch(v22[v23](...));
        end;
    end;
    return v13;
end;
