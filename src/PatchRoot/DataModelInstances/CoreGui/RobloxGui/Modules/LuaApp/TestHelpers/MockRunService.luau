local v0 = {};
v0.__index = v0;
v0.new = function(v1)
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v7 = {
        Heartbeat = {
            Connect = function(_, v4)
                return l_BindableEvent_0.Event:Connect(v4);
            end, 
            Wait = function(_)
                if not v1 then
                    return nil;
                else
                    return l_BindableEvent_0.Event:Wait();
                end;
            end, 
            Fire = function(_, ...)
                l_BindableEvent_0:Fire(...);
            end
        }
    };
    setmetatable(v7, {
        __index = v0
    });
    return v7;
end;
v0.GetRobloxVersion = function(_)
    return "0.0.0.1";
end;
v0.IsStudio = function(_)
    return false;
end;
v0.setThrottleFramerateEnabled = function(_, _)
end;
return v0;
