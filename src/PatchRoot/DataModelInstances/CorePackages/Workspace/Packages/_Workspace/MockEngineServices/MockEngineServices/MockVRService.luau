local v0 = {};
v0.__index = v0;
v0.new = function(_)
    local v10 = {
        VREnabled = false, 
        QuestDisplayRefreshRate = 90, 
        events = {}, 
        GetPropertyChangedSignal = function(v2, v3)
            local l_BindableEvent_0 = Instance.new("BindableEvent");
            v2.events[v3] = v2.events[v3] or {};
            table.insert(v2.events[v3], l_BindableEvent_0);
            return l_BindableEvent_0.Event;
        end, 
        callPropertyChanged = function(v5, v6)
            local v7 = v5.events[v6];
            if v7 then
                for _, v9 in v7, nil, nil do
                    v9:Fire();
                end;
            end;
        end
    };
    setmetatable(v10, {
        __index = v0
    });
    return v10;
end;
return v0;
