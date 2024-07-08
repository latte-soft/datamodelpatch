local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local v4 = require(l_Parent_0.utils.TableUtilities);
local v5 = require(l_Parent_0.utils.invariant);
local function v9(v6, v7)
    if v6.index == v7.index then
        local v8 = #v6.key - #v7.key;
        if v8 == 0 then
            return v6.key < v7.key;
        else
            return v8 < 0;
        end;
    else
        return v6.index < v7.index;
    end;
end;
local function _(v10, v11)
    if v10 and v11 then
        if v10.key ~= v11.key then
            return false;
        else
            return v4.ShallowEqual(v10, v11);
        end;
    else
        return v10 == v11;
    end;
end;
local function _(v13, v14)
    local v15 = false;
    if v13.key == v14.key then
        v15 = false;
        if v13.index == v14.index then
            v15 = false;
            if v13.isStale == v14.isStale then
                v15 = false;
                if v13.isActive == v14.isActive then
                    if v13 and v14 then
                        if v13.key ~= v14.key then
                            return false;
                        else
                            v15 = v4.ShallowEqual(v13, v14);
                        end;
                    else
                        return v13 == v14;
                    end;
                end;
            end;
        end;
    end;
    return v15;
end;
return function(v17, v18, v19, v20)
    for _, v22 in v17, nil, nil do
        local l_route_0 = v22.route;
        if not (not v20 or not v20[l_route_0.key]) then
            v22.descriptor = v20[l_route_0.key];
        end;
    end;
    if v19 == v18 then
        return v17;
    else
        local v24 = {};
        local v25 = {};
        local v26 = {};
        for _, v28 in v17, nil, nil do
            local l_key_0 = v28.key;
            if v28.isStale then
                v26[l_key_0] = v28;
            end;
            v24[l_key_0] = v28;
        end;
        local v30 = {};
        local l_routes_0 = v18.routes;
        if v18.index < #l_routes_0 then
            print("Warning: StackRouter provided invalid state. Index should always be the top route");
            l_routes_0 = l_Array_0.slice(l_routes_0, 1, v18.index);
        end;
        for v32, v33 in l_routes_0, nil, nil do
            local v34 = "scene_" .. v33.key;
            local v35 = {
                index = v32, 
                isActive = false, 
                isStale = false, 
                key = v34, 
                route = v33, 
                descriptor = if not v20 then nil else v20[v33.key]
            };
            v5(not v30[v34], "navigation.state.routes[%d].key '%s' conflicts with another route", v32, v34);
            v30[v34] = true;
            if v26[v34] then
                v26[v34] = nil;
            end;
            v25[v34] = v35;
        end;
        if v19 then
            local l_routes_1 = v19.routes;
            if v19.index < #l_routes_1 then
                print("StackRouter provided invalid state. Index should always be the top route.");
                l_routes_1 = l_Array_0.slice(l_routes_1, 1, v19.index);
            end;
            for v37, v38 in l_routes_1, nil, nil do
                local v39 = "scene_" .. v38.key;
                if not v25[v39] then
                    local v40 = nil;
                    for _, v42 in v17, nil, nil do
                        if v42.route.key == v38.key then
                            v40 = v42;
                            break;
                        end;
                    end;
                    local v43 = v20[v38.key];
                    if v40 then
                        v43 = v40.descriptor;
                    end;
                    if v43 then
                        v26[v39] = {
                            index = v37, 
                            isActive = false, 
                            isStale = true, 
                            key = v39, 
                            route = v38, 
                            descriptor = v43
                        };
                    end;
                end;
            end;
        end;
        local v44 = {};
        local function _(v45)
            local v46 = v24[v45.key] or nil;
            if v46 then
                local v47 = false;
                if v46.key == v45.key then
                    v47 = false;
                    if v46.index == v45.index then
                        v47 = false;
                        if v46.isStale == v45.isStale then
                            v47 = false;
                            if v46.isActive == v45.isActive then
                                v47 = if not not v46 and v45 then not (v46.key ~= v45.key) and v4.ShallowEqual(v46, v45) else v46 == v45;
                            end;
                        end;
                    end;
                end;
                if v47 then
                    table.insert(v44, v46);
                    return ;
                end;
            end;
            table.insert(v44, v45);
        end;
        for _, v50 in v26, nil, nil do
            local v51 = v24[v50.key] or nil;
            if v51 then
                local v52 = false;
                if v51.key == v50.key then
                    v52 = false;
                    if v51.index == v50.index then
                        v52 = false;
                        if v51.isStale == v50.isStale then
                            v52 = false;
                            if v51.isActive == v50.isActive then
                                v52 = if not not v51 and v50 then not (v51.key ~= v50.key) and v4.ShallowEqual(v51, v50) else v51 == v50;
                            end;
                        end;
                    end;
                end;
                if v52 then
                    table.insert(v44, v51);
                    continue;
                end;
            end;
            table.insert(v44, v50);
        end;
        for _, v54 in v25, nil, nil do
            local v55 = v24[v54.key] or nil;
            if v55 then
                local v56 = false;
                if v55.key == v54.key then
                    v56 = false;
                    if v55.index == v54.index then
                        v56 = false;
                        if v55.isStale == v54.isStale then
                            v56 = false;
                            if v55.isActive == v54.isActive then
                                v56 = if not not v55 and v54 then not (v55.key ~= v54.key) and v4.ShallowEqual(v55, v54) else v55 == v54;
                            end;
                        end;
                    end;
                end;
                if v56 then
                    table.insert(v44, v55);
                    continue;
                end;
            end;
            table.insert(v44, v54);
        end;
        table.sort(v44, v9);
        local v57 = 0;
        for v58, v59 in v44, nil, nil do
            local v60 = not v59.isStale and v59.index == v18.index;
            if v60 ~= v59.isActive then
                v44[v58] = l_Object_0.assign(table.clone(v59), {
                    isActive = v60
                });
            end;
            if v60 then
                v57 = v57 + 1;
            end;
        end;
        v5(v57 == 1, "There should only be one active scene, not %d", v57);
        if #v44 ~= #v17 then
            return v44;
        else
            for v61, v62 in v44, nil, nil do
                local v63 = v17[v61];
                local v64 = false;
                if v63.key == v62.key then
                    v64 = false;
                    if v63.index == v62.index then
                        v64 = false;
                        if v63.isStale == v62.isStale then
                            v64 = false;
                            if v63.isActive == v62.isActive then
                                v64 = if not not v63 and v62 then not (v63.key ~= v62.key) and v4.ShallowEqual(v63, v62) else v63 == v62;
                            end;
                        end;
                    end;
                end;
                if not v64 then
                    return v44;
                end;
            end;
            return v17;
        end;
    end;
end;
