local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_FocusNavigationEventNameEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v4 = require(l_CorePackages_0.Packages.InputHandlers);
local v5 = require(script.Parent.useOpenQuickMenuCallback);
local v6 = require(script.Parent.useQuickMenuAvailable);
local v7 = {
    [Enum.KeyCode.ButtonStart] = l_FocusNavigationEventNameEnum_0.OpenQuickMenu
};
return function(v8, v9)
    local v10 = v6();
    local v11 = v5(v8.overlayClosedCallback);
    return v2.useEventHandlerMap(v1.useMemo(function()
        return {
            [l_FocusNavigationEventNameEnum_0.OpenQuickMenu] = {
                handler = if not v10 then nil else v4.onRelease(v11)
            }
        };
    end, {
        v8
    }), (v2.useEventMap(v7, v9)));
end;
