local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local v4 = require(l_Parent_0.NavigationActions);
local v5 = require(l_Parent_0.BackBehavior);
local v6 = require(script.Parent.getScreenForRouteName);
local v7 = require(script.Parent.createConfigGetter);
local v8 = require(script.Parent.validateRouteConfigMap);
local v9 = require(script.Parent.validateRouteConfigArray);
local v10 = require(l_Parent_0.utils.invariant);
local v11 = require(l_Parent_0.routers.StackActions);
local v12 = require(script.Parent.SwitchActions);
local l_createPathParser_0 = require(script.Parent.pathUtils).createPathParser;
local function v14()
    return {};
end;
local function v16(v15)
    return (next(v15));
end;
local function v21(v17, v18)
    local v19, v20 = next(v18);
    v17[v19] = v20;
    return v17;
end;
return function(v22, v23)
    v9(v22);
    v23 = v23 or {};
    local v24 = v8(l_Array_0.reduce(v22, v21, {}));
    local v25 = v23.order or l_Array_0.map(v22, v16);
    local v26 = v23.getCustomActionCreators or v14;
    local l_initialRouteParams_0 = v23.initialRouteParams;
    local v28 = v23.initialRouteName or v25[1];
    local v29 = v23.backBehavior or v5.None;
    local v30 = true;
    if v23.resetOnBlur ~= nil then
        v30 = v23.resetOnBlur;
    end;
    local v31 = l_Array_0.indexOf(v25, v28);
    if v31 < 1 then
        error(("Invalid initialRouteName '%s'. Should be one of %s"):format(v28, (table.concat(l_Array_0.map(v25, function(v32)
            return ("\"%s\""):format(v32);
        end), ", "))), 2);
    end;
    local v33 = {};
    for _, v35 in v25, nil, nil do
        local v36 = v6(v24, v35);
        if not (type(v36) == "table") or not v36.router then
            v33[v35] = false;
        else
            v33[v35] = v36.router;
        end;
    end;
    local function _(v37, v38)
        local v39 = v24[v37];
        if not (type(v39) == "table") or not v39.params then
            return v38;
        elseif not v38 then
            return (table.clone(v39.params));
        else
            return (l_Object_0.assign(table.clone(v39.params), v38));
        end;
    end;
    local v41 = l_createPathParser_0(v33, v24, v23);
    local l_getPathAndParamsForRoute_0 = v41.getPathAndParamsForRoute;
    local l_getActionForPathAndParams_0 = v41.getActionForPathAndParams;
    local function v48(v44)
        local v45 = if v44 == v28 then l_initialRouteParams_0 else nil;
        local v46 = v24[v44];
        local v47 = if type(v46) == "table" and v46.params then if v45 then l_Object_0.assign(table.clone(v46.params), v45) else table.clone(v46.params) else v45;
        v46 = v33[v44];
        if not v46 then
            return {
                key = v44, 
                routeName = v44, 
                params = v47
            };
        else
            return l_Object_0.assign(table.clone(v46.getStateForAction((v4.init()))), {
                key = v44, 
                routeName = v44, 
                params = v47
            });
        end;
    end;
    local function v58(v49, v50, v51)
        local l_v51_0 = v51;
        if not (not (not (not v50 or not v51) and v50.index ~= v51.index) or not v30) then
            local l_routeName_0 = v50.routes[v50.index].routeName;
            local v54 = table.clone(v51.routes);
            v54[v50.index] = v48(l_routeName_0);
            l_v51_0 = l_Object_0.assign(table.clone(v51), {
                routes = v54
            });
        end;
        if not (v29 == v5.History) or not (not v50 or not l_v51_0) and l_v51_0.index == v50.index then
            return l_v51_0;
        else
            local v55 = if not v50 then {} else v50.routeKeyHistory;
            if v49.type == v4.Navigate then
                local l_key_0 = l_v51_0.routes[l_v51_0.index].key;
                v55 = l_Array_0.filter(v55, function(v57)
                    return v57 ~= l_key_0;
                end);
                table.insert(v55, l_key_0);
            elseif v49.type == v4.Back then
                v55 = table.clone(v55);
                table.remove(v55, #v55);
            end;
            return l_Object_0.assign(table.clone(l_v51_0), {
                routeKeyHistory = v55
            });
        end;
    end;
    local function v61()
        local v59 = l_Array_0.map(v25, v48);
        local v60 = {
            routes = v59, 
            index = v31
        };
        if v29 == v5.History then
            v60.routeKeyHistory = {
                v59[v31].key
            };
        end;
        return v60;
    end;
    return {
        childRouters = v33, 
        getActionCreators = function(v62, v63)
            return v26(v62, v63);
        end, 
        getScreenOptions = v7(v24, v23.defaultNavigationOptions), 
        getStateForAction = function(v64, v65)
            local v66 = if not v65 then nil else table.clone(v65);
            local v67 = v65 or v61();
            local l_index_0 = v67.index;
            if v64.type == v4.Init then
                local l_params_0 = v64.params;
                if l_params_0 then
                    local l_l_params_0_0 = l_params_0 --[[ copy: 5 -> 15 ]];
                    v67.routes = l_Array_0.map(v67.routes, function(v71)
                        local v72 = v71.routeName == v28 and l_initialRouteParams_0 or {};
                        return l_Object_0.assign(table.clone(v71), {
                            params = if not v71.params then l_Object_0.assign(table.clone(l_l_params_0_0), v72) else l_Object_0.assign(table.clone(v71.params), l_l_params_0_0, v72)
                        });
                    end);
                end;
            end;
            if v64.type == v12.JumpTo and (not (v64.key ~= nil) or v64.key == v67.key) then
                local l_params_1 = v64.params;
                local v75 = l_Array_0.findIndex(v67.routes, function(v74)
                    return v74.routeName == v64.routeName;
                end);
                if v75 < 1 then
                    error(("There is no route named '%s' in the navigator with the key '%s'.\n"):format(v64.routeName, v64.key) .. "Must be one of: " .. table.concat(l_Array_0.map(v67.routes, function(v76)
                        return v76.routeName;
                    end), ","));
                end;
                local l_routes_0 = v67.routes;
                if not l_params_1 then
                    return v58(v64, v66, l_Object_0.assign(table.clone(v67), {
                        routes = l_routes_0, 
                        index = v75
                    }));
                else
                    return v67.routes.map(function(v78, v79)
                        if v79 == v75 then
                            return l_Object_0.assign(table.clone(v78), {
                                params = l_Object_0.assign(table.clone(v78.params), l_params_1)
                            });
                        else
                            return v78;
                        end;
                    end);
                end;
            else
                local v80 = v67.routes[v67.index];
                local v81 = v33[v25[v67.index]];
                if v81 then
                    local v82 = v81.getStateForAction(v64, v80);
                    if v82 or not v65 then
                        if v82 and v82 ~= v80 then
                            local v83 = table.clone(v67.routes);
                            v83[v67.index] = v82;
                            return v58(v64, v66, l_Object_0.assign(table.clone(v67), {
                                routes = v83
                            }));
                        end;
                    else
                        return nil;
                    end;
                end;
                local v84 = true;
                if v64.key ~= nil then
                    v84 = v64.key == v80.key;
                end;
                if v64.type == v4.Back then
                    if v84 and v29 == v5.InitialRoute then
                        l_index_0 = v31;
                    elseif v84 and v29 == v5.Order then
                        l_index_0 = math.max(1, l_index_0 - 1);
                    elseif (v84 and v29 == v5.History) and #v67.routeKeyHistory > 1 then
                        l_index_0 = l_Array_0.indexOf(v25, v67.routeKeyHistory[#v67.routeKeyHistory - 1]);
                    end;
                end;
                local v85 = false;
                if v64.type == v4.Navigate then
                    v85 = l_Array_0.find(v25, function(v86, v87)
                        if v86 == v64.routeName then
                            l_index_0 = v87;
                            return true;
                        else
                            return false;
                        end;
                    end) ~= nil;
                    if v85 then
                        local v88 = v67.routes[l_index_0];
                        local v89 = v33[v64.routeName];
                        local l_v88_0 = v88;
                        if not (not v64.action or not v89) then
                            local v91 = v89.getStateForAction(v64.action, v88);
                            if v91 then
                                l_v88_0 = v91;
                            end;
                        end;
                        if v64.params then
                            l_v88_0 = l_Object_0.assign(table.clone(l_v88_0), {
                                params = if v64.params == l_Object_0.None then l_Object_0.None else if l_v88_0.params then l_Object_0.assign(table.clone(l_v88_0.params), v64.params) else table.clone(v64.params)
                            });
                        end;
                        if l_v88_0 ~= v88 then
                            local v92 = table.clone(v67.routes);
                            v92[l_index_0] = l_v88_0;
                            return v58(v64, v66, (l_Object_0.assign(table.clone(v67), {
                                routes = v92, 
                                index = l_index_0
                            })));
                        elseif not (not (l_v88_0 == v88 and v67.index == l_index_0) or not v66) then
                            return nil;
                        end;
                    end;
                end;
                if v64.type == v4.SetParams then
                    local l_key_1 = v64.key;
                    local l_l_key_1_0 = l_key_1 --[[ copy: 9 -> 14 ]];
                    local v96 = l_Array_0.findIndex(v67.routes, function(v95)
                        return v95.key == l_l_key_1_0;
                    end);
                    if v96 > 0 then
                        local v97 = v67.routes[v96];
                        local l_None_0 = l_Object_0.None;
                        if v64.params ~= l_Object_0.None then
                            l_None_0 = if not not v97.params and v64.params then l_Object_0.assign(table.clone(v97.params), v64.params) else if v97.params then table.clone(v97.params) else if v64.params then table.clone(v64.params) else {};
                        end;
                        local v99 = table.clone(v67.routes);
                        v99[v96] = l_Object_0.assign(table.clone(v97), {
                            params = l_None_0
                        });
                        return v58(v64, v66, l_Object_0.assign(table.clone(v67), {
                            routes = v99
                        }));
                    end;
                end;
                if l_index_0 ~= v67.index then
                    return v58(v64, v66, l_Object_0.assign(table.clone(v67), {
                        index = l_index_0
                    }));
                elseif not v85 or v65 then
                    if not v85 then
                        local v100 = true;
                        if v64.type ~= v4.Back then
                            v100 = true;
                            if v64.type ~= v11.Pop then
                                v100 = v64.type == v11.PopToTop;
                            end;
                        end;
                        local v101 = not v100;
                        if not v101 then
                            v101 = false;
                            if v64.type == v4.Back then
                                v101 = v64.key ~= nil;
                            end;
                        end;
                        if v101 then
                            local l_index_1 = v67.index;
                            local l_routes_1 = v67.routes;
                            l_Array_0.find(v25, function(v104, v105)
                                local v106 = v33[v104];
                                if v105 == l_index_1 then
                                    return false;
                                else
                                    local v107 = l_routes_1[v105];
                                    if v106 then
                                        v107 = v106.getStateForAction(v64, v107);
                                    end;
                                    if v107 then
                                        if v107 ~= l_routes_1[v105] then
                                            l_routes_1 = table.clone(l_routes_1);
                                            l_routes_1[v105] = v107;
                                            l_index_1 = v105;
                                            return true;
                                        else
                                            return false;
                                        end;
                                    else
                                        l_index_1 = v105;
                                        return true;
                                    end;
                                end;
                            end);
                            if v64.preserveFocus then
                                l_index_1 = v67.index;
                            end;
                            if not (l_index_1 == v67.index) or l_routes_1 ~= v67.routes then
                                return v58(v64, v66, l_Object_0.assign(table.clone(v67), {
                                    index = l_index_1, 
                                    routes = l_routes_1
                                }));
                            else
                                --[[ close >= 11 ]]
                            end;
                        end;
                        return v67;
                    else
                        return table.clone(v67);
                    end;
                else
                    return v67;
                end;
            end;
        end, 
        getComponentForState = function(v108)
            local l_routeName_1 = (v108.routes[v108.index] or {}).routeName;
            v10(l_routeName_1, "There is no route defined for index '%d'. " .. "Check that you passed in a navigation state with a " .. "valid tab/screen index.", v108.index);
            local v110 = v33[l_routeName_1];
            if not v110 then
                return v6(v24, l_routeName_1);
            else
                return v110.getComponentForState(v108.routes[v108.index]);
            end;
        end, 
        getComponentForRouteName = function(v111)
            return v6(v24, v111);
        end, 
        getPathAndParamsForState = function(v112)
            return l_getPathAndParamsForRoute_0(v112.routes[v112.index]);
        end, 
        getActionForPathAndParams = function(v113, v114)
            return l_getActionForPathAndParams_0(v113, v114);
        end
    };
end;
