local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_MockUser_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Models.MockUser;
local v3 = require(l_Modules_0.LuaApp.Models.GameSort);
local v4 = require(l_Modules_0.LuaApp.Models.GamesApi.Game);
local v5 = require(l_Modules_0.LuaApp.Models.DiscoveryApi.OmniRecommendations);
local v6 = require(l_Modules_0.LuaApp.TestHelpers.MockRequest);
return function(v7)
    local v8 = v4.mock();
    local v9 = v3.mock();
    v9.tokenExpiryInSeconds = 0;
    local v10 = not not v7 and v7.gameSorts or {
        v9
    };
    return {
        {
            url = "/v1/games/sorts", 
            request = v6.simpleSuccessRequest({
                sorts = v10
            })
        }, 
        {
            url = "/explore-api/v1/get-sorts-metadata", 
            request = v6.simpleSuccessRequest({
                sortMetadata = v10
            })
        }, 
        {
            url = "/v1/games/list", 
            request = v6.simpleSuccessRequest({
                games = not not v7 and v7.games or {
                    v8
                }
            })
        }, 
        {
            url = "/v1/games/icons", 
            request = v6.simpleSuccessRequest({
                data = {}
            })
        }, 
        {
            url = "/discovery-api/omni-recommendation", 
            request = v6.simpleSuccessRequest(not not v7 and v7.discoveryOmniRecommendations or v5.mockEndpointResponse())
        }, 
        {
            url = "/account-security-service/v1/prompt-assignments", 
            request = v6.simpleSuccessRequest({
                data = {}
            })
        }, 
        {
            url = "/v1/users", 
            request = v6.simpleSuccessRequest({
                data = not not v7 and v7.users or {
                    l_MockUser_0.mockEndpointResponse()
                }
            })
        }, 
        {
            url = "v1/metadata", 
            request = v6.simpleSuccessRequest({
                data = {}
            })
        }, 
        {
            url = "/v1/presence/users", 
            request = v6.simpleSuccessRequest({
                userPresences = {}
            })
        }, 
        {
            url = "/upsellcard/type", 
            request = v6.simpleSuccessRequest({
                data = {}
            })
        }, 
        {
            url = "/multiget/thumbnails", 
            request = v6.simpleSuccessRequest({
                data = {}
            })
        }
    };
end;
