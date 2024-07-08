local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.RedirectToAppRouterScreen);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.RedirectToAvatarScreen);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarPromptDescriptors);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.AvatarExperienceWrapperScreens);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.withAppRouterParams);
return function(v9)
    local v10 = {};
    if not v7[v9] then
        error("Initial route is not supported by AvatarExperienceWrapper: " .. tostring(v9));
    end;
    local v11 = v8(v7[v9]);
    local function _(v12, v13)
        if not v10[v12] then
            v10[v12] = v13;
        end;
    end;
    local function _(v15)
        v10[v15] = nil;
    end;
    for _, v18 in v5, nil, nil do
        local v19 = not not (v7[v18] ~= nil) and v3 or v4;
        if not v10[v18] then
            v10[v18] = v19;
        end;
    end;
    for _, v21 in v6, nil, nil do
        for v22, _ in v21, nil, nil do
            v10[v22] = nil;
        end;
    end;
    v10[v5.AvatarExperienceMainStackNavigator] = nil;
    v10[v9] = nil;
    return (v2.List.join({
        {
            [v9] = v11
        }
    }, v2.List.map(v2.Dictionary.keys(v10), function(v24)
        return {
            [v24] = v10[v24]
        };
    end)));
end;
