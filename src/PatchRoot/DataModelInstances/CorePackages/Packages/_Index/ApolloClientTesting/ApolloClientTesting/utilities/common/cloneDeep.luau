local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Map_0 = v2.Map;
local v5 = require(l_Parent_0.luaUtils.Object);
local l_instanceof_0 = v2.instanceof;
local l_NULL_0 = require(script.Parent.Parent.globals.null).NULL;
local v8 = nil;
v0.cloneDeep = function(v9)
    return v8(v9);
end;
local v10 = {
    v2.Error, 
    v2.Map, 
    v2.WeakMap, 
    v2.Set
};
v8 = function(v11, v12)
    if not l_Array_0.isArray(v11) then
        if not (typeof(v11) == "table" and v11 ~= l_NULL_0) or not l_Array_0.every(v10, function(v13)
            return not l_instanceof_0(v11, v13);
        end) then
            return v11;
        else
            v12 = v12 or l_Map_0.new(nil);
            if not v12:has(v11) then
                local v14 = v5.create(v5.getPrototypeOf(v11));
                v12:set(v11, v14);
                l_Array_0.forEach(v5.keys(v11), function(v15)
                    v14[v15] = v8(v11[v15], v12);
                end);
                return v14;
            else
                return v12:get(v11);
            end;
        end;
    else
        v12 = v12 or l_Map_0.new(nil);
        if not v12:has(v11) then
            local v16 = l_Array_0.slice(v11, 1);
            v12:set(v11, v16);
            l_Array_0.forEach(v16, function(v17, v18)
                v16[v18] = v8(v17, v12);
            end);
            return v16;
        else
            return v12:get(v11);
        end;
    end;
end;
return v0;
