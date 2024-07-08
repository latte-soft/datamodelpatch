local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v3 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v5 = {};
local function v8(v6)
    return v2.useEventHandler(l_FocusNavigationEventNameEnum_0.NavigateBack, (v1.useCallback(v3.onRelease(function(v7)
        v7:cancel();
        v6();
    end), {
        v6
    })));
end;
v5.useOnNavigateBack = v8;
v5.OnNavigateBackWrapper = function(v9)
    return v1.createElement("Frame", {
        ref = v8(v9.onNavigateBack), 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    }, v9.children);
end;
return v5;
