local l_Parent_0 = script.Parent.Parent;
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_Parent_0.t);
local v4 = require(script.Parent.Flags.getFFlagLuaPermissionContactAccess);
local _ = require(script.Parent.PermissionsProtocolTypes);
game:DefineFastFlag("DebugRomarkAudioPermissionsBypass", false);
local v6 = {
    CAMERA_ACCESS = "CAMERA_ACCESS", 
    MICROPHONE_ACCESS = "MICROPHONE_ACCESS", 
    LOCAL_NETWORK = "LOCAL_NETWORK", 
    CONTACTS_ACCESS = "CONTACTS_ACCESS", 
    WRITE_MEDIA_STORAGE = "WRITE_MEDIA_STORAGE", 
    POST_NOTIFICATIONS = "POST_NOTIFICATIONS"
};
local v7 = {
    AUTHORIZED = "AUTHORIZED", 
    DENIED = "DENIED", 
    RESTRICTED = "RESTRICTED", 
    UNSUPPORTED = "UNSUPPORTED"
};
local v8 = v3.array(v3.valueOf(v6));
local v9 = v3.valueOf(v7);
local v10 = {
    Permissions = v6, 
    Status = v7, 
    PERMISSION_REQUEST_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "PermissionsProtocol", 
        methodName = "PermissionsRequest", 
        validateParams = v3.strictInterface({
            permissions = v8
        })
    }, 
    PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "PermissionsProtocol", 
        methodName = "PermissionsRequest", 
        validateParams = v3.strictInterface({
            status = v9, 
            missingPermissions = v8
        })
    }, 
    HAS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "PermissionsProtocol", 
        methodName = "HasPermissions", 
        validateParams = v3.strictInterface({
            permissions = v8
        })
    }, 
    HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "PermissionsProtocol", 
        methodName = "HasPermissions", 
        validateParams = v3.strictInterface({
            status = v9, 
            missingPermissions = v8
        })
    }, 
    SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR = {
        protocolName = "PermissionsProtocol", 
        methodName = "SupportsPermissions", 
        validateParams = v3.strictInterface({
            includeStatus = v3.literal(false)
        })
    }, 
    SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR = {
        protocolName = "PermissionsProtocol", 
        methodName = "SupportsPermissions", 
        validateParams = v3.strictInterface({
            permissions = v8
        })
    }
};
v10.__index = v10;
local function v15(v11)
    local v12 = {};
    for _, v14 in pairs(v11) do
        if v14 == v10.Permissions.CAMERA_ACCESS then
            v12.camera_access_requested = "";
        end;
        if v14 == v10.Permissions.MICROPHONE_ACCESS then
            v12.microphone_access_requested = "";
        end;
        if v14 == v10.Permissions.LOCAL_NETWORK then
            v12.local_network_requested = "";
        end;
        if not (not (v14 == v10.Permissions.CONTACTS_ACCESS) or not v4()) then
            v12.contacts_access_requested = "";
        end;
    end;
    return v12;
end;
v10.new = function()
    return (setmetatable({
        subscriber = l_MessageBus_0.Subscriber.new()
    }, v10));
end;
v10.hasPermissions = function(v16, v17)
    local v22 = v2.new(function(v18, _)
        local l_HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 = v16.HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
        v16.subscriber:subscribeProtocolMethodResponse(l_HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0, function(v21)
            v16.subscriber:unsubscribeToProtocolMethodResponse(l_HAS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0);
            v18(v21);
        end);
    end);
    l_MessageBus_0.publishProtocolMethodRequest(v16.HAS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, {
        permissions = v17
    }, (v15(v17)));
    return v22;
end;
v10.requestPermissions = function(v23, v24)
    if not game:GetFastFlag("DebugRomarkAudioPermissionsBypass") then
        local v29 = v2.new(function(v25, _)
            local l_PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 = v23.PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
            v23.subscriber:subscribeProtocolMethodResponse(l_PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0, function(v28)
                v23.subscriber:unsubscribeToProtocolMethodResponse(l_PERMISSION_REQUEST_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0);
                v25(v28);
            end);
        end);
        l_MessageBus_0.publishProtocolMethodRequest(v23.PERMISSION_REQUEST_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, {
            permissions = v24
        }, (v15(v24)));
        return v29;
    else
        return v2.resolve({
            missingPermissions = {}, 
            status = v10.Status.AUTHORIZED
        });
    end;
end;
v10.getSupportedPermissionsList = function(v30)
    local v35 = v2.new(function(v31, _)
        local l_SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0 = v30.SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR;
        v30.subscriber:subscribeProtocolMethodResponse(l_SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0, function(v34)
            v30.subscriber:unsubscribeToProtocolMethodResponse(l_SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_RESPONSE_DESCRIPTOR_0);
            v31(v34);
        end);
    end);
    l_MessageBus_0.publishProtocolMethodRequest(v30.SUPPORTS_PERMISSIONS_PROTOCOL_METHOD_REQUEST_DESCRIPTOR, {
        includeStatus = false
    }, {});
    return v35;
end;
v10.supportsPermissions = function(v36, v37)
    assert(v8(v37));
    return (v36:getSupportedPermissionsList():andThen(function(v38)
        local v39 = v38 and v38.permissions;
        if not v39 then
            return v2.reject();
        else
            for _, v41 in pairs(v37) do
                local v42 = false;
                for _, v44 in pairs(v39) do
                    if v41 == v44 then
                        v42 = true;
                        break;
                    end;
                end;
                if not v42 then
                    return v2.resolve(false);
                end;
            end;
            return v2.resolve(true);
        end;
    end));
end;
v10.checkOrRequestPermissions = function(v45, v46)
    assert(v8(v46));
    return v45:supportsPermissions(v46):andThen(function(v47)
        if v47 then
            return (v45:hasPermissions(v46):andThen(function(v48)
                if v48.status == v10.Status.AUTHORIZED then
                    return v2.resolve(v48.status);
                else
                    return v45:requestPermissions(v46):andThen(function(v49)
                        return v2.resolve(v49.status);
                    end);
                end;
            end));
        else
            return v2.resolve(v10.Status.UNSUPPORTED);
        end;
    end, function(_)
        return v2.resolve(v10.Status.UNSUPPORTED);
    end);
end;
v10.default = v10.new();
return v10;
