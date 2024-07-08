local l_Players_0 = game:GetService("Players");
local l_Stats_0 = game:GetService("Stats");
local v2 = {};
v2.__index = v2;
v2.EventName = {
    MenuOpened = "emoteMenuOpened", 
    EmotePlayed = "emoteTriggered", 
    EmoteFailed = "emoteTriggerFailed"
};
v2.new = function()
    local v3 = {
        eventStreamImpl = nil
    };
    setmetatable(v3, v2);
    return v3;
end;
v2.withEventStream = function(v4, v5)
    v4.eventStreamImpl = v5;
    return v4;
end;
v2.onMenuOpened = function(v6)
    v6:_getEventStream():setRBXEventStream("emoteMenu", v6.EventName.MenuOpened, {
        pid = tostring(game.PlaceId), 
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        btid = l_Stats_0:GetBrowserTrackerId()
    });
end;
v2.onEmotePlayed = function(v7, v8, v9)
    v7:_getEventStream():setRBXEventStream("emoteMenu", v7.EventName.EmotePlayed, {
        pid = tostring(game.PlaceId), 
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        btid = l_Stats_0:GetBrowserTrackerId(), 
        slotNumber = v8, 
        assetID = v9
    });
end;
v2.onEmoteFailed = function(v10, v11, v12, v13)
    v10:_getEventStream():setRBXEventStream("emoteMenu", v10.EventName.EmoteFailed, {
        pid = tostring(game.PlaceId), 
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        btid = l_Stats_0:GetBrowserTrackerId(), 
        slotNumber = v11, 
        assetID = v12, 
        errorType = v13, 
        invokedByCoreGui = true
    });
end;
v2._getEventStream = function(v14)
    assert(v14.eventStreamImpl, "EventStream implementation not found. Did you forget to construct withEventStream?");
    return v14.eventStreamImpl;
end;
return v2;
