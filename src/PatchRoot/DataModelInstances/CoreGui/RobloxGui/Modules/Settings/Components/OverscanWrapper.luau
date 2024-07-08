local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_RobloxGui_0.Modules.Common.CoreScriptsRootProvider);
local v4 = require(l_RobloxGui_0.Modules.Common.FocusNavigationEffectsWrapper);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local l_FocusNavigableSurfaceIdentifierEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum;
local l_DeviceType_0 = v6.DeviceType;
OverscanWrapper = function(v9)
    return function(v10)
        return v5.createElement(v3, {
            styleOverride = {
                deviceType = l_DeviceType_0.Console
            }
        }, {
            FocusNavigationEffects = v5.createElement(v4, {
                selectionGroupName = "OverscanScreen", 
                focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
            }, {
                Overscan = v5.createElement(v9, v10)
            })
        });
    end;
end;
return OverscanWrapper;
