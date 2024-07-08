local _ = game:GetService("CoreGui").RobloxGui.Modules;
local l_IsVRAppBuild_0 = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).IsVRAppBuild;
return function(v2)
    if not l_IsVRAppBuild_0() then
        return v2.TopBar.topBarHeight;
    else
        return 0;
    end;
end;
