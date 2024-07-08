local l_script_FirstAncestor_0 = script:FindFirstAncestor("NavigationRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local l_getActiveRoutes_0 = require(l_Parent_0.Navigation).getActiveRoutes;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local _ = require(l_script_FirstAncestor_0.types);
local v6 = require(l_script_FirstAncestor_0.Constants);
local function v9(v7)
    local v8 = false;
    if v7.routeName ~= v6.TempRnSwitchNavigatorName then
        v8 = v7.key ~= "StackRouterRoot";
    end;
    return v8;
end;
local function v11(v10)
    return v2.Dictionary.join(v10.params or {}, {
        name = v10.routeName, 
        rnKey = v10.key
    });
end;
local function v13(v12)
    return v2.List.map(v2.List.filter(l_getActiveRoutes_0(v12), v9), v11);
end;
local function v14(v15)
    if v15.routeName == v6.TempRnSwitchNavigatorName then
        return v15;
    else
        local v16 = v15.routes[v15.index];
        if not v16.routes then
            return nil;
        else
            return v14(v16);
        end;
    end;
end;
return {
    getLegacyPageFromRoactNavigationRoute = v11, 
    getLegacyRouteFromRoactNavigationState = v13, 
    getCurrentTabName = function(v17)
        local v18;
        if v17.routeName == v6.TempRnSwitchNavigatorName then
            v18 = v17;
        else
            local v19 = v17.routes[v17.index];
            v18 = if not v19.routes then nil else v14(v19);
        end;
        if v18 ~= nil then
            return v18.routes[v18.index].routeName;
        else
            return l_AppPage_0.None;
        end;
    end
};
