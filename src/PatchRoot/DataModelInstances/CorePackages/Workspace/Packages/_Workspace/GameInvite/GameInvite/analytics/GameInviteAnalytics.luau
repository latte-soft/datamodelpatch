local l_Parent_0 = script:FindFirstAncestor("GameInvite").Parent;
local v1 = require(l_Parent_0.Cryo);
local l_GetFFlagEnableUniversalAppGameInviteUnification_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableUniversalAppGameInviteUnification;
game:DefineFastFlag("LuaAppInviteEventsIncludePlaceId", false);
game:DefineFastFlag("GameInviteModalIncludeLinkIdInShareButton", false);
local v3 = {};
v3.__index = v3;
v3.ButtonName = {
    SettingsHub = "settingsHub", 
    ModalPrompt = "modalPrompt", 
    GameDetailsMoreMenu = "uaGameDetailsMoreMenu", 
    GameDetailsPlayWithFriendsMenu = "uaGameDetailsPlayWithFriendsMenu"
};
v3.EventName = {
    InviteSent = "inputShareGameInviteSent", 
    EntryPoint = "inputShareGameEntryPoint", 
    LinkGenerated = "linkGenerated", 
    ShareButtonClick = "buttonClick", 
    InviteSearchFocused = "inviteSearchFocused", 
    GameInviteModal = "gameInviteModal"
};
v3.ActionType = {
    ModalOpen = "modalOpen", 
    InviteTriggered = "inviteTriggered", 
    ModalClose = "modalClose", 
    InviteFailure = "inviteFailure"
};
v3.DiagCounters = {
    EntryPoint = {
        [v3.ButtonName.SettingsHub] = settings():GetFVariable("LuaShareGameSettingsHubEntryCounter"), 
        [v3.ButtonName.ModalPrompt] = settings():GetFVariable("LuaShareGameModalPromptEntryCounter")
    }, 
    InviteSent = {
        [v3.ButtonName.SettingsHub] = settings():GetFVariable("LuaShareGameSettingsHubInviteCounter"), 
        [v3.ButtonName.ModalPrompt] = settings():GetFVariable("LuaShareGameModalPromptInviteCounter")
    }
};
v3.new = function()
    local v4 = {
        _eventStreamImpl = nil, 
        _diagImpl = nil, 
        _buttonName = nil
    };
    setmetatable(v4, v3);
    return v4;
end;
v3.withEventStream = function(v5, v6)
    v5._eventStreamImpl = v6;
    return v5;
end;
v3.withDiag = function(v7, v8)
    v7._diagImpl = v8;
    return v7;
end;
v3.withButtonName = function(v9, v10)
    v9._buttonName = v10;
    return v9;
end;
v3.onActivatedInviteSent = function(v11, _, v13, v14, v15, v16)
    local v17 = v11:_getButtonName();
    local v18 = "inGame";
    if not (not l_GetFFlagEnableUniversalAppGameInviteUnification_0() or not v11:_getIsUniversalApp()) then
        v18 = "inApp";
    end;
    local l_InviteSent_0 = v3.EventName.InviteSent;
    local v20 = table.concat(v14, ",");
    local v21 = nil;
    local v22 = nil;
    if not l_GetFFlagEnableUniversalAppGameInviteUnification_0() or not v11:_getIsUniversalApp() then
        v21 = tostring(game.PlaceId);
        v22 = tostring(game.GameId);
    else
        v21 = tostring(v15);
        v22 = tostring(v16);
    end;
    v11:_getEventStream():setRBXEventStream(v18, l_InviteSent_0, {
        btn = v17, 
        placeId = v21, 
        gameId = v22, 
        conversationId = tostring(v13), 
        participants = v20
    });
    local v23 = v3.DiagCounters.InviteSent[v11:_getButtonName()];
    if v23 then
        v11:_getDiag():reportCounter(v23, 1);
    end;
