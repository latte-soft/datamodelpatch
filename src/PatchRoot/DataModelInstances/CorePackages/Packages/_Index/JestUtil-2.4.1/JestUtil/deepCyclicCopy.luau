local v0 = require(script.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Object_0 = v0.Object;
local l_Set_0 = v0.Set;
local l_WeakMap_0 = v0.WeakMap;
local v5 = {};
local v6 = nil;
local v7 = nil;
local v8 = nil;
local v9 = l_Set_0.new();
v6 = function(v10, v11, v12)
    local v13 = v11 or {
        blacklist = v9, 
        keepPrototype = false
    };
    local v14 = v12 or l_WeakMap_0.new();
    if typeof(v10) ~= "table" then
        return v10;
    elseif not v14:has(v10) then
        if not l_Array_0.isArray(v10) then
            return v7(v10, v13, v14);
        else
            return (v8(v10, v13, v14));
        end;
    else
        return v14:get(v10);
    end;
end;
v5.default = v6;
v7 = function(v15, v16, v17)
    local v18 = {};
    if v16.keepPrototype then
        warn("Prototype copying is not supported");
    end;
    local v21 = l_Array_0.reduce(l_Object_0.keys(v15), function(v19, v20)
        v19[v20] = {
            value = v15[v20]
        };
        return v19;
    end, {});
    v17:set(v15, v18);
    l_Array_0.forEach(l_Object_0.keys(v21), function(v22)
        if not (v16.blacklist ~= nil) or not v16.blacklist:has(v22) then
            local v23 = v21[v22];
            if typeof(v23.value) ~= "nil" then
                v23.value = v6(v23.value, {
                    blacklist = v9, 
                    keepPrototype = v16.keepPrototype
                }, v17);
            end;
            v23.configurable = true;
            return ;
        else
            v21[v22] = nil;
            return ;
        end;
    end);
    return l_Object_0.assign(v18, l_Array_0.reduce(l_Object_0.keys(v21), function(v24, v25)
        v24[v25] = v21[v25].value;
        return v24;
    end, {}));
end;
v8 = function(v26, v27, v28)
    local v29 = {};
    if v27.keepPrototype then
        warn("Prototype copying is not supported");
    end;
    local v30 = #v26;
    v28:set(v26, v29);
    for v31 = 1, v30 do
        v29[v31] = v6(v26[v31], {
            blacklist = v9, 
            keepPrototype = v27.keepPrototype
        }, v28);
    end;
    return v29;
end;
return v5;
