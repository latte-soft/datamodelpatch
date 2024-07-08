local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.ReportAnything.Resources.Constants);
local v5 = require(script.Parent.ScreenshotFlowStepHandler);
local v6 = v3.PureComponent:extend("ScreenshotFlowStepHandlerContainer");
local v7 = require(l_RobloxGui_0.Modules.Common.CoreScriptsRootProvider);
local v8 = require(l_RobloxGui_0.Modules.Common.FocusNavigationEffectsWrapper);
local l_FocusNavigableSurfaceIdentifierEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum;
v6.render = function(v10)
    return v3.createElement(v7, {}, {
        FocusNavigationEffects = v3.createElement(v8, {
            selectionGroupName = v4.ScreenshotFlowStepHandlerRootName, 
            focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
        }, {
            ScreenshotFlowStepHandlerContainer = v3.createElement(v5, v10.props)
        })
    });
end;
return v6;
