local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(game:GetService("CorePackages").Rodux);
local v2 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.ContactList.dependencies);
return (v1.combineReducers({
    Navigation = require(script.Navigation), 
    Dialog = require(script.Dialog), 
    PlayerMenu = require(script.PlayerMenu), 
    LastRemovedFriend = require(script.LastRemovedFriend), 
    Call = v2.RoduxCall.installReducer(), 
    Friends = v2.RoduxFriends.installReducer(), 
    Presence = v2.RoduxPresence.installReducer(), 
    Users = v2.RoduxUsers.installReducer(), 
    NetworkStatus = v2.RoduxNetworking.installReducer()
}));
