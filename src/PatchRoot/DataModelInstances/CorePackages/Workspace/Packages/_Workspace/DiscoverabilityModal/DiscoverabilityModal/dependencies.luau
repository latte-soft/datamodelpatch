local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuaSocialLibrariesDeps);
local l_RoduxNetworking_0 = v2.RoduxNetworking;
local v4 = require(l_Parent_1.Lumberyak);
local l_httpRequest_0 = v2.httpRequest;
local v6 = v4.Logger.new(nil, "DiscoverabilityModal"):new("DiscoverabilityModal Networking");
local v12 = l_httpRequest_0.config({
    requestFunction = function(v7, v8, v9)
        v6:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v8, v7));
        return l_httpRequest_0.requestFunctions.HttpRbxApi(v7, v8, v9);
    end, 
    postRequestFunction = function(v10, v11)
        v6:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v11.requestMethod, v11.url, v10.StatusCode, v10.Body));
    end, 
    maxRetryCount = game:DefineFastInt("DiscoverabilityModalHttpRetryCount", 3)
});
local l_RODUX_KEY_0 = require(l_Parent_0.Common.Constants).RODUX_KEY;
local v14 = l_RoduxNetworking_0.config({
    keyPath = l_RODUX_KEY_0 .. ".NetworkStatus", 
    networkImpl = v12
});
return {
    AppStorageService = game:GetService("AppStorageService"), 
    SocialLuaAnalytics = require(l_Parent_1.SocialLuaAnalytics), 
    Dash = require(l_Parent_1.Dash), 
    UIBlox = require(l_Parent_1.UIBlox), 
    Roact = require(l_Parent_1.Roact), 
    RoactRodux = require(l_Parent_1.RoactRodux), 
    Rodux = require(l_Parent_1.Rodux), 
    React = require(l_Parent_1.React), 
    ContactsProtocol = require(l_Parent_1.ContactsProtocol).ContactsProtocol, 
    Promise = require(l_Parent_1.Promise), 
    enumerate = require(l_Parent_1.enumerate), 
    RoactNavigation = require(l_Parent_1.RoactNavigation), 
    rolloutByApplicationId = require(l_Parent_1.AppCommonLib).rolloutByApplicationId, 
    RoduxNetworking = v14, 
    SocialLibraries = v2.SocialLibraries.config({}), 
    SocialModalsCommon = require(l_Parent_1.SocialModalsCommon), 
    PermissionsProtocol = require(l_Parent_1.PermissionsProtocol).PermissionsProtocol, 
    NetworkingUserSettings = v2.NetworkingUserSettings.config({
        roduxNetworking = v14
    }), 
    RoduxUserPermissions = v2.RoduxUserPermissions.config({
        keyPath = l_RODUX_KEY_0 .. ".UserPermissions"
    }), 
    LocalizationProvider = require(l_Parent_1.Localization).LocalizationProvider, 
    Hooks = {
        useLocalization = require(l_Parent_1.Localization).Hooks.useLocalization, 
        useNavigation = require(l_Parent_1.RoactUtils).Hooks.useNavigation, 
        useSelector = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useSelector, 
        useDispatch = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useDispatch
    }, 
    getFStringSocialProfileLayer = require(l_Parent_1.SharedFlags).getFStringSocialProfileLayer
};
