local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Set_0 = v1.Set;
local l_WeakMap_0 = v1.WeakMap;
local l_Map_0 = v1.Map;
local v6 = require(l_Parent_0.luaUtils.Object);
local l_HttpService_0 = game:GetService("HttpService");
local v8 = {};
local l_Trie_0 = require(l_Parent_0.wry.trie).Trie;
local v10 = require(script.Parent.Parent.Parent.utilities);
local l_canUseWeakMap_0 = v10.canUseWeakMap;
local l_isNonNullObject_0 = v10.isNonNullObject;
local l_sortedEncode_0 = require(l_Parent_0.luaUtils.sortedEncode).sortedEncode;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local function _(v17)
    return (table.clone(v17));
end;
local function _(v19)
    if not (#v19 == 0) or next(v19) then
        if #v19 > 1 then
            return true;
        else
            return false;
        end;
    else
        return true;
    end;
end;
local v21 = {};
v21.__index = v21;
v21.new = function()
    local v22 = setmetatable({}, v21);
    v22.known = l_Set_0.new();
    v22.pool = l_Trie_0.new(l_canUseWeakMap_0);
    v22.passes = l_WeakMap_0.new();
    v22.keysByJSON = l_Map_0.new(nil);
    v22.empty = v22:admit({});
    return v22;
end;
v21.isKnown = function(v23, v24)
    return l_isNonNullObject_0(v24) and v23.known:has(v24);
end;
v21.pass = function(v25, v26)
    if not l_isNonNullObject_0(v26) then
        return v26;
    else
        local v27 = table.clone(v26);
        v25.passes:set(v27, v26);
        return v27;
    end;
end;
v21.admit = function(v28, v29)
    if l_isNonNullObject_0(v29) then
        local v30 = v28.passes:get(v29);
        if not v30 then
            if v6.getPrototypeOf(v29) == nil then
                if not (#v29 == 0 and not next(v29) or #v29 > 1) then
                    if not v28.known:has(v29) then
                        local v31 = v6.getPrototypeOf(v29);
                        local v32 = {
                            v31
                        };
                        local v33 = v28:sortedKeys(v29);
                        table.insert(v32, v33.json);
                        local v34 = #v32;
                        l_Array_0.forEach(v33.sorted, function(v35)
                            table.insert(v32, v28:admit(v29[v35]));
                        end);
                        local v36 = v28.pool:lookupArray(v32);
                        if not v36.object then
                            v36.object = v6.create(v31);
                            local l_object_0 = v36.object;
                            v28.known:add(l_object_0);
                            l_Array_0.forEach(v33.sorted, function(v38, v39)
                                l_object_0[v38] = v32[v34 + v39];
                            end);
                            if _G.__DEV__ then
                                v6.freeze(l_object_0);
                            end;
                        end;
                        return v36.object;
                    else
                        return v29;
                    end;
                elseif not v28.known:has(v29) then
                    local v40 = l_Array_0.map(v29, v28.admit, v28);
                    local v41 = v28.pool:lookupArray(v40);
                    if not v41.array then
                        v41.array = v40;
                        v28.known:add(v41.array);
                        if _G.__DEV__ then
                            v6.freeze(v40);
                        end;
                    end;
                    return v41.array;
                else
                    return v29;
                end;
            end;
        else
            return v30;
        end;
    end;
    return v29;
end;
v21.sortedKeys = function(v42, v43)
    local v44 = v6.keys(v43);
    local v45 = v42.pool:lookupArray(v44);
    if not v45.keys then
        l_Array_0.sort(v44);
        local v46 = l_HttpService_0:JSONEncode(v44);
        v45.keys = v42.keysByJSON:get(v46);
        if not v45.keys then
            v45.keys = {
                sorted = v44, 
                json = v46
            };
            v42.keysByJSON:set(v46, v45.keys);
        end;
    end;
    return v45.keys;
end;
v8.ObjectCanon = v21;
v8.canonicalStringify = v6.assign(setmetatable({}, {
    __call = function(_, v48)
        if not l_isNonNullObject_0(v48) then
            return l_HttpService_0:JSONEncode(v48);
        else
            if v15 == nil then
                v14();
            end;
            local v49 = v15:admit(v48);
            local v50 = v16:get(v49);
            if v50 == nil then
                local l_v16_0 = v16;
                local l_v49_0 = v49;
                v50 = l_sortedEncode_0(v49);
                l_v16_0:set(l_v49_0, v50);
            end;
            return v50;
        end;
    end
}), {
    reset = function(_)
        return v14();
    end
});
v14 = function()
    v15 = v21.new();
    v16 = l_WeakMap_0.new();
end;
return v8;
