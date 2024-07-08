local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local _ = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local _ = game:GetService("CoreGui").RobloxGui.Modules;
return require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy.connect(function(v5, _)
    return {
        throttleFramerate = v5.getThrottleFramerate()
    };
end)(function(v7)
    v3.useEffect(function()
        if v7.throttleFramerate then
            l_RunService_0:setThrottleFramerateEnabled(true);
        end;
        return function()
            if v7.throttleFramerate then
                l_RunService_0:setThrottleFramerateEnabled(false);
            end;
        end;
    end, {});
end);
