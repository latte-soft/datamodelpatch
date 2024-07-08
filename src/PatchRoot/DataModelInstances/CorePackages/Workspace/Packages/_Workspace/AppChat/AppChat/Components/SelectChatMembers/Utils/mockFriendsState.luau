local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
local l_MockUser_0 = require(l_Parent_0.UserLib).Models.MockUser;
local l_PresenceType_0 = require(l_script_FirstAncestor_0.Http.RoduxPresence).Enums.PresenceType;
local v5 = l_MockUser_0.new();
v5.name = "onlineUser";
v5.presence = l_UserModel_0.PresenceType.ONLINE;
v5.lastLocation = "TestLocation";
v5.isFriend = true;
local v6 = l_MockUser_0.new();
v6.name = "ingameUser";
v6.presence = l_UserModel_0.PresenceType.IN_GAME;
v6.lastLocation = "TestGame";
v6.isFriend = true;
local v7 = l_MockUser_0.new();
v7.name = "offlineUser";
v7.isFriend = true;
return {
    Users = {
        [1] = v5, 
        [2] = v6, 
        [3] = v7
    }, 
    ChatAppReducer = {
        Presence = {
            byUserId = {
                [v5.id] = {
                    userPresenceType = l_PresenceType_0.Online, 
                    lastLocation = "TestLocation"
                }, 
                [v6.id] = {
                    userPresenceType = l_PresenceType_0.InGame, 
                    lastLocation = "TestLocation"
                }, 
                [v7.id] = {
                    userPresenceType = l_PresenceType_0.Offline, 
                    lastLocation = nil
                }
            }
        }
    }
};
