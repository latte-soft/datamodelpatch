local l_ChatConstants_0 = require(script.Parent.Parent:WaitForChild("ChatConstants"));
local v1 = {};
local v2 = {};
v2.__index = v2;
v2.SendSystemMessageToSelf = function(_, v4, v5, v6)
    v5:AddMessageToChannel({
        ID = -1, 
        FromSpeaker = nil, 
        SpeakerUserId = 0, 
        OriginalChannel = v5.Name, 
        IsFiltered = true, 
        MessageLength = string.len(v4), 
        MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(v4)), 
        Message = v4, 
        MessageType = l_ChatConstants_0.MessageTypeSystem, 
        Time = os.time(), 
        ExtraData = v6
    });
end;
v1.new = function()
    local v7 = setmetatable({}, v2);
    v7.COMMAND_MODULES_VERSION = 1;
    v7.KEY_COMMAND_PROCESSOR_TYPE = "ProcessorType";
    v7.KEY_PROCESSOR_FUNCTION = "ProcessorFunction";
    v7.IN_PROGRESS_MESSAGE_PROCESSOR = 0;
    v7.COMPLETED_MESSAGE_PROCESSOR = 1;
    return v7;
end;
return v1.new();
