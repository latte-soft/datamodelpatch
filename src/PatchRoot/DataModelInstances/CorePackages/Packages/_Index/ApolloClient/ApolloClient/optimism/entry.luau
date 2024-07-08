local v0 = require(script.Parent.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Set_0 = v0.Set;
local l_Map_0 = v0.Map;
local l_Error_0 = v0.Error;
local v5 = {};
local v6 = newproxy(true);
getmetatable(v6).__tostring = function()
    return "Value.None";
end;
local v7 = nil;
local v8 = nil;
local v9 = nil;
local v10 = nil;
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
local l_parentEntrySlot_0 = require(script.Parent.context).parentEntrySlot;
local _ = require(script.Parent.initTypes);
local _ = require(script.Parent.depTypes);
local v24 = require(script.Parent.helpers);
local l_maybeUnsubscribe_0 = v24.maybeUnsubscribe;
local l_toArray_0 = v24.toArray;
local v27 = {};
local function _(v28, v29)
    if not v28 then
        error(l_Error_0.new(v29 or "assertion failure"));
    end;
end;
local _ = require(script.Parent.entryTypes);
local _ = require(script.Parent.anyEntryTypes);
local function _(v33, v34)
    local v35 = #v33;
    local v36 = false;
    if v35 > 0 then
        v36 = false;
        if v35 == #v34 then
            v36 = v33[v35] == v34[v35];
        end;
    end;
    return v36;
end;
local function v39(v38)
    if v38[2] ~= nil then
        error(v38[2]);
        return ;
    elseif v38[1] ~= nil then
        if v38[1] == v6 then
            return nil;
        else
            return v38[1];
        end;
    else
        error(l_Error_0.new("unknown value"));
        return ;
    end;
end;
local function _(v40)
    return (table.clone(v40));
end;
local v42 = {};
v42.__index = v42;
v42.count = 0;
v42.new = function(v43)
    local v44 = setmetatable({}, v42);
    v44.parents = l_Set_0.new();
    v44.childValues = l_Map_0.new(nil);
    v44.dirtyChildren = nil;
    v44.dirty = true;
    v44.recomputing = false;
    v44.value = {};
    v44.deps = nil;
    v44.fn = v43;
    local l_v42_0 = v42;
    l_v42_0.count = l_v42_0.count + 1;
    return v44;
end;
v42.peek = function(v46)
    if not (#v46.value == 1) or v10(v46) then
        return nil;
    else
        v7(v46);
        return v46.value[1];
    end;
end;
v42.recompute = function(v47, v48)
    if v47.recomputing then
        error(l_Error_0.new("already recomputing"));
    end;
    v7(v47);
    if not v10(v47) then
        return v39(v47.value);
    else
        return v8(v47, v48);
    end;
end;
v42.setDirty = function(v49)
    if not v49.dirty then
        v49.dirty = true;
        v49.value = {};
        v12(v49);
        l_maybeUnsubscribe_0(v49);
        return ;
    else
        return ;
    end;
end;
v42.dispose = function(v50)
    v50:setDirty();
    v18(v50);
    v14(v50, function(v51, _)
        v51:setDirty();
        v19(v51, v50);
        return nil;
    end);
end;
v42.forget = function(v53)
    v53:dispose();
end;
v42.dependOn = function(v54, v55)
    v55:add(v54);
    if not v54.deps then
        v54.deps = table.remove(v27) or l_Set_0.new();
    end;
    v54.deps:add(v55);
end;
v42.forgetDeps = function(v56)
    if v56.deps then
        l_Array_0.forEach(l_toArray_0(v56.deps), function(v57)
            v57:delete(v56);
        end);
        v56.deps:clear();
        table.insert(v27, v56.deps);
        v56.deps = nil;
    end;
end;
v5.Entry = v42;
v7 = function(v58)
    local v59 = l_parentEntrySlot_0:getValue();
    if not v59 then
        return nil;
    else
        v58.parents:add(v59);
        if not v59.childValues:has(v58) then
            v59.childValues:set(v58, {});
        end;
        if not v10(v58) then
            v16(v59, v58);
            return v59;
        else
            v15(v59, v58);
            return v59;
        end;
    end;
end;
v8 = function(v60, v61)
    v18(v60);
    l_parentEntrySlot_0:withValue(v60, v9, {
        v60, 
        v61
    });
    if v20(v60, v61) then
        v11(v60);
    end;
    return v39(v60.value);
end;
v9 = function(_, v63, v64)
    v63.recomputing = true;
    table.clear(v63.value);
    local l_status_0, l_result_0 = pcall(v63.fn, table.unpack(v64));
    if l_status_0 then
        v63.value[1] = l_result_0;
        if v63.value[1] == nil then
            v63.value[1] = v6;
        end;
    end;
    if not l_status_0 then
        v63.value[2] = l_result_0;
    end;
    v63.recomputing = false;
end;
v10 = function(v67)
    local l_dirty_0 = v67.dirty;
    if not l_dirty_0 then
        l_dirty_0 = false;
        if v67.dirtyChildren ~= nil then
            l_dirty_0 = v67.dirtyChildren.size > 0;
        end;
    end;
    return l_dirty_0;
end;
v11 = function(v69)
    v69.dirty = false;
    if not v10(v69) then
        v13(v69);
        return ;
    else
        return ;
    end;
end;
v12 = function(v70)
    v14(v70, v15);
end;
v13 = function(v71)
    v14(v71, v16);
end;
v14 = function(v72, v73)
    local l_size_0 = v72.parents.size;
    if l_size_0 then
        local v75 = l_toArray_0(v72.parents);
        for v76 = 1, l_size_0 do
            v73(v75[v76], v72);
        end;
    end;
end;
v15 = function(v77, v78)
    if _G.__DEV__ then
        local v79, v80 = v77.childValues:has(v78);
        if not v79 then
            error(l_Error_0.new(v80 or "assertion failure"));
        end;
        v79, v80 = v10(v78);
        if not v79 then
            error(l_Error_0.new(v80 or "assertion failure"));
        end;
    end;
    local v81 = not v10(v77);
    if v77.dirtyChildren then
        if v77.dirtyChildren:has(v78) then
            return ;
        end;
    else
        v77.dirtyChildren = table.remove(v27) or l_Set_0.new();
    end;
    v77.dirtyChildren:add(v78);
    if v81 then
        v12(v77);
    end;
end;
v16 = function(v82, v83)
    if _G.__DEV__ then
        local v84, v85 = v82.childValues:has(v83);
        if not v84 then
            error(l_Error_0.new(v85 or "assertion failure"));
        end;
        if v10(v83) then
            error(l_Error_0.new("assertion failure"));
        end;
    end;
    local v86 = v82.childValues:get(v83);
    if #v86 == 0 then
        v82.childValues:set(v83, (table.clone(v83.value)));
    else
        local l_value_0 = v83.value;
        local v88 = #v86;
        local v89 = false;
        if v88 > 0 then
            v89 = false;
            if v88 == #l_value_0 then
                v89 = v86[v88] == l_value_0[v88];
            end;
        end;
        if not v89 then
            v82:setDirty();
        end;
    end;
    v17(v82, v83);
    if not v10(v82) then
        v13(v82);
        return ;
    else
        return ;
    end;
end;
v17 = function(v90, v91)
    local l_dirtyChildren_0 = v90.dirtyChildren;
    if l_dirtyChildren_0 ~= nil then
        l_dirtyChildren_0:delete(v91);
        if l_dirtyChildren_0.size == 0 then
            if #v27 < 100 then
                table.insert(v27, l_dirtyChildren_0);
            end;
            v90.dirtyChildren = nil;
        end;
    end;
end;
v18 = function(v93)
    if v93.childValues.size > 0 then
        l_Array_0.forEach(table.clone(v93.childValues:keys()), function(v94)
            v19(v93, v94);
        end);
    end;
    v93:forgetDeps();
    if not (v93.dirtyChildren == nil) then
        error(l_Error_0.new("assertion failure"));
    end;
end;
v19 = function(v95, v96)
    v96.parents:delete(v95);
    v95.childValues:delete(v96);
    v17(v95, v96);
end;
v20 = function(v97, v98)
    if not (typeof(v97.subscribe) == "function") or pcall(function()
        l_maybeUnsubscribe_0(v97);
        v97.unsubscribe = v97.subscribe(table.unpack(v98));
        return nil, false;
    end) then
        return true;
    else
        v97:setDirty();
        return false;
    end;
end;
return v5;