end;
v3.inputShareGameEntryPoint = function(v24, v25, v26)
    local v27 = v24:_getButtonName();
    local v28 = "inGame";
    if not (not l_GetFFlagEnableUniversalAppGameInviteUnification_0() or not v24:_getIsUniversalApp()) then
        v28 = "inApp";
    end;
    local l_EntryPoint_0 = v3.EventName.EntryPoint;
    local v30 = nil;
    local v31 = nil;
    if not l_GetFFlagEnableUniversalAppGameInviteUnification_0() or not v24:_getIsUniversalApp() then
        v30 = tostring(game.PlaceId);
        v31 = tostring(game.GameId);
    else
        v30 = tostring(v25);
        v31 = tostring(v26);
    end;
    v24:_getEventStream():setRBXEventStream(v28, l_EntryPoint_0, {
        btn = v27, 
        placeId = v30, 
        gameId = v31
    });
    local v32 = v3.DiagCounters.EntryPoint[v24:_getButtonName()];
    if v32 then
        v24:_getDiag():reportCounter(v32, 1);
    end;
end;
v3.linkGenerated = function(v33, v34)
    v33:_getEventStream():setRBXEventStream("shareLinks", v3.EventName.LinkGenerated, {
        linkType = v34.linkType, 
        linkId = v34.linkId, 
        page = "inGameMenu", 
        subpage = "inviteFriendsPage"
    });
end;
v3.onShareButtonClick = function(v35, v36)
    v35:_getEventStream():setRBXEventStream("shareLinks", v3.EventName.ShareButtonClick, {
        btn = "shareServerInviteLink", 
        page = "inGameMenu", 
        subpage = "inviteFriendsPage", 
        linkId = if not game:GetFastFlag("GameInviteModalIncludeLinkIdInShareButton") then nil else v36, 
        isShortUrlEnabled = true
    });
end;
v3.onSearchFocused = function(v37)
    local l_InviteSearchFocused_0 = v3.EventName.InviteSearchFocused;
    local v39 = "inGame";
    local v40 = {
        btn = v37:_getButtonName(), 
        page = "inGameMenu", 
        subpage = "inviteFriendsPage"
    };
    if not (not l_GetFFlagEnableUniversalAppGameInviteUnification_0() or not v37:_getIsUniversalApp()) then
        v39 = "inApp";
        v40.page = "inAppGameDetails";
    end;
    v37:_getEventStream():setRBXEventStream(v39, l_InviteSearchFocused_0, v40);
end;
v3.sendEvent = function(v41, v42, v43, v44)
    local l_Args_0 = v43.Args;
    if game:GetFastFlag("LuaAppInviteEventsIncludePlaceId") then
        l_Args_0 = v1.Dictionary.join(l_Args_0, {
            placeId = if ((not not l_GetFFlagEnableUniversalAppGameInviteUnification_0() and v41:_getIsUniversalApp()) and v44) and v44.place_id then v44.place_id else game.PlaceId
        });
    end;
    if v44 then
        l_Args_0 = v1.Dictionary.join(l_Args_0, v44);
    end;
    v41:_getEventStream():setRBXEventStream(v42, v43.Type, l_Args_0);
end;
v3.sendGameInviteModalEvent = function(v46, v47, v48)
    local v49 = {
        place_id = if ((not not l_GetFFlagEnableUniversalAppGameInviteUnification_0() and v46:_getIsUniversalApp()) and v48) and v48.place_id then v48.place_id else game.PlaceId
    };
    if v48 then
        v49 = v1.Dictionary.join(v49, v48);
    end;
    v46:_getEventStream():setRBXEventStream(v47, v3.EventName.GameInviteModal, v49);
end;
v3._getEventStream = function(v50)
    assert(v50._eventStreamImpl, "EventStream implementation not found. Did you forget to construct withEventStream?");
    return v50._eventStreamImpl;
end;
v3._getDiag = function(v51)
    assert(v51._diagImpl, "Diag implementation not found. Did you forget to construct withDiag?");
    return v51._diagImpl;
end;
v3._getButtonName = function(v52)
    assert(v52._buttonName, "ButtonName not found. Did you forget to construct withButtonName?");
    return v52._buttonName;
end;
v3._getIsUniversalApp = function(v53)
    assert(v53._buttonName, "ButtonName not found. Did you forget to construct withButtonName?");
    local v54 = true;
    if v53._buttonName ~= v3.ButtonName.GameDetailsMoreMenu then
        v54 = v53._buttonName == v3.ButtonName.GameDetailsPlayWithFriendsMenu;
    end;
    return v54;
end;
return v3;
