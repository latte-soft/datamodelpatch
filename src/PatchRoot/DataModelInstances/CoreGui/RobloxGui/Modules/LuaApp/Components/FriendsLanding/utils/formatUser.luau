local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.t);
local v2 = require(l_CorePackages_0.LuaSocialLibrariesDeps);
local l_llama_0 = v2.llama;
local l_PresenceType_0 = v2.RoduxPresence.config({}).Enums.PresenceType;
local l_UserModel_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Models.UserModel;
local v6 = {
    [l_PresenceType_0.InGame] = l_UserModel_0.PresenceType.IN_GAME, 
    [l_PresenceType_0.Online] = l_UserModel_0.PresenceType.ONLINE, 
    [l_PresenceType_0.InStudio] = l_UserModel_0.PresenceType.IN_STUDIO, 
    [l_PresenceType_0.Offline] = l_UserModel_0.PresenceType.OFFLINE
};
return function(v7)
    assert(v1.table(v7), "formatUser: user should be a table");
    return l_llama_0.Dictionary.join(v7, {
        name = v7.username, 
        gameInstanceId = v7.gameId, 
        presence = v6[v7.userPresenceType] or v6[l_PresenceType_0.Offline]
    });
end;
