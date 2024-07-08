local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Map_0 = v1.Map;
local l_instanceof_0 = v1.instanceof;
local l_setTimeout_0 = v1.setTimeout;
local l_Error_0 = v1.Error;
local l_Error_1 = v1.Error;
local v9 = require(l_Parent_0.Promise);
local v10 = {};
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = {};
v21.__index = v21;
v21.new = function(v22, v23)
    local v24 = setmetatable({}, v21);
    if typeof(v22) ~= "function" then
        error(l_Error_0.new("DataLoader must be constructed with a function which accepts " .. ("Array<key> and returns Promise<Array<value>>, but got: %s."):format((tostring(v22)))));
    end;
    v24._batchLoadFn = v22;
    v24._maxBatchSize = v12(v23);
    v24._batchScheduleFn = v16(v23);
    v24._cacheKeyFn = v17(v23);
    v24._cacheMap = v18(v23);
    v24._batch = nil;
    v24.name = v19(v23);
    return v24;
end;
v21.load = function(v25, v26)
    if v26 == nil then
        error(l_Error_0.new("The loader.load() function must be called with a value, " .. ("but got: %s."):format((tostring(v26)))));
    end;
    local v27 = v11(v25);
    local l__cacheMap_0 = v25._cacheMap;
    local v29 = v25._cacheKeyFn(v26);
    if l_Boolean_0.toJSBoolean(l__cacheMap_0) then
        local v30 = l__cacheMap_0:get(v29);
        if l_Boolean_0.toJSBoolean(v30) then
            local v31;
            if l_Boolean_0.toJSBoolean(v27.cacheHits) then
                v31 = v27.cacheHits;
                if v31 then
                    goto label0;
                end;
            end;
            v27.cacheHits = {};
            v31 = v27.cacheHits;
            ::label0::;
            return v9.new(function(v32)
                table.insert(v31, function()
                    v32(v30);
                end);
            end);
        end;
    end;
    table.insert(v27.keys, v26);
    local v35 = v9.new(function(v33, v34)
        table.insert(v27.callbacks, {
            resolve = v33, 
            reject = v34
        });
    end);
    if l_Boolean_0.toJSBoolean(l__cacheMap_0) then
        l__cacheMap_0:set(v29, v35);
    end;
    return v35;
end;
v21.loadMany = function(v36, v37)
    if not l_Boolean_0.toJSBoolean(v20(v37)) then
        error(l_Error_0.new("The loader.loadMany() function must be called with Array<key> " .. ("but got: %s."):format((tostring(v37)))));
    end;
    local v38 = {};
    local v39 = 0;
    while v39 < #v37 do
        table.insert(v38, v36:load(v37[v39 + 1]):catch(function(v40)
            return v40;
        end));
        v39 = v39 + 1;
    end;
    return v9.all(v38);
end;
v21.clear = function(v41, v42)
    local l__cacheMap_1 = v41._cacheMap;
    if l_Boolean_0.toJSBoolean(l__cacheMap_1) then
        l__cacheMap_1:delete((v41._cacheKeyFn(v42)));
    end;
    return v41;
end;
v21.clearAll = function(v44)
    local l__cacheMap_2 = v44._cacheMap;
    if l_Boolean_0.toJSBoolean(l__cacheMap_2) then
        l__cacheMap_2:clear();
    end;
    return v44;
end;
v21.prime = function(v46, v47, v48)
    local l__cacheMap_3 = v46._cacheMap;
    if l_Boolean_0.toJSBoolean(l__cacheMap_3) then
        local v50 = v46._cacheKeyFn(v47);
        if l__cacheMap_3:get(v50) == nil then
            local v51 = nil;
            if not l_instanceof_0(v48, l_Error_1) then
                v51 = v9.resolve(v48);
            else
                v51 = v9.reject(v48);
                v51:catch(function()
                end);
            end;
            l__cacheMap_3:set(v50, v51);
        end;
    end;
    return v46;
end;
local function v53(v52)
    l_setTimeout_0(v52);
end;
v11 = function(v54)
    local l__batch_0 = v54._batch;
    if not (not (l__batch_0 ~= nil) or l_Boolean_0.toJSBoolean(l__batch_0.hasDispatched)) and #l__batch_0.keys < v54._maxBatchSize then
        return l__batch_0;
    else
        local v56 = {
            hasDispatched = false, 
            keys = {}, 
            callbacks = {}
        };
        v54._batch = v56;
        v54._batchScheduleFn(function()
            v13(v54, v56);
        end);
        return v56;
    end;
