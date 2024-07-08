local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local v6 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v7 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags);
local l_AppUpdateService_0 = v7.AppUpdateService;
local l_RoactAnalytics_0 = v7.RoactAnalytics;
local l_CheckForUpdate_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppUpdate).Thunks.CheckForUpdate;
local v11 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
return function(_)
    local v13 = v6(l_RoactAnalytics_0);
    local v14 = v6(l_AppUpdateService_0);
    local v15 = l_useDispatch_0();
    local v17 = l_useSelector_0(function(v16)
        return v16.AuthenticationStatus.status;
    end);
    v2.useEffect(function()
        if game:GetEngineFeature("AutoUpgradeEngineFeatureOnly") and v17 == v11.LOGGED_IN then
            v15(l_CheckForUpdate_0(v14, false, v13, function()
            end, {
                ctx = "AppUpdateManager"
            }));
        end;
    end, {
        v17, 
        v14, 
        v13
    });
    return nil;
end;
