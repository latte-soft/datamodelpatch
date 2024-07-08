local v0 = require(script:FindFirstAncestor("FriendsCarousel").dependencies);
local l_Rodux_0 = v0.Rodux;
local l_RoduxNetworking_0 = v0.RoduxNetworking;
local l_RoduxUserPermissions_0 = v0.RoduxUserPermissions;
local l_RoduxAnalytics_0 = v0.RoduxAnalytics;
local v5 = require(script.Parent.Users);
local v6 = require(script.Parent.Friends);
local v7 = require(script.Parent.Presence);
local l_ShowContactImporterParams_0 = v0.ShowContactImporterParams;
return function()
    return l_Rodux_0.combineReducers({
        Users = v5, 
        Friends = v6, 
        Presence = v7, 
        UserPermissions = l_RoduxUserPermissions_0.installReducer(), 
        NetworkStatus = l_RoduxNetworking_0.installReducer(), 
        ShowContactImporterParams = l_ShowContactImporterParams_0, 
        Analytics = l_RoduxAnalytics_0.installReducer()
    });
end;
