local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Types);
local function _(v1, v2)
    return v1.state.key == v2.key;
end;
local _ = function(v4, v5)
    for _, v7 in v5, nil, nil do
        if v4.state.key == v7.key then
            return true;
        end;
    end;
    return false;
end;
return function(v9)
    local l_avatarRoute_0 = v9.avatarRoute;
    local l_navigation_0 = v9.navigation;
    local v12 = l_navigation_0.state.key == l_avatarRoute_0.current.key;
    local v13;
    for _, v15 in l_avatarRoute_0.previousPages, nil, nil do
        if l_navigation_0.state.key == v15.key then
            v13 = true;
            goto label0 --[[  true, false  ]];
        end;
    end;
    v13 = false;
    ::label0::;
    return (v12 or v13) or l_navigation_0.state.key == l_avatarRoute_0.opaque.key;
end;
