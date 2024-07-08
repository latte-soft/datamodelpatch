local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v3 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v5 = {
    [Enum.KeyCode.ButtonY] = l_FocusNavigationEventNameEnum_0.DisplayStatsAndInfo, 
    [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.Play
};
return function(v6, v7)
    local v8 = v1.useMemo(function()
        return {
            [l_FocusNavigationEventNameEnum_0.Play] = {
                handler = v3.onRelease(v6)
            }, 
            [l_FocusNavigationEventNameEnum_0.DisplayStatsAndInfo] = {
                handler = v3.onRelease(v7)
            }
        };
    end, {
        v6, 
        v7
    });
    local v9, v10 = v1.useState(true);
    return v2.useEventHandlerMap(if not v9 then {} else v8, (v2.useEventMap(if not v9 then {} else v5, (v1.useRef(nil))))), v10;
end;
