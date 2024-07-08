local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.InputUi);
local l_GamepadDisconnectedModal_0 = v4.Gamepad.GamepadDisconnectedModal;
local l_useGamepadDisconnectOverlayEffect_0 = v4.Gamepad.useGamepadDisconnectOverlayEffect;
local v7 = require(l_CoreGui_0.RobloxGui.Modules.InGameMenuConstants);
local v8 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest.new(l_EventIngestService_0);
local l_GetFFlagGamepadAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagGamepadAnalytics;
return function()
    local v10, v11 = v3.useState(false);
    local v12 = v3.useCallback(function()
        v11(false);
    end, {
        v11
    });
    local v13 = v3.useCallback(function()
        v11(true);
    end, {
        v11
    });
    if not l_GetFFlagGamepadAnalytics_0() then
        l_useGamepadDisconnectOverlayEffect_0(v13, v12);
    else
        l_useGamepadDisconnectOverlayEffect_0(v13, v12, v8, "InExperience");
    end;
    if not v10 then
        return nil;
    else
        return v3.createElement("ScreenGui", {
            DisplayOrder = v7.DisplayOrder.HeadsetDisconnectedDialog, 
            IgnoreGuiInset = true, 
            OnTopOfCoreBlur = true, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            GamepadDisconnectedModal = v3.createElement(l_GamepadDisconnectedModal_0)
        });
    end;
end;
