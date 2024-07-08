local v0 = game:DefineFastFlag("FixConnectionUtilKeys", false);
local v1 = {};
v1.__index = v1;
v1.new = function()
    local v2 = setmetatable({}, v1);
    if not v0 then
        v2.connections_old = {};
        return v2;
    else
        v2.connections = {};
        return v2;
    end;
end;
v1.connect = function(v3, v4, v5, v6)
    if not v0 then
        if v3.connections_old[v5] then
            v3.connections_old[v5]:Disconnect();
        end;
        v3.connections_old[v5] = v5:Connect(v6);
        return ;
    else
        if v3.connections[v4] then
            v3.connections[v4]();
        end;
        local v7 = v5:Connect(v6);
        v3.connections[v4] = function()
            v7:Disconnect();
        end;
        return ;
    end;
end;
v1.connectManual = function(v8, v9, v10)
    assert(v0);
    if v8.connections[v9] then
        v8.connections[v9]();
    end;
    v8.connections[v9] = v10;
end;
v1.disconnect = function(v11, v12)
    assert(v0);
    if v11.connections[v12] then
        v11.connections[v12]();
        v11.connections[v12] = nil;
    end;
end;
v1.disconnectAll = function(v13)
    if not v0 then
        for _, v15 in pairs(v13.connections_old) do
            if v15 then
                v15:Disconnect();
            end;
        end;
        v13.connections_old = {};
        return ;
    else
        for _, v17 in pairs(v13.connections) do
            v17();
        end;
        v13.connections = {};
        return ;
    end;
end;
return v1;
