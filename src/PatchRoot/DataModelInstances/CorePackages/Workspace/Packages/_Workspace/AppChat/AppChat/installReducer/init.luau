local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableUnfilteredThreadsUI);
return function()
    return v2.combineReducers({
        PlaceInfos = require(l_Parent_0.PlaceInfoRodux).Reducers.PlaceInfosReducer, 
        PlaceInfosAsync = require(l_Parent_0.PlaceInfoRodux).Reducers.PlaceInfosAsyncReducer, 
        Aliases = require(script.Aliases), 
        AppLoaded = require(l_script_FirstAncestor_0.installReducer.AppLoaded), 
        ChatSettings = require(l_script_FirstAncestor_0.installReducer.ChatSettings), 
        Conversations = require(l_script_FirstAncestor_0.installReducer.Conversations), 
        ConversationsAsync = require(l_script_FirstAncestor_0.installReducer.ConversationsAsync), 
        ExternalNavigationRequest = require(l_script_FirstAncestor_0.installReducer.ExternalNavigationRequest), 
        LastEntryPoint = require(script.LastEntryPoint), 
        Presence = require(script.Presence), 
        ToggleChatPaused = require(l_script_FirstAncestor_0.installReducer.ToggleChatPaused), 
        networkStatus = require(l_script_FirstAncestor_0.Http.RoduxNetworking).installReducer(), 
        UnfilteredThreads = if not v3() then nil else require(l_script_FirstAncestor_0.installReducer.UnfilteredThreads)
    });
end;
