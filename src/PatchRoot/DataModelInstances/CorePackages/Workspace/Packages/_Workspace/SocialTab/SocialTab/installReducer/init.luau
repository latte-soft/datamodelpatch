local v0 = require(script:FindFirstAncestor("SocialTab").dependencies);
local l_Rodux_0 = v0.Rodux;
local l_RoduxNetworking_0 = v0.RoduxNetworking;
local l_ShowContactImporterParams_0 = v0.ShowContactImporterParams;
local l_SelfViewProfileDiscoverabilityUpsellIXP_0 = v0.SelfViewProfileDiscoverabilityUpsellIXP;
return function()
    return l_Rodux_0.combineReducers({
        Users = require(script.Users), 
        Friends = require(script.Friends), 
        Presence = require(script.Presence), 
        PremiumByUserId = require(script.PremiumByUserId), 
        ShowContactImporterParams = if not l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then nil else l_ShowContactImporterParams_0, 
        NetworkStatus = l_RoduxNetworking_0.installReducer(), 
        UnreadConversationCount = require(script.UnreadConversationCount)
    });
end;
