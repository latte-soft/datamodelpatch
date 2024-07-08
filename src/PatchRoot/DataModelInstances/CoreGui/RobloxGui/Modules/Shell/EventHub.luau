local v0 = {};
local function _(v1, v2)
    return {
        id = v1, 
        callback = v2
    };
end;
return {
    addEventListener = function(_, v5, v6, v7)
        if v0[v5] == nil then
            v0[v5] = {};
        end;
        table.insert(v0[v5], {
            id = v6, 
            callback = v7
        });
    end, 
    removeEventListener = function(_, v9, v10)
        if v0[v9] == nil then
            return ;
        else
            for v11, v12 in ipairs(v0[v9]) do
                if v12 ~= nil and v12.id == v10 then
                    table.remove(v0[v9], v11);
                end;
            end;
            return ;
        end;
    end, 
    removeCallbackFromEvent = function(_, v14, v15, v16)
        if v0[v14] == nil then
            return ;
        else
            for v17, v18 in ipairs(v0[v14]) do
                if (v18 ~= nil and v18.id == v15) and v18.callback == v16 then
                    table.remove(v0[v14], v17);
                    return ;
                end;
            end;
            return ;
        end;
    end, 
    dispatchEvent = function(_, v20, ...)
        if v0[v20] == nil then
            return ;
        else
            for _, v22 in ipairs(v0[v20]) do
                v22.callback(...);
            end;
            return ;
        end;
    end, 
    Notifications = {
        AuthenticationSuccess = "rbxNotificationAuthenticationSuccess", 
        GameJoin = "rbxNotificationGameJoin", 
        OpenGames = "rbxNotificationOpenGames", 
        OpenGameDetail = "rbxNotificationOpenGameDetail", 
        OpenGameGenre = "rbxNotificationOpenGameGenre", 
        OpenBadgeScreen = "rbxNotificationOpenBadgeScreen", 
        OpenSettingsScreen = "rbxNotificationOpenSettingsScreen", 
        OpenSearchScreen = "rbxNotificationOpenSearchScreen", 
        OpenStoreScreen = "rbxNotificationOpenStoreScreen", 
        OpenAvatarEditorScreen = "rbxNotificationOpenAvatarEditorScreen", 
        OpenAccountSettingsScreen = "rbxNotificationOpenAccountSettingsScreen", 
        NavigateToEquippedAvatar = "rbxNotificationNavigateToEquippedAvatar", 
        NavigateToRobuxScreen = "rbxNotificationNavigateToRobuxScreen", 
        RobuxCatalogPurchaseInitiated = "rbxRobuxCatalogPurchaseInitiated", 
        DonnedDifferentPackage = "rbxDonnedDifferentPackage", 
        VotedOnPlace = "rbxVotedOnPlace", 
        AvatarEquipBegin = "rbxAvatarEquipBegin", 
        DonnedDifferentOutfit = "rbxDonnedDifferentOutfit", 
        AvatarEquipSuccess = "rbxAvatarEquipSuccess", 
        AvatarPurchaseBegin = "rbxAvatarPurchaseBegin", 
        AvatarPurchaseSuccess = "rbxAvatarPurchaseSuccess", 
        FavoriteToggle = "rbxFavoriteToggle", 
        PlayedGamesChanged = "rbxPlayedGamesChanged", 
        UnlockedUGC = "rbxNotificationUnlockedUGC", 
        SetGamesHints = "rbxNotificationSetGamesHints", 
        CharacterEquipped = "CharacterEquipped", 
        CharacterUpdated = "CharacterUpdated", 
        HardwareBundleGranted = "HardwareBundleGranted"
    }
};
