local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_withLocalization_0 = v1.withLocalization;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_t_0 = v1.t;
local v7 = require(l_Parent_0.Components.ProfileSocialCircleItem);
local v8 = require(l_Parent_0.Common.ProfileScreens);
local v9 = require(l_Parent_0.Common.ContextPropsTypes);
local v10 = require(l_Parent_0.Common.TextKeys);
local v11 = require(l_Parent_0.Analytics.ButtonClickEvents);
local l_IsVRAppBuild_0 = v1.IsVRAppBuild;
local v13 = l_Roact_0.PureComponent:extend("ProfileSocialCircle");
v13.validateProps = l_t_0.strictInterface({
    profileUserId = l_t_0.string, 
    localUserId = l_t_0.string, 
    friendsCount = l_t_0.number, 
    followersCount = l_t_0.number, 
    followingsCount = l_t_0.number, 
    layoutOrder = l_t_0.optional(l_t_0.number), 
    analytics = l_t_0.table, 
    navigateToLuaAppPages = v9.validateNavigateToLuaAppPages
});
v13.init = function(v14)
    local l_props_0 = v14.props;
    v14.openViewUserFriends = function()
        l_props_0.analytics:buttonClick(v11.Friends);
        l_props_0.navigateToLuaAppPages[v8.ViewUserFriends](l_props_0.profileUserId, {
            localUserId = l_props_0.localUserId, 
            startTime = os.clock()
        });
    end;
    v14.openViewUserFollowing = function()
        l_props_0.analytics:buttonClick(v11.Following);
        l_props_0.navigateToLuaAppPages[v8.ViewUserFollowing](l_props_0.profileUserId);
    end;
    v14.openViewUserFollowers = function()
        l_props_0.analytics:buttonClick(v11.Followers);
        l_props_0.navigateToLuaAppPages[v8.ViewUserFollowers](l_props_0.profileUserId);
    end;
end;
v13.render = function(v16)
    local l_props_1 = v16.props;
    return l_withStyle_0(function(_)
        return l_withLocalization_0({
            friendText = v10.Friend, 
            friendsText = v10.Friends, 
            followingsText = v10.Following, 
            followerText = v10.Follower, 
            followersText = v10.Followers
        })(function(v19)
            return l_Roact_0.createElement("Frame", {
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = l_props_1.layoutOrder
            }, {
                ListLayout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                FriendCountItem = l_Roact_0.createElement(v7, {
                    count = l_props_1.friendsCount, 
                    text = l_props_1.friendsCount == 1 and v19.friendText or v19.friendsText, 
                    layoutOrder = 1, 
                    onActivated = if not l_IsVRAppBuild_0() then v16.openViewUserFriends else nil
                }), 
                FollowersCountItem = l_Roact_0.createElement(v7, {
                    count = l_props_1.followersCount, 
                    text = l_props_1.followersCount == 1 and v19.followerText or v19.followersText, 
                    layoutOrder = 2, 
                    onActivated = if not l_IsVRAppBuild_0() then v16.openViewUserFollowers else nil
                }), 
                FollowingCountItem = l_Roact_0.createElement(v7, {
                    count = l_props_1.followingsCount, 
                    text = v19.followingsText, 
                    layoutOrder = 3, 
                    onActivated = if not l_IsVRAppBuild_0() then v16.openViewUserFollowing else nil
                })
            });
        end);
    end);
end;
return v13;
