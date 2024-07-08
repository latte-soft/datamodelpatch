local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateIntoAvatarExperience);
local v5 = v2.Component:extend("RedirectToAvatarScreen");
v5.didMount = function(v6)
    local l_navigation_0 = v6.props.navigation;
    v6.props.navigateIntoAvatarExperience(l_navigation_0.state.routeName, l_navigation_0.state.params);
    l_navigation_0.pop();
end;
v5.render = function(_)
    return nil;
end;
return v3.connect(nil, function(v9)
    return {
        navigateIntoAvatarExperience = function(v10, v11)
            return v9(v4(v10, v11, true));
        end
    };
end)(v5);
