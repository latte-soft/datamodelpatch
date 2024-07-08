local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v3 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v5 = {
    [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.SeeAll
};
local v6 = {};
local function v8(v7)
    return v2.useEventHandlerMap(v1.useMemo(function()
        return {
            [l_FocusNavigationEventNameEnum_0.SeeAll] = {
                handler = v3.onRelease(v7)
            }
        };
    end, {
        v7
    }), (v2.useEventMap(v5)));
end;
v6.useControllerBarFocusNavigationBindings = v8;
v6.OnSeeAllControllerBarNavigateWrapper = function(v9)
    return v1.createElement("Frame", {
        ref = v8(v9.onSeeAll), 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    }, v9.children);
end;
return v6;
