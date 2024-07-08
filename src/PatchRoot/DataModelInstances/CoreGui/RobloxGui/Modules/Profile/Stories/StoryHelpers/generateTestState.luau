local l_script_FirstAncestor_0 = script:FindFirstAncestor("Profile");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
local l_RetrievalStatus_0 = v1.UIBlox.App.Loading.Enum.RetrievalStatus;
local l_Dash_0 = v1.Dash;
local v5 = require(l_script_FirstAncestor_0.Stories.StoryHelpers.MockAssetsById);
local v6 = require(l_script_FirstAncestor_0.Stories.StoryHelpers.CurrentlyWearingByUserId);
local l_CreatorType_0 = v1.RoduxGames.Enums.CreatorType;
local v8 = require(l_script_FirstAncestor_0.Common.ProfileScreens);
return function(v9)
    return l_Dash_0.join({
        TopBar = {
            statusBarHeight = 8
        }, 
        FormFactor = "COMPACT", 
        ScreenSize = Vector2.new(800, 480), 
        GlobalGuiInset = {
            left = 0, 
            top = 0, 
            right = 0, 
            bottom = 0
        }, 
        LocalUserId = "456", 
        Navigation = {
            history = {
                {
                    name = "ProfilePeekView"
                }
            }
        }, 
        InvisibleMode = {
            NetworkStatus = {
                byUserId = {}
            }
        }, 
        Profile = {
            Games = {
                byGameId = {
                    universeId = {
                        experienceId = "universeId", 
                        name = "Experience name", 
                        description = "description", 
                        price = 100, 
                        rootPlaceId = "rootPlaceId", 
                        creator = l_CreatorType_0.Group
                    }
                }, 
                productInfoByGameId = {
                    universeId = {
                        productId = "productId", 
                        sellerId = "sellerId", 
                        price = 25, 
                        isForSale = true
                    }
                }
            }, 
            NetworkStatus = {}, 
            Assets = v5, 
            CurrentlyWearing = v6, 
            FriendshipStatus = {
                NotFriend = Enum.FriendStatus.NotFriend, 
                UserIsFollowing = Enum.FriendStatus.NotFriend, 
                RequestSent = Enum.FriendStatus.FriendRequestSent, 
                RequestRecieved = Enum.FriendStatus.FriendRequestReceived, 
                StandardFriend = Enum.FriendStatus.Friend, 
                InExperienceFriend = Enum.FriendStatus.Friend, 
                FollowingUser = Enum.FriendStatus.Friend
            }, 
            PremiumMembershipStatus = {}, 
            ProfilePeekView = {}, 
            Users = {
                byUserId = {
                    InExperienceFriend = {
                        id = "InExperienceFriend", 
                        username = "InExperienceFriendUserName", 
                        displayName = "InExperienceFriendDisplayName"
                    }, 
                    ["123"] = {
                        id = "123", 
                        username = "123Username", 
                        displayName = "123DisplayName"
                    }, 
                    loadingUser = {
                        id = "loadingUser", 
                        username = "loadingUserUserName", 
                        displayName = "loadingUserDisplayName"
                    }, 
                    failedUser = {
                        id = "failedUser", 
                        username = "failedUserUserName", 
                        displayName = "failedUserDisplayName"
                    }
                }
            }, 
            IsUserFollowing = {
                NotFriend = false, 
                InExperienceFriend = true, 
                FollowingUser = true
            }, 
            IsBlockedByMe = {
                BlockedUser = true
            }, 
            ProfilePageDataStatus = {
                ["123"] = l_RetrievalStatus_0.Done.rawValue(), 
                deletedUser = l_RetrievalStatus_0.Done.rawValue(), 
                loadingUser = l_RetrievalStatus_0.Fetching.rawValue(), 
                failedUser = l_RetrievalStatus_0.Failed.rawValue()
            }, 
            NextDataExpirationTime = {
                [v8.ProfilePeekView .. "123"] = 0
            }, 
            AdditionalUserFields = {
                deletedUser = {
                    isDeleted = true
                }, 
                noDescription = {
                    description = nil
                }, 
                ["123"] = {
                    description = "hello there"
                }
            }, 
            Presence = {
                byUserId = {
                    InExperienceFriend = {
                        lastLocation = "A fun place", 
                        userPresenceType = l_PresenceType_0.InGame, 
                        universeId = 123
                    }
                }
            }, 
            FriendsCount = {}, 
            FollowersCount = {}, 
            FollowingsCount = {}
        }
    }, v9 or {});
end;
