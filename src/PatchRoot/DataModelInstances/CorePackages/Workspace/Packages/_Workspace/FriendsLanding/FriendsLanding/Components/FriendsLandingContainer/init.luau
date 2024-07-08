local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_llama_0 = v1.llama;
local l_Roact_0 = v1.Roact;
local l_RoactAppExperiment_0 = v1.RoactAppExperiment;
local l_RoactRodux_0 = v1.RoactRodux;
local l_withLocalization_0 = v1.withLocalization;
local l_UniversalAppPolicy_0 = v1.UniversalAppPolicy;
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_compose_0 = l_SocialLibraries_0.RoduxTools.compose;
local l_memoize_0 = v1.memoize;
local v12 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics);
local v13 = require(script.mapStateToProps);
local v14 = require(script.mapDispatchToProps);
local v15 = require(l_script_FirstAncestor_0.Components.ShowMoreWrapper);
local v16 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v17 = require(l_script_FirstAncestor_0.Friends.filterFriends);
local l_User_0 = l_SocialLibraries_0.User;
local l_Logger_0 = v1.Logger;
local l_getFStringSocialFriendsLandingLayer_0 = v1.getFStringSocialFriendsLandingLayer;
local v21 = require(l_script_FirstAncestor_0.Flags.getFFlagFriendsLandingNewEmptyPage);
local l_getFFlagNoFriendsUIEnabled_DEV_0 = require(l_Parent_0.SharedFlags).getFFlagNoFriendsUIEnabled_DEV;
local v23 = l_Roact_0.PureComponent:extend("FriendsLandingContainer");
v23.defaultProps = {
    visibleRows = 6, 
    tilesPerRow = 2, 
    Logger = l_Logger_0, 
    contentComponent = v15
};
v23.init = function(v24)
    v24.localization = {
        pageError = "CommonUI.Messages.Response.PageError"
    };
    v24.filterFriends = l_memoize_0(v17);
    v24.sortFriends = l_memoize_0(function(v25)
        return l_llama_0.List.sort(v25, l_User_0.sortFriendsByCorrectedPresenceAndRank);
    end);
end;
v23.render = function(v26)
    return l_withLocalization_0(v26.localization)(function(v27)
        return l_Roact_0.createElement(v26.props.contentComponent, l_llama_0.Dictionary.join(v26.props, {
            totalFriendCount = #v26.props.friends, 
            friends = v26.sortFriends(v26.filterFriends(v26.props.friends, v26.props.filter)), 
            friendPruningEnabled = v26.props.friendPruningEnabled, 
            localizedStrings = v27, 
            totalInactiveFriends = #v26.filterFriends(v26.props.friends, "Inactive")
        }));
    end);
end;
return l_compose_0(l_RoactRodux_0.connect(v13, v14), l_UniversalAppPolicy_0.connect(function(v28)
    return {
        enableDisplayNamePolicy = v28.getShowDisplayName()
    };
end), v16.connect(function(v29)
    return {
        navigateToLuaAppPages = v29.navigateToLuaAppPages, 
        wideMode = v29.wideMode, 
        filter = v29.filter, 
        isLuobu = v29.isLuobu, 
        setFilterKeys = v29.setFilterKeys, 
        refreshPage = v29.refreshPage, 
        openPlayerContextualMenu = v29.openPlayerContextualMenu
    };
end), v12.connect(function(v30)
    return {
        analytics = v30
    };
end))((l_RoactAppExperiment_0.connectUserLayer({
    l_getFStringSocialFriendsLandingLayer_0()
}, function(v31, _)
    local v33 = v31[l_getFStringSocialFriendsLandingLayer_0()] or {};
    return {
        friendPruningEnabled = v33.show_friend_pruning, 
        newFriendsSort = v33.new_friends_sort, 
        newEmptyPageEnabled = if not v21() then nil else v33.new_empty_page or l_getFFlagNoFriendsUIEnabled_DEV_0()
    };
end)(v23)));
