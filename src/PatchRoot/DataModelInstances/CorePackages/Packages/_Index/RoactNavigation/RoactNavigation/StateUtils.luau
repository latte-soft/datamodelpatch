local v0 = require(script.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Object_0 = v0.Object;
local v15 = {
    get = function(v3, v4)
        for _, v6 in v3.routes, nil, nil do
            if v6.key == v4 then
                return v6;
            end;
        end;
        return nil;
    end, 
    indexOf = function(v7, v8)
        for v9, v10 in v7.routes, nil, nil do
            if v10.key == v8 then
                return v9;
            end;
        end;
        return nil;
    end, 
    has = function(v11, v12)
        for _, v14 in v11.routes, nil, nil do
            if v14.key == v12 then
                return true;
            end;
        end;
        return false;
    end
};
v15.push = function(v16, v17)
    assert(v15.indexOf(v16, v17.key) == nil, ("should not push route with duplicated key %s"):format(v17.key));
    local v18 = l_Array_0.concat(v16.routes, {
        v17
    });
    return l_Object_0.assign(table.clone(v16), {
        index = #v18, 
        routes = v18
    });
end;
v15.pop = function(v19)
    if v19.index <= 1 then
        return v19;
    else
        local v20 = table.clone(v19.routes);
        table.remove(v20, #v20);
        return l_Object_0.assign(table.clone(v19), {
            index = #v20, 
            routes = v20
        });
    end;
end;
v15.jumpToIndex = function(v21, v22)
    if v22 == v21.index then
        return v21;
    else
        assert(v21.routes[v22] ~= nil, ("invalid index %d to jump to"):format(v22));
        return l_Object_0.assign(table.clone(v21), {
            index = v22
        });
    end;
end;
v15.jumpTo = function(v23, v24)
    local v25 = v15.indexOf(v23, v24);
    assert(v25 ~= nil, ("attempt to jump to unknown key \"%s\""):format(v24));
    return v15.jumpToIndex(v23, v25);
end;
v15.back = function(v26)
    local v27 = v26.index - 1;
    if v26.routes[v27] then
        return v15.jumpToIndex(v26, v27);
    else
        return v26;
    end;
end;
v15.forward = function(v28)
    local v29 = v28.index + 1;
    if v28.routes[v29] then
        return v15.jumpToIndex(v28, v29);
    else
        return v28;
    end;
end;
v15.replaceAndPrune = function(v30, v31, v32)
    local v33 = v15.indexOf(v30, v31);
    local v34 = v15.replaceAtIndex(v30, v33, v32);
    return l_Object_0.assign(table.clone(v34), {
        routes = {
            unpack(v34.routes, 1, v33)
        }
    });
end;
v15.replaceAt = function(v35, v36, v37, v38)
    local v39 = v15.indexOf(v35, v36);
    local v40 = if not v38 then v39 else v35.index;
    local v41 = v15.replaceAtIndex(v35, v39, v37);
    v41.index = v40;
    return v41;
end;
v15.replaceAtIndex = function(v42, v43, v44)
    assert(v42.routes[v43] ~= nil, ("invalid index %d for replacing route %s"):format(v43, v44.key));
    if v42.routes[v43] == v44 and v43 == v42.index then
        return v42;
    else
        local v45 = table.clone(v42.routes);
        v45[v43] = v44;
        return l_Object_0.assign(table.clone(v42), {
            index = v43, 
            routes = v45
        });
    end;
end;
v15.reset = function(v46, v47, v48)
    local v49 = false;
    if type(v47) == "table" then
        v49 = #v47 > 0;
    end;
    assert(v49, "invalid routes to replace");
    local v50 = v48 or #v47;
    if #v46.routes == #v47 and v46.index == v50 then
        v49 = true;
        for v51 = 1, #v47 do
            if v46.routes[v51] ~= v47[v51] then
                v49 = false;
                break;
            end;
        end;
        if v49 then
            return v46;
        end;
    end;
    assert(v47[v50] ~= nil, ("invalid index %d to reset"):format(v50));
    return l_Object_0.assign(table.clone(v46), {
        index = v50, 
        routes = v47
    });
end;
return v15;
