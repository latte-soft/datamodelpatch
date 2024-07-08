local l_Parent_0 = script.Parent.Parent;
local l_MessageBusService_0 = game:GetService("MessageBusService");
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_Parent_0.t);
local v5 = require(script.Parent.Flags.getFFlagLuaLinkingSwitchToSettingsApp);
local v6 = require(script.Parent.Flags.getOpenURLUseRequestResponse);
local v7 = require(script.Parent.Flags.getFFlagEnableToSwitchToSettingsAppWithRouteLua);
local _ = require(script.Parent.LinkingProtocolTypes);
local _ = require(script.Parent.Enums.SettingsRoute);
local v10 = v4.strictInterface({
    url = v4.string
});
local v11 = {
    REGISTER_URL_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("Linking", "registerURL"), 
        validateParams = v4.strictInterface({
            url = v4.string, 
            domain = v4.literal("Lua")
        })
    }, 
    DETECT_URL_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("Linking", "detectURL"), 
        validateParams = v10
    }, 
    HANDLE_LUA_URL_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("Linking", "handleLuaURL"), 
        validateParams = v4.strictInterface({
            matchedUrl = v4.string, 
            url = v4.string, 
            attributionUrl = v4.optional(v4.string)
        })
    }, 
    OPEN_URL_REQUEST_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("Linking", "openURLRequest"), 
        validateParams = v10
    }, 
    OPEN_URL_RESPONSE_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("Linking", "openURLResponse"), 
        validateParams = v4.strictInterface({
            success = v4.boolean
        })
    }, 
    IS_URL_REGISTERED_REQUEST_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("Linking", "isURLRegisteredRequest"), 
        validateParams = v10
    }, 
    IS_URL_REGISTERED_RESPONSE_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("Linking", "isURLRegisteredResponse"), 
        validateParams = v4.strictInterface({
            isRegistered = v4.boolean
        })
    }, 
    SWITCH_TO_SETTINGS_APP_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "Linking", 
        methodName = "switchToSettingsApp", 
        validateParams = v4.table
    }, 
    SWITCH_TO_SETTINGS_APP_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "Linking", 
        methodName = "switchToSettingsApp", 
        validateParams = v4.table
    }, 
    SUPPORTS_SWITCH_TO_SETTINGS_APP_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "Linking", 
        methodName = "supportsSwitchToSettingsApp", 
        validateParams = v4.table
    }, 
    SUPPORTS_SWITCH_TO_SETTINGS_APP_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "Linking", 
        methodName = "supportsSwitchToSettingsApp", 
        validateParams = v4.table
    }
};
v11.__index = v11;
v11.new = function()
    return (setmetatable({
        subscriber = l_MessageBus_0.Subscriber.new(), 
        isListeningForURLs = false
    }, v11));
end;
v11.registerURL = function(v12, v13)
    l_MessageBus_0.publish(v12.REGISTER_URL_DESCRIPTOR, {
        url = v13, 
        domain = "Lua"
    });
end;
v11.detectURL = function(v14, v15)
    l_MessageBus_0.publish(v14.DETECT_URL_DESCRIPTOR, {
        url = v15
    });
end;
v11.getLastLuaURL = function(v16)
    local v17 = l_MessageBus_0.getLast(v16.HANDLE_LUA_URL_DESCRIPTOR);
    if v17 ~= nil then
        return v17.url;
    else
        return nil;
    end;
end;
v11.listenForLuaURLs = function(v18, v19, v20)
    if v18.isListeningForURLs then
        v18:stopListeningForLuaURLs();
    end;
    v18.subscriber:subscribe(v18.HANDLE_LUA_URL_DESCRIPTOR, function(v21)
        v19(v21.url, v21.attributionUrl);
    end, v20);
    v18.isListeningForURLs = true;
end;
v11.stopListeningForLuaURLs = function(v22)
    if v22.isListeningForURLs then
        v22.subscriber:unsubscribe(v22.HANDLE_LUA_URL_DESCRIPTOR);
        v22.isListeningForURLs = false;
    end;
