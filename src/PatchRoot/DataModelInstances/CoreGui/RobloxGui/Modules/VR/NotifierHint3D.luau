local v0 = {};
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_RobloxGui_0.Modules.Settings.Utility):Create("ImageLabel")({
    Name = "NotificationObject", 
    Position = UDim2.new(0.5, -860, 1, -301), 
    Size = UDim2.new(0, 1700, 0, 1000), 
    BackgroundTransparency = 1, 
    Image = "rbxasset://textures/ui/VR/notifier_glow.png", 
    ImageTransparency = 0, 
    BorderSizePixel = 0
});
v0.DEFAULT_DURATION = 5;
local v12 = (function()
    local v5 = {};
    local v6 = nil;
    v5.Init = function(v7, v8)
        local v9 = tick();
        local v10 = v9 + v8;
        if v6 then
            v6:disconnect();
            v6 = nil;
        end;
        v6 = l_RunService_0.RenderStepped:connect(function()
            if v10 <= tick() then
                v7:Cancel();
                return ;
            else
                v4.Parent = l_RobloxGui_0;
                v4.ImageTransparency = ((math.sin((tick() - v9) * 2.5 + 1.5707963267948966) + 1) / 2) * 0.5 + 0.5;
                return ;
            end;
        end);
    end;
    v5.Cancel = function(_)
        if v6 then
            v6:disconnect();
            v6 = nil;
        end;
        v4.Parent = nil;
    end;
    return v5;
end)();
v0.BeginNotification = function(v13, v14)
    v13:CancelNotification();
    v12:Init(v14 or v13.DEFAULT_DURATION);
end;
v0.CancelNotification = function(_)
    v12:Cancel();
end;
return v0;
