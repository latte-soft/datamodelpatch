local v0 = {};
v0.__index = v0;
v0.ScheduleNotification = function(_, _, _, _)
end;
v0.CancelNotification = function(_, _)
end;
v0.CancelAllNotification = function(_)
end;
v0.GetScheduledNotifications = function(_)
end;
v0.ActionEnabled = function(_)
end;
v0.ActionTaken = function(_)
end;
v0.GetPropertyChangedSignal = function(v11, v12)
    if v12 == "SelectedTheme" then
        return v11._selectedThemeChanged.Event;
    else
        error(("%s is not a valid property name"):format((tostring(v12))));
        return ;
    end;
end;
v0.new = function()
    local v13 = {
        SelectedTheme = "", 
        _selectedThemeChanged = Instance.new("BindableEvent")
    };
    setmetatable(v13, v0);
    v13.RobloxEventReceived = {
        BindableEvent = Instance.new("BindableEvent")
    };
    v13.RobloxConnectionChanged = {
        BindableEvent = Instance.new("BindableEvent")
    };
    v13.RobloxEventReceived.Connect = function(_, v15)
        return v13.RobloxEventReceived.BindableEvent.Event:Connect(v15);
    end;
    v13.RobloxEventReceived.Fire = function(_, v17)
        v13.RobloxEventReceived.BindableEvent:Fire(v17);
    end;
    v13.RobloxConnectionChanged.Connect = function(_, v19)
        return v13.RobloxConnectionChanged.BindableEvent.Event:Connect(v19);
    end;
    v13.RobloxConnectionChanged.Fire = function(_, v21, v22, v23)
        v13.RobloxConnectionChanged.BindableEvent:Fire(v21, v22, v23);
    end;
    return v13;
end;
return v0;
