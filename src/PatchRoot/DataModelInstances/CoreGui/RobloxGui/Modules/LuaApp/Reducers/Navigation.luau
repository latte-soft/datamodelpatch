local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Rodux);
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.tutils);
local v5 = require(l_Modules_0.LuaApp.mutedError);
local v6 = require(l_Modules_0.LuaApp.Actions.ApplySetNavigationLocked);
local v7 = require(l_Modules_0.LuaApp.Actions.SetBackNavigationDisabled);
local v8 = require(l_Modules_0.LuaApp.Actions.ApplyRoactNavigationHistory);
local v9 = require(l_Modules_0.LuaApp.FlagSettings);
local v10 = require(l_Modules_0.LuaApp.Constants);
local l_getCurrentRouteState_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).getCurrentRouteState;
local v12 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppNavigationAnalytics);
local l_GetFFlagLuaAppRefactorSelectRoute_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppRefactorSelectRoute;
local l_getLegacyPageFromRoactNavigationRoute_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Utils.getLegacyPageFromRoactNavigationRoute;
local function _()
    return {
        routeName = v9.GetDefaultAppPage(), 
        key = v9.GetDefaultAppPage()
    };
end;
local function v16()
    return {
        routeName = v9.GetDefaultAppPage(), 
        key = v9.GetDefaultAppPage(), 
        name = v9.GetDefaultAppPage(), 
        rnKey = v9.GetDefaultAppPage()
    };
end;
local function _()
    return {
        (v16())
    };
end;
return v2.createReducer({
    history = {
        {
            (v16())
        }
    }, 
    currentRoute = if not v12() then {
        (v16())
    } else v16(), 
    lockNavigationActions = false, 
    backNavigationDisableCounter = 0, 
    roactNavigationState = if not l_GetFFlagLuaAppRefactorSelectRoute_0() then nil else {
        routeName = v9.GetDefaultAppPage(), 
        key = v9.GetDefaultAppPage()
    }
}, {
    [v8.name] = function(v18, v19)
        local l_navigationState_0 = v19.navigationState;
        if not (not l_navigationState_0 or not l_navigationState_0.routes) and l_navigationState_0.index then
            local v21 = {};
            for v22 = 1, l_navigationState_0.index do
                local v23 = l_navigationState_0.routes[v22];
                if v23.routeName == v10.TempRnSwitchNavigatorName then
                    v23 = v23.routes[v23.index];
                end;
                table.insert(v21, v3.List.join(v21[v22 - 1] or {}, {
                    if not l_GetFFlagLuaAppRefactorSelectRoute_0() then v3.Dictionary.join(v23.params or {}, {
                        name = v23.routeName, 
                        rnKey = v23.key
                    }) else l_getLegacyPageFromRoactNavigationRoute_0(v23)
                }));
            end;
            if #v21 == 0 then
                v5("RN computed history is empty for action: " .. v4.toString(v19));
                v21 = {
                    {
                        (v16())
                    }
                };
            end;
            local v24 = l_getCurrentRouteState_0({
                state = v19.navigationState
            }) or if v12() then v16() else {};
            if not l_GetFFlagLuaAppRefactorSelectRoute_0() then
                v24.name = v24.routeName;
                v24.rnKey = v24.key;
            end;
            return v3.Dictionary.join(v18, {
                currentRoute = v24, 
                history = v21, 
                lockNavigationActions = l_navigationState_0.isTransitioning or false, 
                roactNavigationState = table.clone(v19.navigationState)
            });
        else
            local l_v18_0 = v18;
            if v18.lockNavigationActions then
                l_v18_0 = v3.Dictionary.join(v18, {
                    lockNavigationActions = false
                });
            end;
            v5("Roact Navigation state is not complete in action: " .. v4.toString(v19));
            return l_v18_0;
        end;
    end, 
    [v6.name] = function(v26, v27)
        if v26.lockNavigationActions == v27.locked then
            return v26;
        else
            return (v3.Dictionary.join(v26, {
                lockNavigationActions = v27.locked or false
            }));
        end;
    end, 
    [v7.name] = function(v28, v29)
        return v3.Dictionary.join(v28, {
            backNavigationDisableCounter = not not v29.disabled and v28.backNavigationDisableCounter + 1 or math.max(v28.backNavigationDisableCounter - 1, 0)
        });
    end
});
