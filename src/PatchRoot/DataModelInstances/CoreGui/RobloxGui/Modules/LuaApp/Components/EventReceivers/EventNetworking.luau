local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.LuaSocialLibrariesDeps);
local l_httpRequest_0 = v1.httpRequest;
local v3 = game:DefineFastInt("EventNetworkHttpRetryCount", 3);
local v4 = require(l_CorePackages_0.Rodux);
local l_GetFFlagLuaAppEnableSquadPage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableSquadPage;
local v9 = l_httpRequest_0.config({
    requestFunction = function(v6, v7, v8)
        return l_httpRequest_0.requestFunctions.HttpRbxApi(v6, v7, v8);
    end, 
    maxRetryCount = v3
});
local v10 = v1.RoduxNetworking.config({
    keyPath = "EventReceievers" .. ".NetworkStatus", 
    networkImpl = v9
});
return {
    networkImpl = v9, 
    RoduxNetworking = v10, 
    installReducer = function()
        return v4.combineReducers({
            NetworkStatus = v10.installReducer()
        });
    end, 
    FriendsNetworking = v1.NetworkingFriends.config({
        roduxNetworking = v10
    }), 
    NetworkingPresence = v1.NetworkingPresence.config({
        roduxNetworking = v10
    }), 
    NetworkingShareLinks = v1.NetworkingShareLinks.config({
        roduxNetworking = v10, 
        useMockedResponse = false
    }), 
    NetworkingSquads = if not l_GetFFlagLuaAppEnableSquadPage_0() then nil else v1.NetworkingSquads.config({
        roduxNetworking = v10, 
        useMockedResponse = true
    }), 
    RoduxFriends = v1.RoduxFriends.config({
        keyPath = "EventReceievers" .. ".Friends"
    }), 
    RoduxUsers = v1.RoduxUsers.config({
        keyPath = "EventReceievers" .. ".Users"
    }), 
    RoduxPresence = v1.RoduxPresence.config({
        keyPath = "EventReceievers" .. ".Presence"
    }), 
    RoduxSquads = if not l_GetFFlagLuaAppEnableSquadPage_0() then nil else v1.RoduxSquads.config({}), 
    RoduxKey = "EventReceievers"
};
