local v0 = require(game:GetService("CorePackages").Packages.React);
local _ = require(script.Parent.Parent.Service.Types);
return function(v2)
    if not v2 or not v2.notification then
        warn("notification object not found");
        return 0;
    else
        local l_notification_0 = v2.notification;
        local v4, v5 = v0.useState(l_notification_0:get());
        v0.useEffect(function()
            local v6 = v2.notification:connect(function()
                v5(l_notification_0:get());
            end);
            return function()
                v6:disconnect();
            end;
        end, {
            v2.id
        });
        if v4 and v4.type == "count" then
            return v4.value;
        else
            return 0;
        end;
    end;
end;
