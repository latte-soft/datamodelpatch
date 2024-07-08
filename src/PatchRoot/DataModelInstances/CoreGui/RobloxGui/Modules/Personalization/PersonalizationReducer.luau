local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
return require(game:GetService("CorePackages").Rodux).combineReducers({
    OrderedOmniItems = require(l_Modules_0.Personalization.OmniFeed.DataStore.OrderedOmniItems), 
    TopicContents = require(l_Modules_0.Personalization.Games.DataStore.TopicContents), 
    PageSessionTimestamp = require(l_Modules_0.Personalization.Sessions.DataStore.PageSessionTimestamp), 
    GameGridFlexFeedItemBounds = require(l_Modules_0.Personalization.OmniFeed.DataStore.GameGridFlexFeedItemBounds), 
    OmniItemsGlobalLayoutData = require(l_Modules_0.Personalization.OmniFeed.DataStore.OmniItemsGlobalLayoutData), 
    OmniItemsRowData = if not require(l_Modules_0.Personalization.Flags.FFlagOmniItemsRowDataEnabled) then nil else require(l_Modules_0.Personalization.OmniFeed.DataStore.OmniItemsRowData), 
    DiscoveryNextPageId = if not require(l_Modules_0.Personalization.Flags.GetFFlagExploreApiSortsEnabled)() then nil else require(l_Modules_0.Personalization.Games.Discovery.DiscoveryNextPageId)
});
