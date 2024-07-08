local l_MessageBusService_0 = game:GetService("MessageBusService");
local _ = require(script.Parent.MessageBusTypes);
local v2 = game:DefineFastFlag("LuaAppFixMessageBusServiceCase", false);
local l_FFlagLuaAppFixMessageBusUnsubscribe_0 = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).FFlagLuaAppFixMessageBusUnsubscribe;
local v4 = {};
v4.__index = v4;
v4.publish = function(v5, v6)
    assert(v5.validateParams(v6));
    l_MessageBusService_0:Publish(v5.mid, v6);
end;
v4.publishProtocolMethodRequest = function(v7, v8, v9)
    assert(v7.validateParams(v8));
    l_MessageBusService_0:PublishProtocolMethodRequest(v7.protocolName, v7.methodName, v8, v9);
end;
v4.publishProtocolMethodResponse = function(v10, v11, v12, v13)
    assert(v10.validateParams(v11));
    if not v2 then
        l_MessageBusService_0:publishProtocolMethodResponse(v10.protocolName, v10.methodName, v11, v12, v13);
        return ;
    else
        l_MessageBusService_0:PublishProtocolMethodResponse(v10.protocolName, v10.methodName, v11, v12, v13);
        return ;
    end;
end;
v4.getLast = function(v14)
    local v15 = nil;
    v15 = if not v2 then l_MessageBusService_0:getLast(v14.mid) else l_MessageBusService_0:GetLast(v14.mid);
    if v15 == nil then
        return nil;
    else
        assert(v14.validateParams(v15));
        return v15;
    end;
end;
v4.getMessageId = function(v16, v17)
    return l_MessageBusService_0:GetMessageId(v16, v17);
end;
v4.getProtocolMethodRequestMessageId = function(v18, v19)
    return l_MessageBusService_0:GetProtocolMethodRequestMessageId(v18, v19);
end;
v4.getProtocolMethodResponseMessageId = function(v20, v21)
    return l_MessageBusService_0:GetProtocolMethodResponseMessageId(v20, v21);
end;
v4.call = function(v22, v23)
    assert(v22.validateParams(v23));
    return l_MessageBusService_0:Call(v22.fid, v23);
end;
local v24 = {};
v24.__index = v24;
v24.new = function()
    return (setmetatable({
        connections = {}
    }, v24));
end;
v24.getSubscriptionCount = function(v25)
    local v26 = 0;
    for _ in pairs(v25.connections) do
        v26 = v26 + 1;
    end;
    return v26;
end;
v24.subscribe = function(v28, v29, v30, v31, v32)
    local v33 = true;
    if v31 ~= nil then
        v33 = v31;
    end;
    local v34 = false;
    if v32 ~= nil then
        v34 = v32;
    end;
    local l_mid_0 = v29.mid;
    if v28.connections[l_mid_0] ~= nil then
        v28:unsubscribe(v29);
    end;
    v28.connections[l_mid_0] = l_MessageBusService_0:Subscribe(l_mid_0, v30, v34, v33);
end;
v24.subscribeProtocolMethodRequest = function(v36, v37, v38, v39, v40)
    local v41 = true;
    if v39 ~= nil then
        v41 = v39;
    end;
    local v42 = false;
    if v40 ~= nil then
        v42 = v40;
    end;
    local l_protocolName_0 = v37.protocolName;
    local l_methodName_0 = v37.methodName;
    local v45 = v4.getProtocolMethodRequestMessageId(l_protocolName_0, l_methodName_0);
    if v36.connections[v45] ~= nil then
        if not l_FFlagLuaAppFixMessageBusUnsubscribe_0 then
            v36:unsubscribe(v45);
        else
            v36:unsubscribeWithMsgId(v45);
        end;
    end;
    v36.connections[v45] = l_MessageBusService_0:SubscribeToProtocolMethodRequest(l_protocolName_0, l_methodName_0, v38, v42, v41);
end;
v24.subscribeProtocolMethodResponse = function(v46, v47, v48, v49, v50)
    local v51 = true;
    if v49 ~= nil then
        v51 = v49;
    end;
    local v52 = false;
    if v50 ~= nil then
        v52 = v50;
    end;
    local l_protocolName_1 = v47.protocolName;
    local l_methodName_1 = v47.methodName;
    local v55 = v4.getProtocolMethodResponseMessageId(l_protocolName_1, l_methodName_1);
    if v46.connections[v55] ~= nil then
        if not l_FFlagLuaAppFixMessageBusUnsubscribe_0 then
            v46:unsubscribe(v55);
        else
            v46:unsubscribeWithMsgId(v55);
        end;
    end;
    v46.connections[v55] = l_MessageBusService_0:SubscribeToProtocolMethodResponse(l_protocolName_1, l_methodName_1, v48, v52, v51);
end;
v24.unsubscribeToProtocolMethodRequest = function(v56, v57)
    v56:unsubscribeWithMsgId(l_MessageBusService_0:GetProtocolMethodRequestMessageId(v57.protocolName, v57.methodName));
end;
v24.unsubscribeToProtocolMethodResponse = function(v58, v59)
    v58:unsubscribeWithMsgId(l_MessageBusService_0:GetProtocolMethodResponseMessageId(v59.protocolName, v59.methodName));
end;
v24.unsubscribe = function(v60, v61)
    v60:unsubscribeWithMsgId(v61.mid);
end;
v24.unsubscribeWithMsgId = function(v62, v63)
    local v64 = v62.connections[v63];
    if v64 == nil then
        error("unsubscribing from a message id not subscribed to: " .. v63);
    end;
    v62.connections[v63] = nil;
    v64:Disconnect();
end;
v24.unsubscribeFromAllMessages = function(v65)
    for v66, v67 in pairs(v65.connections) do
        v65.connections[v66] = nil;
        v67:Disconnect();
    end;
end;
v4.Subscriber = v24;
return v4;
