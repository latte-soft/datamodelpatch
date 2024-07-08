local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuaSocialLibrariesDeps);
local v3 = require(l_Parent_1.Lumberyak);
local l_httpRequest_0 = v2.httpRequest;
local l_NetworkingGames_0 = v2.NetworkingGames;
local l_NetworkingShareLinks_0 = v2.NetworkingShareLinks;
local l_RoduxGames_0 = v2.RoduxGames;
local l_RoduxNetworking_0 = v2.RoduxNetworking;
local l_RoduxShareLinks_0 = v2.RoduxShareLinks;
local v10 = v3.Logger.new(nil, require(l_Parent_0.Constants).LoggerKey);
local v16 = l_RoduxNetworking_0.config({
    keyPath = "NetworkStatus", 
    networkImpl = l_httpRequest_0.config({
        requestFunction = function(v11, v12, v13)
            v10:debug((("Request: [ requestMethod = %*, url = %* ]"):format(v12, v11)));
            return l_httpRequest_0.requestFunctions.HttpRbxApi(v11, v12, v13);
        end, 
        postRequestFunction = function(v14, v15)
            v10:debug((("Response: [ requestMethod = %*, url = %*, statusCode = %*, body = %* ]"):format(v15.requestMethod, v15.url, v14.StatusCode, v14.Body)));
        end, 
        maxRetryCount = game:DefineFastInt("ScreenshotsMaxHttpRequestRetries", 2), 
        maxWaitTime = game:DefineFastInt("ScreenshotsMaxHttpRequestWaitTime", 8)
    })
});
return {
    NetworkingGames = l_NetworkingGames_0.config({
        roduxNetworking = v16
    }), 
    NetworkingShareLinks = l_NetworkingShareLinks_0.config({
        roduxNetworking = v16
    }), 
    RoduxGames = l_RoduxGames_0.config({
        keyPath = "Games"
    }), 
    RoduxNetworking = v16, 
    RoduxShareLinks = l_RoduxShareLinks_0.config({
        keyPath = "ShareLinks"
    })
};
