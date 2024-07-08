local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v2 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreenProperties);
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarRoute);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.RouteInfo);
local v5 = require(l_Modules_0.AvatarExperience.Common.Debug.LogTree).logger("ax.rn.route");
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local function v8(v7)
    return v4.new(v7.routeName, v7.key, v7.params);
end;
local function v9(v10, v11, v12)
    if v10.routeName == v11 then
        return v10, v12;
    else
        local v13 = v10.routes or {};
        local v14 = v10.index or 0;
        for v15, v16 in v13, nil, nil do
            local v17, v18 = v9(v16, v11, v15 == v14);
            if v17 then
                return v17, v12 and v18;
            end;
        end;
        return nil, false;
    end;
end;
local function v23(v19, v20)
    local v21, v22 = v9(v19.state or {}, v20, true);
    if v21 == nil then
        if not _G.__TESTEZ_RUNNING_TEST__ then
            warn(v20 .. " not found in current navigation state");
        end;
        v21 = {};
    end;
    return v21, v22;
end;
return function(v24, v25)
    local v26 = nil;
    local v27 = nil;
    local v28 = {};
    local v29, v30 = v23(v24, v1.AvatarExperienceMainStackNavigator);
    local l_routes_0 = v29.routes;
    if not (not l_routes_0 or not v29.index) then
        local v32 = v6.getActiveScreenNavigationState(l_routes_0[v29.index]);
        v26 = v4.new(v32.routeName, v32.key, v32.params);
        for v33 = v29.index, 1, -1 do
            local v34 = v6.getActiveScreenNavigationState(l_routes_0[v33]);
            if #v28 < v3.maxPreviousCount and v33 < v29.index then
                table.insert(v28, v8(v34));
            end;
            if not v2[v34.routeName].isTransparent then
                v27 = v4.new(v34.routeName, v34.key, v34.params);
                break;
            end;
        end;
    end;
    local v35 = v3.new({
        isVisible = v25, 
        isOverlayVisible = not v30, 
        current = v26, 
        previousPages = v28, 
        opaque = v27
    });
    v5:debug("makeAvatarRoute: {}", v35);
    return v35;
end;
