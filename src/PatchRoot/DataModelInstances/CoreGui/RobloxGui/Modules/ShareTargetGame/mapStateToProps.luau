local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ShareTargetGame_0 = l_CoreGui_0.RobloxGui.Modules.ShareTargetGame;
local l_getGameIcon_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.getGameIcon;
local v4 = require(l_ShareTargetGame_0.Games.Selectors.getGameDetails);
local v5 = require(l_ShareTargetGame_0.ChatConversations.Models.buildConversationModel);
return function(v6, v7)
    local v8 = v6.ChatAppReducer.PlaceInfos[v7.placeId] or {};
    local l_Conversations_0 = v6.ChatAppReducer.Conversations;
    local l_AppLoaded_0 = v6.ChatAppReducer.AppLoaded;
    local v11 = "";
    local v12 = "";
    if v8.universeId then
        v11 = l_getGameIcon_0(v6, (tostring(v8.universeId)));
        v12 = v4(v6, (tostring(v8.universeId))).name;
    end;
    local v13 = {};
    for v14, v15 in pairs(l_Conversations_0) do
        v13[v14] = v5(v6.Users, v15, v6.ChatAppReducer.Aliases);
    end;
    return {
        appLoaded = l_AppLoaded_0, 
        placeInfo = v8, 
        senderId = v6.LocalUserId, 
        conversations = v13, 
        gameCreator = v8.builder, 
        gameThumbnail = v11, 
        gameName = v12, 
        byBuilderText = ""
    };
end;
