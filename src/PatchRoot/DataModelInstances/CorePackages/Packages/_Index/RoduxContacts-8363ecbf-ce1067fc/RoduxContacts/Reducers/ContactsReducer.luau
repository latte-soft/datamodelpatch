local l_Parent_0 = script.Parent.Parent;
local l_Types_0 = l_Parent_0.Types;
local v2 = require(l_Parent_0.Reducers.Contacts.byContactId);
local v3 = require(l_Parent_0.Reducers.Contacts.byDeviceContactId);
local v4 = require(l_Parent_0.Reducers.Contacts.hasSentRequest);
local _ = require(l_Types_0.ReducerTypes);
local v6 = require(l_Parent_0.Reducers.Contacts.deviceContactToRobloxContact);
local v7 = {
    byContactId = {}, 
    byDeviceContactId = {}, 
    hasSentRequest = {}, 
    deviceContactToRobloxContact = {}
};
return function(v8)
    return function(v9, v10)
        local v11 = v9 or v7;
        return {
            byContactId = v2(v8)(v11.byContactId, v10), 
            byDeviceContactId = v3(v8)(v11.byDeviceContactId, v10), 
            hasSentRequest = v4(v8)(v11.hasSentRequest, v10), 
            deviceContactToRobloxContact = v6(v8)(v11.deviceContactToRobloxContact, v10)
        };
    end;
end;
