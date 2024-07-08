local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v3 = require(l_Parent_0.SocialLuaAnalytics);
local v4 = require(l_Parent_0.Lumberyak);
local l_httpRequest_0 = v2.httpRequest;
local l_FFlagContactRecs_0 = require(l_Parent_0.SharedFlags).FFlagContactRecs;
local v7 = v4.Logger.new(nil, "PYMKCarousel"):new("PYMKCarousel Networking");
local v13 = l_httpRequest_0.config({
    requestFunction = function(v8, v9, v10)
        v7:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v9, v8));
        return l_httpRequest_0.requestFunctions.HttpRbxApi(v8, v9, v10);
    end, 
    postRequestFunction = function(v11, v12)
        v7:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v12.requestMethod, v12.url, v11.StatusCode, v11.Body));
    end, 
    maxRetryCount = game:DefineFastInt("PYMKCarouselHttpRetryCount", 3)
});
local l_RODUX_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY;
local l_RoduxNetworking_0 = v2.RoduxNetworking;
local v16 = if not l_FFlagContactRecs_0 then v2.RoduxFriends else require(l_Parent_0.RoduxFriends);
local v17 = l_RoduxNetworking_0.config({
    keyPath = l_RODUX_KEY_0 .. ".NetworkStatus", 
    networkImpl = v13
});
return {
    SocialLuaAnalytics = v3, 
    UIBlox = require(l_Parent_0.UIBlox), 
    Roact = require(l_Parent_0.Roact), 
    React = require(l_Parent_0.React), 
    Rodux = require(l_Parent_0.Rodux), 
    RoactRodux = require(l_Parent_0.RoactRodux), 
    Result = require(l_Parent_0.Result), 
    llama = v2.llama, 
    Dash = require(l_Parent_0.Dash), 
    RoduxNetworking = v17, 
    RoduxFriends = v16.config({
        keyPath = l_RODUX_KEY_0 .. ".Friends"
    }), 
    RoduxUsers = v2.RoduxUsers.config({
        keyPath = l_RODUX_KEY_0 .. ".Users"
    }), 
    NetworkingFriendsEnums = v2.NetworkingFriends.Enums, 
    NetworkingFriends = v2.NetworkingFriends.config({
        roduxNetworking = v17
    }), 
    RoduxAnalytics = v3.Analytics.RoduxAnalytics.config({
        keyPath = l_RODUX_KEY_0 .. ".Analytics"
    }), 
    Players = game:GetService("Players"), 
    convertActions = require(l_Parent_0.SocialReducerAdaptors).convertActions, 
    usersActionAdaptor = require(l_Parent_0.SocialReducerAdaptors).usersActionAdaptor, 
    friendsActionAdaptor = require(l_Parent_0.SocialReducerAdaptors).friendsActionAdaptor, 
    SocialCommon = require(l_Parent_0.SocialCommon), 
    SocialLibraries = v2.SocialLibraries.config({}), 
    Hooks = {
        useSelector = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector, 
        useDispatch = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch, 
        useLocalization = require(l_Parent_0.Localization).Hooks.useLocalization, 
        dependencyArray = require(l_Parent_0.RoactUtils).Hooks.dependencyArray
    }, 
    LocalizationProvider = require(l_Parent_0.Localization).LocalizationProvider, 
    enumerate = require(l_Parent_0.enumerate), 
    getFFlagPYMKAddFriendsEntry = require(l_Parent_0.SharedFlags).getFFlagPYMKAddFriendsEntry
};
