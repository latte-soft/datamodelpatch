local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent;
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v3 = require(l_Parent_0.t);
local v4 = require(l_Parent_0.Promise);
local _ = require(script.Parent.CredentialsProtocolTypes);
local v6 = {
    FIDO2 = "FIDO2", 
    password = "password", 
    all = "all"
};
local v7 = v3.strictInterface({
    keyType = v3.optional(v3.string), 
    publicKey = v3.interface({
        challenge = v3.string, 
        timeout = v3.optional(v3.number), 
        rpId = v3.optional(v3.string), 
        allowCredentials = v3.optional(v3.table), 
        userVerification = v3.optional(v3.string), 
        attestation = v3.optional(v3.string), 
        extensions = v3.optional(v3.table)
    }), 
    deviceBoundOnly = v3.optional(v3.boolean)
});
local v8 = {
    [v6.FIDO2] = v3.strictInterface({
        credentialType = v3.string, 
        parameters = v7
    }), 
    [v6.all] = v3.strictInterface({
        FIDO2 = v3.optional(v7), 
        password = v3.optional(v3.strictInterface({}))
    })
};
local v9 = v3.strictInterface({
    id = v3.optional(v3.string), 
    rawId = v3.optional(v3.string), 
    type = v3.optional(v3.string), 
    response = v3.interface({
        authenticatorData = v3.string, 
        clientDataJSON = v3.string, 
        signature = v3.string, 
        userHandle = v3.optional(v3.string)
    }), 
    errorCode = v3.optional(v3.string), 
    errorMsg = v3.optional(v3.string)
});
local v10 = {
    [v6.FIDO2] = v9, 
    [v6.all] = v3.strictInterface({
        credentialType = v3.string, 
        response = v3.union(v9, v3.strictInterface({
            username = v3.optional(v3.string), 
            password = v3.optional(v3.string), 
            errorCode = v3.optional(v3.string), 
            errorMsg = v3.optional(v3.string)
        }))
    })
};
local v11 = {
    [v6.FIDO2] = v3.strictInterface({
        credentialType = v3.string, 
        parameters = v3.interface({
            keyType = v3.optional(v3.string), 
            publicKey = v3.interface({
                rp = v3.interface({
                    name = v3.string, 
                    id = v3.string
                }), 
                user = v3.interface({
                    name = v3.string, 
                    displayName = v3.string, 
                    id = v3.string
                }), 
                challenge = v3.string, 
                pubKeyCredParams = v3.optional(v3.table), 
                timeout = v3.optional(v3.number), 
                excludeCredentials = v3.optional(v3.table), 
                authenticationSelection = v3.optional(v3.table), 
                attestation = v3.optional(v3.string), 
                extensions = v3.optional(v3.table)
            })
        })
    }), 
    [v6.password] = v3.strictInterface({
        credentialType = v3.string, 
        parameters = v3.strictInterface({
            username = v3.string, 
            password = v3.string
        })
    })
};
local v12 = {
    [v6.FIDO2] = v3.strictInterface({
        id = v3.optional(v3.string), 
        rawId = v3.optional(v3.string), 
        type = v3.optional(v3.string), 
        response = v3.interface({
            clientDataJSON = v3.string, 
            attestationObject = v3.string
        }), 
        authenticatorAttachment = v3.optional(v3.string), 
        clientExtensionResults = v3.optional(v3.table), 
        errorCode = v3.optional(v3.string), 
        errorMsg = v3.optional(v3.string)
    }), 
    [v6.password] = v3.strictInterface({
        errorCode = v3.optional(v3.string), 
        errorMsg = v3.optional(v3.string)
    })
};
local v13 = {
    CredentialsTypes = v6, 
    GET_CREDENTIALS_REQUEST_DESCRIPTOR = {
        [v6.FIDO2] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "getCredentialsRequest"), 
            validateParams = v8[v6.FIDO2]
        }, 
        [v6.all] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "getCredentialsRequest"), 
            validateParams = v8[v6.all]
        }
    }, 
    GET_CREDENTIALS_RESPONSE_DESCRIPTOR = {
        [v6.FIDO2] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "getCredentialsResponse"), 
            validateParams = v10[v6.FIDO2]
        }, 
        [v6.all] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "getCredentialsResponse"), 
            validateParams = v10[v6.all]
        }
    }, 
    REGISTER_CREDENTIALS_REQUEST_DESCRIPTOR = {
        [v6.FIDO2] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "registerCredentialsRequest"), 
            validateParams = v11[v6.FIDO2]
        }, 
        [v6.password] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "registerCredentialsRequest"), 
            validateParams = v11[v6.password]
        }
    }, 
    REGISTER_CREDENTIALS_RESPONSE_DESCRIPTOR = {
        [v6.FIDO2] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "registerCredentialsResponse"), 
            validateParams = v12[v6.FIDO2]
        }, 
        [v6.password] = {
            mid = l_MessageBus_0.getMessageId("Credentials", "registerCredentialsResponse"), 
            validateParams = v12[v6.password]
        }
    }, 
    IS_AVAILABLE_REQUEST_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("Credentials", "isAvailableRequest"), 
        validateParams = v3.strictInterface({
            credentialType = v3.optional(v3.valueOf(v6))
        })
    }, 
    IS_AVAILABLE_RESPONSE_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("Credentials", "isAvailableResponse"), 
        validateParams = v3.strictInterface({
            isAvailable = v3.optional(v3.boolean), 
            supportsDeviceBoundOnly = v3.optional(v3.boolean), 
            FIDO2 = v3.optional(v3.strictInterface({
                isAvailable = v3.boolean, 
                supportsDeviceBoundOnly = v3.boolean
            })), 
            password = v3.optional(v3.strictInterface({
                isAvailable = v3.boolean
            }))
        })
    }
};
v13.__index = v13;
v13.new = function()
    return (setmetatable({
        subscriber = l_MessageBus_0.Subscriber.new(), 
        getCredentialsRequestInFlight = false, 
        registerCredentialsRequestInFlight = false
    }, v13));
