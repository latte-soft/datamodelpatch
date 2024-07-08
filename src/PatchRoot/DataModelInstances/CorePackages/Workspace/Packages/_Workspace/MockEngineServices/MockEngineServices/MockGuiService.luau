local v0 = {};
v0.__index = v0;
v0.new = function()
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v5 = {
        broadcasts = {}, 
        ShowLeaveConfirmation = {
            Connect = function(_, v3)
                return l_BindableEvent_0.Event:Connect(v3);
            end, 
            Fire = function(_, ...)
                l_BindableEvent_0:Fire(...);
            end
        }
    };
    setmetatable(v5, {
        __index = v0
    });
    return v5;
end;
v0.BroadcastNotification = function(v6, v7, v8)
    v6.broadcasts[#v6.broadcasts + 1] = {
        data = v7, 
        notification = v8
    };
end;
v0.SetGlobalGuiInset = function(_, _, _, _, _)
end;
v0.SafeZoneOffsetsChanged = function(_)
end;
return v0;
