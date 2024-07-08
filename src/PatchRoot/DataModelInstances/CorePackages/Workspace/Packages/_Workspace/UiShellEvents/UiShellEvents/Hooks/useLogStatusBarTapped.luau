local l_script_FirstAncestor_0 = script:FindFirstAncestor("UiShellEvents");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useNavigation_0 = require(l_Parent_0.RoactUtils).Hooks.useNavigation;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_getCurrentRouteState_0 = require(l_Parent_0.Navigation).getCurrentRouteState;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_AppUserInputService_0 = require(l_Parent_0.RoactServiceTags).AppUserInputService;
local v8 = require(l_script_FirstAncestor_0.Analytics.uiStatusBarTappedEvent);
return function(v9)
    local v10 = l_useRoactService_0(l_AppEventIngestService_0);
    local v11 = l_useRoactService_0(l_AppUserInputService_0);
    local v12 = (v9 or (l_getCurrentRouteState_0((l_useNavigation_0())) or {}).name) or "Unknown";
    v2.useEffect(function()
        local v13 = v11.StatusBarTapped:Connect(function()
            v8(v10, "StatusBar", {
                page = v12
            });
        end);
        return function()
            v13:Disconnect();
        end;
    end, {
        v10, 
        v11, 
        v12
    });
end;
