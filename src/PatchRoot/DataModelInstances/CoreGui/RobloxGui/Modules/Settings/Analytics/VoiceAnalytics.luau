local v0 = require(script.Parent.Parent.Resources.Constants);
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3)
    local v4 = {
        _eventStreamImpl = v2, 
        _target = "EventIngest", 
        _context = v3 or "SettingsHub"
    };
    setmetatable(v4, v1);
    return v4;
end;
v1.onToggleMuteAll = function(v5, v6)
    if not v6 then
        v5:onUnmuteAll();
        return ;
    else
        v5:onMuteAll();
        return ;
    end;
end;
v1.onToggleMuteSelf = function(v7, v8)
    if not v8 then
        v7:onUnmuteSelf();
        return ;
    else
        v7:onMuteSelf();
        return ;
    end;
end;
v1.onToggleMutePlayer = function(v9, v10, v11)
    if not v11 then
        v9:onUnmutePlayer(v10);
        return ;
    else
        v9:onMutePlayer(v10);
        return ;
    end;
end;
v1.onMuteSelf = function(v12)
    v12._eventStreamImpl:setRBXEventStream(v12._target, v12._context, v0.VoiceAnalytics.MuteSelf, {});
end;
v1.onUnmuteSelf = function(v13)
    v13._eventStreamImpl:setRBXEventStream(v13._target, v13._context, v0.VoiceAnalytics.UnmuteSelf, {});
end;
v1.onMuteAll = function(v14)
    v14._eventStreamImpl:setRBXEventStream(v14._target, v14._context, v0.VoiceAnalytics.MuteAll, {});
end;
v1.onUnmuteAll = function(v15)
    v15._eventStreamImpl:setRBXEventStream(v15._target, v15._context, v0.VoiceAnalytics.UnmuteAll, {});
end;
v1.onMutePlayer = function(v16, v17)
    v16._eventStreamImpl:setRBXEventStream(v16._target, v16._context, v0.VoiceAnalytics.MutePlayer, {
        mutedUserId = v17
    });
end;
v1.onUnmutePlayer = function(v18, v19)
    v18._eventStreamImpl:setRBXEventStream(v18._target, v18._context, v0.VoiceAnalytics.UnmutePlayer, {
        mutedUserId = v19
    });
end;
return v1;