end;
v11.openURL = function(v23, v24)
    local v25 = nil;
    if not v6() then
        v25 = v3.new(function(v26, _)
            local l_OPEN_URL_RESPONSE_DESCRIPTOR_0 = v23.OPEN_URL_RESPONSE_DESCRIPTOR;
            v23.subscriber:subscribe(l_OPEN_URL_RESPONSE_DESCRIPTOR_0, function(v29)
                v23.subscriber:unsubscribe(l_OPEN_URL_RESPONSE_DESCRIPTOR_0);
                v26(v29.success);
            end);
        end);
        l_MessageBus_0.publish(v23.OPEN_URL_REQUEST_DESCRIPTOR, {
            url = v24
        });
        return v25;
    else
        return (v3.new(function(v30, _)
            l_MessageBusService_0:MakeRequest("Linking", "openURL", {
                url = v24
            }, function(v32)
                v30(v32.success);
            end, {});
        end));
    end;
end;
v11.isURLRegistered = function(v33, v34)
    local v39 = v3.new(function(v35, _)
        local l_IS_URL_REGISTERED_RESPONSE_DESCRIPTOR_0 = v33.IS_URL_REGISTERED_RESPONSE_DESCRIPTOR;
        v33.subscriber:subscribe(l_IS_URL_REGISTERED_RESPONSE_DESCRIPTOR_0, function(v38)
            v33.subscriber:unsubscribe(l_IS_URL_REGISTERED_RESPONSE_DESCRIPTOR_0);
            v35(v38.isRegistered);
        end);
    end);
    l_MessageBus_0.publish(v33.IS_URL_REGISTERED_REQUEST_DESCRIPTOR, {
        url = v34
    });
    return v39;
end;
v11.getAndClearLastPendingURL = function(_)
    if game:GetEngineFeature("LinkingProtocolGetLastPendingUrlEnabled") then
        return v3.new(function(v41, _)
            l_MessageBusService_0:MakeRequest("Linking", "getAndClearLastPendingURL", {}, function(v43)
                v41(v43);
            end, {});
        end);
    else
        return v3.resolve({
            hasPendingUrl = false
        });
    end;
end;
v11.switchToSettingsApp = function(v44, v45)
    if v5() then
        local v50 = v3.new(function(v46, _)
            local l_SWITCH_TO_SETTINGS_APP_METHOD_RESPONSE_DESCRIPTOR_0 = v44.SWITCH_TO_SETTINGS_APP_METHOD_RESPONSE_DESCRIPTOR;
            v44.subscriber:subscribeProtocolMethodResponse(l_SWITCH_TO_SETTINGS_APP_METHOD_RESPONSE_DESCRIPTOR_0, function(_)
                v44.subscriber:unsubscribeToProtocolMethodResponse(l_SWITCH_TO_SETTINGS_APP_METHOD_RESPONSE_DESCRIPTOR_0);
                v46();
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v44.SWITCH_TO_SETTINGS_APP_METHOD_REQUEST_DESCRIPTOR, {
            includeStatus = false, 
            route = if not v7() then nil else v45
        }, {});
        return v50;
    else
        return v3.resolve();
    end;
end;
v11.supportsSwitchToSettingsApp = function(v51, v52)
    if v5() then
        local v57 = v3.new(function(v53, _)
            local l_SUPPORTS_SWITCH_TO_SETTINGS_APP_METHOD_RESPONSE_DESCRIPTOR_0 = v51.SUPPORTS_SWITCH_TO_SETTINGS_APP_METHOD_RESPONSE_DESCRIPTOR;
            v51.subscriber:subscribeProtocolMethodResponse(l_SUPPORTS_SWITCH_TO_SETTINGS_APP_METHOD_RESPONSE_DESCRIPTOR_0, function(v56)
                v51.subscriber:unsubscribeToProtocolMethodResponse(l_SUPPORTS_SWITCH_TO_SETTINGS_APP_METHOD_RESPONSE_DESCRIPTOR_0);
                v53(v56.support);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v51.SUPPORTS_SWITCH_TO_SETTINGS_APP_METHOD_REQUEST_DESCRIPTOR, {
            includeStatus = false, 
            route = if not v7() then nil else v52
        }, {});
        return v57;
    else
        return v3.resolve();
    end;
end;
v11.default = v11.new();
return v11;
