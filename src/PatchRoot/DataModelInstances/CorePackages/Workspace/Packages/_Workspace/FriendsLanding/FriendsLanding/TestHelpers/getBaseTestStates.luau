local v0 = require(script:FindFirstAncestor("FriendsLanding").dependencies);
local l_llama_0 = v0.llama;
local l_Presence_0 = v0.RoduxPresence.Models.Presence;
local l_User_0 = v0.RoduxUsers.Models.User;
local l_RecommendationContextType_0 = v0.RoduxFriends.Enums.RecommendationContextType;
local v5 = {};
for v6 = 1, 40 do
    local v7 = l_User_0.mock({
        id = tostring(v6), 
        displayName = "displayName" .. tostring(v6), 
        username = "username" .. tostring(v6), 
        hasVerifiedBadge = false
    });
    v5[v7.id] = v7;
end;
local v8 = l_llama_0.Dictionary.keys(v5);
v5["40"].displayName = "offlineFriend1";
v5["39"].displayName = "offlineFriend2";
v5["38"].displayName = "onlineFriend";
v5["37"].displayName = "inGameFriend";
v5["36"].displayName = "inStudioFriend";
local v9 = {
    v5["40"].id, 
    v5["39"].id, 
    v5["38"].id, 
    v5["37"].id, 
    v5["36"].id
};
local v12 = l_llama_0.List.reduce(v5, function(v10, v11)
    return l_llama_0.Dictionary.join(v10, {
        [v11.id] = l_Presence_0.format(l_Presence_0.mock({
            userPresenceType = 0
        }))
    });
end);
local v13 = {
    recom1 = {
        id = "recom1", 
        mutualFriendsList = {}, 
        rank = 3, 
        contextType = l_RecommendationContextType_0.MutualFriends
    }, 
    recom2 = {
        id = "recom2", 
        mutualFriendsList = {}, 
        rank = 1, 
        contextType = l_RecommendationContextType_0.MutualFriends
    }, 
    recom3 = {
        id = "recom3", 
        mutualFriendsList = {}, 
        rank = 5, 
        contextType = l_RecommendationContextType_0.MutualFriends
    }, 
    recom4 = {
        id = "recom4", 
        mutualFriendsList = {}, 
        rank = 4, 
        contextType = l_RecommendationContextType_0.MutualFriends
    }
};
local v16 = l_llama_0.List.reduce(l_llama_0.Dictionary.keys(v13), function(v14, v15)
    v14[v15] = {
        id = tostring(v15), 
        displayName = "displayName" .. tostring(v15), 
        username = "username" .. tostring(v15), 
        rank = v13[v15].rank, 
        contextType = v13[v15].contextType
    };
    return v14;
end, {});
v12 = {
    ["40"] = l_Presence_0.format(l_Presence_0.mock({
        userPresenceType = 0
    })), 
    ["39"] = l_Presence_0.format(l_Presence_0.mock({
        userPresenceType = 0
    })), 
    ["38"] = l_Presence_0.format(l_Presence_0.mock({
        userPresenceType = 1
    })), 
    ["37"] = l_Presence_0.format(l_Presence_0.mock({
        userPresenceType = 2
    })), 
    ["36"] = l_Presence_0.format(l_Presence_0.mock({
        userPresenceType = 3
    }))
};
return function(v17)
    local v18 = not not v17 and v17.roduxKey or "FriendsLanding";
    return {
        noFriends = {
            LocalUserId = "test", 
            GlobalGuiInset = {
                top = 20, 
                bottom = 20, 
                left = 20, 
                right = 20
            }, 
            [v18] = {
                Friends = {
                    byUserId = {}, 
                    countsByUserId = {}
                }, 
                Users = {}, 
                Presence = {}, 
                NetworkStatus = {
                    ["https://friends.roblox.com/v1/users/test/friends"] = "Done"
                }
            }, 
            ScreenSize = Vector2.new(1000, 100)
        }, 
        smallNumbersOfFriends = {
            LocalUserId = "test", 
            GlobalGuiInset = {
                top = 20, 
                bottom = 20, 
                left = 20, 
                right = 20
            }, 
            [v18] = {
                Friends = {
                    byUserId = {
                        test = v9
                    }, 
                    countsByUserId = {
                        test = #v9
                    }, 
                    friendsRankByUserId = {
                        test = {
                            ["36"] = 10, 
                            ["37"] = 1, 
                            ["38"] = 3, 
                            ["39"] = 2, 
                            ["40"] = 5
                        }
                    }, 
                    recommendations = {}
                }, 
                Users = {
                    byUserId = v5
                }, 
                Presence = {
                    byUserId = v12
                }, 
                NetworkStatus = {
                    ["https://friends.roblox.com/v1/users/test/friends"] = "Done"
                }
            }, 
            ScreenSize = Vector2.new(1000, 100)
        }, 
        manyFriends = {
            LocalUserId = "test", 
            GlobalGuiInset = {
                top = 20, 
                bottom = 20, 
                left = 20, 
                right = 20
            }, 
            [v18] = {
                Friends = {
                    byUserId = {
                        test = v8
                    }, 
                    countsByUserId = {
                        test = #v8
                    }, 
                    requests = {
                        receivedCount = 12
                    }, 
                    recommendations = {}
                }, 
                Users = {
                    byUserId = v5
                }, 
                Presence = {
                    byUserId = v12
                }, 
                NetworkStatus = {
                    ["https://friends.roblox.com/v1/users/test/friends"] = "Done", 
                    ["https://friends.roblox.com/v1/users/test/friends/inactive"] = "Done"
                }
            }, 
            ScreenSize = Vector2.new(1000, 100)
        }, 
        deletedFriends = {
            LocalUserId = "test", 
            GlobalGuiInset = {
                top = 20, 
                bottom = 20, 
                left = 20, 
                right = 20
            }, 
            [v18] = {
                Friends = {
                    byUserId = {}, 
                    countsByUserId = {}
                }, 
                DeletedUsers = {
                    byUserId = {}
                }, 
                Users = {}, 
                Presence = {}, 
                NetworkStatus = {
                    ["https://friends.roblox.com/v1/users/test/friends"] = "Done"
                }
            }, 
            ScreenSize = Vector2.new(600, 300)
        }, 
        friendsAndRecommendations = {
            LocalUserId = "test", 
            GlobalGuiInset = {
                top = 20, 
                bottom = 20, 
                left = 20, 
                right = 20
            }, 
            [v18] = {
                Friends = {
                    byUserId = {
                        test = v9
                    }, 
                    countsByUserId = {
                        test = #v9
                    }, 
                    recommendations = {
                        byUserId = {
                            test = v13
                        }, 
                        bySource = {}
                    }, 
                    requests = {
                        receivedCount = 28
                    }, 
                    friendshipStatus = {
                        recom1 = Enum.FriendStatus.NotFriend, 
                        recom2 = Enum.FriendStatus.NotFriend, 
                        recom3 = Enum.FriendStatus.Unknown, 
                        recom4 = Enum.FriendStatus.FriendRequestSent
                    }
                }, 
                Users = {
                    byUserId = l_llama_0.Dictionary.join(v5, v16)
                }, 
                Presence = {
                    byUserId = v12
                }, 
                NetworkStatus = {
                    ["https://friends.roblox.com/v1/users/test/friends"] = "Done"
                }
            }, 
            ScreenSize = Vector2.new(1000, 100)
        }, 
        recommendationsOnly = {
            LocalUserId = "test", 
            GlobalGuiInset = {
                top = 20, 
                bottom = 20, 
                left = 20, 
                right = 20
            }, 
            [v18] = {
                Friends = {
                    byUserId = {}, 
                    countsByUserId = {}, 
                    recommendations = {
                        byUserId = {
                            test = v13
                        }, 
                        bySource = {
                            AddFriendsPage = {
                                recom1 = true, 
                                recom2 = true, 
                                recom3 = true, 
                                recom4 = true
                            }
                        }
                    }, 
                    requests = {
                        receivedCount = 28
                    }, 
                    friendshipStatus = {
                        recom1 = Enum.FriendStatus.NotFriend, 
                        recom2 = Enum.FriendStatus.NotFriend, 
                        recom3 = Enum.FriendStatus.Unknown, 
                        recom4 = Enum.FriendStatus.FriendRequestSent
                    }
                }, 
                Users = {
                    byUserId = l_llama_0.Dictionary.join(v5, v16)
                }, 
                Presence = {
                    byUserId = v12
                }, 
                NetworkStatus = {
                    ["https://friends.roblox.com/v1/users/test/friends"] = "Done"
                }
            }, 
            ScreenSize = Vector2.new(1000, 100)
        }, 
        manyFriendsAndRecommendations = {
            LocalUserId = "test", 
            GlobalGuiInset = {
                top = 20, 
                bottom = 20, 
                left = 20, 
                right = 20
            }, 
            [v18] = {
                Friends = {
                    byUserId = {
                        test = v8
                    }, 
                    countsByUserId = {
                        test = #v8
                    }, 
                    recommendations = {
                        byUserId = {
                            test = v13
                        }, 
                        bySource = {}
                    }
                }, 
                Users = {
                    byUserId = l_llama_0.Dictionary.join(v5, v16)
                }, 
                Presence = {
                    byUserId = v12
                }, 
                NetworkStatus = {
                    ["https://friends.roblox.com/v1/users/test/friends"] = "Done"
                }
            }, 
            ScreenSize = Vector2.new(1000, 100)
        }
    };
end;
