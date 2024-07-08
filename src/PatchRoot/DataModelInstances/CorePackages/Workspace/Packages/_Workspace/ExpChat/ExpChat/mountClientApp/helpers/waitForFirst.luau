return function(...)
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v1 = {
        ...
    };
    local function v3(...)
        for v2 = 1, #v1 do
            v1[v2]:Disconnect();
        end;
        return l_BindableEvent_0:Fire(...);
    end;
    for v4 = 1, #v1 do
        v1[v4] = v1[v4]:Connect(v3);
    end;
    return l_BindableEvent_0.Event:Wait();
end;
