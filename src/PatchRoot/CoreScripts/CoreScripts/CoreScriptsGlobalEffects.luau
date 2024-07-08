local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_RobloxGui_0.Modules.Common.CoreScriptsRootProvider);
local v5 = require(l_RobloxGui_0.Modules.GamepadDisconnect.CoreScriptsGamepadDisconnectListener);
local v6 = require(l_CorePackages_0.Packages.React);
local v7 = require(l_CorePackages_0.Packages.Roact);
local l_DeviceType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceType;
local l_useLogInputTypeChanged_0 = require(l_CorePackages_0.Workspace.Packages.UiShellEvents).useLogInputTypeChanged;
local l_GetFFlagLogInputTypeChanged_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLogInputTypeChanged;
local v11 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest.new((game:GetService("EventIngestService")));
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
v7.mount(v6.createElement(function(_)
    if l_GetFFlagLogInputTypeChanged_0() then
        if not l_game_EngineFeature_0 then
            l_useLogInputTypeChanged_0(v11);
        else
            l_useLogInputTypeChanged_0(v11, l_RbxAnalyticsService_0:GetPlaySessionId());
        end;
    end;
    return v6.createElement(v4, {
        styleOverride = {
            deviceType = l_DeviceType_0.Console
        }
    }, {
        CoreScriptsGamepadDisconnectListener = v6.createElement(v5)
    });
end), l_CoreGui_0, "CoreScriptsGlobalEffects");
