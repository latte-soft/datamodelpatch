local l_script_FirstAncestor_0 = script:FindFirstAncestor("NavigationRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Navigation);
local l_GetFFlagLuaAppRefactorSelectRoute_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppRefactorSelectRoute;
local l_getLegacyRouteFromRoactNavigationState_0 = require(l_script_FirstAncestor_0.Utils).getLegacyRouteFromRoactNavigationState;
local _ = require(l_script_FirstAncestor_0.types);
local function _(v6)
    return v6.Navigation;
end;
local function v9(v8)
    return v8.Navigation.roactNavigationState;
end;
local function v11(v10)
    return v10.Navigation.currentRoute;
end;
local function _(v12)
    return v12.Navigation.history;
end;
return {
    selectRoactNavigationState = v9, 
    selectCurrentRoactNavigationRoute = v11, 
    selectCurrentLegacyRoute = function(v14)
        if not l_GetFFlagLuaAppRefactorSelectRoute_0() then
            local l_history_0 = v14.Navigation.history;
            return l_history_0[#l_history_0];
        else
            return l_getLegacyRouteFromRoactNavigationState_0(v14.Navigation.roactNavigationState);
        end;
    end, 
    selectCurrentLegacyPage = function(v16)
        local v17;
        if not l_GetFFlagLuaAppRefactorSelectRoute_0() then
            local l_history_1 = v16.Navigation.history;
            v17 = l_history_1[#l_history_1];
        else
            v17 = l_getLegacyRouteFromRoactNavigationState_0(v16.Navigation.roactNavigationState);
        end;
        return v17[#v17];
    end
};
