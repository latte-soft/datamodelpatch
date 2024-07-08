local l_Parent_0 = script.Parent.Parent;
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v2 = require(l_Parent_0.t);
local _ = require(script.Parent.VideoProtocolTypes);
local v4 = {
    GET_RECORDING_DURATION_DESCRIPTOR = {
        fid = l_MessageBus_0.getMessageId("Video", "getRecordingDuration"), 
        validateParams = v2.table
    }
};
v4.__index = v4;
v4.new = function(v5)
    return (setmetatable({
        messageBus = v5 or l_MessageBus_0
    }, v4));
end;
v4.getRecordingDuration = function(v6)
    return v6.messageBus.call(v6.GET_RECORDING_DURATION_DESCRIPTOR, {});
end;
v4.default = v4.new();
return v4;
