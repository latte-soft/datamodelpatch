local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.LuaSocialLibrariesDeps);
local v2 = require(l_CorePackages_0.Lumberyak);
local l_httpRequest_0 = v1.httpRequest;
local v4 = v2.Logger.new(nil, "ContactList");
local v5 = game:DefineFastInt("ContactListHttpRetryCount", 3);
local v6 = v4:new("ContactList Networking");
local v12 = v1.RoduxNetworking.config({
    keyPath = "NetworkStatus", 
    networkImpl = l_httpRequest_0.config({
        requestFunction = function(v7, v8, v9)
            v6:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v8, v7));
            return l_httpRequest_0.requestFunctions.HttpRbxApi(v7, v8, v9);
        end, 
        postRequestFunction = function(v10, v11)
            v6:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v11.requestMethod, v11.url, v10.StatusCode, v10.Body));
        end, 
        maxRetryCount = v5
    })
});
return {
    Hooks = {
        dependencyArray = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.dependencyArray, 
        useDispatch = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch, 
        useSelector = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector, 
        usePrevious = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.usePrevious, 
        useLocalization = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization
    }, 
    NetworkingCall = v1.NetworkingCall.config({
        roduxNetworking = v12, 
        useMockedResponse = true
    }), 
    RoduxCall = v1.RoduxCall.config({
        keyPath = "Call"
    }), 
    RoduxFriends = v1.RoduxFriends.config({
        keyPath = "Friends"
    }), 
    RoduxPresence = v1.RoduxPresence.config({
        keyPath = "Presence"
    }), 
    RoduxUsers = v1.RoduxUsers.config({
        keyPath = "Users"
    }), 
    RoduxNetworking = v12, 
    NetworkingPresence = v1.NetworkingPresence.config({
        roduxNetworking = v12
    }), 
    NetworkingFriends = v1.NetworkingFriends.config({
        roduxNetworking = v12
    }), 
    NetworkingUsers = v1.NetworkingUsers.config({
        roduxNetworking = v12
    }), 
    SocialLibraries = v1.SocialLibraries.config({}), 
    UIBlox = require(l_CorePackages_0.UIBlox), 
    enumerate = require(l_CorePackages_0.enumerate), 
    getStandardSizeAvatarHeadShotRbxthumb = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb, 
    teleportToRootPlace = require(script.Parent.teleportToRootPlace)
};
