local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_Modules_0.LuaApp.AppPage);
local v4 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceActions);
local v6 = {
    [v3.ProfilePeekView] = true, 
    [v3.AvatarExperienceWrapper] = true, 
    [v3.AvatarExperienceWrapperTransparent] = true
};
local function v12(v7)
    local v8 = {};
    for v9 = 1, #v7 do
        local v10 = {};
        for v11 = 1, v9 do
            table.insert(v10, v7[v11]);
        end;
        table.insert(v8, v10);
    end;
    return v8;
end;
local function _(v13)
    local l_name_0 = v13.name;
    if not (l_name_0 ~= v3.AvatarExperienceWrapper) or l_name_0 == v3.AvatarExperienceWrapperTransparent then
        l_name_0 = not not v13.extraProps and v13.extraProps.routeName or nil;
    end;
    return l_name_0;
end;
local function v26(v16, v17)
    local v18 = v2.List.toSet(v17);
    local l_history_0 = v16:getState().Navigation.history;
    local v20 = l_history_0[#l_history_0];
    local v21 = {};
    local v22 = false;
    for v23 = 1, #v20 do
        local v24 = v20[v23];
        local l_name_1 = v24.name;
        if not (l_name_1 ~= v3.AvatarExperienceWrapper) or l_name_1 == v3.AvatarExperienceWrapperTransparent then
            l_name_1 = not not v24.extraProps and v24.extraProps.routeName or nil;
        end;
        if not v18[l_name_1] then
            table.insert(v21, v20[v23]);
        else
            v22 = true;
        end;
    end;
    if v22 then
        v16:dispatch(v4(nil, (v12(v21))));
        return ;
    else
        return ;
    end;
end;
local function _(v27)
    local l_history_1 = v27:getState().Navigation.history;
    local v29 = l_history_1[#l_history_1];
    return v29[#v29].name;
end;
return function(v31, v32)
    return function(v33)
        local l_history_2 = v33:getState().Navigation.history;
        local v35 = l_history_2[#l_history_2];
        if not v6[v35[#v35].name] then
            v31.dispatch(v5.clearScreens(v32));
            return ;
        else
            v26(v33, v32);
            return ;
        end;
    end;
end;
