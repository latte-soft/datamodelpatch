local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Set_0 = v1.Set;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v6 = {};
local l_Trie_0 = require(l_Parent_0.wry.trie).Trie;
local l_Cache_0 = require(script.cache).Cache;
local l_Entry_0 = require(script.entry).Entry;
local l_parentEntrySlot_0 = require(script.context).parentEntrySlot;
local v11 = require(script.context);
v6.bindContext = v11.bindContext;
v6.noContext = v11.noContext;
v6.setTimeout = v11.setTimeout;
v6.dep = require(script.dep).dep;
local _ = function()
    local v12 = l_Trie_0.new(true);
    return function(_, ...)
        return v12:lookupArray({
            ...
        });
    end;
end;
local v15 = l_Trie_0.new(true);
local l_v15_0 = v15 --[[ copy: 17 -> 19 ]];
v6.defaultMakeCacheKey = function(_, ...)
    return l_v15_0:lookupArray({
        ...
    });
end;
v6.KeyTrie = l_Trie_0;
v15 = require(script.initTypes);
local v18 = l_Set_0.new();
v6.wrap = function(v19, v20, v21)
    local l_v20_0 = v20;
    if l_v20_0 == nil then
        l_v20_0 = {};
    end;
    local v24 = l_Cache_0.new(not not l_Boolean_0.toJSBoolean(l_v20_0.max) and l_v20_0.max or 65536, function(v23)
        return v23:dispose();
    end);
    local l_keyArgs_0 = l_v20_0.keyArgs;
    local v26, v27, v28;
    if l_Boolean_0.toJSBoolean(l_v20_0.makeCacheKey) then
        v28 = l_v20_0.makeCacheKey;
        if v28 then
            goto label0;
        end;
    end;
    v26 = l_Trie_0.new(true);
    v27 = v26 --[[ copy: 7 -> 14 ]];
    v28 = function(_, ...)
        return v27:lookupArray({
            ...
        });
    end;
    ::label0::;
    if v21 ~= nil then
        v26 = v19;
        local l_v26_0 = v26 --[[ copy: 7 -> 17 ]];
        v19 = function(...)
            return l_v26_0(v21, ...);
        end;
    end;
    v26 = setmetatable({}, {
        __call = function(_, v32, ...)
            local v33 = nil;
            v33 = if v21 ~= nil then {
                ...
            } else {
                v32, 
                ...
            };
            local v34 = v28(nil, table.unpack((function()
                if not l_keyArgs_0 then
                    return v33;
                else
                    return l_keyArgs_0(nil, table.unpack(v33));
                end;
            end)()));
            if v34 == nil then
                return v19(table.unpack(v33));
            else
                local v35 = v24:get(v34);
                if v35 == nil then
                    v35 = l_Entry_0.new(v19);
                    v24:set(v34, v35);
                    v35.subscribe = l_v20_0.subscribe;
                    v35.forget = function()
                        return v24:delete(v34);
                    end;
                end;
                local v36 = v35:recompute((l_Array_0.slice(v33)));
                v24:set(v34, v35);
                v18:add(v24);
                if not l_parentEntrySlot_0:hasValue() then
                    v18:forEach(function(v37)
                        return v37:clean();
                    end);
                    v18:clear();
                end;
                return v36;
            end;
        end, 
        __index = function(v38, v39)
            if v39 == "size" then
                return v24.map.size;
            else
                return (rawget(v38, v39));
            end;
        end, 
        __newindex = function(v40, v41, v42)
            if v41 == "size" then
                error("attempt to update a read-only table", 2);
            end;
            rawset(v40, v41, v42);
        end
    });
    local _ = function(v43)
        return function(_, ...)
            return v43(...);
        end;
    end;
    local function v48(v46)
        local v47 = v24:get(v46);
        if l_Boolean_0.toJSBoolean(v47) then
            v47:setDirty();
        end;
    end;
    v26.dirtyKey = function(_, ...)
        return v48(...);
    end;
    local function v51(...)
        local v50 = v24:get((v28(nil, ...)));
        if l_Boolean_0.toJSBoolean(v50) then
            v50:setDirty();
        end;
    end;
    local l_v51_0 = v51 --[[ copy: 11 -> 15 ]];
    v26.dirty = function(_, ...)
        return l_v51_0(...);
    end;
    local function v56(v54)
        local v55 = v24:get(v54);
        if not l_Boolean_0.toJSBoolean(v55) then
            return ;
        else
            return v55:peek();
        end;
    end;
    v26.peekKey = function(_, ...)
        return v56(...);
    end;
    local function v58(...)
        return v56(v28(nil, ...));
    end;
    v26.peek = function(_, ...)
        return v58(...);
    end;
    v51 = function(v60)
        return v24:delete(v60);
    end;
    v26.forgetKey = function(_, ...)
        return v51(...);
    end;
    local function v62(...)
        return v51(v28(nil, ...));
    end;
    local l_v62_0 = v62 --[[ copy: 13 -> 16 ]];
    v26.forget = function(_, ...)
        return l_v62_0(...);
    end;
    v26.makeCacheKey = v28;
    if not l_Boolean_0.toJSBoolean(l_keyArgs_0) then
        v26.getKey = v28;
    else
        v62 = function(...)
            return v28(nil, table.unpack(l_keyArgs_0(...)));
        end;
        v26.getKey = function(_, ...)
            return v62(...);
        end;
    end;
    return l_Object_0.freeze(v26);
end;
return v6;
