local v0 = require(script.Parent.Parent.Parent.LuauPolyfill);
local l_Set_0 = v0.Set;
local l_Array_0 = v0.Array;
local v3 = {};
local _ = require(script.Parent.anyEntryTypes);
local _ = require(script.Parent.initTypes);
local l_parentEntrySlot_0 = require(script.Parent.context).parentEntrySlot;
local v7 = require(script.Parent.helpers);
local l_hasOwnProperty_0 = v7.hasOwnProperty;
local l_maybeUnsubscribe_0 = v7.maybeUnsubscribe;
local l_toArray_0 = v7.toArray;
local v11 = {
    setDirty = true, 
    dispose = true, 
    forget = true
};
local _ = require(script.Parent.depTypes);
v3.dep = function(v13)
    local v14 = {};
    local v15 = if v13 ~= nil then v13.subscribe else v13;
    local v20 = setmetatable({}, {
        __call = function(_, v17)
            local v18 = l_parentEntrySlot_0:getValue();
            if v18 ~= nil then
                local v19 = v14[v17];
                if not v19 then
                    v19 = l_Set_0.new();
                    v14[v17] = v19;
                end;
                v18:dependOn(v19);
                if type(v15) == "function" then
                    l_maybeUnsubscribe_0(v19);
                    v19.unsubscribe = v15(v17);
                end;
            end;
        end
    });
    v20.dirty = function(_, v22, v23)
        local v24 = v14[v22];
        if v24 then
            local v25 = if not not v23 and l_hasOwnProperty_0(v11, v23) then v23 else "setDirty";
            l_Array_0.forEach(l_toArray_0(v24), function(v26)
                v26[v25](v26);
            end);
            v14[v22] = nil;
            l_maybeUnsubscribe_0(v24);
        end;
    end;
    return v20;
end;
return v3;