end;
v13 = function(v57, v58)
    v58.hasDispatched = true;
    if #v58.keys == 0 then
        v15(v58);
        return ;
    else
        local v59 = nil;
        local _, v62, v63 = xpcall(function()
            v59 = v57._batchLoadFn(v58.keys);
        end, function(v60)
            return v14(v57, v58, l_Error_0.new("DataLoader must be constructed with a function which accepts " .. "Array<key> and returns Promise<Array<value>>, but the function " .. ("errored synchronously: %s."):format((tostring(v60))))), true;
        end);
        if not v63 then
            if not l_Boolean_0.toJSBoolean(v59) or typeof(v59.andThen) ~= "function" then
                return v14(v57, v58, l_Error_0.new("DataLoader must be constructed with a function which accepts " .. "Array<key> and returns Promise<Array<value>>, but the function did " .. ("not return a Promise: %s."):format((tostring(v59)))));
            else
                v59:andThen(function(v64)
                    if not l_Boolean_0.toJSBoolean(v20(v64)) then
                        error(l_Error_0.new("DataLoader must be constructed with a function which accepts " .. "Array<key> and returns Promise<Array<value>>, but the function did " .. ("not return a Promise of an Array: %s."):format(table.concat(v64, ","))));
                    end;
                    if #v64 ~= #v58.keys then
                        error(l_Error_0.new("DataLoader must be constructed with a function which accepts " .. "Array<key> and returns Promise<Array<value>>, but the function did " .. "not return a Promise of an Array of the same length as the Array " .. "of keys." .. ("\n\nKeys:\n%s"):format(table.concat(v58.keys, ",")) .. ("\n\nValues:\n%s"):format(table.concat(v64, ","))));
                    end;
                    v15(v58);
                    local v65 = 0;
                    while v65 < #v58.callbacks do
                        local v66 = v64[v65 + 1];
                        if not l_instanceof_0(v66, l_Error_1) then
                            v58.callbacks[v65 + 1].resolve(v66);
                        else
                            v58.callbacks[v65 + 1].reject(v66);
                        end;
                        v65 = v65 + 1;
                    end;
                end):catch(function(v67)
                    v14(v57, v58, v67);
                end);
                return nil;
            end;
        else
            return v62;
        end;
    end;
end;
v14 = function(v68, v69, v70)
    v15(v69);
    local v71 = 0;
    while v71 < #v69.keys do
        v68:clear(v69.keys[v71 + 1]);
        v69.callbacks[v71 + 1].reject(v70);
        v71 = v71 + 1;
    end;
end;
v15 = function(v72)
    if l_Boolean_0.toJSBoolean(v72.cacheHits) then
        local v73 = 0;
        while v73 < #v72.cacheHits do
            v72.cacheHits[v73 + 1]();
            v73 = v73 + 1;
        end;
    end;
end;
v12 = function(v74)
    if l_Boolean_0.toJSBoolean(not l_Boolean_0.toJSBoolean(v74) or v74.batch ~= false) then
        local v75 = if not l_Boolean_0.toJSBoolean(v74) then v74 else v74.maxBatchSize;
        if v75 == nil then
            return math.huge;
        else
            if not (typeof(v75) == "number") or v75 < 1 then
                error(l_Error_0.new(("maxBatchSize must be a positive number: %s"):format((tostring(v75)))));
            end;
            return v75;
        end;
    else
        return 1;
    end;
end;
v16 = function(v76)
    local v77 = if not l_Boolean_0.toJSBoolean(v76) then v76 else v76.batchScheduleFn;
    if v77 == nil then
        return v53;
    else
        if typeof(v77) ~= "function" then
            error(l_Error_0.new(("batchScheduleFn must be a function: %s"):format((tostring(v77)))));
        end;
        return v77;
    end;
end;
v17 = function(v78)
    local v79 = if not l_Boolean_0.toJSBoolean(v78) then v78 else v78.cacheKeyFn;
    if v79 == nil then
        return function(v80)
            return v80;
        end;
    else
        if typeof(v79) ~= "function" then
            error(l_Error_0.new(("cacheKeyFn must be a function: %s"):format((tostring(v79)))));
        end;
        return v79;
    end;
end;
v18 = function(v81)
    if l_Boolean_0.toJSBoolean(not l_Boolean_0.toJSBoolean(v81) or v81.cache ~= false) then
        local v82 = if not l_Boolean_0.toJSBoolean(v81) then v81 else v81.cacheMap;
        if v82 == nil then
            return l_Map_0.new();
        else
            if v82 ~= nil then
                local v84 = l_Array_0.filter({
                    "get", 
                    "set", 
                    "delete", 
                    "clear"
                }, function(v83)
                    if not l_Boolean_0.toJSBoolean(v82) then
                        return v82;
                    else
                        return typeof(v82[tostring(v83)]) ~= "function";
                    end;
                end);
                if #v84 ~= 0 then
                    error(l_Error_0.new("Custom cacheMap missing methods: " .. tostring(l_Array_0.join(v84, ", "))));
                end;
            end;
            return v82;
        end;
    else
        return nil;
    end;
end;
v19 = function(v85)
    if not l_Boolean_0.toJSBoolean(if not l_Boolean_0.toJSBoolean(v85) then v85 else v85.name) then
        return nil;
    else
        return v85.name;
    end;
end;
v20 = function(v86)
    local v87 = false;
    if typeof(v86) == "table" then
        v87 = true;
        if #v86 ~= 0 then
            v87 = false;
            if #v86 > 0 then
                v87 = v86[#v86] ~= nil;
            end;
        end;
    end;
    return v87;
end;
v10.DataLoader = v21;
return v10;
