local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.Parent.Parent.Dash);
local l_join_0 = v1.join;
local l_class_0 = v1.class;
local l_forEach_0 = v1.forEach;
local v8 = l_class_0("PluginEventRouter", function(v5, v6, v7)
    return {
        routerId = l_HttpService_0:GenerateGUID(), 
        sourceName = v5, 
        plugin = v6, 
        bridges = v7, 
        outboundBridgeIds = {}
    };
end);
v8._init = function(v9)
    v9.connection = v9.plugin:OnInvoke("DeveloperTools", function(v10)
        if not v10.fromRouter then
            v9.outboundBridgeIds[v10.fromBridgeId] = true;
            local v11 = l_join_0(v10, {
                sourceName = v9.sourceName
            });
            l_forEach_0(v9.bridges, function(v12)
                v12:send(v11);
            end);
            return ;
        else
            return ;
        end;
    end);
    local function v14(v13)
        v9.plugin:Invoke("DeveloperTools", (l_join_0(v13, {
            fromRouter = true
        })));
    end;
    l_forEach_0(v9.bridges, function(v15)
        v15:connect(v14);
    end);
end;
v8.destroy = function(v16)
    v16.connection:Disconnect();
end;
return v8;
