local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_uuid_0 = require(l_Parent_0.utilities.common.makeUniqueId).uuid;
local v5 = {};
local v6 = nil;
local v7 = {};
local v8 = 1;
local function v39()
    local v9 = {};
    v9.__index = v9;
    v9.new = function()
        local v10 = setmetatable({}, v9);
        v10.id = l_Array_0.join({
            "slot", 
            v8, 
            DateTime.now().UnixTimestampMillis, 
            l_uuid_0()
        }, ":");
        v8 = v8 + 1;
        return v10;
    end;
    v9.hasValue = function(v11)
        local l_v6_0 = v6;
        while true do
            if not l_v6_0 then
                break;
            elseif not l_v6_0.slots[v11.id] then
                l_v6_0 = l_v6_0.parent;
            else
                local v13 = l_v6_0.slots[v11.id];
                if v13 ~= v7 then
                    if l_v6_0 ~= v6 then
                        v6.slots[v11.id] = v13;
                    end;
                    return true;
                else
                    break;
                end;
            end;
        end;
        if v6 then
            v6.slots[v11.id] = v7;
        end;
        return false;
    end;
    v9.getValue = function(v14)
        if not v14:hasValue() then
            return nil;
        else
            return v6.slots[v14.id];
        end;
    end;
    v9.withValue = function(v15, v16, v17, v18, v19)
        local v20 = {
            [v15.id] = v16
        };
        local l_v6_1 = v6;
        v6 = {
            parent = l_v6_1, 
            slots = v20
        };
        local v22, v23, v24 = pcall(function()
            return v17(v19, table.unpack(v18 or {})), true;
        end);
        v6 = l_v6_1;
        if not v24 then
            if not v22 then
                error(v23);
            end;
            return nil;
        else
            return v23;
        end;
    end;
    v9.bind = function(v25)
        local l_v6_2 = v6;
        return function(v27, ...)
            local v28 = {
                ...
            };
            local l_v6_3 = v6;
            v6 = l_v6_2;
            local l_status_0, l_result_0 = pcall(v25, v27, table.unpack(v28));
            v6 = l_v6_3;
            if not l_status_0 then
                error(l_result_0);
            end;
            return l_result_0;
        end;
    end;
    v9.noContext = function(v32, v33, v34)
        if not v6 then
            return v32(v34, table.unpack(v33 or {}));
        else
            local l_v6_4 = v6;
            local v36, v37, v38 = pcall(function()
                v6 = nil;
                return v32(v34, table.unpack(v33 or {})), true;
            end);
            v6 = l_v6_4;
            if not v38 then
                if not v36 then
                    error(v37);
                end;
                return nil;
            else
                return v37;
            end;
        end;
    end;
    return v9;
end;
local v40, v41;
if l_Boolean_0.toJSBoolean(l_Array_0["@wry/context:Slot"]) then
    v41 = l_Array_0["@wry/context:Slot"];
    if v41 then
        goto label0;
    end;
end;
v40 = v39();
pcall(function()
    l_Array_0["@wry/context:Slot"] = v40;
end);
v41 = v40;
::label0::;
v5.Slot = v41;
return v5;
