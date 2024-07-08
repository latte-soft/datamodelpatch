local l_Parent_0 = script.Parent.Parent;
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_Parent_0.t);
local v4 = require(script.Parent.Flags.getFFlagLuaNativeUtilProtocol);
local v5 = require(script.Parent.Flags.getFFlagLuaSwitchToSettingsApp);
local l_getFFlagLuaNativeUtilEnableSMSHandling_0 = require(l_Parent_0.SharedFlags).getFFlagLuaNativeUtilEnableSMSHandling;
local v7 = require(script.Parent.Flags.getFFlagLuaGetSMSOTP);
local v8 = require(script.Parent.Flags.getFFlagLuaGetPhoneNumber);
local v9 = require(script.Parent.Flags.getFFlagLuaVerifySNA);
local l_GetFFlagLuaIdentityGetSMSOTP_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaIdentityGetSMSOTP;
local l_GetFFlagLuaIdentityGetPhoneNumber_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaIdentityGetPhoneNumber;
local l_GetFFlagLuaIdentityVerifySNA_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaIdentityVerifySNA;
local _ = require(script.Parent.NativeUtilProtocolTypes);
local v14 = v3.strictInterface({
    sent = v3.optional(v3.boolean)
});
local v15 = v3.strictInterface({
    result = v3.optional(v3.string)
});
local v16 = {
    SEND_SMS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "NativeUtilProtocol", 
        methodName = "sendSMS", 
        validateParams = v3.strictInterface({
            address = v3.string, 
            message = v3.string
        })
    }, 
    SEND_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "NativeUtilProtocol", 
        methodName = "sendSMS", 
        validateParams = v14
    }, 
    SUPPORTS_SMS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "NativeUtilProtocol", 
        methodName = "supportsSMS", 
        validateParams = v3.table
    }, 
    SUPPORTS_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "NativeUtilProtocol", 
        methodName = "supportsSMS", 
        validateParams = v3.table
    }, 
    SWITCH_TO_SETTINGS_APP_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "NativeUtilProtocol", 
        methodName = "switchToSettingsApp"
    }, 
    SWITCH_TO_SETTINGS_APP_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "NativeUtilProtocol", 
        methodName = "switchToSettingsApp"
    }, 
    SUPPORTS_SWITCH_TO_SETTINGS_APP_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "NativeUtilProtocol", 
        methodName = "supportsSwitchToSettingsApp", 
        validateParams = v3.table
    }, 
    SUPPORTS_SWITCH_TO_SETTINGS_APP_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "NativeUtilProtocol", 
        methodName = "supportsSwitchToSettingsApp", 
        validateParams = v3.table
    }, 
    GET_PHONE_NUMBER_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "NativeUtilProtocol", 
        methodName = "getPhoneNumber", 
        validateParams = v3.table
    }, 
    GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "NativeUtilProtocol", 
        methodName = "getPhoneNumber", 
        validateParams = v15
    }, 
    SUPPORTS_GET_PHONE_NUMBER_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "NativeUtilProtocol", 
        methodName = "supportsGetPhoneNumber", 
        validateParams = v3.table
    }, 
    SUPPORTS_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "NativeUtilProtocol", 
        methodName = "supportsGetPhoneNumber", 
        validateParams = v3.table
    }, 
    GET_SMS_OTP_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "NativeUtilProtocol", 
        methodName = "getSMSOTP", 
        validateParams = v3.table
    }, 
    GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "NativeUtilProtocol", 
        methodName = "getSMSOTP", 
        validateParams = v15
    }, 
    SUPPORTS_GET_SMS_OTP_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "NativeUtilProtocol", 
        methodName = "supportsGetSMSOTP", 
        validateParams = v3.table
    }, 
    SUPPORTS_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "NativeUtilProtocol", 
        methodName = "supportsGetSMSOTP", 
        validateParams = v3.table
    }, 
    SUPPORTS_VERIFY_SNA_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "NativeUtilProtocol", 
        methodName = "supportsVerifySNA", 
        validateParams = v3.table
    }, 
    SUPPORTS_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "NativeUtilProtocol", 
        methodName = "supportsVerifySNA", 
        validateParams = v3.table
    }, 
    VERIFY_SNA_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "NativeUtilProtocol", 
        methodName = "verifySNA", 
        validateParams = v3.table
    }, 
    VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "NativeUtilProtocol", 
        methodName = "verifySNA", 
        validateParams = v3.table
    }
};
v16.__index = v16;
v16.new = function()
    return (setmetatable({
        subscriber = l_MessageBus_0.Subscriber.new()
    }, v16));
