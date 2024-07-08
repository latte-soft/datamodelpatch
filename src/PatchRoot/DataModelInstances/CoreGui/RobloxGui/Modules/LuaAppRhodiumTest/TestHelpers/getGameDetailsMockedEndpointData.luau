local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_Modules_0.LuaApp.Constants);
local v4 = require(l_Modules_0.LuaApp.TestHelpers.MockRequest);
local l_GameDetailModel_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GameDetails.GameDetailModel;
local l_PlayabilityStatusEnum_0 = require(l_CorePackages_0.Workspace.Packages.PlayabilityRodux).Enums.PlayabilityStatusEnum;
return function(v7, v8)
    local v9 = v2.Dictionary.join({
        gamesDetails = v4.simpleSuccessRequest({
            data = l_GameDetailModel_0.mock(v7, "mock game")
        }), 
        voiceShowAgeVerificationOverlay = v4.simpleSuccessRequest({
            showAgeVerificationOverlay = false, 
            universePlaceVoiceEnabledSettings = {
                isPlaceEnabledForVoice = true, 
                isUniverseEnabledForVoice = true
            }
        }), 
        voiceUserOptIn = v4.simpleSuccessRequest({
            isUserOptIn = false
        }), 
        gamesMedia = v4.simpleSuccessRequest({
            data = {}
        }), 
        gamesThumbnailsList = v4.simpleSuccessRequest({
            {
                universeId = v7, 
                thumbnails = {
                    url = "rbxassetid://0"
                }
            }
        }), 
        supportedLocales = v4.simpleSuccessRequest({}), 
        gamesUserVotes = v4.simpleSuccessRequest({
            canVote = true, 
            reasonForNotVoteable = "", 
            userVote = false
        }), 
        gamesVotes = v4.simpleSuccessRequest({
            upVotes = 10, 
            downVotes = 10
        }), 
        gamesFavorites = v4.simpleSuccessRequest({
            isFavorited = true
        }), 
        followingUniverse = v4.simpleSuccessRequest({
            CanFollow = true, 
            IsFollowing = true
        }), 
        gamesSocialLinks = v4.simpleSuccessRequest({
            data = {}
        }), 
        gameRecommendations = v4.simpleSuccessRequest({
            games = {}
        }), 
        gamePassesList = v4.simpleSuccessRequest({
            data = {
                {
                    id = 12345, 
                    isOwned = false, 
                    name = "2x Money", 
                    price = 450
                }
            }
        }), 
        gamePasses = v4.simpleSuccessRequest({}), 
        badges = v4.simpleSuccessRequest({
            data = {}
        }), 
        bigGameIcons = v4.simpleSuccessRequest({}), 
        ageRecommendation = v4.simpleSuccessRequest({
            ageRecommendationDetails = {
                summary = {
                    ageRecommendation = {
                        minimumAge = 13
                    }
                }
            }
        }), 
        assetTextFilterSettings = v4.simpleSuccessRequest({
            containsStrongLanguage = false
        }), 
        playabilityStatus = v4.simpleSuccessRequest({
            data = {
                universeId = v7, 
                isPlayable = true, 
                playabilityStatus = l_PlayabilityStatusEnum_0.Playable
            }
        }), 
        privateServersEnabled = v4.simpleSuccessRequest({
            privateServersEnabled = true
        })
    }, v8);
    return {
        {
            url = "https://games.roblox.com/v1/games?universeIds=" .. v7, 
            request = v9.gamesDetails
        }, 
        {
            url = "https://voice.roblox.com//v1/settings/verify/show-age-verification-overlay/" .. v7, 
            request = v9.voiceShowAgeVerificationOverlay
        }, 
        {
            url = "https://voice.roblox.com//v1/settings/user-opt-in", 
            request = v9.voiceUserOptIn
        }, 
        {
            url = "https://games.roblox.com/v2/games/" .. v7 .. "/media", 
            request = v9.gamesMedia
        }, 
        {
            url = "https://thumbnails.roblox.com/v1/games/multiget/thumbnails?universeIds=" .. v7 .. "&format=Jpeg&size=256x144", 
            request = v9.gamesThumbnailsList
        }, 
        {
            url = "https://locale.roblox.com/v1/locales/user-localization-locus-supported-locales", 
            request = v9.supportedLocales
        }, 
        {
            url = "https://games.roblox.com/v1/games/" .. v7 .. "/votes/user", 
            usePatterns = false, 
            request = v9.gamesUserVotes
        }, 
        {
            url = "https://games.roblox.com/v1/games/" .. v7 .. "/votes", 
            request = v9.gamesVotes
        }, 
        {
            url = "https://games.roblox.com/v1/games/" .. v7 .. "/favorites", 
            request = v9.gamesFavorites
        }, 
        {
            url = "https://followings.roblox.com//v1/users//universes/" .. v7 .. "/status", 
            request = v9.followingUniverse
        }, 
        {
            url = "https://games.roblox.com/v1/games/" .. v7 .. "/social-links/list", 
            request = v9.gamesSocialLinks
        }, 
        {
            url = string.format("https://games.roblox.com/v1/games/recommendations/game/%s?maxRows=%s", v7, (tostring(v3.MAX_RECOMMENDED_GAMES_FETCH_COUNT))), 
            request = v9.gameRecommendations
        }, 
        {
            url = "https://games.roblox.com/v1/games/" .. v7 .. "/game-passes", 
            request = v9.gamePassesList
        }, 
        {
            url = "https://thumbnails.roblox.com/v1/game-passes?isCircular=true&format=png&size=150x150&gamePassIds=12345", 
            request = v9.gamePasses
        }, 
        {
            url = "https://badges.roblox.com/v1/universes/" .. v7 .. "/badges", 
            request = v9.badges
        }, 
        {
            url = "https://thumbnails.roblox.com/v1/games/icons?universeIds=" .. v7 .. "&format=png&size=512x512", 
            request = v9.bigGameIcons
        }, 
        {
            url = "https://apis.roblox.com/experience-guidelines-api/experience-guidelines/get-age-recommendation", 
            request = v9.ageRecommendation
        }, 
        {
            url = "https://apis.roblox.com/asset-text-filter-settings/" .. v7, 
            request = v9.assetTextFilterSettings
        }, 
        {
            url = "https://games.roblox.com//v1/games/multiget-playability-status?universeIds=" .. v7, 
            request = v9.playabilityStatus
        }, 
        {
            url = "https://games.roblox.com/v1/private-servers/enabled-in-universe/" .. v7, 
            request = v9.privateServersEnabled
        }
    };
end;
