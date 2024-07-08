local l_Parent_0 = script:FindFirstAncestor("GameInvite").Parent;
local l_Parent_1 = script.Parent;
local l_UserReducer_0 = require(l_Parent_0.UserLib).Reducers.UserReducer;
local v3 = require(l_Parent_0.Rodux);
local v4 = require(l_Parent_0.LegacyFriendsRodux);
local l_ReducerDependencies_0 = require(l_Parent_0.NotificationsCommon).ReducerDependencies;
local l_Friends_0 = v4.Reducers.Friends;
local l_FriendCount_0 = v4.Reducers.FriendCount;
local v8 = require(l_Parent_1.Invites);
local l_RoduxShareLinks_0 = l_ReducerDependencies_0.RoduxShareLinks;
local v10 = l_ReducerDependencies_0.RoduxNetworking.installReducer();
local v11 = l_RoduxShareLinks_0.installReducer();
local l_GetFFlagEnableUniversalAppGameInviteUnification_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableUniversalAppGameInviteUnification;
return v3.combineReducers({
    Friends = if not l_GetFFlagEnableUniversalAppGameInviteUnification_0() then l_Friends_0 else nil, 
    FriendCount = l_FriendCount_0, 
    GameInvitesStatus = if not l_GetFFlagEnableUniversalAppGameInviteUnification_0() then nil else v8, 
    Invites = if not l_GetFFlagEnableUniversalAppGameInviteUnification_0() then v8 else nil, 
    Users = l_UserReducer_0, 
    ShareLinks = v11, 
    NetworkStatus = v10
});
