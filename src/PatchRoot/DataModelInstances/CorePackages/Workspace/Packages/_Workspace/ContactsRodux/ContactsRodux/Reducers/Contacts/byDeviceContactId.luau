local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Types_0 = l_Parent_0.Types;
local v3 = require(l_Parent_1.Rodux);
local _ = require(l_Types_0.ReducerTypes);
local _ = require(l_Types_0.ActionTypes);
local l_DeviceContactsReceived_0 = require(l_Parent_0.Actions).DeviceContactsReceived;
local v7 = require(l_Parent_1.Dash);
local v8 = require(l_Parent_0.Models.DeviceContact);
local v9 = {};
return function(_)
    return v3.createReducer(v9, {
        [l_DeviceContactsReceived_0.name] = function(_, v12)
            local l_payload_0 = v12.payload;
            local v14 = {};
            v7.forEach(l_payload_0, function(v15)
                local v16 = v8.formatFromDevice(v15);
                v14[v16.id] = v16;
            end);
            return v14;
        end
    });
end;
