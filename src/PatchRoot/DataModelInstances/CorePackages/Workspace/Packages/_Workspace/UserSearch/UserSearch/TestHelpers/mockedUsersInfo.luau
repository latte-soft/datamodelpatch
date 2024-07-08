local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.TestHelpers.ProfileInsightsMocks);
local l_ContextualInfoTypes_0 = require(l_Parent_0.SocialCommon).Enums.ContextualInfoTypes;
local v4 = {
    yourself = "1111", 
    following = "2222", 
    friend = "3333", 
    incomingFriendship = "4444", 
    outgoingFriendship = "5555", 
    previousUserName = "6666", 
    random = "7777", 
    notFriend = "8888", 
    mutualFriends = "9999", 
    frequents = "101010"
};
return {
    ids = v4, 
    state = {
        LocalUserId = v4.yourself, 
        FriendStatuses = {
            [v4.friend] = Enum.FriendStatus.Friend, 
            [v4.incomingFriendship] = Enum.FriendStatus.FriendRequestReceived, 
            [v4.outgoingFriendship] = Enum.FriendStatus.FriendRequestSent, 
            [v4.notFriend] = Enum.FriendStatus.NotFriend, 
            [v4.mutualFriends] = Enum.FriendStatus.NotFriend, 
            [v4.frequents] = Enum.FriendStatus.NotFriend
        }, 
        FriendFollowings = {
            [v4.following] = true
        }
    }, 
    users = {
        yourself = {
            id = v4.yourself
        }, 
        following = {
            id = v4.following
        }, 
        friend = {
            id = v4.friend
        }, 
        incomingFriendship = {
            id = v4.incomingFriendship
        }, 
        outgoingFriendship = {
            id = v4.outgoingFriendship
        }, 
        previousUserName = {
            id = v4.previousUserName, 
            previousUsernames = {
                "random1", 
                "random1", 
                "searchKeyword"
            }
        }, 
        random = {
            id = v4.random
        }, 
        notFriend = {
            id = v4.notFriend
        }, 
        mutualFriends = {
            id = v4.mutualFriends, 
            profileInsight = v2.mockProfileInsightWithMutualFriends(v4.mutualFriends)
        }, 
        frequents = {
            id = v4.frequents, 
            profileInsight = v2.mockProfileInsight(v4.frequents)
        }
    }, 
    contextualInfoType = {
        yourself = l_ContextualInfoTypes_0.IsMyself, 
        following = l_ContextualInfoTypes_0.Following, 
        friend = l_ContextualInfoTypes_0.Friend, 
        incomingFriendship = nil, 
        outgoingFriendship = nil, 
        previousUserName = l_ContextualInfoTypes_0.PreviousUsername, 
        random = nil, 
        notFriend = nil, 
        mutualFriends = l_ContextualInfoTypes_0.MutualFriends, 
        frequents = l_ContextualInfoTypes_0.Frequents
    }
};
