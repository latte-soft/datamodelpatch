local l_NotificationService_0 = game:GetService("NotificationService");
local v1 = require(script:FindFirstAncestor("TenFootUiShell").Parent.React);
local v2 = require(script.Parent.useAppPolicy);
return function()
    local v4 = v2(function(v3)
        return v3.getForceTheme();
    end);
    v1.useLayoutEffect(function()
        if v4 then
            l_NotificationService_0.SelectedTheme = v4;
        end;
    end, {
        v4
    });
end;