end;
v13.getCredentials = function(v14, v15, v16, v17)
    if v14.getCredentialsRequestInFlight then
        return v4.reject();
    else
        local v21 = v4.race({
            v4.new(function(v18, _)
                v14.subscriber:subscribe(v14.GET_CREDENTIALS_RESPONSE_DESCRIPTOR[v15], function(v20)
                    v14.subscriber:unsubscribe(v14.GET_CREDENTIALS_RESPONSE_DESCRIPTOR[v15]);
                    v14.getCredentialsRequestInFlight = false;
                    v18((l_HttpService_0:JSONEncode(v20)));
                end);
            end), 
            v4.delay(v17):andThen(function()
                v14.subscriber:unsubscribe(v14.GET_CREDENTIALS_RESPONSE_DESCRIPTOR[v15]);
                v14.getCredentialsRequestInFlight = false;
            end)
        });
        v14.getCredentialsRequestInFlight = true;
        if v15 == v6.all then
            l_MessageBus_0.publish(v14.GET_CREDENTIALS_REQUEST_DESCRIPTOR[v15], l_HttpService_0:JSONDecode(v16));
            return v21;
        else
            l_MessageBus_0.publish(v14.GET_CREDENTIALS_REQUEST_DESCRIPTOR[v15], {
                credentialType = v15, 
                parameters = l_HttpService_0:JSONDecode(v16)
            });
            return v21;
        end;
    end;
end;
v13.registerCredentials = function(v22, v23, v24, v25)
    if v22.registerCredentialsRequestInFlight then
        return v4.reject();
    else
        local v29 = v4.race({
            v4.new(function(v26, _)
                v22.subscriber:subscribe(v22.REGISTER_CREDENTIALS_RESPONSE_DESCRIPTOR[v23], function(v28)
                    v22.subscriber:unsubscribe(v22.REGISTER_CREDENTIALS_RESPONSE_DESCRIPTOR[v23]);
                    v22.registerCredentialsRequestInFlight = false;
                    v26((l_HttpService_0:JSONEncode(v28)));
                end);
            end), 
            v4.delay(v25):andThen(function()
                v22.subscriber:unsubscribe(v22.REGISTER_CREDENTIALS_RESPONSE_DESCRIPTOR[v23]);
                v22.registerCredentialsRequestInFlight = false;
            end)
        });
        v22.registerCredentialsRequestInFlight = true;
        l_MessageBus_0.publish(v22.REGISTER_CREDENTIALS_REQUEST_DESCRIPTOR[v23], {
            credentialType = v23, 
            parameters = l_HttpService_0:JSONDecode(v24)
        });
        return v29;
    end;
end;
v13.isAvailable = function(v30, v31, v32)
    local v36 = v4.race({
        v4.new(function(v33, _)
            v30.subscriber:subscribe(v30.IS_AVAILABLE_RESPONSE_DESCRIPTOR, function(v35)
                v30.subscriber:unsubscribe(v30.IS_AVAILABLE_RESPONSE_DESCRIPTOR);
                v33(v35);
            end);
        end), 
        v4.delay(v32):andThen(function()
            v30.subscriber:unsubscribe(v30.IS_AVAILABLE_RESPONSE_DESCRIPTOR);
            return v4.resolve({
                isAvailable = nil, 
                supportsDeviceBoundOnly = nil
            });
        end)
    });
    l_MessageBus_0.publish(v30.IS_AVAILABLE_REQUEST_DESCRIPTOR, {
        credentialType = v31
    });
    return v36;
end;
v13.default = v13.new();
return v13;
