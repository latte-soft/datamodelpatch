local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = {};
local l_dep_0 = require(l_Parent_0.optimism).dep;
local l_Slot_0 = require(l_Parent_0.wry.context).Slot;
local _ = require(script.Parent.Parent.core.cache);
local v6 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v6.Array;
local l_Set_0 = v6.Set;
local l_WeakMap_0 = v6.WeakMap;
local v10 = nil;
local v11 = l_Slot_0.new();
v2.cacheSlot = v11;
local v12 = l_WeakMap_0.new();
local function v15(v13)
    local v14 = v12:get(v13);
    if not v14 then
        v14 = {
            vars = l_Set_0.new(), 
            dep = l_dep_0()
        };
        v12:set(v13, v14);
    end;
    return v14;
end;
v2.forgetCache = function(v16)
    v15(v16).vars:forEach(function(v17)
        return v17:forgetCache(v16);
    end);
end;
v2.recallCache = function(v18)
    v15(v18).vars:forEach(function(v19)
        return v19:attachCache(v18);
    end);
end;
v2.makeVar = function(v20)
    local v21 = l_Set_0.new();
    local v22 = l_Set_0.new();
    local v23 = nil;
    local v24 = nil;
    v23 = setmetatable({}, {
        __call = function(_, ...)
            if select("#", ...) >= 1 then
                local v26 = ({
                    ...
                })[1];
                if v20 ~= v26 then
                    v20 = v26;
                    v21:forEach(function(v27)
                        v15(v27).dep:dirty(v23);
                        v10(v27);
                    end);
                    local v28 = l_Array_0.from(v22);
                    v22:clear();
                    l_Array_0.forEach(v28, function(v29)
                        v29(v20);
                    end);
                end;
            else
                local v30 = v11:getValue();
                if v30 then
                    v24(v30);
                    v15(v30).dep(v23);
                end;
            end;
            return v20;
        end
    });
    v23.onNextChange = function(_, v32)
        v22:add(v32);
        return function()
            v22:delete(v32);
        end;
    end;
    v24 = function(v33)
        v21:add(v33);
        v15(v33).vars:add(v23);
        return v23;
    end;
    v23.attachCache = function(_, v35)
        return v24(v35);
    end;
    v23.forgetCache = function(_, v37)
        return v21:delete(v37);
    end;
    return v23;
end;
v10 = function(v38)
    if v38.broadcastWatches ~= nil then
        v38:broadcastWatches();
    end;
end;
return v2;
