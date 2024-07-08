local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.AddFriends.dependencies);
local l_Rodux_0 = v1.Rodux;
local l_llama_0 = v1.llama;
local v4 = require(l_script_FirstAncestor_0.TestHelpers.getBaseTestStates);
return function(v5, v6, v7)
    local v8 = if not v6 or v5 then if v6 and v5 then v4().friendsAndRecommendations else v4().smallNumbersOfFriends else v4().recommendationsOnly;
    local l_FriendsLanding_0 = v8.FriendsLanding;
    local v10 = {};
    local v11 = 0;
    local v12 = nil;
    local v13 = {};
    local v14 = {};
    local v15 = {};
    local v16 = {};
    local v17 = {};
    local v18 = {};
    local v19 = {};
    if v5 then
        v10 = l_FriendsLanding_0.Users.byUserId;
        v11 = #l_llama_0.Dictionary.keys(l_FriendsLanding_0.Users.byUserId);
        v12 = "next";
        v16 = {
            ["36"] = "game_universe_id_36", 
            ["37"] = "game_universe_id_37", 
            ["38"] = "game_universe_id_39"
        };
        v14 = {
            ["36"] = {
                isFollowing = true, 
                isFollowed = true
            }
        };
        v15 = {
            game_universe_id_36 = {
                name = "test game"
            }, 
            game_universe_id_37 = {
                name = "test game"
            }, 
            game_universe_id_38 = {
                name = "test game"
            }
        };
        v17 = {
            ["1"] = {
                "Bob", 
                "Corey", 
                "Andrew"
            }, 
            ["2"] = {}, 
            ["3"] = {}
        };
        v18 = {
            shouldShowContactImporterFeature = true, 
            shouldShowContactImporterUpsellModal = true, 
            isDiscoverabilityUnset = false
        };
    end;
    if v6 then
        v19 = v4().recommendationsOnly.FriendsLanding.Friends.recommendations;
    end;
    return l_Rodux_0.Store.new(function()
        return {
            ScreenSize = Vector2.new(540, 960), 
            GlobalGuiInset = {
                top = 20, 
                bottom = 20, 
                left = 20, 
                right = 20
            }, 
            LocalUserId = v8.LocalUserId, 
            FriendStatuses = l_llama_0.Dictionary.map(l_FriendsLanding_0.Users.byUserId, function()
                return Enum.FriendStatus.FriendRequestReceived;
            end), 
            FriendsLanding = l_llama_0.Dictionary.join({
                Friends = {
                    requests = {
                        byUserId = v10, 
                        receivedCount = v11, 
                        nextPageCursor = v12, 
                        sourceUniverseIds = v16, 
                        mutualFriends = v17
                    }, 
                    recommendations = v19
                }, 
                Users = l_FriendsLanding_0.Users, 
                Presence = l_FriendsLanding_0.Presence, 
                NetworkStatus = l_FriendsLanding_0.NetworkStatus, 
                UserFollowers = v13, 
                IsUserFollowing = v14, 
                Games = {
                    byGameId = v15
                }, 
                ShowContactImporterParams = v18
            }, v7 or {})
        };
    end, {}, {
        l_Rodux_0.thunkMiddleware
    });
end;
