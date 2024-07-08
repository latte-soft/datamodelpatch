local v0 = {};
v0.__index = v0;
v0.ButtonName = {
    LuaChatInputBar = "luaChatInputBar", 
    LuaGameDetails = "luaGameDetails"
};
v0.EventName = {
    InviteSent = "inputShareGameInviteSent", 
    EntryPoint = "inputShareGameEntryPoint"
};
v0.DiagCounters = {
    EntryPoint = {
        [v0.ButtonName.LuaChatInputBar] = game:DefineFastString("LuaShareGameLuaChatInputBarEntryCounter", "LuaShareGameLuaChatInputBarEntryCounter"), 
        [v0.ButtonName.LuaGameDetails] = game:DefineFastString("LuaShareGameLuaGameDetailsEntryCounter", "LuaShareGameLuaGameDetailsEntryCounter")
    }, 
    InviteSent = {
        [v0.ButtonName.LuaChatInputBar] = game:DefineFastString("LuaShareGameLuaChatInputBarInviteCounter", "LuaShareGameLuaChatInputBarInviteCounter"), 
        [v0.ButtonName.LuaGameDetails] = game:DefineFastString("LuaShareGameLuaGameDetailsInviteCounter", "LuaShareGameLuaGameDetailsInviteCounter")
    }
};
v0.new = function(v1, v2, v3)
    assert(v1, "EventStream implementation not found.");
    assert(v2, "Diag implementation not found.");
    assert(v3, "ButtonName not found.");
    return (setmetatable({
        _eventStreamImpl = v1, 
        _diagImpl = v2, 
        _buttonName = v3
    }, v0));
end;
v0.onActivatedInviteSent = function(v4, v5, v6, v7, v8, v9)
    v4:_getEventStream():setRBXEventStream("touch", v0.EventName.InviteSent, {
        btn = v4:_getButtonName(), 
        placeId = tostring(v5), 
        gameId = tostring(v6), 
        senderId = v7, 
        conversationId = tostring(v8), 
        participants = table.concat(v9, ",")
    });
    local v10 = v0.DiagCounters.InviteSent[v4:_getButtonName()];
    if v10 then
        v4:_getDiag():reportCounter(v10, 1);
    end;
end;
v0.inputShareGameEntryPoint = function(v11, v12, v13)
    v11:_getEventStream():setRBXEventStream("touch", v0.EventName.EntryPoint, {
        btn = v11:_getButtonName(), 
        placeId = v12 and tostring(v12), 
        gameId = v13 and tostring(v13)
    });
    local v14 = v0.DiagCounters.EntryPoint[v11:_getButtonName()];
    if v14 then
        v11:_getDiag():reportCounter(v14, 1);
    end;
end;
v0._getEventStream = function(v15)
    return v15._eventStreamImpl;
end;
v0._getDiag = function(v16)
    return v16._diagImpl;
end;
v0._getButtonName = function(v17)
    return v17._buttonName;
end;
return v0;
