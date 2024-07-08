local l_Parent_0 = script.Parent.Parent;
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_Parent_0.t);
local v4 = require(script.Parent.Flags.getFFlagLuaGetContactsAccess);
game:DefineFastFlag("UpdateContactParams", false);
local l_UpdateContactParams_0 = game:GetFastFlag("UpdateContactParams");
local _ = require(script.Parent.ContactsProtocolTypes);
local v7 = {
    GET_CONTACTS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "ContactsProtocol", 
        methodName = "getContacts", 
        validateParams = v3.table
    }, 
    GET_CONTACTS_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "ContactsProtocol", 
        methodName = "getContacts", 
        validateParams = v3.strictInterface({
            firstName = v3.optional(v3.string), 
            lastName = v3.optional(v3.string), 
            phoneNumbers = v3.optional(v3.table)
        })
    }, 
    SUPPORTS_CONTACTS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "ContactsProtocol", 
        methodName = "SupportsContacts", 
        validateParams = v3.table
    }, 
    SUPPORTS_CONTACTS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "ContactsProtocol", 
        methodName = "SupportsContacts", 
        validateParams = v3.table
    }
};
v7.__index = v7;
v7.new = function()
    return (setmetatable({
        subscriber = l_MessageBus_0.Subscriber.new()
    }, v7));
end;
v7.getContacts = function(v8)
    if v4() then
        local v13 = v2.new(function(v9, _)
            local l_GET_CONTACTS_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 = v8.GET_CONTACTS_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
            v8.subscriber:subscribeProtocolMethodResponse(l_GET_CONTACTS_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0, function(v12)
                v8.subscriber:unsubscribeToProtocolMethodResponse(l_GET_CONTACTS_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0);
                v9(v12);
            end);
        end);
        if not l_UpdateContactParams_0 then
            l_MessageBus_0.publishProtocolMethodRequest(v8.GET_CONTACTS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, {}, {});
            return v13;
        else
            l_MessageBus_0.publishProtocolMethodRequest(v8.GET_CONTACTS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, {
                includeVariable = false
            }, {});
            return v13;
        end;
    else
        return v2.resolve();
    end;
end;
v7.supportsContacts = function(v14)
    if v4() then
        local v19 = v2.new(function(v15, _)
            local l_SUPPORTS_CONTACTS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 = v14.SUPPORTS_CONTACTS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
            v14.subscriber:subscribeProtocolMethodResponse(l_SUPPORTS_CONTACTS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0, function(v18)
                v14.subscriber:unsubscribeToProtocolMethodResponse(l_SUPPORTS_CONTACTS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0);
                v15(v18.support);
            end);
        end);
        if not l_UpdateContactParams_0 then
            l_MessageBus_0.publishProtocolMethodRequest(v14.SUPPORTS_CONTACTS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, {}, {});
            return v19;
        else
            l_MessageBus_0.publishProtocolMethodRequest(v14.SUPPORTS_CONTACTS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, {
                includeStatus = false
            }, {});
            return v19;
        end;
    else
        return v2.resolve();
    end;
end;
v7.default = v7.new();
return v7;
