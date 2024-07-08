local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.Parent.Parent.Dash);
local l_class_0 = v1.class;
local l_join_0 = v1.join;
local l_forEach_0 = v1.forEach;
local l_insert_0 = table.insert;
local v7 = l_class_0("PluginEventBridge", function(v6)
    return {
        id = l_HttpService_0:GenerateGUID(), 
        plugin = v6, 
        connections = {}
    };
end);
v7.send = function(v8, v9)
    v8.plugin:Invoke("DeveloperTools", (l_join_0(v9, {
        fromBridgeId = v8.id
    })));
end;
v7.connect = function(v10, v11)
    l_insert_0(v10.connections, (v10.plugin:OnInvoke("DeveloperTools", function(v12)
        if v12.fromBridgeId ~= v10.id then
            v11(v12);
        end;
    end)));
end;
v7.destroy = function(v13)
    l_forEach_0(v13.connections, function(v14)
        v14:Disconnect();
    end);
end;
return v7;
