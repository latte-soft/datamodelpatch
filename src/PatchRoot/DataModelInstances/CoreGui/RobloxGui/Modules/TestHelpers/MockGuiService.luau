local v0 = {};
v0.__index = v0;
v0.new = function()
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v4 = {
        broadcasts = {}, 
        NativeClose = {
            Connect = function(_, v3)
                return l_BindableEvent_0.Event:Connect(v3);
            end
        }, 
        MenuIsOpen = false, 
        openedMenus = {}
    };
    setmetatable(v4, {
        __index = v0
    });
    return v4;
end;
v0.SetMenuIsOpen = function(v5, v6, v7)
    if not v6 then
        local v8 = table.find(v5.openedMenus, v7);
        if v8 then
            table.remove(v5.openedMenus, v8);
        end;
    else
        table.insert(v5.openedMenus, v7);
    end;
    v5.MenuIsOpen = #v5.openedMenus > 0;
end;
v0.BroadcastNotification = function(v9, v10, v11)
    table.insert(v9.broadcasts, {
        data = v10, 
        notification = v11
    });
end;
v0.GetNotificationTypeList = function(_)
    return {
        NATIVE_EXIT = 35, 
        RESTART_APP = 41
    };
end;
return v0;
