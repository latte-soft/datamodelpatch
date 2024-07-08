local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.TestHelpers.MockRequest);
local v4 = require(l_Modules_0.LuaApp.Models.ExperienceGuidelinesApi.AgeRecommendationDetails);
local v5 = require(l_Modules_0.LuaApp.Models.GamesApi.Game);
local l_GameDetailModel_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GameDetails.GameDetailModel;
local v7 = {
    dummyUniverseId = "0", 
    dummyGameName = "test"
};
local v8 = v4.mock();
local v9 = v5.mock();
return function(v10)
    local v11 = v1.Dictionary.join(v7, v10 or {});
    return {
        {
            url = string.format("v1/games?universeIds=%s", v11.dummyUniverseId), 
            request = v3.simpleSuccessRequest({
                data = {
                    l_GameDetailModel_0.mock(v11.dummyUniverseId, v11.dummyGameName)
                }
            })
        }, 
        {
            url = string.format("v1/games/multiget-playability-status?universeIds=%s", v11.dummyUniverseId), 
            request = v3.simpleSuccessRequest({
                {
                    playabilityStatus = "Playable", 
                    isPlayable = true, 
                    universeId = v11.dummyUniverseId
                }
            })
        }, 
        {
            url = "v1/settings/user-opt-in", 
            request = v3.simpleSuccessRequest({
                isUserOptIn = true
            })
        }, 
        {
            url = string.format("v2/games/%s/media", v11.dummyUniverseId), 
            request = v3.simpleSuccessRequest({
                data = {}
            })
        }, 
        {
            url = string.format("v1/games/%s/votes/user", v11.dummyUniverseId), 
            request = v3.simpleSuccessRequest({
                canVote = false, 
                userVote = nil, 
                reasonForNotVoteable = "PlayGame"
            })
        }, 
        {
            url = string.format("v1/games/%s/votes", v11.dummyUniverseId), 
            request = v3.simpleSuccessRequest({
                upVotes = 0, 
                downVotes = 0
            })
        }, 
        {
            url = string.format("v1/games/%s/favorites", v11.dummyUniverseId), 
            request = v3.simpleSuccessRequest({
                isFavorited = true
            })
        }, 
        {
            url = string.format("v1/users//universes/%s/status", v11.dummyUniverseId), 
            request = v3.simpleSuccessRequest({
                UniverseId = v11.dummyUniverseId, 
                UserId = 0, 
                CanFollow = true, 
                IsFollowing = true, 
                FollowingCountByType = 0, 
                FollowingLimitByType = 0
            })
        }, 
        {
            url = string.format("v1/games/%s/social-links/list", v11.dummyUniverseId), 
            request = v3.simpleSuccessRequest({
                data = {}
            })
        }, 
        {
            url = string.format("v1/games/recommendations/game/%s?maxRows=6", v11.dummyUniverseId), 
            request = v3.simpleSuccessRequest({
                games = {
                    v9
                }
            })
        }, 
        {
            url = "experience-guidelines-api/experience-guidelines/get-age-recommendation", 
            request = v3.simpleSuccessRequest({
                ageRecommendationDetails = v8
            })
        }, 
        {
            url = string.format("v1/games/icons?universeIds=%s&format=png&size=150x150", v9.universeId), 
            request = v3.simpleSuccessRequest({
                data = {
                    targetId = v9.universeId, 
                    state = "Completed", 
                    imageUrl = "https://t1.rbxcdn.com/a4bf94a31c04809ac4e8b8bd6aec01a1"
                }
            })
        }, 
        {
            url = string.format("v1/games/%s/game-passes", v11.dummyUniverseId), 
            request = v3.simpleSuccessRequest({
                data = {
                    {
                        id = 1234567, 
                        name = "test", 
                        productId = 12345678, 
                        price = 123
                    }
                }
            })
        }, 
        {
            url = "v1/game-passes?isCircular=true&format=png", 
            request = v3.simpleSuccessRequest({
                data = {
                    targetId = v9.universeId, 
                    state = "Completed", 
                    imageUrl = "https://t1.rbxcdn.com/a4bf94a31c04809ac4e8b8bd6aec01a1"
                }
            })
        }, 
        {
            url = string.format("v1/universes/%s/badges", v11.dummyUniverseId), 
            request = v3.simpleSuccessRequest({
                data = {
                    {
                        id = 123456
                    }
                }
            })
        }
    };
end;
