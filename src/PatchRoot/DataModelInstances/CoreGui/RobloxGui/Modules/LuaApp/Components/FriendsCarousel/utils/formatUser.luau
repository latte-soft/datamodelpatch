local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.LuaSocialLibrariesDeps);
local l_llama_0 = v1.llama;
local l_PresenceType_0 = v1.RoduxPresence.config({}).Enums.PresenceType;
local l_UserModel_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Models.UserModel;
local l_PresenceType_1 = require(l_CorePackages_0.Workspace.Packages.GraphQLServer).types.PresenceType;
local l_Formatters_0 = require(l_CorePackages_0.Workspace.Packages.ApolloPresence).Formatters;
local l_FFlagFriendsCarouselPaginatedFriendsEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagFriendsCarouselPaginatedFriendsEnabled;
local v8 = {
    [l_PresenceType_0.InGame] = l_UserModel_0.PresenceType.IN_GAME, 
    [l_PresenceType_0.Online] = l_UserModel_0.PresenceType.ONLINE, 
    [l_PresenceType_0.InStudio] = l_UserModel_0.PresenceType.IN_STUDIO, 
    [l_PresenceType_0.Offline] = l_UserModel_0.PresenceType.OFFLINE
};
return function(v9)
    if l_FFlagFriendsCarouselPaginatedFriendsEnabled_0 and v9.__typename == "Friend" then
        local v10 = {
            [l_PresenceType_1.InGame] = l_UserModel_0.PresenceType.IN_GAME, 
            [l_PresenceType_1.Online] = l_UserModel_0.PresenceType.ONLINE, 
            [l_PresenceType_1.InStudio] = l_UserModel_0.PresenceType.IN_STUDIO, 
            [l_PresenceType_1.Offline] = l_UserModel_0.PresenceType.OFFLINE
        };
        local v11 = v9.presence or {};
        return l_llama_0.Dictionary.join(v9, {
            gameInstanceId = v11.gameId, 
            userPresenceType = l_Formatters_0.formatPresenceTypeToNumber(v11.userPresenceType), 
            presence = v10[v11.userPresenceType] or v10[l_PresenceType_0.Offline], 
            universeId = v11.universeId
        });
    else
        return l_llama_0.Dictionary.join(v9, {
            name = v9.username, 
            gameInstanceId = v9.gameId, 
            presence = v8[v9.userPresenceType] or v8[l_PresenceType_0.Offline]
        });
    end;
end;
