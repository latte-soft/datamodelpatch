local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(script.Parent.Thunks.SendGameLinkMessage);
local l_ApiFetchGameDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GameDetails.ApiFetchGameDetails;
local l_ApiFetchGameIcons_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.ApiFetchGameIcons;
local l_ApiFetchPlaceInfos_0 = require(l_CorePackages_0.Workspace.Packages.PlaceInfoRodux).Thunks.ApiFetchPlaceInfos;
local l_SetAppLoaded_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Actions.SetAppLoaded;
local v6 = require(script:FindFirstAncestor("ShareTargetGame").ChatConversations.Thunks.requestOlderConversations);
local l_DEPRECATED_getLocalUserConversations_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Conversations.Thunks.DEPRECATED_getLocalUserConversations;
return function(v8)
    local function v10(v9)
        return v8(l_DEPRECATED_getLocalUserConversations_0(v9, 30));
    end;
    return {
        sendGameLinkToConversation = function(v11, v12, v13, v14, v15)
            return v8(v1(v11, v12, v13 or false, v14 or 0, v15 or 0));
        end, 
        fetchGameData = function(v16, v17)
            v8(l_ApiFetchGameIcons_0(v16, {
                v17
            }));
            v8(l_ApiFetchGameDetails_0.Fetch(v16, {
                v17
            }));
        end, 
        fetchConversations = v10, 
        setAppLoaded = function()
            return v8(l_SetAppLoaded_0(true));
        end, 
        fetchPlaceInfos = function(v18, v19)
            return v8(l_ApiFetchPlaceInfos_0(v18, {
                v19
            }));
        end, 
        conversationListScrollTouchedBottom = function()
            return v8(v6(v10, 30));
        end
    };
end;
