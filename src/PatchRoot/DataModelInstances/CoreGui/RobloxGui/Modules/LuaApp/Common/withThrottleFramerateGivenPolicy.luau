local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_AppRunService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppRunService;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v6 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_Object_0 = require(l_CorePackages_0.Packages.LuauPolyfill).Object;
return function(v8)
    return v3.forwardRef(function(v9, v10)
        local v11 = v6(l_AppRunService_0) or l_RunService_0;
        return v3.createElement(v3.useMemo(function()
            return l_RoactAppPolicy_0.connect(function(v12)
                return {
                    setThrottleFramerateEnabled = function(v13)
                        if v12.getThrottleFramerate() then
                            v11:setThrottleFramerateEnabled(v13);
                        end;
                    end
                };
            end)(v8);
        end, {
            v8, 
            v11
        }), l_Object_0.assign(v9, {
            ref = v10
        }));
    end);
end;
