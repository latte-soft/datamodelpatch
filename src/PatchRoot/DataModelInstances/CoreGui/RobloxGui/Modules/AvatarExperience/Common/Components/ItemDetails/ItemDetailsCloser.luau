local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v7 = v2.PureComponent:extend("ItemDetailsCloser");
v7.validateProps = v4.strictInterface({
    navigation = v4.table, 
    isAvatarExperienceRoute = v4.boolean
});
v7.render = function(_)
    return nil;
end;
v7.didUpdate = function(v9, v10)
    local l_isAvatarExperienceRoute_0 = v9.props.isAvatarExperienceRoute;
    if not (not v10.isAvatarExperienceRoute or l_isAvatarExperienceRoute_0) then
        v6.closeFiltersAndItemDetails(v9.props.navigation);
    end;
end;
return (v3.connect(function(v12, _)
    return {
        isAvatarExperienceRoute = v5.isAvatarExperienceRoute(v12)
    };
end, nil)(v7));
