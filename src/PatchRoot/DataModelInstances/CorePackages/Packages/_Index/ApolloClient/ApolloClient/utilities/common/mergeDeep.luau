local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Set_0 = require(l_Parent_0.Parent.LuauPolyfill).Set;
local v3 = newproxy(true);
getmetatable(v3).__tostring = function()
    return "Value.None";
end;
local l_isNonNullObject_0 = require(script.Parent.objects).isNonNullObject;
local v5 = require(l_Parent_0.luaUtils.hasOwnProperty);
local v6 = require(l_Parent_0.luaUtils.objectKeysForEach);
local v7 = nil;
v0.mergeDeep = function(...)
    return v7({
        ...
    });
end;
local v8 = {};
v7 = function(v9)
    local v10 = v9[1] or {};
    local v11 = #v9;
    if v11 > 1 then
        local v12 = v8.new();
        for v13 = 2, v11 do
            v10 = v12:merge(v10, v9[v13]);
        end;
    end;
    return v10;
end;
v0.mergeDeepArray = v7;
v8.__index = v8;
v8.new = function(v14)
    local v15 = setmetatable({}, v8);
    local function v20(v16, v17, v18, v19)
        return v16:merge(v17[v19], v18[v19]);
    end;
    if v14 == nil then
        v14 = v20;
    end;
    v15.reconciler = v14;
    v15.isObject = l_isNonNullObject_0;
    v15.pastCopies = l_Set_0.new();
    return v15;
end;
v8.merge = function(v21, v22, v23, ...)
    local v24 = table.pack(...);
    if not l_isNonNullObject_0(v23) or not l_isNonNullObject_0(v22) then
        return v23;
    else
        v6(v23, function(v25)
            if not v5(v22, v25) then
                v22 = v21:shallowCopyForMerge(v22);
                v22[v25] = v23[v25];
            else
                local v26 = v22[v25];
                if v23[v25] ~= v26 then
                    local v27 = v21:reconciler(v22, v23, v25, table.unpack(v24));
                    if v27 ~= v26 then
                        v22 = v21:shallowCopyForMerge(v22);
                        v22[v25] = v27;
                    end;
                end;
            end;
            if v22[v25] == v3 then
                v22[v25] = nil;
            end;
        end);
        return v22;
    end;
end;
v8.shallowCopyForMerge = function(v28, v29)
    if not (not l_isNonNullObject_0(v29) or v28.pastCopies:has(v29)) then
        v29 = table.clone(v29);
        v28.pastCopies:add(v29);
    end;
    return v29;
end;
v8.None = v3;
v0.DeepMerger = v8;
return v0;