end;
v16.sendSMS = function(v17, v18)
    if v4() and l_getFFlagLuaNativeUtilEnableSMSHandling_0() then
        local v23 = v2.new(function(v19, _)
            local l_SEND_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 = v17.SEND_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
            v17.subscriber:subscribeProtocolMethodResponse(l_SEND_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0, function(v22)
                v17.subscriber:unsubscribeToProtocolMethodResponse(l_SEND_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0);
                v19(v22);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v17.SEND_SMS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, v18, {});
        return v23;
    else
        return v2.resolve();
    end;
end;
v16.supportsSMS = function(v24)
    if v4() and l_getFFlagLuaNativeUtilEnableSMSHandling_0() then
        local v29 = v2.new(function(v25, _)
            local l_SUPPORTS_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 = v24.SUPPORTS_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
            v24.subscriber:subscribeProtocolMethodResponse(l_SUPPORTS_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0, function(v28)
                v24.subscriber:unsubscribeToProtocolMethodResponse(l_SUPPORTS_SMS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0);
                v25(v28.support);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v24.SUPPORTS_SMS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, {
            includeStatus = false
        }, {});
        return v29;
    else
        return v2.resolve();
    end;
end;
v16.supportsVerifySNA = function(v30)
    if not (not v4() or not v9()) and not l_GetFFlagLuaIdentityVerifySNA_0() then
        local v35 = v2.new(function(v31, _)
            local l_SUPPORTS_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR_0 = v30.SUPPORTS_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR;
            v30.subscriber:subscribeProtocolMethodResponse(l_SUPPORTS_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR_0, function(v34)
                v30.subscriber:unsubscribeToProtocolMethodResponse(l_SUPPORTS_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR_0);
                v31(v34.support);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v30.SUPPORTS_VERIFY_SNA_METHOD_REQUEST_DESCRIPTOR, {}, {});
        return v35;
    else
        return v2.resolve(false);
    end;
end;
v16.verifySNA = function(v36, v37)
    if not (not v4() or not v9()) and not l_GetFFlagLuaIdentityVerifySNA_0() then
        local v42 = v2.new(function(v38, _)
            local l_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR_0 = v36.VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR;
            v36.subscriber:subscribeProtocolMethodResponse(l_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR_0, function(v41)
                v36.subscriber:unsubscribeToProtocolMethodResponse(l_VERIFY_SNA_METHOD_RESPONSE_DESCRIPTOR_0);
                v38(v41.result);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v36.VERIFY_SNA_METHOD_REQUEST_DESCRIPTOR, v37, {});
        return v42;
    else
        return v2.resolve(false);
    end;
end;
v16.switchToSettingsApp = function(v43)
    if v4() and v5() then
        local v48 = v2.new(function(v44, _)
            local l_SWITCH_TO_SETTINGS_APP_METHOD_RESPONSE_DESCRIPTOR_0 = v43.SWITCH_TO_SETTINGS_APP_METHOD_RESPONSE_DESCRIPTOR;
            v43.subscriber:subscribeProtocolMethodResponse(l_SWITCH_TO_SETTINGS_APP_METHOD_RESPONSE_DESCRIPTOR_0, function(_)
                v43.subscriber:unsubscribeToProtocolMethodResponse(l_SWITCH_TO_SETTINGS_APP_METHOD_RESPONSE_DESCRIPTOR_0);
                v44();
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v43.SWITCH_TO_SETTINGS_APP_METHOD_REQUEST_DESCRIPTOR, {
            includeStatus = false
        }, {});
        return v48;
    else
        return v2.resolve();
    end;
end;
v16.supportsSwitchToSettingsApp = function(v49)
    if v4() and v5() then
        local v54 = v2.new(function(v50, _)
            local l_SUPPORTS_SWITCH_TO_SETTINGS_APP_METHOD_RESPONSE_DESCRIPTOR_0 = v49.SUPPORTS_SWITCH_TO_SETTINGS_APP_METHOD_RESPONSE_DESCRIPTOR;
            v49.subscriber:subscribeProtocolMethodResponse(l_SUPPORTS_SWITCH_TO_SETTINGS_APP_METHOD_RESPONSE_DESCRIPTOR_0, function(v53)
                v49.subscriber:unsubscribeToProtocolMethodResponse(l_SUPPORTS_SWITCH_TO_SETTINGS_APP_METHOD_RESPONSE_DESCRIPTOR_0);
                v50(v53.support);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v49.SUPPORTS_SWITCH_TO_SETTINGS_APP_METHOD_REQUEST_DESCRIPTOR, {
            includeStatus = false
        }, {});
        return v54;
    else
        return v2.resolve();
    end;
end;
v16.getPhoneNumber = function(v55)
    if not (not v4() or not v8()) and not l_GetFFlagLuaIdentityGetPhoneNumber_0() then
        local v60 = v2.new(function(v56, _)
            local l_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR_0 = v55.GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR;
            v55.subscriber:subscribeProtocolMethodResponse(l_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR_0, function(v59)
                v55.subscriber:unsubscribeToProtocolMethodResponse(l_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR_0);
                v56(v59.result);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v55.GET_PHONE_NUMBER_METHOD_REQUEST_DESCRIPTOR, {
            includeStatus = false
        }, {});
        return v60;
    else
        return v2.resolve();
    end;
end;
v16.supportsGetPhoneNumber = function(v61)
    if not (not v4() or not v8()) and not l_GetFFlagLuaIdentityGetPhoneNumber_0() then
        local v66 = v2.new(function(v62, _)
            local l_SUPPORTS_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR_0 = v61.SUPPORTS_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR;
            v61.subscriber:subscribeProtocolMethodResponse(l_SUPPORTS_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR_0, function(v65)
                v61.subscriber:unsubscribeToProtocolMethodResponse(l_SUPPORTS_GET_PHONE_NUMBER_METHOD_RESPONSE_DESCRIPTOR_0);
                v62(v65.support);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v61.SUPPORTS_GET_PHONE_NUMBER_METHOD_REQUEST_DESCRIPTOR, {
            includeStatus = false
        }, {});
        return v66;
    else
        return v2.resolve();
    end;
end;
v16.getSMSOTP = function(v67)
    if not (not v4() or not v7()) and not l_GetFFlagLuaIdentityGetSMSOTP_0() then
        local v72 = v2.new(function(v68, _)
            local l_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR_0 = v67.GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR;
            v67.subscriber:subscribeProtocolMethodResponse(l_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR_0, function(v71)
                v67.subscriber:unsubscribeToProtocolMethodResponse(l_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR_0);
                v68(v71.result);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v67.GET_SMS_OTP_METHOD_REQUEST_DESCRIPTOR, {
            includeStatus = false
        }, {});
        return v72;
    else
        return v2.resolve();
    end;
end;
v16.supportsGetSMSOTP = function(v73)
    if not (not v4() or not v7()) and not l_GetFFlagLuaIdentityGetSMSOTP_0() then
        local v78 = v2.new(function(v74, _)
            local l_SUPPORTS_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR_0 = v73.SUPPORTS_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR;
            v73.subscriber:subscribeProtocolMethodResponse(l_SUPPORTS_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR_0, function(v77)
                v73.subscriber:unsubscribeToProtocolMethodResponse(l_SUPPORTS_GET_SMS_OTP_METHOD_RESPONSE_DESCRIPTOR_0);
                v74(v77.support);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v73.SUPPORTS_GET_SMS_OTP_METHOD_REQUEST_DESCRIPTOR, {
            includeStatus = false
        }, {});
        return v78;
    else
        return v2.resolve();
    end;
end;
v16.default = v16.new();
return v16;
