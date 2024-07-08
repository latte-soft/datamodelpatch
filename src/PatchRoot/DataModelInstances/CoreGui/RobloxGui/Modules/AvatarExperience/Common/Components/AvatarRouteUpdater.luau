local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAvatarSceneRoute);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarRoute);
local v7 = v2.PureComponent:extend("AvatarRouteUpdater");
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
v7.validateProps = v4.strictInterface({
    avatarRoute = v6.Interface, 
    setAvatarSceneRoute = v4.callback
});
v7.render = function(_)
    return nil;
end;
v7.didMount = function(v10)
    v10.props.setAvatarSceneRoute(v10.props.avatarRoute);
end;
v7.didUpdate = function(v11, v12)
    local l_avatarRoute_0 = v11.props.avatarRoute;
    if l_avatarRoute_0 ~= v12.avatarRoute then
        v11.props.setAvatarSceneRoute(l_avatarRoute_0);
    end;
end;
return (v3.connect(nil, function(v14)
    return {
        setAvatarSceneRoute = function(v15)
            v14(v5(v15));
        end
    };
end)(v7));
