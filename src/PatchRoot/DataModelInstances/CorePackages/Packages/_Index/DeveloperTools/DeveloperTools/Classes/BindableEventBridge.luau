local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.Parent.Parent.Dash);
local l_join_0 = v1.join;
local l_class_0 = v1.class;
local l_forEach_0 = v1.forEach;
local l_insert_0 = table.insert;
local v8 = l_class_0("BindableEventBridge", function(_, v7)
    return {
        id = l_HttpService_0:GenerateGUID(), 
        connections = {}, 
        noCreate = v7
    };
end);
v8._createEvent = function(v9, v10)
    if not v9.noCreate then
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        l_BindableEvent_0.Name = "DeveloperTools";
        l_BindableEvent_0.Parent = v10;
        return l_BindableEvent_0;
    else
        return nil;
    end;
end;
v8._init = function(v12, v13)
    v12.event = v13:FindFirstChild("DeveloperTools") or v12:_createEvent(v13);
end;
v8.send = function(v14, v15)
    local v16 = l_join_0(v15, {
        fromBridgeId = v14.id
    });
    if v14.event then
        v14.event:Fire(v16);
    end;
end;
v8.connect = function(v17, v18)
    local function v20(v19)
        if v19.fromBridgeId ~= v17.id then
            v18(v19);
        end;
    end;
    if not v17.event then
        return nil;
    else
        local v21 = v17.event.Event:Connect(v20);
        l_insert_0(v17.connections, v21);
        return v21;
    end;
end;
v8.destroy = function(v22)
    l_forEach_0(v22.connections, function(v23)
        v23:Disconnect();
    end);
end;
return v8;
