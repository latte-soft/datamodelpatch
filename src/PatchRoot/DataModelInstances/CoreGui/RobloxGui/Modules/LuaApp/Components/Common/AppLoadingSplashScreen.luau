local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(game:GetService("CoreGui").RobloxGui.Modules.Common.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local l_useIsFPSAtTarget_0 = require(l_CorePackages_0.Workspace.Packages.SplashScreenManager).useIsFPSAtTarget;
return v3.memo(function()
    local v5 = l_useIsFPSAtTarget_0();
    local v6 = v3.useRef(nil);
    local v7 = v3.useRef(tick());
    local v8 = v3.useRef(0);
    local v9 = v3.useRef(nil);
    v3.useEffect(function()
        if v5 then
            if v9.current then
                v9.current:Disconnect();
            end;
            return ;
        else
            v9.current = l_RunService_0.RenderStepped:Connect(function(_)
                local v11 = tick();
                v8.current = v8.current + ((v11 - v7.current) * 0.5) * 360;
                if v6.current and v6.current.Rotation ~= nil then
                    v6.current.Rotation = v8.current;
                end;
                v7.current = v11;
            end);
            return ;
        end;
    end, {
        v5
    });
    if v5 then
        return nil;
    else
        return (v2.createElement("ScreenGui", {}, {
            Spinner = v2.createElement("ImageLabel", {
                Size = UDim2.new(0.05, 0, 0.05, 0), 
                Position = UDim2.new(0.475, 0, 0.425, 0), 
                Image = "rbxasset://textures/ui/LoadingScreen/LoadingSpinner.png", 
                BackgroundTransparency = 1, 
                ref = v6
            })
        }));
    end;
end);
