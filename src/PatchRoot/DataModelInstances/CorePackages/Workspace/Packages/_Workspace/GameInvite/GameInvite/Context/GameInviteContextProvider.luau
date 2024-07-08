local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.FriendsMenu);
local v4 = require(l_Parent_2.React);
local l_GetFFlagEnableCommonFriendsMenu_0 = require(l_Parent_2.SharedFlags).GetFFlagEnableCommonFriendsMenu;
local l_FriendsListContextProvider_0 = v3.FriendsListContextProvider;
local v7 = require(l_Parent_0.InviteFriendProvider);
local v8 = require(l_Parent_0.GameDetailsContextProvider);
local _ = require(l_Parent_1.gameInviteModalType);
return function(v10)
    local v11 = nil;
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    local v17 = nil;
    if v10.options then
        v11 = v10.options.trigger;
        v12 = v10.options.inviteMessageId;
        v13 = v10.options.launchData;
        v14 = v10.options.promptMessage;
        v15 = v10.isCoreScript or false;
        v16 = v10.options.rootPlaceId;
        v17 = v10.options.universeId;
    end;
    return v4.createElement(v8, {
        gameDetails = v10.gameDetails, 
        serverType = v10.serverType, 
        promptMessage = v14, 
        trigger = v11, 
        isCoreScript = v15
    }, {
        if not l_GetFFlagEnableCommonFriendsMenu_0() then v4.createElement(l_FriendsListContextProvider_0, {
            isLoadingCustomParams = v10.isLoadingCustomParams
        }, v4.createElement(v7, {
            trigger = v11, 
            inviteMessageId = v12, 
            launchData = v13, 
            promptMessage = v14, 
            isCoreScript = v15, 
            rootPlaceId = v16, 
            universeId = v17
        }, v10.children)) else v4.createElement(v7, {
            trigger = v11, 
            inviteMessageId = v12, 
            launchData = v13, 
            promptMessage = v14, 
            isCoreScript = v15, 
            rootPlaceId = v16, 
            universeId = v17
        }, v10.children)
    });
end;
