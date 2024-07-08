local l_Parent_0 = script:FindFirstAncestor("InviteLinkExpiredModal").Parent;
local v1 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v2 = require(l_Parent_0.Lumberyak).Logger.new(nil, "InviteLinkExpiredModal"):new("InviteLinkExpiredModal Networking");
local v3 = game:DefineFastInt("InviteLinkExpiredModalHttpRetryCount", 3);
local l_httpRequest_0 = v1.httpRequest;
local v10 = v1.RoduxNetworking.config({
    keyPath = "InviteLinkExpiredModal.NetworkStatus", 
    networkImpl = l_httpRequest_0.config({
        requestFunction = function(v5, v6, v7)
            v2:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v6, v5));
            return l_httpRequest_0.requestFunctions.HttpRbxApi(v5, v6, v7);
        end, 
        postRequestFunction = function(v8, v9)
            v2:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v9.requestMethod, v9.url, v8.StatusCode, v8.Body));
        end, 
        maxRetryCount = v3
    })
});
return {
    Dash = require(l_Parent_0.Dash), 
    Roact = require(l_Parent_0.Roact), 
    RoactRodux = require(l_Parent_0.RoactRodux), 
    RoactNavigation = require(l_Parent_0.RoactNavigation), 
    Rodux = require(l_Parent_0.Rodux), 
    t = require(l_Parent_0.t), 
    UIBlox = require(l_Parent_0.UIBlox), 
    LocalizationProvider = require(l_Parent_0.Localization).LocalizationProvider, 
    withLocalization = require(l_Parent_0.Localization).withLocalization, 
    llama = v1.llama, 
    SocialLibraries = v1.SocialLibraries.config({}), 
    RoduxGames = v1.RoduxGames.config({
        keyPath = "InviteLinkExpiredModal.Games"
    }), 
    RoduxShareLinks = v1.RoduxShareLinks.config({
        keyPath = "InviteLinkExpiredModal.ShareLinks"
    }), 
    RoduxNetworking = v10, 
    NetworkingGames = v1.NetworkingGames.config({
        roduxNetworking = v10
    })
};
