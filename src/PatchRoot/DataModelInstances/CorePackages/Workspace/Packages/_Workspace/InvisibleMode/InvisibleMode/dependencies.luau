local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.AppCommonLib);
local v3 = require(l_Parent_0.Dash);
local l_Hooks_0 = require(l_Parent_0.RoactUtils).Hooks;
local v5 = require(l_Parent_0.Localization);
local v6 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v7 = require(l_Parent_0.Otter);
local v8 = require(l_Parent_0.Promise);
local v9 = require(l_Parent_0.React);
local v10 = require(l_Parent_0.RoactAppExperiment);
local v11 = require(l_Parent_0.RoactRodux);
local v12 = require(l_Parent_0.RobloxAppHooks);
local v13 = require(l_Parent_0.Rodux);
local l_RoduxNetworking_0 = v6.RoduxNetworking;
local v15 = require(l_Parent_0.SocialLuaAnalytics);
local v16 = require(l_Parent_0.UIBlox);
local l_httpRequest_0 = v6.httpRequest;
local l_RoduxPresence_0 = v6.RoduxPresence;
local l_useDispatch_0 = l_Hooks_0.RoactRodux.useDispatch;
local l_useEffectOnce_0 = l_Hooks_0.useEffectOnce;
local l_useLocalization_0 = v5.Hooks.useLocalization;
local l_useSelector_0 = l_Hooks_0.RoactRodux.useSelector;
local l_useStyle_0 = v16.Core.Style.useStyle;
local v24 = l_RoduxPresence_0.config({
    keyPath = "InvisibleMode.Presence"
});
local v25 = l_RoduxNetworking_0.config({
    keyPath = "InvisibleMode.NetworkStatus", 
    networkImpl = l_httpRequest_0.config({
        requestFunction = l_httpRequest_0.requestFunctions.HttpRbxApi
    })
});
return {
    Analytics = v1, 
    Dash = v3, 
    Hooks = {
        useDispatch = l_useDispatch_0, 
        useEffectOnce = l_useEffectOnce_0, 
        useLocalization = l_useLocalization_0, 
        useLocalUserId = v12.useLocalUserId, 
        useScreenSize = v12.useScreenSize, 
        useSelector = l_useSelector_0, 
        useStyle = l_useStyle_0, 
        useTopBarHeight = v12.useTopBarHeight
    }, 
    LocalizationProvider = v5.LocalizationProvider, 
    LuaSocialLibrariesDeps = v6, 
    NetworkingPresence = v6.NetworkingPresence.config({
        roduxNetworking = v25
    }), 
    Otter = v7, 
    PresenceReducer = v24, 
    Promise = v8, 
    React = v9, 
    RoactAppExperiment = v10, 
    RoactRodux = v11, 
    Rodux = v13, 
    RoduxNetworking = v25, 
    SocialLibraries = v6.SocialLibraries.config({}), 
    SocialLuaAnalytics = v15, 
    Text = v2.Text, 
    UIBlox = v16
};
