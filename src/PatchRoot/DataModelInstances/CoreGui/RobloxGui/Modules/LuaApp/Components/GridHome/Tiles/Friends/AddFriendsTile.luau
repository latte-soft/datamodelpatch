local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_Images_0 = require(l_CorePackages_0.UIBlox).App.ImageSet.Images;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_FriendsLandingAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.FriendsLanding).FriendsLandingAnalytics;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v8 = require(l_Modules_0.LuaApp.AppPage);
local v9 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v10 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v11 = require(l_Modules_0.LuaApp.Components.GridHome.Tiles.Friends.BaseUserTile);
local l_FFlagFriendGridRowCreateCarouselList_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagFriendGridRowCreateCarouselList;
local v13 = l_Images_0["icons/menu/friends_large"];
local v14 = v2.PureComponent:extend("AddFriendsTile");
v14.init = function(v15)
    local v16 = l_FriendsLandingAnalytics_0.Class.new(v15.props.analytics, "");
    v15.onActivated = function()
        v16:reportAddFriendsEntrypoint(v8.Home);
        v15.props.navigateDown({
            name = v8.AddFriendsPage, 
            extraProps = {
                titleKey = "CommonUI.Features.Label.Friends"
            }
        });
    end;
end;
v14.render = function(v17)
    return l_withLocalization_0({
        addFriends = "Feature.Friends.Feature.Friends.Heading.AddFriends"
    })(function(v18)
        return v2.createElement(v11, {
            icon = if not l_FFlagFriendGridRowCreateCarouselList_0 then v13 else v17.props.icon or v13, 
            text = v18.addFriends, 
            onActivated = v17.onActivated, 
            noBorder = if not l_FFlagFriendGridRowCreateCarouselList_0 then nil else v17.props.noBorder, 
            backgroundColor = if not l_FFlagFriendGridRowCreateCarouselList_0 then nil else v17.props.backgroundColor, 
            iconColor = if not l_FFlagFriendGridRowCreateCarouselList_0 then nil else v17.props.iconColor
        });
    end);
end;
return (l_RoactServices_0.connect({
    analytics = v9
})((v3.connect(nil, function(v19)
    return {
        navigateDown = function(v20)
            v19(v10(v20));
        end
    };
end)(v14))));
