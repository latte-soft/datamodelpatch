local l_console_0 = require(script.Parent.Parent.Parent.Parent.Shared).console;
local v1 = {
    Disabled = "Disabled", 
    Suspended = "Suspended", 
    Enabled = "Enabled"
};
local v2 = {};
v2.__index = v2;
v2.new = function(v3)
    return (setmetatable({
        _suspendedEventQueue = {}, 
        _connections = {}, 
        _listeners = {}, 
        _status = v1.Disabled, 
        _isResuming = false, 
        _instance = v3
    }, v2));
end;
v2.connectEvent = function(v4, v5, v6)
    v4:_connect(v5, v4._instance[v5], v6);
end;
v2.connectPropertyChange = function(v7, v8, v9)
    local l_status_0, l_result_0 = pcall(v7._instance.GetPropertyChangedSignal, v7._instance, v8);
    if not l_status_0 then
        error(string.format("Cannot get changed signal on property %q: %s", tostring(v8), l_result_0), 0);
    end;
    v7:_connect("Change." .. v8, l_result_0, v9);
end;
v2._connect = function(v12, v13, v14, v15)
    if v15 == nil then
        if v12._connections[v13] ~= nil then
            v12._connections[v13]:Disconnect();
            v12._connections[v13] = nil;
        end;
        v12._listeners[v13] = nil;
        return ;
    else
        if v12._connections[v13] == nil then
            v12._connections[v13] = v14:Connect(function(...)
                if v12._status == v1.Enabled then
                    v12._listeners[v13](v12._instance, ...);
                    return ;
                else
                    if v12._status == v1.Suspended then
                        table.insert(v12._suspendedEventQueue, {
                            v13, 
                            select("#", ...), 
                            ...
                        });
                    end;
                    return ;
                end;
            end);
        end;
        v12._listeners[v13] = v15;
        return ;
    end;
end;
v2.suspend = function(v16)
    v16._status = v1.Suspended;
end;
v2.resume = function(v17)
    if not v17._isResuming then
        v17._isResuming = true;
        for _, v19 in v17._suspendedEventQueue, nil, nil do
            local v20 = v17._listeners[v19[1]];
            local v21 = v19[2];
            if v20 ~= nil then
                local v22, v23 = coroutine.resume(coroutine.create(v20), v17._instance, unpack(v19, 3, 2 + v21));
                if not v22 then
                    l_console_0.warn("%s", v23);
                end;
            end;
        end;
        v17._isResuming = false;
        v17._status = v1.Enabled;
        table.clear(v17._suspendedEventQueue);
        return ;
    else
        return ;
    end;
end;
return v2;
