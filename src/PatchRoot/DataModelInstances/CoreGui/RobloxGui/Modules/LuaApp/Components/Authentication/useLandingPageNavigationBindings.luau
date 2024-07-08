local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_FocusNavigationEventNameEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum;
return function()
    return (v2.useEventHandler(l_FocusNavigationEventNameEnum_0.NavigateBack, (v1.useCallback(function(v4)
        v4:cancel();
    end, {}))));
end;
