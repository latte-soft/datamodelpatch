local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local v4 = require(l_Parent_0.NavigationActions);
local v5 = require(script.Parent.StackActions);
local v6 = require(l_Parent_0.utils.KeyGenerator);
local v7 = require(l_Parent_0.StateUtils);
local v8 = require(script.Parent.getScreenForRouteName);
local v9 = require(script.Parent.createConfigGetter);
local v10 = require(script.Parent.validateRouteConfigArray);
local v11 = require(script.Parent.validateRouteConfigMap);
local v12 = require(l_Parent_0.utils.invariant);
local l_createPathParser_0 = require(script.Parent.pathUtils).createPathParser;
local v14 = require(script.Parent["ChildIsScreenRouterSymbol.roblox"]);
local function v15()
    return {};
end;
local function _(v16)
    local v17 = true;
    if v16.type ~= v4.Navigate then
        v17 = v16.type == v5.Push;
    end;
    return v17;
end;
local function _(v19)
    local v20 = false;
    if v19.type == v5.Reset then
        v20 = v19.key == nil;
    end;
    return v20;
end;
local function v23(v22)
    return (next(v22));
end;
local function v29(v24, v25, _)
    local v27, v28 = next(v25);
    v24[v27] = v28;
    return v24;
end;
return function(v30, v31)
    v10(v30);
    v31 = v31 or {};
    local v32 = v11(l_Array_0.reduce(v30, v29, {}));
    local v33 = v31.order or l_Array_0.map(v30, v23);
    local v34 = {};
    for _, v36 in v33, nil, nil do
        local v37 = v32[v36];
        local v38 = if type(v37) == "table" and v37.screen then v37.screen else v37;
        if not (type(v38) == "table") or not v38.router then
            v34[v36] = v14;
        else
            v34[v36] = v38.router;
        end;
    end;
    local l_initialRouteParams_0 = v31.initialRouteParams;
    local v40 = v31.getCustomActionCreators or v15;
    local v41 = v31.initialRouteName or v33[1];
    local v42 = v34[v41];
    if l_Array_0.indexOf(v33, v41) < 1 then
        local v43 = "";
        for _, v45 in v33, nil, nil do
            v43 = v43 .. v45 .. ",";
        end;
        error(string.format("Invalid initialRouteName '%s'. Must be one of [%s]", v41, v43), 2);
    end;
    local function v51(v46)
        local v47 = {};
        local v48 = v34[v46.routeName];
        local v49 = true;
        if v46.type ~= v4.Navigate then
            v49 = v46.type == v5.Push;
        end;
        if v49 and v48 ~= nil then
            v49 = {};
            if v48 ~= v14 then
                v49 = v48.getStateForAction(v46.action or v4.init({
                    params = v46.params
                }));
            end;
            return {
                key = "StackRouterRoot", 
                isTransitioning = false, 
                index = 1, 
                routes = {
                    l_Object_0.assign({
                        params = v46.params
                    }, v49, {
                        key = v46.key or v6.generateKey(), 
                        routeName = v46.routeName
                    })
                }
            };
        else
            if v42 ~= nil and v42 ~= v14 then
                v47 = v42.getStateForAction(v4.navigate({
                    routeName = v41, 
                    params = l_initialRouteParams_0
                }));
            end;
            v49 = v32[v41];
            local v50 = false;
            if type(v49) == "table" then
                v50 = v49.params;
            end;
            return {
                key = "StackRouterRoot", 
                isTransitioning = false, 
                index = 1, 
                routes = {
                    (l_Object_0.assign(table.clone(v47), {
                        params = (((v50 or v47.params) or v46.params) or l_initialRouteParams_0) and l_Object_0.assign(if not v50 then {} else table.clone(v50), v47.params or {}, v46.params or {}, l_initialRouteParams_0 or {}), 
                        routeName = v41, 
                        key = (v46.key or v31.initialRouteKey) or v6.generateKey()
                    }))
                }
            };
        end;
    end;
    local function v55(v52, v53)
        if v53.params == l_Object_0.None then
            return nil;
        else
            local v54 = v32[v52];
            if not (type(v54) == "table") or not v54.params then
                if not v53.params then
                    return nil;
                else
                    return l_Object_0.assign({}, v53.params);
                end;
            else
                return l_Object_0.assign(table.clone(v54.params), v53.params);
            end;
        end;
    end;
    local v56 = l_createPathParser_0(v34, v32, v31);
    local l_getPathAndParamsForRoute_0 = v56.getPathAndParamsForRoute;
    local l_getActionForPathAndParams_0 = v56.getActionForPathAndParams;
    local v59 = {};
    for v60, v61 in v34, nil, nil do
        if v61 ~= v14 then
            v59[v60] = v61;
        end;
    end;
    return {
        childRouters = v59, 
        _CHILD_IS_SCREEN = v14, 
        getComponentForState = function(v62)
            local v63 = v62.routes[v62.index] or {};
            local l_routeName_0 = v63.routeName;
            v12(l_routeName_0, "There is no route defined for index '%d'. " .. "Make sure that you passed in a navigation state with a " .. "valid stack index.", v62.index);
            local v65 = v34[l_routeName_0];
            if v65 ~= nil and v65 ~= v14 then
                return v34[l_routeName_0].getComponentForState(v63);
            else
                return v8(v32, l_routeName_0);
            end;
        end, 
        getComponentForRouteName = function(v66)
            return v8(v32, v66);
        end, 
        getActionCreators = function(v67, v68)
            return l_Object_0.assign(table.clone(v40(v67, v68)), {
                pop = function(v69, v70)
                    return v5.pop(l_Object_0.assign({
                        n = v69
                    }, v70 or {}));
                end, 
                popToTop = function(v71)
                    return v5.popToTop(v71);
                end, 
                push = function(v72, v73, v74)
                    return v5.push({
                        routeName = v72, 
                        params = v73, 
                        action = v74
                    });
                end, 
                replace = function(v75, v76, v77, v78)
                    if type(v75) == "string" then
                        return v5.replace({
                            routeName = v75, 
                            params = v76, 
                            action = v77, 
                            key = v67.key, 
                            newKey = v78
                        });
                    else
                        v12(type(v75) == "table", "replaceWith must be a table or string");
                        v12(v76 == nil, "params must not be provided to .replace() when specifying a table");
                        v12(v77 == nil, "Child action must not be provided to .replace() when specifying a table");
                        v12(v78 == nil, "newKey must not be provided to .replace() when specifying a table");
                        return v5.replace(v75);
                    end;
                end, 
                reset = function(v79, v80)
                    local l_v80_0 = v80;
                    if v80 == nil then
                        l_v80_0 = #v79;
                    end;
                    return v5.reset({
                        actions = v79, 
                        index = l_v80_0, 
                        key = v68
                    });
                end, 
                dismiss = function()
                    return v4.back({
                        key = v68
                    });
                end
            });
        end, 
        getStateForAction = function(v82, v83)
            if v83 then
                local v84 = v83.routes[v83.index];
                local v85 = false;
                if v82.type == v5.Reset then
                    v85 = v82.key == nil;
                end;
                if not v85 and v82.type ~= v4.Navigate then
                    v85 = v34[v84.routeName];
                    if v85 ~= nil and v85 ~= v14 then
                        local v86 = v85.getStateForAction(v82, v84);
                        if v86 ~= nil and v86 ~= v84 then
                            return v7.replaceAt(v83, v84.key, v86, v82.type == v4.SetParams);
                        end;
                    end;
                elseif v82.type == v4.Navigate then
                    for v87 = #v83.routes, 1, -1 do
                        local v88 = v83.routes[v87];
                        local v89 = v34[v88.routeName];
                        local l_v82_0 = v82;
                        if not (not (v82.routeName == v88.routeName) or not v82.action) then
                            l_v82_0 = v82.action;
                        end;
                        if v89 ~= nil and v89 ~= v14 then
                            local v91 = v89.getStateForAction(l_v82_0, v88);
                            if not (v91 ~= nil) or v91 ~= v88 then
                                local v92 = v7.replaceAndPrune(v83, if not v91 then v88.key else v91.key, v91 or v88);
                                local l_isTransitioning_0 = v83.isTransitioning;
                                if v83.index ~= v92.index then
                                    l_isTransitioning_0 = v82.immediate ~= true;
                                end;
                                return l_Object_0.assign(table.clone(v92), {
                                    isTransitioning = l_isTransitioning_0
                                });
                            end;
                        end;
                    end;
                end;
                v85 = true;
                if v82.type ~= v4.Navigate then
                    v85 = v82.type == v5.Push;
                end;
                if v85 and v34[v82.routeName] ~= nil then
                    v85 = v34[v82.routeName];
                    local l_v12_0 = v12;
                    local v95 = true;
                    if v82.type == v5.Push then
                        v95 = v82.key == nil;
                    end;
                    l_v12_0(v95, "StackRouter does not support key on the push action");
                    l_v12_0 = function(v96)
                        return v96.routeName == v82.routeName;
                    end;
                    if v82.key then
                        l_v12_0 = function(v97)
                            return v97.key == v82.key;
                        end;
                    end;
                    v95 = l_Array_0.findIndex(v83.routes, l_v12_0);
                    if v82.type ~= v5.Push and v95 > 0 then
                        if not (v83.index == v95) or v82.params then
                            local v98 = l_Array_0.slice(v83.routes, 1, v95 + 1);
                            if v82.params then
                                local v99 = v83.routes[v95];
                                v98[v95] = l_Object_0.assign(table.clone(v99), {
                                    params = if v82.params == l_Object_0.None then l_Object_0.None else if v99.params then l_Object_0.assign(table.clone(v99.params), v82.params) else table.clone(v82.params)
                                });
                            end;
                            local l_isTransitioning_1 = v83.isTransitioning;
                            if v83.index ~= v95 then
                                l_isTransitioning_1 = v82.immediate ~= true;
                            end;
                            return l_Object_0.assign(table.clone(v83), {
                                isTransitioning = l_isTransitioning_1, 
                                index = v95, 
                                routes = v98
                            });
                        else
                            return nil;
                        end;
                    else
                        local _ = nil;
                        return l_Object_0.assign(v7.push(v83, if v85 ~= v14 then l_Object_0.assign({
                            params = v55(v82.routeName, v82)
                        }, v85.getStateForAction(v82.action or v4.init({
                            params = v55(v82.routeName, v82)
                        })), {
                            routeName = v82.routeName, 
                            key = v82.key or v6.generateKey()
                        }) else {
                            params = v55(v82.routeName, v82), 
                            routeName = v82.routeName, 
                            key = v82.key or v6.generateKey()
                        }), {
                            isTransitioning = v82.immediate ~= true
                        });
                    end;
                elseif v82.type == v5.Push and v34[v82.routeName] == nil then
                    return v83;
                else
                    v85 = true;
                    if v82.type ~= v4.Navigate then
                        v85 = v82.type == v5.Push;
                    end;
                    if v85 then
                        for v102 in v34, nil, nil do
                            local v103 = v34[v102];
                            if v103 ~= nil and v103 ~= v14 then
                                local v104 = v103.getStateForAction(v4.init());
                                local v105 = v103.getStateForAction(v82, v104);
                                local v106 = nil;
                                if v105 == nil then
                                    v106 = v104;
                                elseif v105 ~= v104 then
                                    v106 = v105;
                                end;
                                if v106 then
                                    return l_Object_0.assign(v7.push(v83, (l_Object_0.assign(table.clone(v106), {
                                        routeName = v102, 
                                        key = v82.key or v6.generateKey()
                                    }))), {
                                        isTransitioning = v82.immediate ~= true
                                    });
                                end;
                            end;
                        end;
                    end;
                    if v82.type == v5.PopToTop then
                        if v82.key and v83.key ~= v82.key then
                            return v83;
                        elseif v83.index > 1 then
                            return l_Object_0.assign(table.clone(v83), {
                                isTransitioning = v82.immediate ~= true, 
                                index = 1, 
                                routes = {
                                    v83.routes[1]
                                }
                            });
                        else
                            return v83;
                        end;
                    else
                        if v82.type == v5.Replace then
                            v85 = nil;
                            v85 = if v82.key == nil and #v83.routes > 0 then #v83.routes else l_Array_0.findIndex(v83.routes, function(v107)
                                return v107.key == v82.key;
                            end);
                            if v85 > 0 then
                                local v108 = v34[v82.routeName];
                                local v109 = {};
                                if v108 ~= nil and v108 ~= v14 then
                                    v109 = v108.getStateForAction(v82.action or v4.init({
                                        params = v55(v82.routeName, v82)
                                    }));
                                end;
                                local v110 = table.clone(v83.routes);
                                v110[v85] = l_Object_0.assign({
                                    params = v55(v82.routeName, v82)
                                }, v109, {
                                    routeName = v82.routeName, 
                                    key = v82.newKey or v6.generateKey()
                                });
                                return l_Object_0.assign(table.clone(v83), {
                                    routes = v110
                                });
                            end;
                        end;
                        if not ((v82.type == v5.CompleteTransition and (not (v82.key ~= nil) or v82.key == v83.key)) and v82.toChildKey == v83.routes[v83.index].key) or not v83.isTransitioning then
                            if v82.type == v4.SetParams then
                                v85 = v82.key;
                                local l_v85_0 = v85 --[[ copy: 3 -> 14 ]];
                                local v113 = l_Array_0.findIndex(v83.routes, function(v112)
                                    return v112.key == l_v85_0;
                                end);
                                if v113 > 0 then
                                    local v114 = v83.routes[v113];
                                    local l_None_0 = l_Object_0.None;
                                    if v82.params ~= l_Object_0.None then
                                        l_None_0 = if not not v114.params and v82.params then l_Object_0.assign(table.clone(v114.params), v82.params) else if v114.params then table.clone(v114.params) else if v82.params then table.clone(v82.params) else {};
                                    end;
                                    local v116 = table.clone(v83.routes);
                                    v116[v113] = l_Object_0.assign(table.clone(v114), {
                                        params = l_None_0
                                    });
                                    return l_Object_0.assign(table.clone(v83), {
                                        routes = v116
                                    });
                                end;
                            end;
                            if v82.type == v5.Reset then
                                if v82.key ~= nil and v82.key ~= v83.key then
                                    return v83;
                                else
                                    return l_Object_0.assign(table.clone(v83), {
                                        routes = if not v82.actions then {} else l_Array_0.map(v82.actions, function(v117)
                                            local v118 = v34[v117.routeName];
                                            local v119 = {};
                                            if v118 ~= nil and v118 ~= v14 then
                                                v119 = v118.getStateForAction(v117.action or v4.init({
                                                    params = v55(v117.routeName, v117)
                                                }));
                                            end;
                                            return l_Object_0.assign({
                                                params = v55(v117.routeName, v117)
                                            }, v119, {
                                                routeName = v117.routeName, 
                                                key = v117.key or v6.generateKey()
                                            });
                                        end), 
                                        index = v82.index
                                    });
                                end;
                            else
                                if not (v82.type ~= v4.Back) or v82.type == v5.Pop then
                                    v85 = v82.key;
                                    local l_n_0 = v82.n;
                                    local l_immediate_0 = v82.immediate;
                                    local l_prune_0 = v82.prune;
                                    if not (v82.type == v5.Pop and l_prune_0 == false) or not v85 then
                                        local l_index_0 = v83.index;
                                        if v82.type == v5.Pop and l_n_0 ~= nil then
                                            l_index_0 = math.max(2, (v83.index - l_n_0) + 1);
                                        elseif v85 then
                                            local l_v85_1 = v85 --[[ copy: 3 -> 13 ]];
                                            l_index_0 = l_Array_0.findIndex(v83.routes, function(v125)
                                                return v125.key == l_v85_1;
                                            end);
                                        end;
                                        if l_index_0 > 1 then
                                            return l_Object_0.assign(table.clone(v83), {
                                                routes = l_Array_0.slice(v83.routes, 1, l_index_0), 
                                                index = l_index_0 - 1, 
                                                isTransitioning = l_immediate_0 ~= true
                                            });
                                        end;
                                    else
                                        local l_v85_2 = v85 --[[ copy: 3 -> 12 ]];
                                        local v128 = l_Array_0.findIndex(v83.routes, function(v127)
                                            return v127.key == l_v85_2;
                                        end);
                                        if v128 > 0 then
                                            local v129 = l_Array_0.concat(l_Array_0.slice(v83.routes, 1, math.max(v128 - (l_n_0 or 1), 1) + 1), l_Array_0.slice(v83.routes, v128 + 1));
                                            if #v129 > 0 then
                                                return l_Object_0.assign(table.clone(v83), {
                                                    routes = v129, 
                                                    index = #v129, 
                                                    isTransitioning = l_immediate_0 ~= true
                                                });
                                            end;
                                        end;
                                    end;
                                end;
                                v85 = if not v82.key then nil else v7.indexOf(v83, v82.key);
                                for v130 = #v83.routes, 1, -1 do
                                    local v131 = v83.routes[v130];
                                    if v131.key ~= v84.key and (not (v85 ~= 1) or v131.key == v82.key) then
                                        local v132 = v34[v131.routeName];
                                        if v132 ~= nil and v132 ~= v14 then
                                            local v133 = v132.getStateForAction(v82, v131);
                                            if v133 == nil then
                                                return v83;
                                            elseif v133 ~= v131 then
                                                return v7.replaceAt(v83, v131.key, v133, v82.preserveFocus);
                                            end;
                                        end;
                                    end;
                                end;
                                return v83;
                            end;
                        else
                            return l_Object_0.assign(table.clone(v83), {
                                isTransitioning = false
                            });
                        end;
                    end;
                end;
            else
                return (v51(v82));
            end;
        end, 
        getPathAndParamsForState = function(v134)
            return l_getPathAndParamsForRoute_0(v134.routes[v134.index]);
        end, 
        getActionForPathAndParams = function(v135, v136)
            return l_getActionForPathAndParams_0(v135, v136);
        end, 
        getScreenOptions = v9(v32, v31.defaultNavigationOptions)
    };
end;
