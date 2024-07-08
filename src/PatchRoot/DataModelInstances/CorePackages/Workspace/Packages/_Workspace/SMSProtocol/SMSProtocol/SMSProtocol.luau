local l_Parent_0 = script.Parent.Parent;
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_Parent_0.t);
local v4 = require(script.Parent.Flags.getFFlagLuaSMSProtocol);
local _ = require(script.Parent.SMSProtocolTypes);
local v6 = {
    SEND_SMS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "SMSProtocol", 
        methodName = "sendSMS", 
        validateParams = v3.strictInterface({
            address = v3.string, 
            message = v3.string
        })
    }, 
    SEND_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "SMSProtocol", 
        methodName = "sendSMS", 
        validateParams = v3.strictInterface({
            sent = v3.optional(v3.boolean)
        })
    }, 
    SUPPORTS_SMS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "SMSProtocol", 
        methodName = "supportsSMS", 
        validateParams = v3.table
    }, 
    SUPPORTS_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "SMSProtocol", 
        methodName = "supportsSMS", 
        validateParams = v3.table
    }
};
v6.__index = v6;
v6.new = function()
    return (setmetatable({
        subscriber = l_MessageBus_0.Subscriber.new()
    }, v6));
end;
v6.sendSMS = function(v7, v8)
    if v4() then
        local v13 = v2.new(function(v9, _)
            local l_SEND_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 = v7.SEND_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
            v7.subscriber:subscribeProtocolMethodResponse(l_SEND_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0, function(v12)
                v7.subscriber:unsubscribeToProtocolMethodResponse(l_SEND_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0);
                v9(v12);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v7.SEND_SMS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, v8, {});
        return v13;
    else
        return v2.resolve();
    end;
end;
v6.supportsSMS = function(v14)
    if v4() then
        local v19 = v2.new(function(v15, _)
            local l_SUPPORTS_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 = v14.SUPPORTS_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
            v14.subscriber:subscribeProtocolMethodResponse(l_SUPPORTS_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0, function(v18)
                v14.subscriber:unsubscribeToProtocolMethodResponse(l_SUPPORTS_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0);
                v15(v18.support);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v14.SUPPORTS_SMS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, {
            includeStatus = false
        }, {});
        return v19;
    else
        return v2.resolve();
    end;
end;
v6.default = v6.new();
return v6;
