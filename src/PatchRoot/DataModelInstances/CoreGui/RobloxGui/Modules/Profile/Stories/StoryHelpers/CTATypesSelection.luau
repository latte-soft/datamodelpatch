local l_Dash_0 = require(script:FindFirstAncestor("Profile").dependencies).Dash;
local v1 = {
    JoinExperience = {
        isLocalUser = false, 
        friendshipStatus = Enum.FriendStatus.Friend, 
        isUserInGame = true, 
        isDeleted = false, 
        isUserBlockedByMe = false
    }, 
    Chat = {
        isLocalUser = false, 
        friendshipStatus = Enum.FriendStatus.Friend, 
        isUserInGame = false, 
        isDeleted = false, 
        isUserBlockedByMe = false
    }, 
    EditProfile = {
        isLocalUser = true, 
        friendshipStatus = Enum.FriendStatus.Unknown, 
        isDeleted = false, 
        isUserBlockedByMe = false, 
        isUserInGame = false
    }, 
    Unfriend = {
        isLocalUser = false, 
        friendshipStatus = Enum.FriendStatus.Friend, 
        isDeleted = true, 
        isUserBlockedByMe = false, 
        isUserInGame = false
    }, 
    Unblock = {
        isLocalUser = false, 
        isUserBlockedByMe = true, 
        friendshipStatus = Enum.FriendStatus.Unknown, 
        isDeleted = false, 
        isUserInGame = false
    }, 
    AddFriend = {
        isLocalUser = false, 
        friendshipStatus = Enum.FriendStatus.Unknown, 
        isDeleted = false, 
        isUserBlockedByMe = false, 
        isUserInGame = false
    }, 
    AcceptFriendRequest = {
        isLocalUser = false, 
        friendshipStatus = Enum.FriendStatus.FriendRequestReceived, 
        isDeleted = false, 
        isUserBlockedByMe = false, 
        isUserInGame = false
    }, 
    AcceptOffNetworkFriendRequest = {
        isLocalUser = false, 
        friendshipStatus = Enum.FriendStatus.Unknown, 
        isDeleted = false, 
        isUserBlockedByMe = false, 
        isUserInGame = false
    }, 
    PendingFriendRequest = {
        isLocalUser = false, 
        friendshipStatus = Enum.FriendStatus.FriendRequestSent, 
        isDeleted = false, 
        isUserBlockedByMe = false, 
        isUserInGame = false
    }, 
    CannotAddFriend = {
        isLocalUser = false, 
        friendshipStatus = Enum.FriendStatus.Unknown, 
        isDeleted = false, 
        isUserBlockedByMe = false, 
        canRequestFriendshipWith = false, 
        isUserInGame = false
    }
};
return {
    controls = {
        CTAtype = l_Dash_0.keys(v1)
    }, 
    getUserCTA = function(v2)
        return v1[v2.controls.CTAtype];
    end
};
