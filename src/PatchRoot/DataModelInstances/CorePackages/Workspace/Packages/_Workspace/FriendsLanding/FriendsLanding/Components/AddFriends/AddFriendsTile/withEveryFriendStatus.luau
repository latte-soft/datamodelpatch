local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.AddFriends.dependencies);
local l_RecommendationContextType_0 = v2.RoduxFriends.Enums.RecommendationContextType;
local l_Rodux_0 = v2.Rodux;
local l_llama_0 = v2.llama;
local l_User_0 = v2.RoduxUsers.Models.User;
local l_PresenceType_0 = v2.RoduxPresence.Enums.PresenceType;
local l_FriendshipOriginSourceType_0 = v2.NetworkingFriendsEnums.FriendshipOriginSourceType;
local l_FFlagContactRecs_0 = require(l_Parent_0.SharedFlags).FFlagContactRecs;
local v10 = {
    ["36"] = Enum.FriendStatus.NotFriend, 
    ["39"] = Enum.FriendStatus.Friend, 
    ["37"] = Enum.FriendStatus.FriendRequestSent, 
    ["38"] = Enum.FriendStatus.FriendRequestReceived
};
local v11 = l_Rodux_0.Store.new(function()
    return {
        LocalUserId = "0", 
        FriendStatuses = v10, 
        ScreenSize = Vector2.new(500, 500)
    };
end, {}, {
    l_Rodux_0.thunkMiddleware
});
local function v14(v12, v13)
    return l_llama_0.Dictionary.join(l_User_0.mock({
        id = l_llama_0.Dictionary.flip(v10)[v12]
    }), v13);
end;
local v15 = {
    tileProps = {
        sentFromExperienceName = "TestSentFrom", 
        amIFollowingUser = true, 
        isUserFollowingMe = true
    }, 
    userProps = {
        mutualFriends = {
            {}, 
            {}, 
            {}
        }, 
        userPresenceType = l_PresenceType_0.InGame, 
        lastLocation = "TestLastLocation"
    }
};
return {
    localUserId = "0", 
    friendWithContextInfo = {
        FriendWithFullContextInfo = l_llama_0.Dictionary.joinDeep(v15, {
            userProps = {
                username = "FriendRequestReceived", 
                displayName = "WithFullContextInfo"
            }
        }), 
        FriendWithMutualFriends = {
            tileProps = {}, 
            userProps = {
                username = "FriendRequestReceived", 
                displayName = "WithMutualFriends", 
                mutualFriends = v15.userProps.mutualFriends
            }
        }, 
        Contact = {
            tileProps = {}, 
            userProps = {
                entityDisplayName = "entityDisplayName", 
                thumbnailEntities = {
                    avatarImageUrl = "avatarImageUrl"
                }, 
                contextType = if not l_FFlagContactRecs_0 then nil else l_RecommendationContextType_0.Contacts
            }
        }, 
        FriendWithSentFrom = {
            tileProps = {
                sentFromExperienceName = v15.tileProps.sentFromExperienceName
            }, 
            userProps = {
                username = "FriendRequestReceived", 
                displayName = "WithSentContext"
            }
        }, 
        FriendYouAreFollowing = {
            tileProps = {
                amIFollowingUser = v15.tileProps.amIFollowingUser
            }, 
            userProps = {
                username = "FriendRequestReceived", 
                displayName = "WithYourAllFollowing"
            }
        }, 
        FriendFollowingMe = {
            tileProps = {
                isUserFollowingMe = v15.tileProps.isUserFollowingMe
            }, 
            userProps = {
                username = "FriendRequestReceived", 
                displayName = "WithFollowingMe", 
                followers = {}
            }
        }, 
        FriendViaQRCode = {
            tileProps = {
                originSourceType = l_FriendshipOriginSourceType_0.QrCode.rawValue()
            }, 
            userProps = {
                username = "FriendRequestReceived", 
                displayName = "WithQRCode"
            }
        }, 
        FriendNoFriend = {
            tileProps = {}, 
            userProps = {
                username = "NotFriend", 
                displayName = "Friend to add"
            }
        }, 
        FriendPending = {
            tileProps = {}, 
            userProps = {
                username = "FriendRequestSent", 
                displayName = "Friend pending"
            }
        }
    }, 
    fullContextInfo = v15, 
    userForStatus = v14, 
    baseStore = v11
};
