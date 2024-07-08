local l_NotificationService_0 = game:GetService("NotificationService");
local v1 = require(script:FindFirstAncestor("RoactUtils").Parent.React);
return function()
    local v2, v3 = v1.useState(string.lower(l_NotificationService_0.SelectedTheme));
    v1.useEffect(function()
        local v4 = l_NotificationService_0:GetPropertyChangedSignal("SelectedTheme"):Connect(function()
            v3(string.lower(l_NotificationService_0.SelectedTheme));
        end);
        return function()
            v4:Disconnect();
        end;
    end);
    return v2;
end;
