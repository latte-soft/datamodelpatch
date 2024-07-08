local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(game:GetService("CorePackages").Roact);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_RobloxGui_0.Modules.CaptureNotification);
local v4 = require(l_RobloxGui_0.Modules.shouldSaveScreenshotToAlbum);
local v5 = {};
v5.__index = v5;
v5.new = function()
    local v6 = {};
    setmetatable(v6, v5);
    v6.init = false;
    v6.captureEvent = Instance.new("BindableEvent");
    v6.permissionEvent = Instance.new("BindableEvent");
    if v4() then
        v6.captureNotification = v1.createElement(v3, {
            permissionEvent = v6.permissionEvent
        });
    end;
    return v6;
end;
v5.Start = function(v7)
    if not v7.init then
        v7.init = true;
        if v4() then
            v7.captureNotificationInstance = v1.mount(v7.captureNotification, l_CoreGui_0, "RobloxCaptureNotificationGui");
        end;
        return ;
    else
        return ;
    end;
end;
local v8 = v5.new();
v5.DismissNotification = function(v9)
    if v9.init then
        if v4() then
            v1.update(v9.captureNotificationInstance, v1.createElement(v3, {
                permissionEvent = v9.permissionEvent, 
                forceDismissToast = {
                    onDismissed = function()
                        v1.update(v9.captureNotificationInstance, v1.createElement(v3, {
                            permissionEvent = v9.permissionEvent, 
                            forceDismissToast = nil
                        }));
                    end
                }
            }));
        end;
        return ;
    else
        v8:Start();
        return ;
    end;
end;
v5.ShowPermissionToast = function(v10)
    if not v10.init then
        v8:Start();
    end;
    v10.permissionEvent:Fire();
end;
v5.Capture = function(v11)
    v11:DismissNotification();
    v11.captureEvent:Fire();
end;
return v8;
