local l_CorePackages_0 = game:GetService("CorePackages");
local l_useLogStatusBarTapped_0 = require(l_CorePackages_0.Workspace.Packages.UiShellEvents).useLogStatusBarTapped;
local l_AppEventIngestService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppEventIngestService;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_useLogInputTypeChanged_0 = require(l_CorePackages_0.Workspace.Packages.UiShellEvents).useLogInputTypeChanged;
local l_GetFFlagLogInputTypeChanged_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLogInputTypeChanged;
return function(v6)
    l_useLogStatusBarTapped_0(v6.currentPage);
    if l_GetFFlagLogInputTypeChanged_0() then
        l_useLogInputTypeChanged_0((l_useRoactService_0(l_AppEventIngestService_0)));
    end;
    return nil;
end;
