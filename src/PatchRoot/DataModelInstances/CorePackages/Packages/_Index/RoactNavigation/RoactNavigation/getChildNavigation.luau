local v0 = require(script.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Object_0 = v0.Object;
local v3 = require(script.Parent.getEventManager);
local v4 = require(script.Parent.getChildRouter);
local v5 = require(script.Parent.routers.getNavigationActionCreators);
local v6 = require(script.Parent.getChildrenNavigationCache);
local function _(v7)
    return function(v8, v9)
        local l_params_0 = v7.params;
        if l_params_0 and l_params_0[v8] ~= nil then
            return l_params_0[v8];
        else
            return v9;
        end;
    end;
end;
local function v12(v13, v14, v15)
    local v16 = v6(v13);
    local v18 = l_Array_0.findIndex(v13.state.routes, function(v17)
        return v17.key == v14;
    end);
    if v18 < 1 then
        return nil;
    else
        local v19 = v13.state.routes[v18];
        local v20 = v16[v14];
        if v20 and v20.state == v19 then
            return v20;
        else
            local v21 = v4(v13.router, v19.routeName);
            local v22 = nil;
            if v19.routes and type(v19.index) == "number" then
                v22 = v19.routes[v19.index];
            end;
            local v23 = l_Object_0.assign(if not v13.actions then {} else table.clone(v13.actions), v13.router.getActionCreators(v19, v13.state.key) or {}, (not not v21 and v21.getActionCreators(v22, v19.key) or {}) or {}, v5(v19) or {});
            local v24 = {};
            for v25, v26 in v23, nil, nil do
                v24[v25] = function(...)
                    return v13.dispatch((v26(...)));
                end;
            end;
            local v27 = true;
            local v28 = v15();
            if v28 then
                v27 = l_Array_0.indexOf(v28.state.routes, v19) == 1;
            end;
            if v20 and v20.isFirstRouteInParent() == v27 then
                local v29 = nil;
                v29 = l_Object_0.assign(table.clone(v20), v24, {
                    state = v19, 
                    router = v21, 
                    actions = v23, 
                    getParam = function(v30, v31)
                        local l_params_1 = v19.params;
                        if l_params_1 and l_params_1[v30] ~= nil then
                            return l_params_1[v30];
                        else
                            return v31;
                        end;
                    end, 
                    getChildNavigation = function(v33)
                        return v12(v29, v33, function()
                            local v34 = v15();
                            if not v34 then
                                return nil;
                            else
                                return (v34.getChildNavigation(v14));
                            end;
                        end);
                    end
                });
                v16[v14] = v29;
                return v29;
            else
                local v35 = v3(v14);
                local v36 = nil;
                v36 = l_Object_0.assign(table.clone(v24), {
                    state = v19, 
                    router = v21, 
                    actions = v23, 
                    getParam = function(v37, v38)
                        local l_params_2 = v19.params;
                        if l_params_2 and l_params_2[v37] ~= nil then
                            return l_params_2[v37];
                        else
                            return v38;
                        end;
                    end, 
                    getChildNavigation = function(v40)
                        return v12(v36, v40, function()
                            local v41 = v15();
                            if not v41 then
                                return nil;
                            else
                                return (v41.getChildNavigation(v14));
                            end;
                        end);
                    end, 
                    isFocused = function()
                        local v42 = v15();
                        if v42 then
                            if v42.isFocused() then
                                local l_state_0 = v42.state;
                                if l_state_0.routes[l_state_0.index].key == v14 then
                                    return true;
                                else
                                    return false;
                                end;
                            else
                                return false;
                            end;
                        else
                            return false;
                        end;
                    end, 
                    isFirstRouteInParent = function()
                        return v27;
                    end, 
                    dispatch = v13.dispatch, 
                    getScreenProps = v13.getScreenProps, 
                    _dangerouslyGetParent = v15, 
                    addListener = v35.addListener, 
                    emit = v35.emit
                });
                v16[v14] = v36;
                return v36;
            end;
        end;
    end;
end;
return v12;
