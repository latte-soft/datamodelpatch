local l_Error_0 = require(script.Parent.Parent.LuauPolyfill).Error;
local v1 = {};
v1.__index = v1;
v1.new = function()
    local v2 = {};
    setmetatable(v2, v1);
    v2.aborted = false;
    v2.reason = l_Error_0.new("Undefined Error");
    v2._signal = Instance.new("BindableEvent");
    return v2;
end;
v1.abort = function(v3)
    local v4 = v1.new();
    v4.reason = v3 or l_Error_0.new("Signal Aborted");
    return v4;
end;
v1.timeout = function(v5)
    local v6 = v1.new();
    v6.reason = l_Error_0.new("TimeoutError");
    task.delay(v5 / 1000, function()
        v6:fire();
    end);
    return v6;
end;
v1.throwIfAborted = function(v7)
    if v7.aborted then
        error(v7.reason);
    end;
end;
v1.connect = function(v8, v9)
    return v8._signal.Event:Connect(v9);
end;
v1.fire = function(v10)
    v10.aborted = true;
    v10._signal:Fire();
end;
return {
    AbortSignal = v1
};
